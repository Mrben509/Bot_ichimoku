//+------------------------------------------------------------------+
//|                                           Ichimoku_Strat_Bot.mq5 |
//|                                  Copyright 2025, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2025, MetaQuotes Ltd."
#property link      "https://www.mql5.com"
#property version   "1.00"

//+------------------------------------------------------------------+
//| Includes and External Libraries                                  |
//+------------------------------------------------------------------+
#include <Indicators/Trend.mqh>

// Trade module
#include <Pre_Pwo/Trade.mqh>
CTrade Trades;

// Price data module
#include <Pre_Pwo/Price.mqh>
CBars Price;

// Money management module
#include <Pre_Pwo/Moneymanagement.mqh>

// Trailing stops module
#include <Pre_Pwo/Ichimoku_Trail.mqh>
CIchimokuTrailStop Trail;

// Timer module
#include <Pre_Pwo/Timer.mqh>
CTimer Timer;
CNewBar NewBar;

// Strategy module
#include <Pre_Pwo/Strategie.mqh>

// Statistics and probability module
#include <Pre_Pwo/stat_prob.mqh>

// Boosting model for machine learning predictions
#include <Pre_Pwo/boosting_model_10.mqh>

// Array libraries for data storage
#include <Arrays/ArrayLong.mqh>
#include <Arrays/ArrayDouble.mqh>
#include <Arrays/ArrayInt.mqh>

//+------------------------------------------------------------------+
//| Global Arrays for Trade Data Storage                            |
//+------------------------------------------------------------------+
CArrayLong tickets;           // Store position tickets
CArrayInt dealTypes;          // Store deal types (BUY/SELL)
CArrayDouble tenkans;         // Store Tenkan-sen values
CArrayDouble kijuns;          // Store Kijun-sen values
CArrayDouble spansA;          // Store Senkou Span A values
CArrayDouble spansB;          // Store Senkou Span B values
CArrayDouble laggings;        // Store Chikou Span values
CArrayDouble openPrices;      // Store opening prices
CArrayDouble cloudTops;       // Store cloud top values
CArrayDouble cloudBottoms;    // Store cloud bottom values
CArrayDouble stopLoss;        // Store stop loss levels
CArrayDouble takeProfit;      // Store take profit levels
CArrayDouble rsiValues;       // Store RSI indicator values
CArrayDouble atrValues;       // Store ATR indicator values
CArrayDouble slopes5Val;      // Store 5-period slope values
CArrayDouble slopes10Val;     // Store 10-period slope values
CArrayDouble slopes20Val;     // Store 20-period slope values
CArrayDouble priceStd5Val;    // Store 5-period standard deviation
CArrayDouble priceStd10Val;   // Store 10-period standard deviation
CArrayDouble priceStd20Val;   // Store 20-period standard deviation
CArrayDouble zScore50Val;     // Store 50-period Z-score values

string symbols[];             // Array to store trading symbols

//+------------------------------------------------------------------+
//| Input Parameters for Expert Advisor Configuration               |
//+------------------------------------------------------------------+
input ulong Slippage = 10;    // Maximum allowed slippage in points
input bool TradeOnNewBar = true; // Only trade on new bar formation

sinput string MM;    // Money Management section
input bool UseMoneyManagement = true; // Enable/disable money management
input double RiskPercent = 0.5;      // Risk percentage per trade
input double FixedVolume = 0.1;      // Fixed lot size if money management disabled
input double ratio = 3.5;            // Risk-reward ratio

sinput string TI;     // Timer section
input bool UseTimer = false;          // Enable/disable trading timer
input int StartHour = 0;              // Trading session start hour
input int StartMinute = 0;            // Trading session start minute
input int EndHour = 0;                // Trading session end hour
input int EndMinute = 0;              // Trading session end minute
input bool UseLocalTime = false;      // Use local time instead of server time

input double proba = 0.8; // Minimum success probability to open a position

//+------------------------------------------------------------------+
//| Global Variables                                                |
//+------------------------------------------------------------------+
datetime lastRequestTime = 0;     // Last request time for rate limiting
int minInterval = 1000;           // Minimum interval between requests (ms)
int lastPositionCount = 0;        // Track number of positions

// Global variable to track simulated net balance
double soldeNet = 0;

//+------------------------------------------------------------------+
//| Expert Initialization Function                                  |
//+------------------------------------------------------------------+
int OnInit()
{
//---
   // Initialize probability module
   // ProbabilityModuleInit();

   // Retrieve all symbols visible in market watch
   nb_symbols = SymbolsTotal(true);
   ArrayResize(symbols, nb_symbols);
   for(int i = 0; i < nb_symbols; i++)
   {
       string symbol = SymbolName(i, true);
       symbols[i] = symbol;
       InitIchimokuHandles(symbol, i);
   }
   Trades.Deviation(Slippage);
   soldeNet = AccountInfoDouble(ACCOUNT_BALANCE);

//---
   return(INIT_SUCCEEDED);
}

//+------------------------------------------------------------------+
//| Expert Deinitialization Function                                |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
{
//---
   // Release Ichimoku indicator handles for all symbols
   for(int i = 0; i < nb_symbols; i++)
    ReleaseIchimokuHandles(symbols[i]);
}

//+------------------------------------------------------------------+
//| Expert Tick Function - Main Trading Logic                       |
//+------------------------------------------------------------------+
void OnTick()
{
//---

//+------------------------------------------------------------------+
//| Check for New Bar Formation                                     |
//+------------------------------------------------------------------+
   bool newBar = true;
   int barShift = 0;

   if(TradeOnNewBar == true)
   {
      newBar = NewBar.CheckNewBar(_Symbol,_Period);
      barShift = 1;
   }

//+------------------------------------------------------------------+
//| Check Trading Time Restrictions                                 |
//+------------------------------------------------------------------+
   bool timerOn = true;
   if(UseTimer == true)
   {
      timerOn = Timer.DailyTimer(StartHour,StartMinute,EndHour,EndMinute,UseLocalTime);
   }

//+------------------------------------------------------------------+
//| Retrieve and Validate Price Data                                |
//+------------------------------------------------------------------+
   // Update price data for current symbol
   Price.Update(_Symbol,_Period);

   // Iterate through all symbols in market watch
   for(int i = 0; i < nb_symbols; i++)
   {
      string symbol = symbols[i];

   // Get current bid and ask prices
   double ask = SymbolInfoDouble(symbol,SYMBOL_ASK);
   double bid = SymbolInfoDouble(symbol,SYMBOL_BID);

//+------------------------------------------------------------------+
//| Retrieve Ichimoku Kinko Hyo Indicator Values                   |
//+------------------------------------------------------------------+
   double tenkan[1], kijun[1], SpanA[1], SpanB[1], lagging[1];
   double tenkanValue = 0.0; // Tenkan-sen value at signal time
   double kijunValue = 0.0;  // Kijun-sen value at signal time
   double spanAVal = 0.0;    // Senkou Span A value at signal time
   double spanBVal = 0.0;    // Senkou Span B value at signal time
   double laggingS = 0.0;    // Chikou Span value at signal time

   // Copy Ichimoku indicator values from buffers
   if(
      lagging[0] = LaggingSpan(symbol, handles[i].handle_M5) &&
      CopyBuffer(handles[i].handle_M5, 1, 0, 1, kijun) == 1
      && CopyBuffer(handles[i].handle_M5, 2, 0, 1, SpanA) == 1
      && CopyBuffer(handles[i].handle_M5, 3, 0, 1, SpanB) == 1
      && CopyBuffer(handles[i].handle_M5, 0, 0, 1, tenkan) == 1
   )
   {
      // Verify that indicator values are valid
      if(kijun[0] != EMPTY_VALUE && SpanA[0] != EMPTY_VALUE && SpanB[0] != EMPTY_VALUE
         && lagging[0] != EMPTY_VALUE && tenkan[0] != EMPTY_VALUE)
      {
         // Store current Ichimoku values
         tenkanValue = tenkan[0];
         laggingS = lagging[0];
         kijunValue = kijun[0];
         spanAVal = SpanA[0];
         spanBVal = SpanB[0];
      }
      else
      {
         Print("Invalid Ichimoku values for symbol: ", symbol);
         return;
      }
   }
   else
   {
      Print("Error retrieving Ichimoku buffers: ", GetLastError());
      return;
   }

//+------------------------------------------------------------------+
//| Retrieve RSI and ATR Indicator Values                           |
//+------------------------------------------------------------------+
   double rsiValue = 0.0, atr = 0.0;
   int rsiHandle = iRSI(symbol, _Period, 14, PRICE_CLOSE);
   int atrHandle = iATR(symbol, _Period, 14);
   if(rsiHandle != INVALID_HANDLE && atrHandle != INVALID_HANDLE)
   {
       double rsiBuffer[1], atrBuffer[1];
       if(CopyBuffer(rsiHandle, 0, 0, 1, rsiBuffer) > 0
           && CopyBuffer(atrHandle, 0, 0, 1, atrBuffer) > 0)
        {
           rsiValue = rsiBuffer[0];
            atr = atrBuffer[0];
        }
       // Release indicator handles to free memory
       IndicatorRelease(rsiHandle);
       IndicatorRelease(atrHandle);
   }
   else
   {
       Print("Error creating RSI, ATR handles: ", GetLastError());
       return;
   }

//+------------------------------------------------------------------+
//| Calculate Slopes, Standard Deviations and Z-Score               |
//+------------------------------------------------------------------+
   double price5[5], price10[10], price20[20], price50[50];
   // Copy historical close prices for different periods
   CopyClose(symbol, _Period, 0, 5, price5);
   CopyClose(symbol, _Period, 0, 10, price10);
   CopyClose(symbol, _Period, 0, 20, price20);
   CopyClose(symbol, _Period, 0, 50, price50);

   // Calculate linear regression slopes
   double slope5  = LinearSlope(price5, 5);
   double slope10 = LinearSlope(price10, 10);
   double slope20 = LinearSlope(price20, 20);

   // Calculate price standard deviations
   double priceStd5  = StdDev(price5, 5);
   double priceStd10 = StdDev(price10, 10);
   double priceStd20 = StdDev(price20, 20);

   // Calculate Z-score for current price relative to 50-period history
   double zscorePrice = ZScore(price50[0], price50, 50);

   // Calculate Buy stop loss based on Kijun-sen
   double BStopPrice = BStopLoss(POSITION_TYPE_BUY, kijunValue, 60);
   BStopPrice = AdjustStopLevel(symbol, BStopPrice, 10, true); // 10 points above stop level
   double BStopPoints =  StopPriceToPoints(symbol, BStopPrice, ask);

   // Calculate Sell stop loss based on Kijun-sen
   double SStopPrice = SStopLoss(POSITION_TYPE_SELL, kijunValue, 60);
   SStopPrice = AdjustStopLevel(symbol, SStopPrice, 10, false); // 10 points above stop level
   double SStopPoints = StopPriceToPoints(symbol, SStopPrice, bid);

   // Calculate take profit levels based on risk-reward ratio
   double buyProfit = BTakeProfit(symbol,ask,BStopPoints,ratio,POSITION_TYPE_BUY);
   double sellProfit = STakeProfit(symbol,bid,SStopPoints,ratio,POSITION_TYPE_SELL); 

   double buyProfitPoints = buyProfit - ask;
   double sellProfitPoints = bid - sellProfit;

//+------------------------------------------------------------------+
//| Trading Conditions and Order Placement Logic                    |
//+------------------------------------------------------------------+
   if(newBar == true && timerOn == true)
   {
      // Money Management Calculations
      double buyTradeSize = FixedVolume;
      double sellTradeSize = FixedVolume;

      if(UseMoneyManagement == true)
      {
         if(CanOpenBuyPosition(symbol))
            buyTradeSize = MoneyManagement(symbol, FixedVolume, RiskPercent, BStopPoints);
         if(CanOpenSellPosition(symbol))
            sellTradeSize = MoneyManagement(symbol, FixedVolume, RiskPercent, SStopPoints);
      }

      // Check if trading is allowed for this symbol
      bool canBuy = CanOpenBuyPosition(symbol);
      bool canSell = CanOpenSellPosition(symbol);

      // Check if last close was older than 9 bars
      bool LastCloseOlder = IsLastCloseOlderThanNBars(symbol, 9);
      
      // Check overall trading status
      CheckTradingStatus();
      Print("Loss detected: ", losingTrades, " - Trading allowed: ", !stopTrading);
      if(stopTrading)
      {
          // If trading is stopped, do not open new positions
         Print("No new positions will be taken today.");
         return;
      }
      Print("stopTrading = ", stopTrading); 

      // Check if trading should stop due to take profit reached today
      CheckStopTradingOnTakeProfit(symbol);
      if(stopTrading)
      {
          Print("Trading stopped for the day due to Take Profit reached.");
          return;
      }
      
      // Check if trading should stop after 2 profitable positions closed
      CheckStopTradingAfter2Profits(symbol);
      if(stopTrading)
      {
         Print("Trading stopped for the day after 2 profitable positions closed.");
         return;
      } 
         
      // Check if a position was closed within last 9 bars
      bool recentClose = !IsLastCloseOlderThanNBars(symbol, 9);

      // Verify stop loss distance is above minimum points
      bool distanceOkBuy = IsStopLossDistanceAboveNPoints(ask, BStopPrice, 300, true);
      bool distanceOkSell = IsStopLossDistanceAboveNPoints(bid, SStopPrice, 300, false);

      // Check distance after cloud breakout
      bool distanceApKumoBuy = !IsDistanceAfterKumoBreak(symbol, handles[i].handle_M5, 1600, true);
      bool distanceApKumoSell = !IsDistanceAfterKumoBreak(symbol, handles[i].handle_M5, 1600, false);

//+------------------------------------------------------------------+
//| Machine Learning Probability Calculation                        |
//+------------------------------------------------------------------+

      // Calculate cloud boundaries
      double cloudTop = MathMax(spanAVal, spanBVal);
      double cloudBottom = MathMin(spanAVal, spanBVal);
      double distPriceToCloudB = MathMin(MathAbs(ask - cloudTop), MathAbs(ask - cloudBottom));
      double distPriceToCloudS = MathMin(MathAbs(bid - cloudTop), MathAbs(bid - cloudBottom));
      double distKijunToCloud = MathMin(MathAbs(kijunValue - cloudTop), MathAbs(kijunValue - cloudBottom));

      // Determine trade type based on market conditions
      bool condition_achat = false;
      int type = (condition_achat) ? 0 : 1;
      if(CanOpenBuyPosition(symbol))
         condition_achat = true;
      else if(CanOpenSellPosition(symbol))
         condition_achat = false;
      else
         type = -1; // Ignore if no clear signal

      // Determine price and parameters based on trade type
      double PriceF = (type == 0) ? ask : bid;
      double distPriceToCloud = (type == 0) ? distPriceToCloudB : distPriceToCloudS;
      double Volume = (type == 0) ? buyTradeSize : sellTradeSize;
      double SL     = (type == 0) ? BStopPrice   : SStopPrice;
      double TP     = (type == 0) ? buyProfit    : sellProfit;

      // Calculate advanced features for machine learning model
      double distance_to_sl_art = (PriceF - SL) / atr;

      // Calculate volatility regime
      double priceStd20Arr[100];
      double priceStd20Mean = 0.0;
      for(int k=0; k<100; k++)
          priceStd20Mean += priceStd20Arr[k];
      priceStd20Mean /= 100;
      int volatility_regime = (priceStd20 > priceStd20Mean) ? 1 : 0;

      // Calculate price relative to EMA200
      double ema200 = iMA(symbol, _Period, 200, 0, MODE_EMA, PRICE_CLOSE);
      double prix_vs_ema200 = (PriceF - ema200) / atr;

      // Calculate RSI relative to its EMA
      double rsiBuffer[14];
      CopyBuffer(rsiHandle, 0, 0, 14, rsiBuffer);
      double rsiSum = 0.0;
      for(int k=0; k<14; k++)
          rsiSum += rsiBuffer[k];
      double ema_rsi = rsiSum / 14;
      double rsi_vs_ema_rsi = rsiValue - ema_rsi;

      // Calculate stop loss size in ATR units
      double sl_size_in_atr = MathAbs(PriceF - SL) / atr;

      // Prepare feature array for machine learning model
      double features[26];
      features[0] = type;               // Trade type (0=Buy, 1=Sell)
      features[1] = rsiValue;           // RSI value
      features[2] = atr;                // Average True Range
      features[3] = tenkanValue;        // Tenkan-sen value
      features[4] = kijunValue;         // Kijun-sen value
      features[5] = spanAVal;           // Senkou Span A
      features[6] = spanBVal;           // Senkou Span B
      features[7] = laggingS;           // Chikou Span
      features[8] = PriceF;             // Entry price
      features[9] = distPriceToCloud;   // Distance to cloud
      features[10] = distKijunToCloud;  // Kijun distance to cloud
      features[11] = Volume;            // Trade volume
      features[12] = SL;                // Stop loss
      features[13] = TP;                // Take profit
      features[14] = slope5;            // 5-period slope
      features[15] = slope10;           // 10-period slope
      features[16] = slope20;           // 20-period slope
      features[17] = priceStd5;         // 5-period standard deviation
      features[18] = priceStd10;        // 10-period standard deviation
      features[19] = priceStd20;        // 20-period standard deviation
      features[20] = zscorePrice;       // 50-period Z-score
      features[21] = distance_to_sl_art; // Stop loss distance in ATR
      features[22] = volatility_regime;  // Volatility regime flag
      features[23] = prix_vs_ema200;    // Price vs EMA200 in ATR
      features[24] = rsi_vs_ema_rsi;    // RSI vs its EMA
      features[25] = sl_size_in_atr;    // Stop loss size in ATR

      // Get prediction from machine learning model
      // double pred_proba = XGBoost_Predict(features);
      double pred_proba = LightGBM_Predict(features); // Call for side effects

//+------------------------------------------------------------------+
//| Order Opening Logic                                             |
//+------------------------------------------------------------------+
      // Buy order conditions
      if(canBuy && !PositionSelect(symbol)
       && LastCloseOlder && distanceOkBuy && distanceApKumoBuy
         && pred_proba >= proba)
      {
         // If position closed recently AND opening price is NOT above last 9-bar high, block
         if(recentClose && IsOpenAboveLast9High(symbol))
         {
            Print("Blocking buy opening: recent close and no breakout of last high.");
         }
         else
         {
            Print(" canBuy=", canBuy, " LastCloseOlder=", LastCloseOlder,
                  " distanceOkBuy=", distanceOkBuy, " distanceApKumoBuy=", distanceApKumoBuy);
            Trades.Buy(symbol, buyTradeSize, BStopPrice, buyProfit);
         }
      }

      // Sell order conditions
      if(canSell && !PositionSelect(symbol)
       && LastCloseOlder && distanceOkSell && distanceApKumoSell
         && pred_proba >= proba)
      {
         // If position closed recently AND opening price is NOT below last 9-bar low, block
         if(recentClose && IsOpenBelowLast9Low(symbol))
         {
            Print("Blocking sell opening: recent close and no breakout of last low.");
         }
         else
         {
            Print(" canSell=", canSell, " LastCloseOlder=", LastCloseOlder,
                  " distanceOkSell=", distanceOkSell, " distanceApKumoSell=", distanceApKumoSell);
            Trades.Sell(symbol, sellTradeSize, SStopPrice, sellProfit);
         }
      }
  }

//+------------------------------------------------------------------+
//| Post-Trade Management and Position Monitoring                   |
//+------------------------------------------------------------------+

   // Send notification if position was opened
   if(PositionSelect(symbol))
   {
      double volume = PositionGetDouble(POSITION_VOLUME);
      int positionType = (int)PositionGetInteger(POSITION_TYPE);
      double openPrice = PositionGetDouble(POSITION_PRICE_OPEN);

      if(positionType == POSITION_TYPE_BUY)
      {
         NotifyPositionOpened(symbol, "Buy", volume, openPrice);
      }
      else if(positionType == POSITION_TYPE_SELL)
      {
         NotifyPositionOpened(symbol, "Sell", volume, openPrice);
      }
   }

  // Breakeven and trailing stop functionality
  if(PositionSelect(symbol))
    {
        int posType = (int)PositionGetInteger(POSITION_TYPE);
        double entry   = PositionGetDouble(POSITION_PRICE_OPEN);
        double stop    = PositionGetDouble(POSITION_SL);
        double tp      = PositionGetDouble(POSITION_TP);
        ulong  ticket  = PositionGetInteger(POSITION_TICKET);

        if(posType == POSITION_TYPE_BUY)
        {
            CheckBreakEvenAndPauseTrailingBuy(symbol, handles[i].handle_M5, entry, stop, tp, ticket);
            if(!trailingPaused)
                Trail.UpdateStopLoss(symbol);
        }
        else if(posType == POSITION_TYPE_SELL)
        {
            CheckBreakEvenAndPauseTrailingSell(symbol, handles[i].handle_M5, entry, stop, tp, ticket);
            if(!trailingPaused)
                Trail.UpdateStopLoss(symbol);
        }
    } 

  // Update trailing stops
   if(PositionSelect(symbol))
      Trail.UpdateStopLoss(symbol);

   // Close buy positions when conditions met
   if(PositionSelect(symbol) && (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_BUY && CanClosePositionBuy(symbol))
   {
       ulong ticket = PositionGetInteger(POSITION_TICKET);
      if(!Trades.PositionClose(ticket, 3))
           Print("Failed to close position on ", symbol, ". Error: ", GetLastError());
   }

   // Close sell positions when conditions met
   if(PositionSelect(symbol) && (ENUM_POSITION_TYPE)PositionGetInteger(POSITION_TYPE)==POSITION_TYPE_SELL && CanClosePositionSell(symbol))
   {
       ulong ticket = PositionGetInteger(POSITION_TICKET);
      if(!Trades.PositionClose(ticket, 3))
           Print("Failed to close position on ", symbol, ". Error: ", GetLastError());
   }

   // Calculate net profit after transaction fees
   if(PositionSelect(symbol))
   {
      double profitBrut = PositionGetDouble(POSITION_PROFIT);
      double volume     = PositionGetDouble(POSITION_VOLUME);
      double profitNet  = ApplyTransactionFeePerLot(profitBrut, volume, 5.0); // 5 units fee per lot

      Print("Net profit after fees: ", DoubleToString(profitNet, 2));
   }
   }
  }

//+------------------------------------------------------------------+
//| Utility Function: Get Kijun Value by Ticket                     |
//+------------------------------------------------------------------+
double GetKijunValue(ulong ticket)
{
   for(int i=0; i<tickets.Total(); i++)
      if(tickets.At(i) == ticket)
         return kijuns.At(i);
   return 0.0;
}

//+------------------------------------------------------------------+
//| Trade Transaction Handler - Records Trade Data                  |
//+------------------------------------------------------------------+
void OnTradeTransaction(const MqlTradeTransaction &trans, const MqlTradeRequest &request,
    const MqlTradeResult &result)
{
   // Only process deal addition transactions
   if(trans.type != TRADE_TRANSACTION_DEAL_ADD)
      return;

   if(!HistoryDealSelect(trans.deal))
      return;
      
   long deal_entry = HistoryDealGetInteger(trans.deal, DEAL_ENTRY);   
   
   // --- HANDLE POSITION OPENING DEAL ---
   if(deal_entry == DEAL_ENTRY_IN)
   {
      // This is an opening deal. Calculate context and record immediately.

      string symbol = trans.symbol;
      
      // --- Recalculate indicators for exact opening context ---
      // Note: Using shift 1 to get value from bar just before opening
      
      // Ichimoku values
      double tenkan[1], kijun[1], SpanA[1], SpanB[1], laggingS[1];
      int handle_idx = -1;
      
      // Find symbol index in handles array
      for(int i=0; i<nb_symbols; i++) 
      {
         if(symbols[i] == symbol) 
         {
            handle_idx = i;
            break;
         }
      }
      if(handle_idx == -1) return; // Symbol not found, cannot continue

      // Copy Ichimoku indicator values
      CopyBuffer(handles[handle_idx].handle_M5, 0, 1, 1, tenkan);
      CopyBuffer(handles[handle_idx].handle_M5, 1, 1, 1, kijun);
      CopyBuffer(handles[handle_idx].handle_M5, 2, 1, 1, SpanA);
      CopyBuffer(handles[handle_idx].handle_M5, 3, 1, 1, SpanB);
      // Copy Lagging Span (Chikou) from buffer 4
      CopyBuffer(handles[handle_idx].handle_M5, 4, 1, 1, laggingS);

      // RSI & ATR values
      double rsiValue = 0.0, atrValue = 0.0;
      int rsiHandle = iRSI(symbol, _Period, 14, PRICE_CLOSE);
      int atrHandle = iATR(symbol, _Period, 14);
      if(rsiHandle != INVALID_HANDLE && atrHandle != INVALID_HANDLE)
      {
         double rsiBuffer[1], atrBuffer[1];
         // Copy value from last closed bar (shift 1)
         if(CopyBuffer(rsiHandle, 0, 1, 1, rsiBuffer) == 1 && CopyBuffer(atrHandle, 0, 1, 1, atrBuffer) == 1)
         {
            rsiValue = rsiBuffer[0];
            atrValue = atrBuffer[0];
         }
         IndicatorRelease(rsiHandle);
         IndicatorRelease(atrHandle);
      }

      // Slopes, Standard Deviations, Z-Score
      double price5[5], price10[10], price20[20], price50[50];
      CopyClose(symbol, _Period, 1, 5, price5);
      CopyClose(symbol, _Period, 1, 10, price10);
      CopyClose(symbol, _Period, 1, 20, price20);
      CopyClose(symbol, _Period, 1, 50, price50);

      double slope5  = LinearSlope(price5, 5);
      double slope10 = LinearSlope(price10, 10);
      double slope20 = LinearSlope(price20, 20);
      double priceStd5  = StdDev(price5, 5);
      double priceStd10 = StdDev(price10, 10);
      double priceStd20 = StdDev(price20, 20);
      double zscorePrice = ZScore(price50[0], price50, 50);

      // --- Prepare data for direct recording ---
      ulong deal_ticket = trans.deal;
      // Get time directly from deal for maximum reliability
      datetime timeInput = (datetime)HistoryDealGetInteger(deal_ticket, DEAL_TIME);
      int type = (int)trans.deal_type;
      double openPrice = trans.price;
      double volume = trans.volume;
      double sl = trans.price_sl;
      double tp = trans.price_tp;
      
      // Trade result not yet known, use default value (-1)
      int resultVal = -1; 
      
      // Calculate cloud metrics
      double cloudTop = MathMax(SpanA[0], SpanB[0]);
      double cloudBottom = MathMin(SpanA[0], SpanB[0]);
      double distPriceToCloud = MathMin(MathAbs(openPrice - cloudTop), MathAbs(openPrice - cloudBottom));
      double distKijunToCloud = MathMin(MathAbs(kijun[0] - cloudTop), MathAbs(kijun[0] - cloudBottom));

      // --- Call function to save data to CSV ---
      AppendSignalToHistoryCSV(
         deal_ticket, timeInput, 0, type, tenkan[0],
         kijun[0], SpanA[0], SpanB[0], rsiValue, atrValue,
         openPrice, resultVal, distPriceToCloud, distKijunToCloud,
         volume, sl, tp, slope5, slope10, slope20, priceStd5, priceStd10,
         priceStd20, zscorePrice, symbol
      );
      
      Print("Opening deal #", deal_ticket, " recorded directly in CSV.");
   }
   // --- HANDLE POSITION CLOSING DEAL ---
   else if(deal_entry == DEAL_ENTRY_OUT || deal_entry == DEAL_ENTRY_INOUT)
   {
      // Record separate line for closing
      
      // --- Get closing deal data ---
      ulong deal_ticket = trans.deal;
      double profit = HistoryDealGetDouble(deal_ticket, DEAL_PROFIT);
      double commission = HistoryDealGetDouble(deal_ticket, DEAL_COMMISSION);
      double swap = HistoryDealGetDouble(deal_ticket, DEAL_SWAP);
      double total_profit = profit + commission + swap;
      int resultVal = (total_profit > 0) ? 1 : 0;
      datetime timeOutput = (datetime)HistoryDealGetInteger(deal_ticket, DEAL_TIME);
      double volume = trans.volume; // Closing deal volume
      string symbol = trans.symbol;
      int type = (int)trans.deal_type;
      double closePrice = trans.price;

      // --- Call function to save data to CSV ---
      // Use placeholders (0.0) for indicators not relevant for closing deal
      AppendSignalToHistoryCSV(
         deal_ticket, 0, timeOutput, type, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
         closePrice, resultVal, 0.0, 0.0,
         volume, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
         0.0, 0.0, symbol
      );
      
      Print("Closing deal #", deal_ticket, " for position #", trans.position, " recorded. Result: ", (resultVal == 1 ? "Winner" : "Loser"));
   }
}
//+------------------------------------------------------------------+
