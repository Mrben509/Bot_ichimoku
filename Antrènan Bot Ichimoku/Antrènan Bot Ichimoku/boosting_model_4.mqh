//+------------------------------------------------------------------+
//|   XGBoost Predictor for MQL5
//+------------------------------------------------------------------+
#property strict

const double BEST_THRESHOLD = 0.410000;

// --- Liste des features attendues par le modèle ---
// 0: type
// 1: rsiV
// 2: atrV
// 3: tenkan
// 4: kijun
// 5: spanA
// 6: spanB
// 7: lagging
// 8: price
// 9: distPriceToCloud
// 10: distKijunToCloud
// 11: volume
// 12: sl
// 13: tp
// 14: slope5V
// 15: slope10V
// 16: slope20V
// 17: priceStd5V
// 18: priceStd10V
// 19: priceStd20V
// 20: zScore50V
// 21: distance_to_sl_art
// 22: volatility_regime
// 23: prix_vs_ema200
// 24: rsi_vs_ema_rsi
// 25: sl_size_in_atr

// --- Code généré par m2cgen ---
#include <math.h>
#include <string.h>
double sigmoid(double x) {
    if (x < 0.0) {
        double z = exp(x);
        return z / (1.0 + z);
    }
    return 1.0 / (1.0 + exp(-x));
}
void xgboost_score(const double &inputs[], double * output) {
    double var0;
    if (inputs[19] < 1.1199208) {
        var0 = 0.021941753;
    } else {
        if (inputs[23] < -55.599304) {
            var0 = -0.03361669;
        } else {
            if (inputs[18] < 1.59889) {
                if (inputs[2] < 1.6492857) {
                    if (inputs[10] < 0.56) {
                        var0 = 0.017465832;
                    } else {
                        var0 = -0.0060846484;
                    }
                } else {
                    if (inputs[16] < 0.06866165) {
                        var0 = -0.009097796;
                    } else {
                        var0 = -0.044371452;
                    }
                }
            } else {
                if (inputs[9] < 7.655) {
                    if (inputs[25] < 1.8018335) {
                        var0 = -0.014193796;
                    } else {
                        var0 = 0.02185901;
                    }
                } else {
                    if (inputs[25] < 2.4191177) {
                        var0 = 0.015319215;
                    } else {
                        var0 = -0.024673013;
                    }
                }
            }
        }
    }
    double var1;
    if (inputs[15] < -0.6484848) {
        var1 = 0.021258129;
    } else {
        if (inputs[18] < 2.2016084) {
            if (inputs[15] < 0.3481818) {
                if (inputs[24] < -18.488583) {
                    if (inputs[16] < -0.17421053) {
                        var1 = -0.0032280975;
                    } else {
                        var1 = 0.034755748;
                    }
                } else {
                    if (inputs[9] < 5.695) {
                        var1 = -0.006166509;
                    } else {
                        var1 = -0.038335007;
                    }
                }
            } else {
                if (inputs[1] < 72.61344) {
                    if (inputs[20] < -0.19728385) {
                        var1 = 0.016211586;
                    } else {
                        var1 = 0.03454538;
                    }
                } else {
                    var1 = -0.003541633;
                }
            }
        } else {
            var1 = -0.023407489;
        }
    }
    double var2;
    if (inputs[16] < 0.12944362) {
        if (inputs[1] < 30.82347) {
            if (inputs[1] < 27.259417) {
                if (inputs[23] < -19.12085) {
                    var2 = -0.017781746;
                } else {
                    var2 = 0.025640769;
                }
            } else {
                var2 = -0.025399793;
            }
        } else {
            if (inputs[25] < 1.8914771) {
                var2 = -0.013101291;
            } else {
                if (inputs[9] < 4.19) {
                    if (inputs[14] < 0.781) {
                        var2 = 0.015657477;
                    } else {
                        var2 = 0.045989707;
                    }
                } else {
                    if (inputs[15] < -0.2869091) {
                        var2 = 0.019077832;
                    } else {
                        var2 = -0.019320816;
                    }
                }
            }
        }
    } else {
        if (inputs[20] < 0.106602594) {
            if (inputs[2] < 1.7664286) {
                if (inputs[3] < 1814.065) {
                    var2 = -0.008648311;
                } else {
                    var2 = 0.030044323;
                }
            } else {
                var2 = -0.02030755;
            }
        } else {
            if (inputs[11] < 0.28) {
                var2 = -0.018353177;
            } else {
                var2 = -0.060235757;
            }
        }
    }
    double var3;
    if (inputs[20] < 0.106602594) {
        if (inputs[21] < -2.6912065) {
            if (inputs[20] < -0.9081138) {
                var3 = 0.010388583;
            } else {
                var3 = -0.022975765;
            }
        } else {
            if (inputs[25] < 2.3903956) {
                if (inputs[18] < 1.8450803) {
                    var3 = -0.011264907;
                } else {
                    var3 = 0.014753628;
                }
            } else {
                if (inputs[17] < 1.1192747) {
                    var3 = 0.000025936552;
                } else {
                    if (inputs[1] < 68.180214) {
                        var3 = 0.05304529;
                    } else {
                        var3 = 0.015459377;
                    }
                }
            }
        }
    } else {
        if (inputs[16] < 0.120789476) {
            if (inputs[9] < 4.47) {
                if (inputs[17] < 1.2256917) {
                    var3 = -0.0046832487;
                } else {
                    var3 = 0.028498743;
                }
            } else {
                if (inputs[4] < 1778.515) {
                    var3 = -0.044829126;
                } else {
                    if (inputs[15] < -0.4269697) {
                        var3 = 0.017226748;
                    } else {
                        var3 = -0.027328106;
                    }
                }
            }
        } else {
            if (inputs[2] < 1.9864286) {
                var3 = -0.05822996;
            } else {
                var3 = -0.005055323;
            }
        }
    }
    double var4;
    if (inputs[20] < 0.08772628) {
        if (inputs[21] < -2.872818) {
            var4 = -0.011154775;
        } else {
            if (inputs[18] < 1.5401887) {
                if (inputs[15] < 0.2969697) {
                    if (inputs[19] < 1.3315202) {
                        var4 = 0.029685233;
                    } else {
                        var4 = -0.0032048698;
                    }
                } else {
                    if (inputs[10] < 1.68) {
                        var4 = -0.021976465;
                    } else {
                        var4 = 0.0065276464;
                    }
                }
            } else {
                if (inputs[2] < 1.7892857) {
                    var4 = 0.04713492;
                } else {
                    if (inputs[20] < -0.9606296) {
                        var4 = -0.012982074;
                    } else {
                        var4 = 0.024414286;
                    }
                }
            }
        }
    } else {
        if (inputs[16] < 0.1437594) {
            if (inputs[10] < 2.1375) {
                if (inputs[20] < 0.7862127) {
                    var4 = -0.0062546255;
                } else {
                    if (inputs[21] < -1.9089215) {
                        var4 = 0.034134496;
                    } else {
                        var4 = 0.010539811;
                    }
                }
            } else {
                if (inputs[15] < -0.44751516) {
                    var4 = 0.0035982737;
                } else {
                    var4 = -0.03691385;
                }
            }
        } else {
            if (inputs[11] < 0.27) {
                var4 = -0.012804951;
            } else {
                var4 = -0.061367974;
            }
        }
    }
    double var5;
    if (inputs[23] < 26.09915) {
        if (inputs[13] < 1779.85) {
            if (inputs[20] < 0.00019193416) {
                if (inputs[17] < 1.075472) {
                    var5 = -0.020953208;
                } else {
                    if (inputs[17] < 1.4078722) {
                        var5 = 0.030012101;
                    } else {
                        var5 = 0.0062403376;
                    }
                }
            } else {
                if (inputs[19] < 1.4670558) {
                    var5 = 0.0005431217;
                } else {
                    var5 = -0.03609972;
                }
            }
        } else {
            if (inputs[16] < 0.12332331) {
                if (inputs[13] < 1808.35) {
                    var5 = 0.03756686;
                } else {
                    if (inputs[20] < 1.1718025) {
                        var5 = 0.0068493625;
                    } else {
                        var5 = 0.032772947;
                    }
                }
            } else {
                if (inputs[16] < 0.23195489) {
                    var5 = -0.021970177;
                } else {
                    if (inputs[9] < 5.21) {
                        var5 = 0.00011059864;
                    } else {
                        var5 = 0.027914057;
                    }
                }
            }
        }
    } else {
        var5 = -0.03070278;
    }
    double var6;
    if (inputs[10] < 1.185) {
        if (inputs[13] < 1675.32) {
            var6 = 0.03641624;
        } else {
            if (inputs[5] < 1827.1575) {
                if (inputs[15] < 0.3429091) {
                    if (inputs[16] < -0.11422557) {
                        var6 = -0.019002916;
                    } else {
                        var6 = -0.04018687;
                    }
                } else {
                    var6 = -0.0005767555;
                }
            } else {
                if (inputs[18] < 1.6192594) {
                    if (inputs[19] < 1.3315202) {
                        var6 = 0.019907014;
                    } else {
                        var6 = -0.00925995;
                    }
                } else {
                    var6 = 0.03139213;
                }
            }
        }
    } else {
        if (inputs[13] < 1706.51) {
            if (inputs[3] < 1665.805) {
                var6 = -0.0050681983;
            } else {
                var6 = -0.051443797;
            }
        } else {
            if (inputs[6] < 1838.545) {
                if (inputs[16] < -0.14364661) {
                    var6 = -0.011841004;
                } else {
                    if (inputs[15] < 0.20012121) {
                        var6 = 0.038754202;
                    } else {
                        var6 = 0.0018263815;
                    }
                }
            } else {
                if (inputs[10] < 3.645) {
                    if (inputs[19] < 1.7740611) {
                        var6 = -0.011158671;
                    } else {
                        var6 = -0.040128563;
                    }
                } else {
                    var6 = 0.009756156;
                }
            }
        }
    }
    double var7;
    if (inputs[20] < 0.08772628) {
        if (inputs[23] < -55.599304) {
            var7 = -0.020561283;
        } else {
            if (inputs[23] < -21.98774) {
                if (inputs[9] < 5.695) {
                    var7 = 0.0378318;
                } else {
                    var7 = 0.0040388466;
                }
            } else {
                if (inputs[17] < 1.7805235) {
                    if (inputs[13] < 1778.21) {
                        var7 = -0.029721059;
                    } else {
                        var7 = 0.0035872173;
                    }
                } else {
                    var7 = 0.022232905;
                }
            }
        }
    } else {
        if (inputs[21] < -2.7182846) {
            if (inputs[23] < -15.428504) {
                var7 = -0.006246964;
            } else {
                var7 = 0.025301991;
            }
        } else {
            if (inputs[10] < 1.16) {
                if (inputs[16] < 0.11796992) {
                    var7 = 0.016672745;
                } else {
                    var7 = -0.016636908;
                }
            } else {
                if (inputs[15] < -0.208) {
                    var7 = -0.043268133;
                } else {
                    var7 = -0.019735929;
                }
            }
        }
    }
    double var8;
    if (inputs[20] < 0.106602594) {
        if (inputs[13] < 1854.9) {
            if (inputs[13] < 1820.89) {
                if (inputs[25] < 3.2899106) {
                    if (inputs[11] < 0.31) {
                        var8 = 0.036847066;
                    } else {
                        var8 = 0.004129999;
                    }
                } else {
                    var8 = -0.0063122734;
                }
            } else {
                var8 = -0.026914356;
            }
        } else {
            if (inputs[13] < 1908.8) {
                var8 = 0.04346938;
            } else {
                if (inputs[2] < 1.9664285) {
                    var8 = 0.02108821;
                } else {
                    var8 = -0.010965616;
                }
            }
        }
    } else {
        if (inputs[11] < 0.35) {
            if (inputs[11] < 0.23) {
                var8 = 0.0024501807;
            } else {
                if (inputs[19] < 2.0286694) {
                    var8 = -0.016955579;
                } else {
                    var8 = -0.041807257;
                }
            }
        } else {
            if (inputs[16] < 0.05710526) {
                if (inputs[1] < 31.394823) {
                    var8 = -0.0030188337;
                } else {
                    var8 = 0.029441146;
                }
            } else {
                var8 = -0.020135954;
            }
        }
    }
    double var9;
    if (inputs[16] < -0.16803007) {
        if (inputs[15] < -0.3089697) {
            if (inputs[17] < 1.2208292) {
                var9 = 0.023869934;
            } else {
                if (inputs[13] < 1856.33) {
                    var9 = -0.025702538;
                } else {
                    var9 = 0.013946662;
                }
            }
        } else {
            var9 = -0.036472782;
        }
    } else {
        if (inputs[24] < -19.664974) {
            var9 = 0.037651476;
        } else {
            if (inputs[13] < 1772.31) {
                if (inputs[13] < 1730.38) {
                    if (inputs[15] < -0.14654545) {
                        var9 = -0.022740223;
                    } else {
                        var9 = 0.010176809;
                    }
                } else {
                    var9 = -0.029859252;
                }
            } else {
                if (inputs[13] < 1805.01) {
                    var9 = 0.02855576;
                } else {
                    if (inputs[24] < 23.25806) {
                        var9 = -0.0004951206;
                    } else {
                        var9 = 0.027950032;
                    }
                }
            }
        }
    }
    double var10;
    if (inputs[23] < -63.956158) {
        var10 = -0.024397556;
    } else {
        if (inputs[21] < 3.4954956) {
            if (inputs[25] < 1.6705577) {
                var10 = -0.01953505;
            } else {
                if (inputs[15] < -0.71115154) {
                    var10 = 0.025282504;
                } else {
                    if (inputs[10] < 3.0025) {
                        var10 = 0.008360227;
                    } else {
                        var10 = -0.009284568;
                    }
                }
            }
        } else {
            var10 = -0.017785603;
        }
    }
    double var11;
    if (inputs[13] < 1852.78) {
        if (inputs[25] < 1.8914771) {
            var11 = -0.034504864;
        } else {
            if (inputs[25] < 3.1514523) {
                if (inputs[8] < 1813.39) {
                    if (inputs[4] < 1779.85) {
                        var11 = 0.0015886637;
                    } else {
                        var11 = 0.042491168;
                    }
                } else {
                    var11 = -0.017890543;
                }
            } else {
                if (inputs[17] < 1.3987509) {
                    if (inputs[24] < -15.776913) {
                        var11 = 0.023781149;
                    } else {
                        var11 = -0.021575259;
                    }
                } else {
                    var11 = -0.043162845;
                }
            }
        }
    } else {
        if (inputs[18] < 1.3279924) {
            var11 = -0.0097259395;
        } else {
            if (inputs[11] < 0.29) {
                var11 = -0.0029952093;
            } else {
                if (inputs[20] < -0.29775542) {
                    var11 = 0.041687645;
                } else {
                    var11 = 0.015607049;
                }
            }
        }
    }
    double var12;
    if (inputs[2] < 1.7578571) {
        if (inputs[2] < 1.5585715) {
            if (inputs[19] < 1.4932142) {
                if (inputs[9] < 5.75) {
                    if (inputs[9] < 4.7025) {
                        var12 = 0.004406032;
                    } else {
                        var12 = 0.031477425;
                    }
                } else {
                    var12 = -0.024063801;
                }
            } else {
                if (inputs[3] < 1776.65) {
                    var12 = -0.035804387;
                } else {
                    var12 = -0.00044556858;
                }
            }
        } else {
            if (inputs[10] < 1.105) {
                var12 = 0.034084335;
            } else {
                var12 = 0.0022143894;
            }
        }
    } else {
        if (inputs[18] < 1.7295618) {
            if (inputs[17] < 1.2055439) {
                var12 = -0.011382275;
            } else {
                var12 = -0.046220835;
            }
        } else {
            if (inputs[9] < 2.985) {
                var12 = 0.021215396;
            } else {
                if (inputs[13] < 1846.82) {
                    if (inputs[25] < 2.3944354) {
                        var12 = -0.029623697;
                    } else {
                        var12 = -0.0060205804;
                    }
                } else {
                    var12 = 0.004770751;
                }
            }
        }
    }
    double var13;
    if (inputs[18] < 1.1976143) {
        if (inputs[20] < -0.9729088) {
            var13 = 0.012323362;
        } else {
            if (inputs[24] < -12.509911) {
                var13 = -0.0008865092;
            } else {
                var13 = -0.033825938;
            }
        }
    } else {
        if (inputs[9] < 2.4575) {
            if (inputs[17] < 1.3987509) {
                var13 = 0.028808922;
            } else {
                var13 = 0.0025599692;
            }
        } else {
            if (inputs[2] < 1.305) {
                if (inputs[19] < 1.2894278) {
                    var13 = 0.031911056;
                } else {
                    var13 = 0.0024205379;
                }
            } else {
                if (inputs[20] < -0.4211998) {
                    if (inputs[19] < 2.5699441) {
                        var13 = -0.0034276014;
                    } else {
                        var13 = 0.023101663;
                    }
                } else {
                    if (inputs[8] < 1770.48) {
                        var13 = -0.038497373;
                    } else {
                        var13 = -0.0016598504;
                    }
                }
            }
        }
    }
    double var14;
    if (inputs[15] < 0.3481818) {
        if (inputs[23] < -23.573027) {
            if (inputs[13] < 1750.23) {
                if (inputs[19] < 1.4192966) {
                    var14 = 0.01132013;
                } else {
                    var14 = -0.014748031;
                }
            } else {
                if (inputs[16] < -0.14364661) {
                    var14 = -0.046314694;
                } else {
                    var14 = -0.014043834;
                }
            }
        } else {
            if (inputs[23] < 10.910757) {
                if (inputs[10] < 0.4375) {
                    var14 = -0.021795304;
                } else {
                    if (inputs[3] < 1780.435) {
                        var14 = -0.005886118;
                    } else {
                        var14 = 0.022717394;
                    }
                }
            } else {
                var14 = -0.023050712;
            }
        }
    } else {
        if (inputs[19] < 1.3074727) {
            var14 = 0.04653965;
        } else {
            if (inputs[15] < 0.5062424) {
                if (inputs[14] < 0.735) {
                    var14 = 0.016331976;
                } else {
                    var14 = -0.032913096;
                }
            } else {
                if (inputs[10] < 1.0175) {
                    var14 = 0.03170766;
                } else {
                    var14 = 0.0075860033;
                }
            }
        }
    }
    double var15;
    if (inputs[20] < -0.07321377) {
        if (inputs[25] < 1.8102108) {
            var15 = -0.022414643;
        } else {
            if (inputs[16] < -0.16803007) {
                var15 = -0.004018469;
            } else {
                if (inputs[16] < 0.035654135) {
                    var15 = 0.037553836;
                } else {
                    if (inputs[2] < 1.7664286) {
                        var15 = 0.017851884;
                    } else {
                        var15 = -0.015158775;
                    }
                }
            }
        }
    } else {
        if (inputs[18] < 1.3921552) {
            if (inputs[16] < 0.08121804) {
                if (inputs[10] < 1.645) {
                    var15 = 0.0001964203;
                } else {
                    var15 = -0.037924413;
                }
            } else {
                var15 = -0.048014686;
            }
        } else {
            if (inputs[1] < 69.46455) {
                if (inputs[1] < 59.95259) {
                    if (inputs[20] < 1.4213508) {
                        var15 = -0.0130265085;
                    } else {
                        var15 = 0.019476186;
                    }
                } else {
                    var15 = 0.035745867;
                }
            } else {
                var15 = -0.029802267;
            }
        }
    }
    double var16;
    if (inputs[23] < 10.910757) {
        if (inputs[5] < 1781.945) {
            if (inputs[20] < -0.3163457) {
                if (inputs[8] < 1668.26) {
                    var16 = 0.025610648;
                } else {
                    var16 = -0.0069114966;
                }
            } else {
                if (inputs[9] < 3.935) {
                    var16 = -0.0003940386;
                } else {
                    if (inputs[2] < 1.3114285) {
                        var16 = -0.007182923;
                    } else {
                        var16 = -0.0451348;
                    }
                }
            }
        } else {
            if (inputs[3] < 1899.9) {
                if (inputs[21] < -2.9766355) {
                    var16 = -0.0042808903;
                } else {
                    if (inputs[9] < 2.595) {
                        var16 = 0.002395991;
                    } else {
                        var16 = 0.026157467;
                    }
                }
            } else {
                if (inputs[25] < 2.4294116) {
                    var16 = 0.00956181;
                } else {
                    var16 = -0.020791229;
                }
            }
        }
    } else {
        var16 = -0.019906772;
    }
    double var17;
    if (inputs[25] < 3.3337195) {
        if (inputs[16] < -0.041323308) {
            if (inputs[1] < 30.82347) {
                if (inputs[15] < -0.44751516) {
                    var17 = 0.011636748;
                } else {
                    var17 = -0.026577916;
                }
            } else {
                if (inputs[16] < -0.16133834) {
                    var17 = 0.008876337;
                } else {
                    if (inputs[23] < -1.2926564) {
                        var17 = 0.04377656;
                    } else {
                        var17 = 0.019852314;
                    }
                }
            }
        } else {
            if (inputs[25] < 2.0631578) {
                if (inputs[1] < 62.119) {
                    var17 = -0.031007597;
                } else {
                    var17 = -0.0049009314;
                }
            } else {
                if (inputs[18] < 1.2593713) {
                    var17 = -0.014192942;
                } else {
                    if (inputs[17] < 1.193861) {
                        var17 = 0.036721025;
                    } else {
                        var17 = 0.0044982317;
                    }
                }
            }
        }
    } else {
        if (inputs[25] < 3.964557) {
            if (inputs[17] < 1.2666112) {
                var17 = -0.00850214;
            } else {
                var17 = -0.0358865;
            }
        } else {
            var17 = 0.010516954;
        }
    }
    double var18;
    if (inputs[20] < 0.06041935) {
        if (inputs[23] < 3.5438905) {
            if (inputs[1] < 61.282856) {
                if (inputs[18] < 1.8482535) {
                    if (inputs[9] < 2.4475) {
                        var18 = 0.011960182;
                    } else {
                        var18 = -0.026577663;
                    }
                } else {
                    var18 = 0.015761113;
                }
            } else {
                if (inputs[9] < 2.985) {
                    var18 = 0.037408657;
                } else {
                    if (inputs[15] < 0.30321214) {
                        var18 = 0.033710543;
                    } else {
                        var18 = 0.005131862;
                    }
                }
            }
        } else {
            var18 = -0.019116588;
        }
    } else {
        if (inputs[11] < 0.34) {
            if (inputs[11] < 0.23) {
                var18 = -0.0016145401;
            } else {
                if (inputs[16] < 0.064518794) {
                    var18 = -0.027641142;
                } else {
                    var18 = -0.05230989;
                }
            }
        } else {
            if (inputs[16] < 0.05710526) {
                if (inputs[20] < 0.86715806) {
                    var18 = -0.011266739;
                } else {
                    if (inputs[14] < -0.752) {
                        var18 = 0.01041125;
                    } else {
                        var18 = 0.033557978;
                    }
                }
            } else {
                var18 = -0.02159134;
            }
        }
    }
    double var19;
    if (inputs[9] < 2.42) {
        if (inputs[17] < 1.1588719) {
            var19 = -0.007958447;
        } else {
            if (inputs[16] < -0.004045113) {
                var19 = 0.046227857;
            } else {
                var19 = 0.0074166283;
            }
        }
    } else {
        if (inputs[25] < 2.1747572) {
            if (inputs[18] < 1.8450803) {
                var19 = -0.044749603;
            } else {
                if (inputs[2] < 2.8635714) {
                    var19 = 0.010381488;
                } else {
                    var19 = -0.016625207;
                }
            }
        } else {
            if (inputs[23] < -59.855896) {
                var19 = -0.022033649;
            } else {
                if (inputs[5] < 1913.09) {
                    if (inputs[1] < 26.023777) {
                        var19 = 0.031543497;
                    } else {
                        var19 = 0.0071487813;
                    }
                } else {
                    if (inputs[3] < 1938.925) {
                        var19 = -0.03580204;
                    } else {
                        var19 = 0.006175739;
                    }
                }
            }
        }
    }
    double var20;
    if (inputs[5] < 1781.945) {
        if (inputs[20] < 1.163589) {
            if (inputs[17] < 1.2774255) {
                if (inputs[23] < -48.36916) {
                    var20 = 0.014666709;
                } else {
                    var20 = -0.027843367;
                }
            } else {
                if (inputs[2] < 2.1121428) {
                    if (inputs[19] < 1.4192966) {
                        var20 = 0.016756803;
                    } else {
                        var20 = -0.022034885;
                    }
                } else {
                    var20 = 0.024079293;
                }
            }
        } else {
            var20 = -0.03140164;
        }
    } else {
        if (inputs[13] < 1808.35) {
            var20 = 0.025302174;
        } else {
            if (inputs[1] < 32.795147) {
                if (inputs[15] < -0.43333334) {
                    var20 = -0.001254796;
                } else {
                    var20 = -0.039994325;
                }
            } else {
                if (inputs[1] < 35.50532) {
                    var20 = 0.03409917;
                } else {
                    if (inputs[24] < 19.951187) {
                        var20 = -0.004114629;
                    } else {
                        var20 = 0.02304342;
                    }
                }
            }
        }
    }
    double var21;
    if (inputs[17] < 1.2666112) {
        if (inputs[2] < 2.1185715) {
            if (inputs[18] < 1.4568651) {
                if (inputs[20] < -0.09276572) {
                    if (inputs[19] < 1.160412) {
                        var21 = -0.0029817591;
                    } else {
                        var21 = 0.026559183;
                    }
                } else {
                    if (inputs[20] < 0.8231325) {
                        var21 = -0.024727227;
                    } else {
                        var21 = 0.009968548;
                    }
                }
            } else {
                if (inputs[23] < -13.575977) {
                    var21 = 0.042814303;
                } else {
                    var21 = 0.016827278;
                }
            }
        } else {
            var21 = -0.029417567;
        }
    } else {
        if (inputs[20] < 1.163589) {
            if (inputs[2] < 2.732143) {
                if (inputs[10] < 2.1375) {
                    if (inputs[16] < 0.15609023) {
                        var21 = 0.010754446;
                    } else {
                        var21 = -0.022815675;
                    }
                } else {
                    if (inputs[20] < -0.005653874) {
                        var21 = -0.0025504644;
                    } else {
                        var21 = -0.039567303;
                    }
                }
            } else {
                var21 = 0.014591408;
            }
        } else {
            var21 = -0.025877425;
        }
    }
    double var22;
    if (inputs[14] < -1.168) {
        if (inputs[16] < -0.17726316) {
            var22 = -0.0033695588;
        } else {
            var22 = 0.03271993;
        }
    } else {
        if (inputs[15] < 0.3429091) {
            if (inputs[15] < 0.27848485) {
                if (inputs[10] < 2.1375) {
                    if (inputs[9] < 4.385) {
                        var22 = -0.008902437;
                    } else {
                        var22 = 0.02210896;
                    }
                } else {
                    if (inputs[19] < 1.8369683) {
                        var22 = -0.03541706;
                    } else {
                        var22 = 0.0009368489;
                    }
                }
            } else {
                var22 = -0.039441112;
            }
        } else {
            if (inputs[23] < -23.777779) {
                var22 = 0.022321709;
            } else {
                if (inputs[1] < 69.5182) {
                    if (inputs[20] < -0.3163457) {
                        var22 = -0.0073214755;
                    } else {
                        var22 = 0.025527643;
                    }
                } else {
                    var22 = -0.020876937;
                }
            }
        }
    }
    double var23;
    if (inputs[23] < 25.207453) {
        if (inputs[20] < 0.106602594) {
            if (inputs[21] < 2.5932102) {
                if (inputs[1] < 64.21748) {
                    if (inputs[1] < 60.820408) {
                        var23 = -0.0014140644;
                    } else {
                        var23 = 0.038662095;
                    }
                } else {
                    var23 = -0.024088554;
                }
            } else {
                if (inputs[19] < 1.3074727) {
                    var23 = 0.03346701;
                } else {
                    if (inputs[15] < 0.50357574) {
                        var23 = -0.0049298685;
                    } else {
                        var23 = 0.033379145;
                    }
                }
            }
        } else {
            if (inputs[23] < -3.9755354) {
                if (inputs[23] < -32.626118) {
                    if (inputs[20] < 1.4213508) {
                        var23 = -0.013486364;
                    } else {
                        var23 = 0.018482473;
                    }
                } else {
                    if (inputs[9] < 4.105) {
                        var23 = -0.016862625;
                    } else {
                        var23 = -0.04640918;
                    }
                }
            } else {
                if (inputs[15] < -0.3449091) {
                    var23 = 0.027751695;
                } else {
                    var23 = -0.002462711;
                }
            }
        }
    } else {
        var23 = -0.028031932;
    }
    double var24;
    if (inputs[3] < 1827.035) {
        if (inputs[10] < 0.3275) {
            var24 = -0.029774085;
        } else {
            if (inputs[23] < -16.935852) {
                if (inputs[19] < 1.4670558) {
                    if (inputs[17] < 1.2465311) {
                        var24 = 0.0051711765;
                    } else {
                        var24 = 0.0343638;
                    }
                } else {
                    if (inputs[2] < 1.9985714) {
                        var24 = -0.025859864;
                    } else {
                        var24 = 0.021588208;
                    }
                }
            } else {
                if (inputs[21] < -2.3217247) {
                    var24 = 0.0054013445;
                } else {
                    var24 = -0.02629058;
                }
            }
        }
    } else {
        if (inputs[10] < 0.205) {
            var24 = 0.030728836;
        } else {
            if (inputs[1] < 32.738472) {
                var24 = -0.016896335;
            } else {
                if (inputs[1] < 36.89342) {
                    var24 = 0.03269452;
                } else {
                    if (inputs[4] < 1923.46) {
                        var24 = 0.01381053;
                    } else {
                        var24 = -0.01765035;
                    }
                }
            }
        }
    }
    double var25;
    if (inputs[16] < -0.25378194) {
        if (inputs[11] < 0.23) {
            var25 = 0.008710068;
        } else {
            var25 = -0.04452698;
        }
    } else {
        if (inputs[1] < 26.193537) {
            var25 = 0.026029121;
        } else {
            if (inputs[1] < 30.003166) {
                var25 = -0.02968594;
            } else {
                if (inputs[16] < -0.08324812) {
                    if (inputs[5] < 1786.4475) {
                        var25 = 0.00048133713;
                    } else {
                        var25 = 0.026627418;
                    }
                } else {
                    if (inputs[25] < 2.0785584) {
                        var25 = -0.018360652;
                    } else {
                        var25 = 0.0049783075;
                    }
                }
            }
        }
    }
    double var26;
    if (inputs[10] < 2.4825) {
        if (inputs[10] < 0.66) {
            if (inputs[15] < 0.3481818) {
                if (inputs[2] < 1.3571428) {
                    var26 = -0.034985557;
                } else {
                    if (inputs[21] < -2.0811305) {
                        var26 = 0.022289984;
                    } else {
                        var26 = -0.016857656;
                    }
                }
            } else {
                var26 = 0.016486835;
            }
        } else {
            if (inputs[19] < 2.144363) {
                if (inputs[15] < -0.43333334) {
                    var26 = 0.034696747;
                } else {
                    if (inputs[11] < 0.33) {
                        var26 = -0.010956813;
                    } else {
                        var26 = 0.01613756;
                    }
                }
            } else {
                var26 = -0.014273987;
            }
        }
    } else {
        if (inputs[2] < 2.3585715) {
            if (inputs[2] < 1.4471428) {
                var26 = -0.009308339;
            } else {
                var26 = -0.044412933;
            }
        } else {
            if (inputs[25] < 2.4294116) {
                var26 = 0.01680131;
            } else {
                var26 = -0.00979826;
            }
        }
    }
    double var27;
    if (inputs[23] < 19.42722) {
        if (inputs[10] < 2.205) {
            if (inputs[16] < 0.18751879) {
                if (inputs[14] < 0.55) {
                    if (inputs[21] < -1.8869901) {
                        var27 = 0.011468274;
                    } else {
                        var27 = -0.023138955;
                    }
                } else {
                    if (inputs[23] < -32.103245) {
                        var27 = 0.035522506;
                    } else {
                        var27 = 0.008357269;
                    }
                }
            } else {
                if (inputs[15] < 0.44769698) {
                    var27 = -0.027349189;
                } else {
                    var27 = 0.010271233;
                }
            }
        } else {
            if (inputs[2] < 2.78) {
                if (inputs[23] < -45.13154) {
                    var27 = 0.014197114;
                } else {
                    if (inputs[19] < 1.6515522) {
                        var27 = -0.040605117;
                    } else {
                        var27 = -0.010530593;
                    }
                }
            } else {
                var27 = 0.011131846;
            }
        }
    } else {
        var27 = -0.031106073;
    }
    double var28;
    if (inputs[14] < -1.185) {
        var28 = 0.020798964;
    } else {
        if (inputs[25] < 1.8835075) {
            if (inputs[24] < 2.8597767) {
                var28 = -0.03459117;
            } else {
                var28 = -0.00017122121;
            }
        } else {
            if (inputs[2] < 2.67) {
                if (inputs[17] < 1.2800875) {
                    if (inputs[18] < 1.5035175) {
                        var28 = 0.00047199722;
                    } else {
                        var28 = 0.02149836;
                    }
                } else {
                    if (inputs[14] < 0.952) {
                        var28 = -0.016858319;
                    } else {
                        var28 = 0.0053887535;
                    }
                }
            } else {
                var28 = 0.022676436;
            }
        }
    }
    double var29;
    if (inputs[23] < 10.910757) {
        if (inputs[8] < 1942.16) {
            if (inputs[24] < -24.57918) {
                var29 = 0.018070534;
            } else {
                if (inputs[16] < -0.11656391) {
                    if (inputs[15] < -0.4562424) {
                        var29 = 0.00565779;
                    } else {
                        var29 = -0.024937004;
                    }
                } else {
                    if (inputs[16] < -0.041323308) {
                        var29 = 0.021891266;
                    } else {
                        var29 = -0.00074875803;
                    }
                }
            }
        } else {
            var29 = 0.028898297;
        }
    } else {
        var29 = -0.017176919;
    }
    double var30;
    if (inputs[1] < 30.82347) {
        if (inputs[20] < 0.83157694) {
            if (inputs[15] < -0.40339395) {
                var30 = -0.03379193;
            } else {
                var30 = 0.0011449716;
            }
        } else {
            var30 = 0.0052467505;
        }
    } else {
        if (inputs[24] < -17.83942) {
            var30 = 0.022984007;
        } else {
            if (inputs[15] < 0.3481818) {
                if (inputs[14] < -0.923) {
                    var30 = 0.020567432;
                } else {
                    if (inputs[20] < -1.3405008) {
                        var30 = 0.015222888;
                    } else {
                        var30 = -0.016057547;
                    }
                }
            } else {
                if (inputs[16] < 0.15609023) {
                    if (inputs[23] < -23.777779) {
                        var30 = 0.043762766;
                    } else {
                        var30 = 0.006236484;
                    }
                } else {
                    if (inputs[3] < 1819.97) {
                        var30 = -0.016385512;
                    } else {
                        var30 = 0.011382777;
                    }
                }
            }
        }
    }
    double var31;
    if (inputs[24] < -20.653982) {
        if (inputs[10] < 2.03) {
            var31 = 0.032732695;
        } else {
            var31 = 0.0001479113;
        }
    } else {
        if (inputs[15] < 0.39478788) {
            if (inputs[25] < 3.3829618) {
                if (inputs[18] < 1.1163709) {
                    var31 = 0.014379574;
                } else {
                    if (inputs[21] < -1.6590085) {
                        var31 = 0.0036653145;
                    } else {
                        var31 = -0.024438443;
                    }
                }
            } else {
                var31 = -0.032902617;
            }
        } else {
            if (inputs[15] < 0.43066666) {
                var31 = 0.03680162;
            } else {
                if (inputs[1] < 74.1825) {
                    if (inputs[23] < -23.777779) {
                        var31 = 0.031282116;
                    } else {
                        var31 = 0.003964917;
                    }
                } else {
                    var31 = -0.013582284;
                }
            }
        }
    }
    double var32;
    if (inputs[10] < 0.35) {
        if (inputs[25] < 2.8755717) {
            var32 = 0.000836687;
        } else {
            var32 = -0.03621799;
        }
    } else {
        if (inputs[9] < 2.965) {
            if (inputs[16] < -0.0798797) {
                var32 = 0.03765234;
            } else {
                if (inputs[1] < 60.98387) {
                    var32 = -0.010330251;
                } else {
                    var32 = 0.02894897;
                }
            }
        } else {
            if (inputs[20] < -0.5909319) {
                if (inputs[25] < 2.6388013) {
                    var32 = 0.0015902133;
                } else {
                    if (inputs[10] < 2.105) {
                        var32 = 0.035162665;
                    } else {
                        var32 = 0.011733293;
                    }
                }
            } else {
                if (inputs[11] < 0.37) {
                    if (inputs[19] < 1.8369683) {
                        var32 = -0.03150903;
                    } else {
                        var32 = 0.0012922011;
                    }
                } else {
                    if (inputs[2] < 1.2021428) {
                        var32 = 0.033090375;
                    } else {
                        var32 = -0.0021191447;
                    }
                }
            }
        }
    }
    double var33;
    if (inputs[2] < 2.78) {
        if (inputs[19] < 1.1154667) {
            if (inputs[23] < -31.334112) {
                var33 = 0.029012911;
            } else {
                var33 = 0.010409585;
            }
        } else {
            if (inputs[25] < 1.8732743) {
                var33 = -0.028614705;
            } else {
                if (inputs[18] < 1.1123799) {
                    var33 = -0.025435414;
                } else {
                    if (inputs[17] < 1.2256917) {
                        var33 = 0.014132047;
                    } else {
                        var33 = -0.00507566;
                    }
                }
            }
        }
    } else {
        if (inputs[6] < 1925.67) {
            var33 = 0.026382497;
        } else {
            var33 = 0.0041125054;
        }
    }
    double var34;
    if (inputs[23] < -35.493023) {
        if (inputs[14] < -0.763) {
            var34 = -0.033912;
        } else {
            if (inputs[11] < 0.36) {
                var34 = -0.019751083;
            } else {
                if (inputs[21] < 2.0965884) {
                    var34 = -0.0041;
                } else {
                    var34 = 0.025835844;
                }
            }
        }
    } else {
        if (inputs[23] < 0.9116595) {
            if (inputs[1] < 68.180214) {
                if (inputs[16] < 0.21756391) {
                    if (inputs[14] < -1.185) {
                        var34 = 0.030566156;
                    } else {
                        var34 = 0.004442485;
                    }
                } else {
                    var34 = 0.043822378;
                }
            } else {
                if (inputs[2] < 1.405) {
                    var34 = 0.010153447;
                } else {
                    var34 = -0.021032909;
                }
            }
        } else {
            if (inputs[2] < 1.7892857) {
                var34 = 0.0018808682;
            } else {
                var34 = -0.032679502;
            }
        }
    }
    double var35;
    if (inputs[20] < 0.08772628) {
        if (inputs[11] < 0.41) {
            if (inputs[8] < 1667.8) {
                var35 = 0.018950505;
            } else {
                if (inputs[16] < 0.18212782) {
                    if (inputs[19] < 1.3652738) {
                        var35 = -0.034195106;
                    } else {
                        var35 = -0.0055306638;
                    }
                } else {
                    if (inputs[1] < 73.153046) {
                        var35 = 0.02268953;
                    } else {
                        var35 = -0.013197935;
                    }
                }
            }
        } else {
            if (inputs[14] < 0.608) {
                var35 = 0.0046151946;
            } else {
                var35 = 0.035517942;
            }
        }
    } else {
        if (inputs[16] < 0.15496993) {
            if (inputs[1] < 31.216616) {
                if (inputs[20] < 0.84939736) {
                    var35 = -0.03300361;
                } else {
                    var35 = -0.007193571;
                }
            } else {
                if (inputs[23] < -32.103245) {
                    var35 = 0.021307057;
                } else {
                    if (inputs[18] < 1.5214299) {
                        var35 = -0.022730578;
                    } else {
                        var35 = 0.0069889477;
                    }
                }
            }
        } else {
            var35 = -0.030245269;
        }
    }
    double var36;
    if (inputs[15] < -0.5858182) {
        if (inputs[23] < -14.196849) {
            var36 = 0.003470561;
        } else {
            var36 = 0.031120028;
        }
    } else {
        if (inputs[17] < 2.40022) {
            if (inputs[1] < 31.467228) {
                if (inputs[1] < 26.495476) {
                    var36 = 0.00931272;
                } else {
                    if (inputs[2] < 1.4335715) {
                        var36 = -0.049211998;
                    } else {
                        var36 = -0.0034497634;
                    }
                }
            } else {
                if (inputs[23] < -19.270708) {
                    if (inputs[25] < 2.7594762) {
                        var36 = 0.0007675145;
                    } else {
                        var36 = 0.025216341;
                    }
                } else {
                    if (inputs[4] < 1775.015) {
                        var36 = -0.02955684;
                    } else {
                        var36 = 0.0027411731;
                    }
                }
            }
        } else {
            var36 = -0.035255663;
        }
    }
    double var37;
    if (inputs[1] < 31.125147) {
        if (inputs[10] < 0.6925) {
            var37 = -0.034064684;
        } else {
            if (inputs[10] < 2.1375) {
                var37 = 0.019327972;
            } else {
                if (inputs[20] < 0.84939736) {
                    var37 = -0.042414114;
                } else {
                    var37 = -0.0071918345;
                }
            }
        }
    } else {
        if (inputs[24] < -16.75377) {
            var37 = 0.03279978;
        } else {
            if (inputs[19] < 2.7001708) {
                if (inputs[16] < 0.19874436) {
                    if (inputs[25] < 2.2597165) {
                        var37 = 0.011772343;
                    } else {
                        var37 = -0.0062340437;
                    }
                } else {
                    if (inputs[10] < 1.355) {
                        var37 = -0.04415717;
                    } else {
                        var37 = 0.0078382995;
                    }
                }
            } else {
                if (inputs[19] < 3.4676204) {
                    var37 = 0.034590032;
                } else {
                    var37 = 0.0050388;
                }
            }
        }
    }
    double var38;
    if (inputs[16] < -0.16803007) {
        if (inputs[9] < 4.3075) {
            var38 = -0.030717835;
        } else {
            if (inputs[10] < 1.575) {
                var38 = 0.02025741;
            } else {
                if (inputs[20] < 0.54795927) {
                    var38 = 0.008658202;
                } else {
                    var38 = -0.034972318;
                }
            }
        }
    } else {
        if (inputs[24] < -18.971659) {
            var38 = 0.027307788;
        } else {
            if (inputs[11] < 0.45) {
                if (inputs[19] < 1.1154667) {
                    var38 = 0.030182881;
                } else {
                    if (inputs[15] < 0.3798788) {
                        var38 = -0.0124725625;
                    } else {
                        var38 = 0.007343241;
                    }
                }
            } else {
                var38 = -0.022274636;
            }
        }
    }
    double var39;
    if (inputs[18] < 1.2168549) {
        if (inputs[10] < 2.1375) {
            if (inputs[15] < 0.23206061) {
                if (inputs[25] < 3.0107527) {
                    var39 = -0.0022474506;
                } else {
                    var39 = 0.027656052;
                }
            } else {
                var39 = -0.020843502;
            }
        } else {
            var39 = -0.035196606;
        }
    } else {
        if (inputs[17] < 2.5590653) {
            if (inputs[11] < 0.2) {
                var39 = 0.032327767;
            } else {
                if (inputs[21] < -2.872818) {
                    var39 = -0.009698296;
                } else {
                    if (inputs[10] < 1.23) {
                        var39 = 0.017003076;
                    } else {
                        var39 = -0.00017841453;
                    }
                }
            }
        } else {
            var39 = -0.016390394;
        }
    }
    double var40;
    if (inputs[17] < 0.8197219) {
        var40 = -0.02405704;
    } else {
        if (inputs[19] < 1.1199208) {
            var40 = 0.025890749;
        } else {
            if (inputs[24] < -20.12975) {
                if (inputs[24] < -26.2384) {
                    var40 = -0.010216752;
                } else {
                    if (inputs[17] < 1.3955787) {
                        var40 = 0.03973753;
                    } else {
                        var40 = 0.0052870554;
                    }
                }
            } else {
                if (inputs[18] < 1.6558771) {
                    if (inputs[8] < 1805.09) {
                        var40 = -0.025051065;
                    } else {
                        var40 = -0.003232281;
                    }
                } else {
                    if (inputs[23] < 4.9678183) {
                        var40 = 0.006524653;
                    } else {
                        var40 = -0.013557806;
                    }
                }
            }
        }
    }
    double var41;
    if (inputs[14] < 0.93) {
        if (inputs[24] < -19.664974) {
            if (inputs[24] < -26.2384) {
                var41 = -0.013165589;
            } else {
                if (inputs[21] < -3.0357554) {
                    var41 = 0.03682563;
                } else {
                    var41 = 0.011249459;
                }
            }
        } else {
            if (inputs[1] < 30.82347) {
                var41 = -0.03328601;
            } else {
                if (inputs[19] < 1.3179533) {
                    if (inputs[10] < 0.95) {
                        var41 = 0.026638847;
                    } else {
                        var41 = -0.011064191;
                    }
                } else {
                    if (inputs[19] < 1.8027071) {
                        var41 = -0.021015357;
                    } else {
                        var41 = -0.00038262573;
                    }
                }
            }
        }
    } else {
        if (inputs[17] < 1.6821961) {
            var41 = 0.034987137;
        } else {
            if (inputs[5] < 1818.8975) {
                var41 = 0.018524757;
            } else {
                var41 = -0.01172244;
            }
        }
    }
    double var42;
    if (inputs[25] < 2.946502) {
        if (inputs[25] < 1.8835075) {
            if (inputs[3] < 1848.65) {
                var42 = -0.026859058;
            } else {
                var42 = 0.008242686;
            }
        } else {
            if (inputs[18] < 1.3073698) {
                if (inputs[18] < 1.1484094) {
                    var42 = 0.008832371;
                } else {
                    var42 = -0.01601849;
                }
            } else {
                if (inputs[10] < 3.1275) {
                    if (inputs[16] < -0.041323308) {
                        var42 = 0.02791206;
                    } else {
                        var42 = 0.0106873065;
                    }
                } else {
                    var42 = -0.0006917674;
                }
            }
        }
    } else {
        if (inputs[20] < -0.4953674) {
            if (inputs[14] < 0.448) {
                var42 = -0.020317867;
            } else {
                var42 = 0.02348019;
            }
        } else {
            if (inputs[16] < 0.19218796) {
                if (inputs[17] < 1.0672319) {
                    var42 = -0.023920372;
                } else {
                    if (inputs[2] < 1.4264286) {
                        var42 = 0.013394475;
                    } else {
                        var42 = -0.021128848;
                    }
                }
            } else {
                var42 = -0.04063718;
            }
        }
    }
    double var43;
    if (inputs[25] < 2.3162615) {
        if (inputs[6] < 1834.63) {
            if (inputs[13] < 1731.27) {
                var43 = -0.014190802;
            } else {
                var43 = -0.04072399;
            }
        } else {
            if (inputs[2] < 2.0285714) {
                var43 = 0.026465679;
            } else {
                var43 = -0.011076901;
            }
        }
    } else {
        if (inputs[20] < 0.08772628) {
            if (inputs[24] < 17.506098) {
                if (inputs[5] < 1778.7025) {
                    if (inputs[24] < -12.862494) {
                        var43 = 0.029993732;
                    } else {
                        var43 = 0.006012349;
                    }
                } else {
                    if (inputs[2] < 1.5042857) {
                        var43 = -0.026202844;
                    } else {
                        var43 = 0.0139706135;
                    }
                }
            } else {
                if (inputs[3] < 1819.97) {
                    var43 = 0.010163534;
                } else {
                    var43 = 0.041290104;
                }
            }
        } else {
            if (inputs[14] < -0.653) {
                if (inputs[1] < 30.82347) {
                    var43 = -0.0023978034;
                } else {
                    var43 = 0.026419733;
                }
            } else {
                if (inputs[18] < 1.4149307) {
                    var43 = -0.033346433;
                } else {
                    var43 = 0.0031083245;
                }
            }
        }
    }
    double var44;
    if (inputs[17] < 0.8197219) {
        var44 = -0.024176558;
    } else {
        if (inputs[20] < 0.025593309) {
            if (inputs[3] < 1728.96) {
                if (inputs[6] < 1666.91) {
                    var44 = 0.017052662;
                } else {
                    var44 = 0.03668354;
                }
            } else {
                if (inputs[13] < 1854.9) {
                    if (inputs[17] < 1.2055439) {
                        var44 = 0.005002795;
                    } else {
                        var44 = -0.019261291;
                    }
                } else {
                    if (inputs[12] < 1922.22) {
                        var44 = 0.037212037;
                    } else {
                        var44 = -0.0039172894;
                    }
                }
            }
        } else {
            if (inputs[1] < 69.5182) {
                if (inputs[25] < 2.1560936) {
                    if (inputs[17] < 1.4736539) {
                        var44 = -0.036884204;
                    } else {
                        var44 = 0.003627184;
                    }
                } else {
                    if (inputs[16] < -0.23464662) {
                        var44 = -0.010749963;
                    } else {
                        var44 = 0.012670277;
                    }
                }
            } else {
                var44 = -0.04052276;
            }
        }
    }
    double var45;
    if (inputs[24] < -20.653982) {
        if (inputs[24] < -25.921698) {
            var45 = -0.005284944;
        } else {
            if (inputs[4] < 1808.115) {
                var45 = 0.012073032;
            } else {
                var45 = 0.037168972;
            }
        }
    } else {
        if (inputs[21] < -2.872818) {
            var45 = -0.028752513;
        } else {
            if (inputs[25] < 1.8835075) {
                if (inputs[13] < 1846.3) {
                    var45 = -0.031654146;
                } else {
                    var45 = -0.00060546293;
                }
            } else {
                if (inputs[23] < 1.182681) {
                    if (inputs[18] < 1.2593713) {
                        var45 = -0.0036662724;
                    } else {
                        var45 = 0.015157353;
                    }
                } else {
                    if (inputs[17] < 1.2465311) {
                        var45 = 0.007300986;
                    } else {
                        var45 = -0.0340314;
                    }
                }
            }
        }
    }
    double var46;
    if (inputs[4] < 1720.37) {
        if (inputs[13] < 1667.96) {
            if (inputs[4] < 1651.39) {
                var46 = -0.012467388;
            } else {
                var46 = 0.021448975;
            }
        } else {
            if (inputs[14] < 0.679) {
                var46 = -0.035586555;
            } else {
                var46 = -0.0083105005;
            }
        }
    } else {
        if (inputs[20] < -0.09276572) {
            if (inputs[2] < 2.0564287) {
                if (inputs[6] < 1826.915) {
                    if (inputs[6] < 1779.555) {
                        var46 = 0.024718551;
                    } else {
                        var46 = -0.014522881;
                    }
                } else {
                    if (inputs[9] < 3.2025) {
                        var46 = 0.040088505;
                    } else {
                        var46 = 0.010618088;
                    }
                }
            } else {
                if (inputs[20] < -1.0209947) {
                    var46 = -0.013408293;
                } else {
                    var46 = 0.0033732206;
                }
            }
        } else {
            if (inputs[11] < 0.21) {
                var46 = 0.017518586;
            } else {
                if (inputs[1] < 26.023777) {
                    var46 = 0.02078949;
                } else {
                    if (inputs[11] < 0.35) {
                        var46 = -0.02778058;
                    } else {
                        var46 = -0.0003298891;
                    }
                }
            }
        }
    }
    double var47;
    if (inputs[25] < 1.6705577) {
        var47 = -0.021545686;
    } else {
        if (inputs[25] < 3.3075356) {
            if (inputs[20] < -1.0644877) {
                if (inputs[10] < 1.535) {
                    var47 = 0.0014202544;
                } else {
                    var47 = 0.032489322;
                }
            } else {
                if (inputs[10] < 2.42) {
                    if (inputs[25] < 2.860633) {
                        var47 = 0.011502321;
                    } else {
                        var47 = -0.00825117;
                    }
                } else {
                    if (inputs[25] < 2.7251277) {
                        var47 = -0.029603532;
                    } else {
                        var47 = 0.00616419;
                    }
                }
            }
        } else {
            if (inputs[24] < -23.214403) {
                var47 = 0.019308172;
            } else {
                if (inputs[17] < 1.378135) {
                    if (inputs[10] < 1.89) {
                        var47 = -0.01970462;
                    } else {
                        var47 = 0.013131983;
                    }
                } else {
                    var47 = -0.03936858;
                }
            }
        }
    }
    double var48;
    if (inputs[16] < -0.239203) {
        if (inputs[3] < 1794.415) {
            var48 = 0.0001676088;
        } else {
            var48 = -0.026511787;
        }
    } else {
        if (inputs[1] < 25.699049) {
            var48 = 0.028953603;
        } else {
            if (inputs[1] < 31.125147) {
                var48 = -0.022384726;
            } else {
                if (inputs[16] < -0.028947368) {
                    if (inputs[14] < -0.763) {
                        var48 = 0.031278506;
                    } else {
                        var48 = 0.008439186;
                    }
                } else {
                    if (inputs[15] < 0.39478788) {
                        var48 = -0.010917237;
                    } else {
                        var48 = 0.009087192;
                    }
                }
            }
        }
    }
    double var49;
    if (inputs[2] < 1.6878572) {
        if (inputs[25] < 2.860633) {
            if (inputs[16] < 0.051766917) {
                if (inputs[25] < 2.3828723) {
                    var49 = 0.0069672177;
                } else {
                    var49 = 0.03282759;
                }
            } else {
                var49 = -0.005139646;
            }
        } else {
            if (inputs[25] < 3.964557) {
                if (inputs[20] < -1.1184866) {
                    var49 = 0.014373252;
                } else {
                    if (inputs[16] < -0.12616542) {
                        var49 = -0.0019755608;
                    } else {
                        var49 = -0.023253752;
                    }
                }
            } else {
                var49 = 0.020953503;
            }
        }
    } else {
        if (inputs[19] < 1.8369683) {
            if (inputs[10] < 1.2175) {
                var49 = -0.0076326146;
            } else {
                var49 = -0.038062606;
            }
        } else {
            if (inputs[2] < 2.195) {
                var49 = 0.020355081;
            } else {
                if (inputs[17] < 1.3955787) {
                    var49 = -0.031603053;
                } else {
                    if (inputs[17] < 2.102351) {
                        var49 = 0.019833867;
                    } else {
                        var49 = -0.008383337;
                    }
                }
            }
        }
    }
    double var50;
    if (inputs[25] < 4.345679) {
        if (inputs[24] < -25.921698) {
            var50 = -0.023108069;
        } else {
            if (inputs[14] < -1.185) {
                var50 = 0.020377005;
            } else {
                if (inputs[25] < 1.8835075) {
                    if (inputs[10] < 1.185) {
                        var50 = 0.0010656754;
                    } else {
                        var50 = -0.030203225;
                    }
                } else {
                    if (inputs[2] < 2.6864285) {
                        var50 = 0.0015324516;
                    } else {
                        var50 = 0.024947787;
                    }
                }
            }
        }
    } else {
        var50 = 0.029914426;
    }
    double var51;
    if (inputs[13] < 1667.96) {
        var51 = 0.016221322;
    } else {
        if (inputs[8] < 1712.04) {
            var51 = -0.029528957;
        } else {
            if (inputs[4] < 1727.25) {
                var51 = 0.026809132;
            } else {
                if (inputs[6] < 1762.775) {
                    var51 = -0.025911972;
                } else {
                    if (inputs[18] < 1.5945748) {
                        var51 = -0.0048749303;
                    } else {
                        var51 = 0.007936842;
                    }
                }
            }
        }
    }
    double var52;
    if (inputs[16] < 0.2694436) {
        if (inputs[24] < -20.471956) {
            if (inputs[16] < -0.16803007) {
                if (inputs[24] < -25.683517) {
                    var52 = -0.021358741;
                } else {
                    var52 = 0.01087254;
                }
            } else {
                var52 = 0.02352483;
            }
        } else {
            if (inputs[15] < 0.3481818) {
                if (inputs[15] < -0.5858182) {
                    var52 = 0.006037458;
                } else {
                    if (inputs[9] < 5.8425) {
                        var52 = -0.01024309;
                    } else {
                        var52 = -0.040534098;
                    }
                }
            } else {
                if (inputs[9] < 2.965) {
                    var52 = 0.028074726;
                } else {
                    if (inputs[2] < 1.3192858) {
                        var52 = 0.012600406;
                    } else {
                        var52 = -0.022380777;
                    }
                }
            }
        }
    } else {
        if (inputs[14] < 0.679) {
            var52 = 0.034688413;
        } else {
            var52 = -0.0006114758;
        }
    }
    double var53;
    if (inputs[17] < 2.40022) {
        if (inputs[18] < 1.568082) {
            if (inputs[2] < 2.0085714) {
                if (inputs[19] < 1.7180334) {
                    if (inputs[19] < 1.4670558) {
                        var53 = 0.0006283468;
                    } else {
                        var53 = -0.02699907;
                    }
                } else {
                    var53 = 0.020115849;
                }
            } else {
                var53 = -0.026485901;
            }
        } else {
            if (inputs[24] < -14.232029) {
                if (inputs[24] < -21.277676) {
                    var53 = 0.010600819;
                } else {
                    var53 = -0.017095538;
                }
            } else {
                if (inputs[21] < -1.6590085) {
                    var53 = 0.034716785;
                } else {
                    if (inputs[14] < 0.826) {
                        var53 = -0.0069806604;
                    } else {
                        var53 = 0.023986086;
                    }
                }
            }
        }
    } else {
        var53 = -0.016803037;
    }
    double var54;
    if (inputs[23] < -3.152488) {
        if (inputs[21] < 2.9065473) {
            if (inputs[13] < 1835.06) {
                if (inputs[13] < 1779.85) {
                    if (inputs[8] < 1726.94) {
                        var54 = -0.003624689;
                    } else {
                        var54 = -0.033832893;
                    }
                } else {
                    var54 = 0.017198805;
                }
            } else {
                if (inputs[18] < 1.6192594) {
                    var54 = -0.045029923;
                } else {
                    var54 = -0.00667512;
                }
            }
        } else {
            if (inputs[20] < -0.3115604) {
                var54 = 0.030727401;
            } else {
                var54 = -0.009557401;
            }
        }
    } else {
        if (inputs[19] < 1.2721828) {
            var54 = -0.0097352825;
        } else {
            if (inputs[9] < 2.39) {
                var54 = 0.033291288;
            } else {
                if (inputs[20] < 0.73104346) {
                    if (inputs[20] < -0.09276572) {
                        var54 = 0.011341032;
                    } else {
                        var54 = -0.01961541;
                    }
                } else {
                    var54 = 0.021170625;
                }
            }
        }
    }
    double var55;
    if (inputs[23] < 10.910757) {
        if (inputs[23] < -5.579464) {
            if (inputs[21] < -3.0842733) {
                var55 = -0.019120995;
            } else {
                if (inputs[2] < 1.1721429) {
                    var55 = 0.020638093;
                } else {
                    if (inputs[1] < 65.745186) {
                        var55 = 0.004848141;
                    } else {
                        var55 = -0.015308729;
                    }
                }
            }
        } else {
            if (inputs[19] < 1.6401807) {
                if (inputs[2] < 1.4235715) {
                    var55 = 0.016370934;
                } else {
                    var55 = -0.01692251;
                }
            } else {
                if (inputs[25] < 2.912995) {
                    if (inputs[25] < 2.1560936) {
                        var55 = 0.017679546;
                    } else {
                        var55 = 0.037708152;
                    }
                } else {
                    var55 = 0.005030245;
                }
            }
        }
    } else {
        if (inputs[10] < 1.21) {
            var55 = -0.006202459;
        } else {
            var55 = -0.024538826;
        }
    }
    double var56;
    if (inputs[1] < 74.73677) {
        if (inputs[18] < 1.8450803) {
            if (inputs[2] < 2.195) {
                if (inputs[21] < -3.4217253) {
                    var56 = 0.01707662;
                } else {
                    if (inputs[21] < -2.8872595) {
                        var56 = -0.033737775;
                    } else {
                        var56 = 0.0036784285;
                    }
                }
            } else {
                var56 = -0.029177584;
            }
        } else {
            if (inputs[10] < 1.185) {
                if (inputs[10] < 0.6475) {
                    var56 = 0.018095413;
                } else {
                    var56 = 0.037554942;
                }
            } else {
                if (inputs[2] < 2.382857) {
                    var56 = -0.021985218;
                } else {
                    if (inputs[2] < 3.2471428) {
                        var56 = 0.023730144;
                    } else {
                        var56 = -0.004907113;
                    }
                }
            }
        }
    } else {
        var56 = -0.02484315;
    }
    double var57;
    if (inputs[16] < -0.32093233) {
        var57 = -0.019485213;
    } else {
        if (inputs[1] < 26.023777) {
            var57 = 0.023220524;
        } else {
            if (inputs[10] < 5.995) {
                if (inputs[9] < 5.2025) {
                    if (inputs[10] < 0.335) {
                        var57 = -0.01069308;
                    } else {
                        var57 = 0.007004272;
                    }
                } else {
                    if (inputs[18] < 1.2435127) {
                        var57 = -0.033262067;
                    } else {
                        var57 = -0.0047138804;
                    }
                }
            } else {
                var57 = 0.024333412;
            }
        }
    }
    double var58;
    if (inputs[23] < 10.910757) {
        if (inputs[16] < 0.12596993) {
            if (inputs[24] < 12.106855) {
                if (inputs[20] < -1.1184866) {
                    var58 = -0.023262503;
                } else {
                    if (inputs[16] < -0.06378947) {
                        var58 = 0.013052111;
                    } else {
                        var58 = -0.009998539;
                    }
                }
            } else {
                if (inputs[10] < 1.155) {
                    var58 = 0.03354796;
                } else {
                    var58 = 0.0066095707;
                }
            }
        } else {
            if (inputs[24] < 10.666371) {
                var58 = 0.019233573;
            } else {
                if (inputs[20] < 0.28234375) {
                    if (inputs[23] < -23.777779) {
                        var58 = 0.012171768;
                    } else {
                        var58 = -0.017473146;
                    }
                } else {
                    var58 = -0.030837832;
                }
            }
        }
    } else {
        var58 = -0.018101975;
    }
    double var59;
    if (inputs[13] < 1850.02) {
        if (inputs[23] < -59.0966) {
            var59 = -0.025906475;
        } else {
            if (inputs[17] < 2.2499475) {
                if (inputs[17] < 1.7898) {
                    if (inputs[3] < 1664.805) {
                        var59 = 0.016605232;
                    } else {
                        var59 = -0.009503421;
                    }
                } else {
                    var59 = 0.02958456;
                }
            } else {
                var59 = -0.026407849;
            }
        }
    } else {
        if (inputs[5] < 1913.09) {
            if (inputs[20] < -0.14515267) {
                var59 = 0.03317167;
            } else {
                var59 = 0.005907651;
            }
        } else {
            if (inputs[9] < 2.93) {
                var59 = 0.02042348;
            } else {
                if (inputs[18] < 1.7450455) {
                    var59 = -0.02449155;
                } else {
                    var59 = 0.004954077;
                }
            }
        }
    }
    double var60;
    if (inputs[23] < -55.599304) {
        var60 = -0.017374665;
    } else {
        if (inputs[18] < 3.397783) {
            if (inputs[10] < 5.865) {
                if (inputs[21] < 3.4954956) {
                    if (inputs[16] < 0.2641203) {
                        var60 = 0.0033628477;
                    } else {
                        var60 = 0.025594654;
                    }
                } else {
                    var60 = -0.013828523;
                }
            } else {
                var60 = 0.027735898;
            }
        } else {
            var60 = -0.016592868;
        }
    }
    double var61;
    if (inputs[11] < 0.23) {
        if (inputs[17] < 1.6396024) {
            var61 = 0.02580056;
        } else {
            var61 = -0.0024279933;
        }
    } else {
        if (inputs[6] < 1931.85) {
            if (inputs[10] < 0.68) {
                if (inputs[17] < 1.0089718) {
                    var61 = -0.0028904038;
                } else {
                    if (inputs[11] < 0.38) {
                        var61 = -0.018460164;
                    } else {
                        var61 = -0.046505023;
                    }
                }
            } else {
                if (inputs[2] < 1.2021428) {
                    if (inputs[21] < 3.1700976) {
                        var61 = 0.02656886;
                    } else {
                        var61 = -0.0036445432;
                    }
                } else {
                    if (inputs[18] < 1.2435127) {
                        var61 = -0.030655194;
                    } else {
                        var61 = -0.0009112059;
                    }
                }
            }
        } else {
            if (inputs[5] < 1959.915) {
                var61 = 0.028208064;
            } else {
                var61 = -0.0060582194;
            }
        }
    }
    double var62;
    if (inputs[17] < 0.87206423) {
        var62 = -0.018558469;
    } else {
        if (inputs[19] < 1.1154667) {
            var62 = 0.023659833;
        } else {
            if (inputs[23] < -35.493023) {
                if (inputs[17] < 1.3103373) {
                    var62 = 0.0012906935;
                } else {
                    var62 = -0.02974796;
                }
            } else {
                if (inputs[19] < 1.6755253) {
                    if (inputs[4] < 1812.825) {
                        var62 = -0.020294992;
                    } else {
                        var62 = 0.00636102;
                    }
                } else {
                    if (inputs[19] < 1.9347545) {
                        var62 = 0.03034216;
                    } else {
                        var62 = 0.0018056486;
                    }
                }
            }
        }
    }
    double var63;
    if (inputs[17] < 2.5590653) {
        if (inputs[11] < 0.21) {
            if (inputs[5] < 1825.695) {
                var63 = 0.03188208;
            } else {
                var63 = 0.002580908;
            }
        } else {
            if (inputs[19] < 2.3010995) {
                if (inputs[16] < -0.041323308) {
                    if (inputs[20] < 0.8231325) {
                        var63 = -0.0026116981;
                    } else {
                        var63 = 0.02579741;
                    }
                } else {
                    if (inputs[20] < -0.8732041) {
                        var63 = 0.01056194;
                    } else {
                        var63 = -0.011760242;
                    }
                }
            } else {
                var63 = -0.026765099;
            }
        }
    } else {
        var63 = -0.017419785;
    }
    double var64;
    if (inputs[23] < -63.260647) {
        var64 = -0.0211424;
    } else {
        if (inputs[6] < 1671.95) {
            if (inputs[20] < -0.4211998) {
                var64 = 0.035805088;
            } else {
                var64 = 0.0067065386;
            }
        } else {
            if (inputs[1] < 32.738472) {
                if (inputs[9] < 4.745) {
                    var64 = -0.032728236;
                } else {
                    if (inputs[14] < -0.816) {
                        var64 = -0.012653129;
                    } else {
                        var64 = 0.021061247;
                    }
                }
            } else {
                if (inputs[8] < 1755.68) {
                    var64 = -0.0111612715;
                } else {
                    if (inputs[14] < -0.742) {
                        var64 = 0.025119618;
                    } else {
                        var64 = 0.0038783017;
                    }
                }
            }
        }
    }
    double var65;
    if (inputs[16] < 0.12944362) {
        if (inputs[10] < 1.185) {
            if (inputs[21] < -2.8800974) {
                var65 = -0.006869345;
            } else {
                if (inputs[2] < 2.0564287) {
                    if (inputs[9] < 2.73) {
                        var65 = 0.0154373385;
                    } else {
                        var65 = 0.040061437;
                    }
                } else {
                    var65 = -0.0023821644;
                }
            }
        } else {
            if (inputs[2] < 1.3678571) {
                if (inputs[13] < 1786.35) {
                    var65 = 0.021910284;
                } else {
                    var65 = -0.0037204532;
                }
            } else {
                if (inputs[3] < 1800.145) {
                    var65 = -0.029251942;
                } else {
                    if (inputs[11] < 0.29) {
                        var65 = -0.017967043;
                    } else {
                        var65 = 0.01299321;
                    }
                }
            }
        }
    } else {
        if (inputs[20] < -0.7405298) {
            if (inputs[16] < 0.22166166) {
                var65 = -0.0029711023;
            } else {
                var65 = 0.021780087;
            }
        } else {
            if (inputs[16] < 0.2694436) {
                if (inputs[3] < 1775.79) {
                    var65 = -0.01727509;
                } else {
                    var65 = -0.040254284;
                }
            } else {
                var65 = -0.002345767;
            }
        }
    }
    double var66;
    if (inputs[15] < -0.71115154) {
        var66 = 0.025340715;
    } else {
        if (inputs[19] < 2.0921564) {
            if (inputs[18] < 1.7450455) {
                if (inputs[2] < 1.7892857) {
                    if (inputs[2] < 1.5521429) {
                        var66 = 0.00064680015;
                    } else {
                        var66 = 0.024162821;
                    }
                } else {
                    var66 = -0.012768228;
                }
            } else {
                if (inputs[18] < 2.0153313) {
                    var66 = 0.030596185;
                } else {
                    var66 = 0.007511889;
                }
            }
        } else {
            if (inputs[15] < 0.39175758) {
                if (inputs[5] < 1837.4675) {
                    var66 = -0.013029833;
                } else {
                    var66 = -0.03702845;
                }
            } else {
                if (inputs[18] < 2.2016084) {
                    var66 = 0.013265847;
                } else {
                    var66 = -0.015959606;
                }
            }
        }
    }
    double var67;
    if (inputs[13] < 1850.37) {
        if (inputs[16] < 0.2694436) {
            if (inputs[13] < 1816.5) {
                if (inputs[2] < 1.1535715) {
                    if (inputs[19] < 1.2444535) {
                        var67 = 0.023848582;
                    } else {
                        var67 = -0.008948347;
                    }
                } else {
                    if (inputs[17] < 1.8681178) {
                        var67 = -0.0154830115;
                    } else {
                        var67 = 0.010742889;
                    }
                }
            } else {
                if (inputs[5] < 1841.055) {
                    var67 = -0.03579162;
                } else {
                    var67 = -0.008584695;
                }
            }
        } else {
            var67 = 0.015836427;
        }
    } else {
        if (inputs[17] < 1.8443145) {
            if (inputs[14] < -0.79) {
                var67 = 0.038101353;
            } else {
                if (inputs[18] < 1.34489) {
                    var67 = -0.019033499;
                } else {
                    if (inputs[11] < 0.28) {
                        var67 = -0.0024750794;
                    } else {
                        var67 = 0.026883373;
                    }
                }
            }
        } else {
            var67 = -0.012001399;
        }
    }
    double var68;
    if (inputs[23] < 10.910757) {
        if (inputs[14] < 1.153) {
            if (inputs[2] < 2.67) {
                if (inputs[2] < 2.2585714) {
                    if (inputs[17] < 1.2666112) {
                        var68 = 0.0062962836;
                    } else {
                        var68 = -0.009186062;
                    }
                } else {
                    var68 = -0.03059672;
                }
            } else {
                if (inputs[2] < 3.0985715) {
                    var68 = 0.03469225;
                } else {
                    var68 = -0.005070974;
                }
            }
        } else {
            var68 = 0.016708378;
        }
    } else {
        if (inputs[1] < 60.9473) {
            var68 = -0.029776659;
        } else {
            var68 = -0.0054413844;
        }
    }
    double var69;
    if (inputs[20] < 0.28234375) {
        if (inputs[9] < 8.15) {
            if (inputs[19] < 1.7106633) {
                if (inputs[19] < 1.4277356) {
                    if (inputs[17] < 1.3543264) {
                        var69 = 0.025471559;
                    } else {
                        var69 = -0.011005335;
                    }
                } else {
                    if (inputs[18] < 1.6264222) {
                        var69 = -0.026635204;
                    } else {
                        var69 = 0.006199201;
                    }
                }
            } else {
                if (inputs[17] < 1.2264322) {
                    var69 = 0.008364995;
                } else {
                    if (inputs[20] < -0.81941295) {
                        var69 = 0.012231903;
                    } else {
                        var69 = 0.04520766;
                    }
                }
            }
        } else {
            var69 = -0.0055892817;
        }
    } else {
        if (inputs[21] < 2.8196435) {
            if (inputs[15] < 0.3398788) {
                if (inputs[20] < 0.84939736) {
                    var69 = -0.019534918;
                } else {
                    if (inputs[21] < -2.6420665) {
                        var69 = 0.020714264;
                    } else {
                        var69 = -0.0065872576;
                    }
                }
            } else {
                var69 = 0.027145252;
            }
        } else {
            var69 = -0.021721512;
        }
    }
    double var70;
    if (inputs[11] < 0.35) {
        if (inputs[20] < -1.499064) {
            var70 = 0.019600794;
        } else {
            if (inputs[18] < 2.0385132) {
                if (inputs[10] < 0.45) {
                    var70 = 0.0076068165;
                } else {
                    if (inputs[2] < 1.6828572) {
                        var70 = -0.010217776;
                    } else {
                        var70 = -0.034480914;
                    }
                }
            } else {
                if (inputs[18] < 3.397783) {
                    if (inputs[18] < 2.4614255) {
                        var70 = 0.00077352824;
                    } else {
                        var70 = 0.028086007;
                    }
                } else {
                    var70 = -0.017555887;
                }
            }
        }
    } else {
        if (inputs[21] < -2.872818) {
            var70 = -0.005198112;
        } else {
            if (inputs[23] < -31.092716) {
                if (inputs[25] < 2.3162615) {
                    var70 = 0.010091411;
                } else {
                    if (inputs[16] < 0.092939846) {
                        var70 = 0.044711966;
                    } else {
                        var70 = 0.0194999;
                    }
                }
            } else {
                if (inputs[23] < -5.150817) {
                    var70 = -0.016299136;
                } else {
                    if (inputs[16] < -0.044586465) {
                        var70 = 0.029418591;
                    } else {
                        var70 = 0.003948797;
                    }
                }
            }
        }
    }
    double var71;
    if (inputs[11] < 0.45) {
        if (inputs[16] < -0.29300752) {
            if (inputs[24] < -21.15462) {
                var71 = -0.0019976704;
            } else {
                var71 = -0.02741015;
            }
        } else {
            if (inputs[10] < 5.0575) {
                if (inputs[9] < 6.4875) {
                    if (inputs[25] < 1.8914771) {
                        var71 = -0.023078999;
                    } else {
                        var71 = 0.006427312;
                    }
                } else {
                    if (inputs[19] < 1.6835228) {
                        var71 = -0.03310584;
                    } else {
                        var71 = 0.005905133;
                    }
                }
            } else {
                var71 = 0.020696372;
            }
        }
    } else {
        var71 = -0.025330268;
    }
    double var72;
    if (inputs[4] < 1664.69) {
        var72 = 0.018042019;
    } else {
        if (inputs[1] < 30.82347) {
            if (inputs[23] < -14.929883) {
                var72 = -0.025223266;
            } else {
                var72 = 0.0012762321;
            }
        } else {
            if (inputs[19] < 2.144363) {
                if (inputs[19] < 1.8027071) {
                    if (inputs[6] < 1933.575) {
                        var72 = -0.0022261697;
                    } else {
                        var72 = 0.022384467;
                    }
                } else {
                    var72 = 0.023640038;
                }
            } else {
                if (inputs[17] < 1.4689125) {
                    var72 = -0.024468472;
                } else {
                    var72 = 0.001610774;
                }
            }
        }
    }
    double var73;
    if (inputs[16] < -0.28039098) {
        if (inputs[15] < -0.67) {
            var73 = -0.00555455;
        } else {
            var73 = -0.03230058;
        }
    } else {
        if (inputs[10] < 5.0575) {
            if (inputs[2] < 1.7892857) {
                if (inputs[8] < 1923.76) {
                    if (inputs[25] < 3.1451292) {
                        var73 = 0.0075610904;
                    } else {
                        var73 = -0.0095389355;
                    }
                } else {
                    var73 = 0.023619732;
                }
            } else {
                if (inputs[1] < 63.875416) {
                    if (inputs[24] < -7.1595545) {
                        var73 = -0.023002742;
                    } else {
                        var73 = 0.007501685;
                    }
                } else {
                    var73 = -0.040999986;
                }
            }
        } else {
            var73 = 0.022095574;
        }
    }
    double var74;
    if (inputs[23] < 10.910757) {
        if (inputs[9] < 2.985) {
            if (inputs[2] < 1.2535714) {
                var74 = -0.0107760085;
            } else {
                if (inputs[11] < 0.39) {
                    var74 = 0.031358883;
                } else {
                    var74 = 0.003762749;
                }
            }
        } else {
            if (inputs[10] < 5.0575) {
                if (inputs[25] < 1.8914771) {
                    var74 = -0.02629402;
                } else {
                    if (inputs[9] < 6.58) {
                        var74 = 0.0047444524;
                    } else {
                        var74 = -0.009780974;
                    }
                }
            } else {
                var74 = 0.015980646;
            }
        }
    } else {
        if (inputs[2] < 1.6328571) {
            var74 = 0.0016888361;
        } else {
            var74 = -0.029897654;
        }
    }
    double var75;
    if (inputs[14] < 0.55) {
        if (inputs[21] < -1.6590085) {
            if (inputs[23] < -2.358174) {
                if (inputs[6] < 1704.27) {
                    var75 = 0.01012699;
                } else {
                    if (inputs[20] < 0.83157694) {
                        var75 = -0.026116064;
                    } else {
                        var75 = 0.0037768125;
                    }
                }
            } else {
                if (inputs[24] < -16.417265) {
                    if (inputs[14] < -0.869) {
                        var75 = 0.009130008;
                    } else {
                        var75 = 0.03198537;
                    }
                } else {
                    var75 = -0.004248338;
                }
            }
        } else {
            var75 = -0.026351174;
        }
    } else {
        if (inputs[14] < 0.707) {
            var75 = 0.021788402;
        } else {
            if (inputs[23] < -23.777779) {
                if (inputs[24] < 20.301311) {
                    var75 = 0.030834185;
                } else {
                    var75 = -0.004632792;
                }
            } else {
                if (inputs[18] < 1.568082) {
                    var75 = -0.030886596;
                } else {
                    if (inputs[8] < 1855.85) {
                        var75 = -0.0107993875;
                    } else {
                        var75 = 0.016785959;
                    }
                }
            }
        }
    }
    double var76;
    if (inputs[13] < 1779.34) {
        if (inputs[20] < 1.2404754) {
            if (inputs[13] < 1652.48) {
                var76 = 0.023605619;
            } else {
                if (inputs[19] < 1.2559031) {
                    var76 = 0.010479663;
                } else {
                    if (inputs[25] < 2.6388013) {
                        var76 = -0.024787936;
                    } else {
                        var76 = -0.0031428884;
                    }
                }
            }
        } else {
            var76 = -0.028431494;
        }
    } else {
        if (inputs[3] < 1974.84) {
            if (inputs[12] < 1942.07) {
                if (inputs[17] < 1.2595555) {
                    if (inputs[20] < 1.0302223) {
                        var76 = 0.009146189;
                    } else {
                        var76 = 0.03636687;
                    }
                } else {
                    if (inputs[17] < 1.394165) {
                        var76 = -0.030666005;
                    } else {
                        var76 = 0.0074548614;
                    }
                }
            } else {
                var76 = 0.029950654;
            }
        } else {
            var76 = -0.017644381;
        }
    }
    double var77;
    if (inputs[15] < -0.71115154) {
        var77 = 0.02420195;
    } else {
        if (inputs[16] < -0.17063157) {
            if (inputs[19] < 1.6515522) {
                var77 = -0.0333039;
            } else {
                if (inputs[19] < 1.9797952) {
                    var77 = 0.021052198;
                } else {
                    var77 = -0.027634226;
                }
            }
        } else {
            if (inputs[24] < -22.04852) {
                var77 = 0.031744253;
            } else {
                if (inputs[24] < -9.013856) {
                    var77 = -0.023264173;
                } else {
                    if (inputs[23] < 5.8796015) {
                        var77 = 0.006016907;
                    } else {
                        var77 = -0.018451307;
                    }
                }
            }
        }
    }
    double var78;
    if (inputs[2] < 0.96428573) {
        var78 = 0.02417476;
    } else {
        if (inputs[18] < 1.2168549) {
            if (inputs[2] < 1.2021428) {
                var78 = 0.011390928;
            } else {
                if (inputs[2] < 1.4471428) {
                    var78 = -0.0437258;
                } else {
                    var78 = -0.0103935255;
                }
            }
        } else {
            if (inputs[21] < -2.872818) {
                if (inputs[10] < 2.3575) {
                    var78 = -0.025037397;
                } else {
                    var78 = 0.017061511;
                }
            } else {
                if (inputs[10] < 1.43) {
                    if (inputs[19] < 1.8905985) {
                        var78 = 0.005737688;
                    } else {
                        var78 = 0.032233696;
                    }
                } else {
                    if (inputs[20] < 0.06041935) {
                        var78 = 0.010129908;
                    } else {
                        var78 = -0.013443435;
                    }
                }
            }
        }
    }
    double var79;
    if (inputs[21] < 3.0345144) {
        if (inputs[21] < 2.765644) {
            if (inputs[16] < 0.054278195) {
                if (inputs[1] < 30.82347) {
                    if (inputs[9] < 4.885) {
                        var79 = -0.027995516;
                    } else {
                        var79 = 0.0049087876;
                    }
                } else {
                    if (inputs[11] < 0.35) {
                        var79 = -0.0016117784;
                    } else {
                        var79 = 0.01860224;
                    }
                }
            } else {
                if (inputs[23] < -16.034887) {
                    var79 = -0.026241692;
                } else {
                    if (inputs[15] < 0.3798788) {
                        var79 = -0.010542515;
                    } else {
                        var79 = 0.014291657;
                    }
                }
            }
        } else {
            var79 = 0.02587943;
        }
    } else {
        if (inputs[1] < 72.32843) {
            var79 = -0.025143817;
        } else {
            var79 = 0.0010429205;
        }
    }
    double var80;
    if (inputs[23] < 10.910757) {
        if (inputs[11] < 0.23) {
            if (inputs[17] < 2.102351) {
                var80 = 0.03140829;
            } else {
                var80 = -0.010700768;
            }
        } else {
            if (inputs[19] < 1.1154667) {
                var80 = 0.019723741;
            } else {
                if (inputs[10] < 0.35) {
                    if (inputs[18] < 1.4889866) {
                        var80 = -0.03181828;
                    } else {
                        var80 = -0.005271878;
                    }
                } else {
                    if (inputs[10] < 0.55) {
                        var80 = 0.028124675;
                    } else {
                        var80 = -0.0014449148;
                    }
                }
            }
        }
    } else {
        if (inputs[25] < 2.8027887) {
            var80 = -0.02860008;
        } else {
            var80 = -0.006170362;
        }
    }
    double var81;
    if (inputs[21] < 3.4123142) {
        if (inputs[15] < -0.3987879) {
            if (inputs[11] < 0.21) {
                var81 = 0.015310708;
            } else {
                if (inputs[19] < 2.144363) {
                    if (inputs[19] < 1.6925792) {
                        var81 = -0.01533693;
                    } else {
                        var81 = 0.016258016;
                    }
                } else {
                    var81 = -0.027853;
                }
            }
        } else {
            if (inputs[15] < -0.3449091) {
                var81 = 0.0291629;
            } else {
                if (inputs[2] < 1.7892857) {
                    if (inputs[8] < 1878.55) {
                        var81 = 0.0021201826;
                    } else {
                        var81 = 0.024419783;
                    }
                } else {
                    if (inputs[20] < -0.8543823) {
                        var81 = -0.028518379;
                    } else {
                        var81 = 0.0036551883;
                    }
                }
            }
        }
    } else {
        var81 = -0.021782683;
    }
    double var82;
    if (inputs[17] < 1.9122196) {
        if (inputs[18] < 1.3073698) {
            if (inputs[9] < 5.695) {
                if (inputs[20] < -0.22793856) {
                    var82 = 0.009178111;
                } else {
                    if (inputs[11] < 0.41) {
                        var82 = -0.024535092;
                    } else {
                        var82 = 0.004352735;
                    }
                }
            } else {
                var82 = -0.02594971;
            }
        } else {
            if (inputs[25] < 3.571873) {
                if (inputs[21] < -2.872818) {
                    var82 = -0.019202346;
                } else {
                    if (inputs[25] < 1.8835075) {
                        var82 = -0.012064848;
                    } else {
                        var82 = 0.013533878;
                    }
                }
            } else {
                var82 = 0.025780326;
            }
        }
    } else {
        if (inputs[18] < 2.4044418) {
            var82 = -0.028968077;
        } else {
            var82 = -0.0004371678;
        }
    }
    double var83;
    if (inputs[23] < 10.910757) {
        if (inputs[14] < -0.869) {
            if (inputs[18] < 1.7881454) {
                var83 = -0.026456723;
            } else {
                if (inputs[1] < 31.216616) {
                    var83 = -0.014012499;
                } else {
                    var83 = 0.011582298;
                }
            }
        } else {
            if (inputs[25] < 2.6467662) {
                if (inputs[25] < 2.4294116) {
                    if (inputs[10] < 0.8075) {
                        var83 = -0.015318963;
                    } else {
                        var83 = 0.00925496;
                    }
                } else {
                    var83 = -0.02433635;
                }
            } else {
                if (inputs[1] < 76.283356) {
                    if (inputs[18] < 1.5000937) {
                        var83 = 0.00670545;
                    } else {
                        var83 = 0.028380165;
                    }
                } else {
                    var83 = -0.011864092;
                }
            }
        }
    } else {
        if (inputs[2] < 1.5921428) {
            var83 = -0.004573359;
        } else {
            var83 = -0.029543899;
        }
    }
    double var84;
    if (inputs[25] < 4.284579) {
        if (inputs[1] < 30.82347) {
            if (inputs[19] < 1.4941549) {
                var84 = -0.03980697;
            } else {
                if (inputs[11] < 0.28) {
                    var84 = -0.02356566;
                } else {
                    var84 = 0.01817289;
                }
            }
        } else {
            if (inputs[9] < 5.8975) {
                if (inputs[1] < 35.918762) {
                    if (inputs[14] < -0.847) {
                        var84 = 0.004044227;
                    } else {
                        var84 = 0.027211335;
                    }
                } else {
                    if (inputs[24] < -3.9323542) {
                        var84 = -0.01642974;
                    } else {
                        var84 = 0.005657817;
                    }
                }
            } else {
                if (inputs[24] < 16.160595) {
                    var84 = -0.01826651;
                } else {
                    var84 = 0.0060307826;
                }
            }
        }
    } else {
        var84 = 0.01995817;
    }
    double var85;
    if (inputs[1] < 69.5182) {
        if (inputs[14] < 0.641) {
            if (inputs[20] < 0.83157694) {
                if (inputs[2] < 1.3) {
                    var85 = -0.023095146;
                } else {
                    if (inputs[2] < 1.6985714) {
                        var85 = 0.015410541;
                    } else {
                        var85 = -0.00945842;
                    }
                }
            } else {
                if (inputs[10] < 2.4975) {
                    if (inputs[9] < 4.03) {
                        var85 = 0.00612651;
                    } else {
                        var85 = 0.032712445;
                    }
                } else {
                    var85 = -0.008891716;
                }
            }
        } else {
            if (inputs[23] < -26.165287) {
                var85 = 0.032254282;
            } else {
                if (inputs[1] < 64.91959) {
                    var85 = -0.0069600283;
                } else {
                    var85 = 0.015172337;
                }
            }
        }
    } else {
        if (inputs[20] < -0.4081105) {
            var85 = 0.0041254745;
        } else {
            var85 = -0.023433017;
        }
    }
    double var86;
    if (inputs[1] < 61.282856) {
        if (inputs[20] < 1.4213508) {
            if (inputs[21] < -1.7450612) {
                if (inputs[2] < 1.1821429) {
                    var86 = -0.022637485;
                } else {
                    if (inputs[17] < 1.4689125) {
                        var86 = 0.006777019;
                    } else {
                        var86 = -0.013293216;
                    }
                }
            } else {
                var86 = -0.029007431;
            }
        } else {
            var86 = 0.01220166;
        }
    } else {
        if (inputs[1] < 63.736034) {
            var86 = 0.022869194;
        } else {
            if (inputs[2] < 1.6828572) {
                if (inputs[20] < 0.25269383) {
                    if (inputs[23] < -4.5796494) {
                        var86 = 0.023586726;
                    } else {
                        var86 = -0.0018281196;
                    }
                } else {
                    var86 = -0.01612123;
                }
            } else {
                if (inputs[16] < 0.3315113) {
                    var86 = -0.03304887;
                } else {
                    var86 = 0.0038215732;
                }
            }
        }
    }
    double var87;
    if (inputs[18] < 1.1976143) {
        if (inputs[11] < 0.4) {
            if (inputs[14] < 0.506) {
                var87 = -0.030741341;
            } else {
                var87 = -0.004743171;
            }
        } else {
            var87 = 0.006864897;
        }
    } else {
        if (inputs[21] < -3.3781095) {
            var87 = -0.008586768;
        } else {
            if (inputs[11] < 0.16) {
                var87 = 0.026129873;
            } else {
                if (inputs[10] < 1.16) {
                    if (inputs[20] < -0.5177981) {
                        var87 = -0.008921325;
                    } else {
                        var87 = 0.020210454;
                    }
                } else {
                    if (inputs[20] < 0.06041935) {
                        var87 = 0.01208005;
                    } else {
                        var87 = -0.012050537;
                    }
                }
            }
        }
    }
    double var88;
    if (inputs[11] < 0.45) {
        if (inputs[2] < 0.9671429) {
            var88 = 0.028214777;
        } else {
            if (inputs[25] < 3.3075356) {
                if (inputs[2] < 1.2021428) {
                    var88 = 0.027386596;
                } else {
                    if (inputs[14] < -1.064) {
                        var88 = 0.021384837;
                    } else {
                        var88 = -0.0010103812;
                    }
                }
            } else {
                if (inputs[21] < -3.4881837) {
                    var88 = 0.007892609;
                } else {
                    if (inputs[24] < 19.642025) {
                        var88 = -0.03604676;
                    } else {
                        var88 = 0.0039147884;
                    }
                }
            }
        }
    } else {
        var88 = -0.015571571;
    }
    double var89;
    if (inputs[15] < 0.43066666) {
        if (inputs[15] < 0.39478788) {
            if (inputs[20] < -0.27667353) {
                if (inputs[19] < 2.3168728) {
                    if (inputs[10] < 1.2875) {
                        var89 = -0.00817344;
                    } else {
                        var89 = 0.013329997;
                    }
                } else {
                    var89 = 0.03256977;
                }
            } else {
                if (inputs[19] < 2.3010995) {
                    if (inputs[19] < 1.8369683) {
                        var89 = -0.005288785;
                    } else {
                        var89 = 0.017623829;
                    }
                } else {
                    var89 = -0.025200045;
                }
            }
        } else {
            var89 = 0.032443933;
        }
    } else {
        if (inputs[15] < 0.5062424) {
            var89 = -0.031595822;
        } else {
            if (inputs[16] < 0.19218796) {
                var89 = 0.010027348;
            } else {
                var89 = -0.013914277;
            }
        }
    }
    double var90;
    if (inputs[25] < 4.2767625) {
        if (inputs[10] < 2.1375) {
            if (inputs[10] < 1.79) {
                if (inputs[18] < 1.8571904) {
                    if (inputs[18] < 1.6317381) {
                        var90 = 0.00036985055;
                    } else {
                        var90 = -0.0297815;
                    }
                } else {
                    if (inputs[2] < 2.1185715) {
                        var90 = 0.028125495;
                    } else {
                        var90 = -0.0004321327;
                    }
                }
            } else {
                var90 = 0.025395459;
            }
        } else {
            if (inputs[2] < 2.3585715) {
                if (inputs[2] < 1.5785714) {
                    if (inputs[20] < 0.007195763) {
                        var90 = 0.005107941;
                    } else {
                        var90 = -0.021350838;
                    }
                } else {
                    var90 = -0.035908815;
                }
            } else {
                if (inputs[9] < 10.915) {
                    var90 = 0.021571632;
                } else {
                    var90 = -0.012748485;
                }
            }
        }
    } else {
        var90 = 0.022839716;
    }
    double var91;
    if (inputs[20] < 0.11182756) {
        if (inputs[17] < 0.8829043) {
            var91 = -0.014691279;
        } else {
            if (inputs[17] < 1.0193018) {
                var91 = 0.026614359;
            } else {
                if (inputs[15] < 0.2969697) {
                    if (inputs[21] < -2.8556485) {
                        var91 = -0.0076684356;
                    } else {
                        var91 = 0.021652577;
                    }
                } else {
                    if (inputs[24] < 19.951187) {
                        var91 = -0.025277883;
                    } else {
                        var91 = 0.008078661;
                    }
                }
            }
        }
    } else {
        if (inputs[21] < 2.3889909) {
            if (inputs[16] < -0.239203) {
                var91 = -0.028043946;
            } else {
                if (inputs[10] < 1.0175) {
                    if (inputs[2] < 1.7264286) {
                        var91 = 0.030938178;
                    } else {
                        var91 = -0.003224371;
                    }
                } else {
                    if (inputs[20] < 0.8231325) {
                        var91 = -0.02753232;
                    } else {
                        var91 = 0.006834502;
                    }
                }
            }
        } else {
            var91 = -0.02350519;
        }
    }
    double var92;
    if (inputs[16] < -0.32093233) {
        var92 = -0.020709233;
    } else {
        if (inputs[1] < 26.023777) {
            var92 = 0.023824086;
        } else {
            if (inputs[21] < -3.2986603) {
                var92 = -0.02444205;
            } else {
                if (inputs[10] < 2.205) {
                    if (inputs[14] < 0.967) {
                        var92 = 0.001905516;
                    } else {
                        var92 = 0.020789914;
                    }
                } else {
                    if (inputs[19] < 1.6401807) {
                        var92 = -0.023565356;
                    } else {
                        var92 = 0.0019898873;
                    }
                }
            }
        }
    }
    double var93;
    if (inputs[16] < 0.014992481) {
        if (inputs[9] < 5.5525) {
            if (inputs[15] < -0.18448485) {
                if (inputs[3] < 1752.67) {
                    var93 = -0.011011809;
                } else {
                    if (inputs[19] < 1.5801452) {
                        var93 = 0.00059330725;
                    } else {
                        var93 = 0.028754992;
                    }
                }
            } else {
                var93 = 0.02977422;
            }
        } else {
            if (inputs[21] < -2.7182846) {
                if (inputs[10] < 3.0775) {
                    var93 = 0.0013843738;
                } else {
                    var93 = 0.012750034;
                }
            } else {
                var93 = -0.022959601;
            }
        }
    } else {
        if (inputs[3] < 1899.9) {
            if (inputs[16] < 0.27678195) {
                if (inputs[2] < 1.7664286) {
                    if (inputs[4] < 1720.37) {
                        var93 = -0.017497972;
                    } else {
                        var93 = 0.011305654;
                    }
                } else {
                    var93 = -0.017535426;
                }
            } else {
                var93 = 0.020088835;
            }
        } else {
            if (inputs[3] < 1944.205) {
                var93 = -0.037302148;
            } else {
                var93 = -0.0053766672;
            }
        }
    }
    double var94;
    if (inputs[16] < -0.35218796) {
        var94 = -0.02745542;
    } else {
        if (inputs[18] < 1.012366) {
            var94 = 0.018540788;
        } else {
            if (inputs[18] < 1.568082) {
                if (inputs[2] < 1.6878572) {
                    if (inputs[2] < 1.2635714) {
                        var94 = -0.012461401;
                    } else {
                        var94 = 0.01321647;
                    }
                } else {
                    var94 = -0.024934608;
                }
            } else {
                if (inputs[10] < 0.32) {
                    var94 = -0.01514934;
                } else {
                    if (inputs[18] < 1.6910399) {
                        var94 = 0.027852025;
                    } else {
                        var94 = 0.0018962201;
                    }
                }
            }
        }
    }
    double var95;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < 0.19874436) {
            if (inputs[9] < 6.4875) {
                if (inputs[10] < 2.5575) {
                    if (inputs[20] < -1.1543432) {
                        var95 = -0.015034479;
                    } else {
                        var95 = 0.0043871896;
                    }
                } else {
                    var95 = 0.025439147;
                }
            } else {
                if (inputs[2] < 2.4271429) {
                    var95 = -0.023138093;
                } else {
                    var95 = 0.008189908;
                }
            }
        } else {
            var95 = -0.0193597;
        }
    } else {
        if (inputs[16] < 0.39284962) {
            var95 = 0.033948194;
        } else {
            var95 = -0.0049933046;
        }
    }
    double var96;
    if (inputs[25] < 4.284579) {
        if (inputs[25] < 3.3075356) {
            if (inputs[14] < -1.185) {
                var96 = 0.025771726;
            } else {
                if (inputs[18] < 1.0589377) {
                    var96 = 0.022817777;
                } else {
                    if (inputs[15] < 0.3798788) {
                        var96 = -0.00911273;
                    } else {
                        var96 = 0.0077829715;
                    }
                }
            }
        } else {
            if (inputs[24] < -16.75377) {
                var96 = 0.003800819;
            } else {
                if (inputs[14] < 0.823) {
                    var96 = -0.03125771;
                } else {
                    var96 = -0.0048406306;
                }
            }
        }
    } else {
        var96 = 0.022010086;
    }
    double var97;
    if (inputs[18] < 0.97819275) {
        var97 = -0.022262746;
    } else {
        if (inputs[1] < 69.681725) {
            if (inputs[4] < 1935.9) {
                if (inputs[5] < 1913.09) {
                    if (inputs[16] < -0.16878195) {
                        var97 = -0.0077796513;
                    } else {
                        var97 = 0.011644535;
                    }
                } else {
                    var97 = -0.025274808;
                }
            } else {
                if (inputs[9] < 4.47) {
                    var97 = 0.03427851;
                } else {
                    var97 = 0.0049860943;
                }
            }
        } else {
            if (inputs[20] < -0.3115604) {
                var97 = 0.0024510599;
            } else {
                var97 = -0.02661227;
            }
        }
    }
    double var98;
    if (inputs[14] < 0.452) {
        if (inputs[15] < -0.25133333) {
            if (inputs[14] < -0.57) {
                if (inputs[23] < -3.152488) {
                    if (inputs[20] < -0.27667353) {
                        var98 = 0.0029339476;
                    } else {
                        var98 = -0.017625706;
                    }
                } else {
                    if (inputs[2] < 1.6828572) {
                        var98 = -0.006253362;
                    } else {
                        var98 = 0.018754555;
                    }
                }
            } else {
                var98 = 0.019777292;
            }
        } else {
            if (inputs[11] < 0.37) {
                var98 = -0.044818792;
            } else {
                var98 = -0.0037335006;
            }
        }
    } else {
        if (inputs[18] < 1.0958599) {
            var98 = 0.029210638;
        } else {
            if (inputs[23] < 0.0) {
                if (inputs[23] < -18.51324) {
                    if (inputs[25] < 3.2406492) {
                        var98 = -0.0075783543;
                    } else {
                        var98 = 0.02165456;
                    }
                } else {
                    var98 = 0.028079411;
                }
            } else {
                if (inputs[13] < 1852.78) {
                    var98 = -0.030050812;
                } else {
                    if (inputs[13] < 1953.42) {
                        var98 = 0.017927954;
                    } else {
                        var98 = -0.014183215;
                    }
                }
            }
        }
    }
    double var99;
    if (inputs[17] < 0.83912814) {
        var99 = -0.019723773;
    } else {
        if (inputs[10] < 5.375) {
            if (inputs[9] < 2.42) {
                if (inputs[17] < 1.2933152) {
                    var99 = 0.026506178;
                } else {
                    var99 = -0.000116493335;
                }
            } else {
                if (inputs[25] < 4.0183487) {
                    if (inputs[25] < 3.3337195) {
                        var99 = 0.0017315228;
                    } else {
                        var99 = -0.020650603;
                    }
                } else {
                    var99 = 0.018569214;
                }
            }
        } else {
            var99 = 0.01938775;
        }
    }
    double var100;
    if (inputs[9] < 1.5625) {
        var100 = -0.020105086;
    } else {
        if (inputs[9] < 13.0225) {
            if (inputs[18] < 2.8816252) {
                if (inputs[16] < -0.239203) {
                    var100 = -0.015354734;
                } else {
                    if (inputs[16] < 0.035654135) {
                        var100 = 0.011081929;
                    } else {
                        var100 = -0.0013293496;
                    }
                }
            } else {
                var100 = 0.022836247;
            }
        } else {
            var100 = -0.016477946;
        }
    }
    double var101;
    if (inputs[1] < 68.044624) {
        if (inputs[17] < 0.8829043) {
            var101 = -0.02011408;
        } else {
            if (inputs[2] < 2.0564287) {
                if (inputs[13] < 1882.85) {
                    if (inputs[3] < 1709.265) {
                        var101 = 0.02051794;
                    } else {
                        var101 = -0.0021658118;
                    }
                } else {
                    if (inputs[23] < 0.3177864) {
                        var101 = 0.030352471;
                    } else {
                        var101 = 0.011784855;
                    }
                }
            } else {
                if (inputs[18] < 2.8605216) {
                    if (inputs[25] < 1.9213322) {
                        var101 = -0.0018811321;
                    } else {
                        var101 = -0.03412942;
                    }
                } else {
                    var101 = 0.016608713;
                }
            }
        }
    } else {
        if (inputs[11] < 0.31) {
            var101 = -0.02445887;
        } else {
            if (inputs[15] < 0.37369698) {
                var101 = -0.021257574;
            } else {
                var101 = 0.0064787683;
            }
        }
    }
    double var102;
    if (inputs[10] < 7.3) {
        if (inputs[21] < 3.2294042) {
            if (inputs[20] < -1.7131134) {
                var102 = -0.017764961;
            } else {
                if (inputs[1] < 31.125147) {
                    if (inputs[24] < -18.610117) {
                        var102 = 0.0021794208;
                    } else {
                        var102 = -0.032632455;
                    }
                } else {
                    if (inputs[20] < 0.106602594) {
                        var102 = 0.012431983;
                    } else {
                        var102 = -0.0015662359;
                    }
                }
            }
        } else {
            if (inputs[16] < 0.19218796) {
                var102 = -0.0008216062;
            } else {
                var102 = -0.042128604;
            }
        }
    } else {
        var102 = 0.019526301;
    }
    double var103;
    if (inputs[16] < -0.21651128) {
        if (inputs[17] < 1.8443145) {
            if (inputs[14] < -0.714) {
                var103 = 0.031397883;
            } else {
                var103 = 0.0081699705;
            }
        } else {
            var103 = -0.0053653107;
        }
    } else {
        if (inputs[23] < 0.9116595) {
            if (inputs[6] < 1789.415) {
                if (inputs[19] < 1.2318324) {
                    var103 = 0.007857261;
                } else {
                    if (inputs[1] < 68.180214) {
                        var103 = -0.006818131;
                    } else {
                        var103 = -0.029142037;
                    }
                }
            } else {
                if (inputs[24] < -9.013856) {
                    var103 = -0.007560774;
                } else {
                    if (inputs[1] < 63.736034) {
                        var103 = 0.03111881;
                    } else {
                        var103 = 0.003845376;
                    }
                }
            }
        } else {
            if (inputs[14] < 0.621) {
                var103 = -0.0009922651;
            } else {
                var103 = -0.031488303;
            }
        }
    }
    double var104;
    if (inputs[25] < 4.115349) {
        if (inputs[18] < 1.5945748) {
            if (inputs[15] < -0.3961212) {
                var104 = -0.028377555;
            } else {
                if (inputs[21] < -3.0461998) {
                    var104 = 0.01771483;
                } else {
                    if (inputs[20] < 0.94071513) {
                        var104 = -0.0031787716;
                    } else {
                        var104 = -0.028030403;
                    }
                }
            }
        } else {
            if (inputs[13] < 1779.85) {
                if (inputs[22] < 1.0) {
                    var104 = -0.019138051;
                } else {
                    var104 = 0.0016226114;
                }
            } else {
                if (inputs[18] < 2.1924095) {
                    if (inputs[18] < 1.8450803) {
                        var104 = 0.009184965;
                    } else {
                        var104 = 0.027480967;
                    }
                } else {
                    if (inputs[11] < 0.21) {
                        var104 = 0.015260536;
                    } else {
                        var104 = -0.016062852;
                    }
                }
            }
        }
    } else {
        var104 = 0.017780356;
    }
    double var105;
    if (inputs[10] < 2.1375) {
        if (inputs[20] < -1.6100832) {
            var105 = -0.017395051;
        } else {
            if (inputs[14] < 0.967) {
                if (inputs[15] < 0.17339393) {
                    if (inputs[24] < -7.1595545) {
                        var105 = 0.0022649157;
                    } else {
                        var105 = 0.033868194;
                    }
                } else {
                    if (inputs[15] < 0.3798788) {
                        var105 = -0.023784151;
                    } else {
                        var105 = 0.0063333027;
                    }
                }
            } else {
                var105 = 0.021532783;
            }
        }
    } else {
        if (inputs[18] < 1.4523295) {
            var105 = -0.02758144;
        } else {
            if (inputs[15] < -0.55) {
                var105 = -0.027848544;
            } else {
                if (inputs[24] < 8.31379) {
                    var105 = 0.028878633;
                } else {
                    var105 = -0.008505882;
                }
            }
        }
    }
    double var106;
    if (inputs[20] < -1.7409832) {
        var106 = -0.022964083;
    } else {
        if (inputs[18] < 3.397783) {
            if (inputs[18] < 2.4614255) {
                if (inputs[14] < 0.641) {
                    if (inputs[15] < -0.26) {
                        var106 = 0.0020493583;
                    } else {
                        var106 = -0.016646095;
                    }
                } else {
                    if (inputs[15] < 0.41733333) {
                        var106 = 0.016458593;
                    } else {
                        var106 = -0.0056525995;
                    }
                }
            } else {
                var106 = 0.028927185;
            }
        } else {
            var106 = -0.024954624;
        }
    }
    double var107;
    if (inputs[14] < 0.55) {
        if (inputs[16] < -0.077203006) {
            if (inputs[20] < 0.8231325) {
                if (inputs[24] < -13.781551) {
                    if (inputs[21] < -3.4881837) {
                        var107 = 0.015253846;
                    } else {
                        var107 = -0.0041723065;
                    }
                } else {
                    var107 = -0.024530532;
                }
            } else {
                if (inputs[2] < 1.3) {
                    var107 = 0.032931328;
                } else {
                    var107 = 0.006545451;
                }
            }
        } else {
            if (inputs[19] < 1.6925792) {
                var107 = -0.037258375;
            } else {
                var107 = -0.0021296174;
            }
        }
    } else {
        if (inputs[24] < 25.472149) {
            if (inputs[17] < 1.1634259) {
                var107 = 0.025492888;
            } else {
                if (inputs[10] < 1.43) {
                    if (inputs[16] < 0.11796992) {
                        var107 = 0.036784593;
                    } else {
                        var107 = 0.0004028218;
                    }
                } else {
                    if (inputs[2] < 1.5621428) {
                        var107 = 0.013818216;
                    } else {
                        var107 = -0.025032066;
                    }
                }
            }
        } else {
            var107 = -0.01630257;
        }
    }
    double var108;
    if (inputs[20] < 0.106602594) {
        if (inputs[16] < 0.16592482) {
            if (inputs[19] < 1.3652738) {
                if (inputs[19] < 1.124791) {
                    var108 = 0.0074803573;
                } else {
                    var108 = -0.020163966;
                }
            } else {
                if (inputs[20] < -1.1543432) {
                    var108 = -0.0050931117;
                } else {
                    if (inputs[21] < -2.6752014) {
                        var108 = -0.00073983433;
                    } else {
                        var108 = 0.024440907;
                    }
                }
            }
        } else {
            if (inputs[11] < 0.33) {
                var108 = 0.0047504855;
            } else {
                var108 = 0.036530793;
            }
        }
    } else {
        if (inputs[20] < 0.4305812) {
            var108 = -0.033076048;
        } else {
            if (inputs[18] < 1.1802728) {
                var108 = -0.021376712;
            } else {
                if (inputs[17] < 1.1304936) {
                    var108 = 0.026713924;
                } else {
                    if (inputs[21] < -2.7182846) {
                        var108 = 0.0155293355;
                    } else {
                        var108 = -0.007867686;
                    }
                }
            }
        }
    }
    double var109;
    if (inputs[15] < -0.71115154) {
        var109 = 0.020681925;
    } else {
        if (inputs[18] < 2.2016084) {
            if (inputs[15] < 0.5382424) {
                if (inputs[1] < 26.495476) {
                    var109 = 0.021938158;
                } else {
                    if (inputs[25] < 3.3016887) {
                        var109 = 0.0026474511;
                    } else {
                        var109 = -0.01511003;
                    }
                }
            } else {
                var109 = 0.023009727;
            }
        } else {
            if (inputs[19] < 3.076999) {
                var109 = -0.028741498;
            } else {
                var109 = 0.003048916;
            }
        }
    }
    double var110;
    if (inputs[1] < 31.216616) {
        if (inputs[24] < -20.653982) {
            if (inputs[24] < -26.514355) {
                var110 = -0.012960029;
            } else {
                var110 = 0.019538652;
            }
        } else {
            var110 = -0.028894197;
        }
    } else {
        if (inputs[21] < -2.3217247) {
            if (inputs[20] < 0.49242997) {
                var110 = 0.0034437655;
            } else {
                var110 = 0.040300123;
            }
        } else {
            if (inputs[1] < 60.820408) {
                if (inputs[15] < -0.26) {
                    var110 = 0.0044920756;
                } else {
                    var110 = -0.029851202;
                }
            } else {
                if (inputs[1] < 63.736034) {
                    var110 = 0.019368736;
                } else {
                    if (inputs[21] < 2.3521504) {
                        var110 = -0.017892726;
                    } else {
                        var110 = 0.006255641;
                    }
                }
            }
        }
    }
    double var111;
    if (inputs[2] < 1.2635714) {
        if (inputs[15] < 0.37369698) {
            if (inputs[2] < 0.98071426) {
                var111 = 0.005328253;
            } else {
                if (inputs[17] < 1.1247827) {
                    var111 = -0.036714878;
                } else {
                    var111 = -0.01165778;
                }
            }
        } else {
            var111 = 0.01213079;
        }
    } else {
        if (inputs[2] < 1.3721429) {
            var111 = 0.0200651;
        } else {
            if (inputs[5] < 1761.0675) {
                if (inputs[14] < 0.844) {
                    if (inputs[1] < 34.498104) {
                        var111 = 0.0011285727;
                    } else {
                        var111 = -0.02985237;
                    }
                } else {
                    var111 = 0.009341729;
                }
            } else {
                if (inputs[15] < -0.2869091) {
                    if (inputs[11] < 0.29) {
                        var111 = 0.0004336813;
                    } else {
                        var111 = 0.029048385;
                    }
                } else {
                    if (inputs[13] < 1837.94) {
                        var111 = -0.01938935;
                    } else {
                        var111 = 0.0064455396;
                    }
                }
            }
        }
    }
    double var112;
    if (inputs[9] < 1.41) {
        var112 = -0.018961117;
    } else {
        if (inputs[24] < 25.472149) {
            if (inputs[14] < -0.563) {
                if (inputs[17] < 1.1380615) {
                    var112 = 0.01567677;
                } else {
                    if (inputs[21] < -2.3628435) {
                        var112 = 0.0010477959;
                    } else {
                        var112 = -0.020149704;
                    }
                }
            } else {
                if (inputs[19] < 1.196023) {
                    var112 = -0.010207583;
                } else {
                    if (inputs[1] < 40.085823) {
                        var112 = 0.034997698;
                    } else {
                        var112 = 0.009656976;
                    }
                }
            }
        } else {
            var112 = -0.01278782;
        }
    }
    double var113;
    if (inputs[17] < 0.9489573) {
        if (inputs[15] < 0.3429091) {
            var113 = -0.020776972;
        } else {
            var113 = 0.0073872874;
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[16] < -0.16878195) {
                if (inputs[19] < 1.6699505) {
                    var113 = -0.012825732;
                } else {
                    if (inputs[17] < 1.9682418) {
                        var113 = 0.015212882;
                    } else {
                        var113 = -0.0136204325;
                    }
                }
            } else {
                if (inputs[1] < 30.481112) {
                    var113 = 0.0057296935;
                } else {
                    var113 = 0.030488752;
                }
            }
        } else {
            if (inputs[16] < 0.27678195) {
                if (inputs[2] < 1.3192858) {
                    if (inputs[16] < 0.12596993) {
                        var113 = 0.021187246;
                    } else {
                        var113 = -0.008955458;
                    }
                } else {
                    if (inputs[21] < 2.2095516) {
                        var113 = -0.007733264;
                    } else {
                        var113 = -0.034493815;
                    }
                }
            } else {
                var113 = 0.0141335875;
            }
        }
    }
    double var114;
    if (inputs[13] < 1845.64) {
        if (inputs[13] < 1827.23) {
            if (inputs[15] < -0.53818184) {
                var114 = -0.017821994;
            } else {
                if (inputs[24] < -13.781551) {
                    if (inputs[17] < 1.2962098) {
                        var114 = 0.030163929;
                    } else {
                        var114 = -0.008167794;
                    }
                } else {
                    if (inputs[14] < 0.4) {
                        var114 = -0.023525707;
                    } else {
                        var114 = 0.0004883676;
                    }
                }
            }
        } else {
            var114 = -0.02686348;
        }
    } else {
        if (inputs[17] < 1.8443145) {
            if (inputs[14] < -0.827) {
                var114 = 0.028597958;
            } else {
                if (inputs[18] < 1.34489) {
                    var114 = -0.007305622;
                } else {
                    if (inputs[2] < 1.8114285) {
                        var114 = 0.021487527;
                    } else {
                        var114 = 0.0021757819;
                    }
                }
            }
        } else {
            var114 = -0.009089773;
        }
    }
    double var115;
    if (inputs[1] < 74.73677) {
        if (inputs[15] < 0.3798788) {
            if (inputs[15] < -0.32460606) {
                if (inputs[15] < -0.3961212) {
                    if (inputs[25] < 3.2037778) {
                        var115 = 0.006104456;
                    } else {
                        var115 = -0.020542499;
                    }
                } else {
                    var115 = 0.02788753;
                }
            } else {
                if (inputs[19] < 1.1199208) {
                    var115 = 0.0063351747;
                } else {
                    if (inputs[17] < 0.98597366) {
                        var115 = 0.0036182443;
                    } else {
                        var115 = -0.020841228;
                    }
                }
            }
        } else {
            if (inputs[15] < 0.4257576) {
                var115 = 0.03162877;
            } else {
                if (inputs[22] < 1.0) {
                    var115 = -0.009263647;
                } else {
                    var115 = 0.017170997;
                }
            }
        }
    } else {
        var115 = -0.024181921;
    }
    double var116;
    if (inputs[11] < 0.45) {
        if (inputs[10] < 5.0575) {
            if (inputs[10] < 3.19) {
                if (inputs[16] < 0.12944362) {
                    if (inputs[14] < 0.727) {
                        var116 = 0.0012066393;
                    } else {
                        var116 = 0.023162596;
                    }
                } else {
                    if (inputs[17] < 1.0464149) {
                        var116 = 0.012636363;
                    } else {
                        var116 = -0.0157146;
                    }
                }
            } else {
                var116 = -0.02192782;
            }
        } else {
            if (inputs[4] < 1852.03) {
                var116 = 0.020287354;
            } else {
                var116 = 0.00550644;
            }
        }
    } else {
        var116 = -0.021520313;
    }
    double var117;
    if (inputs[13] < 1835.06) {
        if (inputs[10] < 0.205) {
            var117 = -0.020612057;
        } else {
            if (inputs[5] < 1788.55) {
                if (inputs[14] < 0.93) {
                    if (inputs[25] < 2.3021126) {
                        var117 = -0.014101058;
                    } else {
                        var117 = 0.0031758735;
                    }
                } else {
                    var117 = 0.018323015;
                }
            } else {
                if (inputs[25] < 2.8523908) {
                    var117 = 0.033687644;
                } else {
                    var117 = 0.0076806657;
                }
            }
        }
    } else {
        if (inputs[19] < 2.9961197) {
            if (inputs[19] < 2.1180258) {
                if (inputs[6] < 1933.575) {
                    if (inputs[21] < -2.3333333) {
                        var117 = -0.03478717;
                    } else {
                        var117 = -0.0027118032;
                    }
                } else {
                    var117 = 0.010834761;
                }
            } else {
                var117 = -0.036153503;
            }
        } else {
            var117 = 0.01015534;
        }
    }
    double var118;
    if (inputs[24] < -20.653982) {
        if (inputs[20] < 0.6413026) {
            var118 = 0.025452452;
        } else {
            var118 = 0.0017716006;
        }
    } else {
        if (inputs[25] < 3.3075356) {
            if (inputs[25] < 2.7837949) {
                if (inputs[10] < 0.8625) {
                    if (inputs[19] < 1.326365) {
                        var118 = 0.0078033675;
                    } else {
                        var118 = -0.027058832;
                    }
                } else {
                    if (inputs[19] < 1.3578346) {
                        var118 = -0.018636866;
                    } else {
                        var118 = 0.008198246;
                    }
                }
            } else {
                if (inputs[4] < 1824.605) {
                    var118 = 0.023447003;
                } else {
                    var118 = -0.0006637703;
                }
            }
        } else {
            if (inputs[10] < 0.79) {
                var118 = 0.0073300055;
            } else {
                if (inputs[18] < 1.4750394) {
                    var118 = -0.03658305;
                } else {
                    var118 = -0.010231893;
                }
            }
        }
    }
    double var119;
    if (inputs[3] < 1974.84) {
        if (inputs[12] < 1942.07) {
            if (inputs[16] < 0.2694436) {
                if (inputs[16] < 0.19354135) {
                    if (inputs[6] < 1920.46) {
                        var119 = 0.0025519086;
                    } else {
                        var119 = -0.01954261;
                    }
                } else {
                    var119 = -0.022870667;
                }
            } else {
                if (inputs[21] < 3.262794) {
                    var119 = 0.024741203;
                } else {
                    var119 = 0.0030669097;
                }
            }
        } else {
            var119 = 0.023313265;
        }
    } else {
        var119 = -0.024268476;
    }
    double var120;
    if (inputs[25] < 4.345679) {
        if (inputs[10] < 7.3) {
            if (inputs[9] < 5.8975) {
                if (inputs[17] < 1.6396024) {
                    if (inputs[17] < 1.2800875) {
                        var120 = 0.0017672575;
                    } else {
                        var120 = -0.016828347;
                    }
                } else {
                    if (inputs[2] < 1.8228571) {
                        var120 = -0.0008929234;
                    } else {
                        var120 = 0.022501804;
                    }
                }
            } else {
                if (inputs[15] < -0.44751516) {
                    var120 = -0.00040203956;
                } else {
                    if (inputs[16] < 0.16081955) {
                        var120 = -0.032731432;
                    } else {
                        var120 = -0.0066750175;
                    }
                }
            }
        } else {
            var120 = 0.013773403;
        }
    } else {
        var120 = 0.022341507;
    }
    double var121;
    if (inputs[13] < 1667.96) {
        var121 = 0.011325864;
    } else {
        if (inputs[13] < 1778.21) {
            if (inputs[13] < 1737.78) {
                if (inputs[13] < 1704.27) {
                    var121 = -0.01664217;
                } else {
                    var121 = 0.011001965;
                }
            } else {
                var121 = -0.024956545;
            }
        } else {
            if (inputs[1] < 32.795147) {
                if (inputs[15] < -0.47048485) {
                    var121 = 0.005458832;
                } else {
                    var121 = -0.018825274;
                }
            } else {
                if (inputs[16] < -0.028947368) {
                    if (inputs[11] < 0.36) {
                        var121 = 0.0037831513;
                    } else {
                        var121 = 0.03344564;
                    }
                } else {
                    if (inputs[15] < 0.5062424) {
                        var121 = -0.004252794;
                    } else {
                        var121 = 0.014040474;
                    }
                }
            }
        }
    }
    double var122;
    if (inputs[16] < 0.2694436) {
        if (inputs[25] < 4.115349) {
            if (inputs[25] < 3.680317) {
                if (inputs[23] < -55.599304) {
                    var122 = -0.016855251;
                } else {
                    if (inputs[18] < 1.1484094) {
                        var122 = 0.0120363515;
                    } else {
                        var122 = -0.001969633;
                    }
                }
            } else {
                var122 = -0.03000133;
            }
        } else {
            var122 = 0.017065167;
        }
    } else {
        if (inputs[3] < 1847.285) {
            var122 = 0.024703022;
        } else {
            var122 = -0.00084394094;
        }
    }
    double var123;
    if (inputs[9] < 11.365) {
        if (inputs[10] < 0.09) {
            var123 = 0.024889309;
        } else {
            if (inputs[15] < 0.54818183) {
                if (inputs[19] < 2.144363) {
                    if (inputs[19] < 1.8369683) {
                        var123 = -0.0006608556;
                    } else {
                        var123 = 0.02457712;
                    }
                } else {
                    if (inputs[19] < 2.9961197) {
                        var123 = -0.028397124;
                    } else {
                        var123 = 0.008915843;
                    }
                }
            } else {
                var123 = 0.018455481;
            }
        }
    } else {
        var123 = -0.01868439;
    }
    double var124;
    if (inputs[20] < -1.8230268) {
        var124 = -0.024475731;
    } else {
        if (inputs[11] < 0.45) {
            if (inputs[11] < 0.36) {
                if (inputs[19] < 1.8027071) {
                    if (inputs[17] < 1.3323122) {
                        var124 = -0.026162373;
                    } else {
                        var124 = -0.000034102795;
                    }
                } else {
                    if (inputs[19] < 2.0921564) {
                        var124 = 0.026118845;
                    } else {
                        var124 = -0.003928414;
                    }
                }
            } else {
                if (inputs[15] < -0.18915151) {
                    if (inputs[10] < 0.8075) {
                        var124 = -0.015844967;
                    } else {
                        var124 = 0.008053845;
                    }
                } else {
                    if (inputs[23] < -35.168385) {
                        var124 = 0.04153135;
                    } else {
                        var124 = 0.008170234;
                    }
                }
            }
        } else {
            var124 = -0.017201494;
        }
    }
    double var125;
    if (inputs[10] < 5.91) {
        if (inputs[2] < 0.9671429) {
            var125 = 0.016006164;
        } else {
            if (inputs[2] < 1.0985714) {
                var125 = -0.02213435;
            } else {
                if (inputs[19] < 1.1154667) {
                    var125 = 0.018833015;
                } else {
                    if (inputs[19] < 1.3897288) {
                        var125 = -0.01602755;
                    } else {
                        var125 = 0.0012470183;
                    }
                }
            }
        }
    } else {
        var125 = 0.022017062;
    }
    double var126;
    if (inputs[23] < 25.207453) {
        if (inputs[24] < 21.994337) {
            if (inputs[16] < 0.22166166) {
                if (inputs[14] < 0.564) {
                    if (inputs[21] < -1.8701564) {
                        var126 = -0.00095323945;
                    } else {
                        var126 = -0.027146323;
                    }
                } else {
                    if (inputs[14] < 1.008) {
                        var126 = 0.014470178;
                    } else {
                        var126 = -0.0114711085;
                    }
                }
            } else {
                var126 = 0.017688511;
            }
        } else {
            if (inputs[9] < 5.31) {
                var126 = -0.003568233;
            } else {
                var126 = -0.027735574;
            }
        }
    } else {
        var126 = -0.024314053;
    }
    double var127;
    if (inputs[15] < 0.664303) {
        if (inputs[10] < 5.0575) {
            if (inputs[2] < 1.7578571) {
                if (inputs[9] < 6.4875) {
                    if (inputs[8] < 1712.04) {
                        var127 = -0.009204517;
                    } else {
                        var127 = 0.008965684;
                    }
                } else {
                    var127 = -0.013601773;
                }
            } else {
                if (inputs[14] < -0.923) {
                    var127 = 0.011365724;
                } else {
                    if (inputs[10] < 1.155) {
                        var127 = -0.0061811274;
                    } else {
                        var127 = -0.026339082;
                    }
                }
            }
        } else {
            var127 = 0.019727727;
        }
    } else {
        var127 = -0.022573665;
    }
    double var128;
    if (inputs[24] < 25.472149) {
        if (inputs[16] < -0.2654737) {
            if (inputs[20] < 0.1593122) {
                var128 = -0.0027682427;
            } else {
                var128 = -0.02305339;
            }
        } else {
            if (inputs[18] < 1.5272669) {
                if (inputs[2] < 1.6985714) {
                    if (inputs[9] < 2.625) {
                        var128 = -0.011737693;
                    } else {
                        var128 = 0.0084028635;
                    }
                } else {
                    var128 = -0.014702036;
                }
            } else {
                if (inputs[11] < 0.39) {
                    if (inputs[18] < 2.2641952) {
                        var128 = 0.020065334;
                    } else {
                        var128 = 0.0012866429;
                    }
                } else {
                    var128 = -0.007985121;
                }
            }
        }
    } else {
        var128 = -0.015031346;
    }
    double var129;
    if (inputs[17] < 0.87206423) {
        var129 = -0.024642395;
    } else {
        if (inputs[15] < 0.3798788) {
            if (inputs[15] < 0.2938788) {
                if (inputs[24] < -7.1595545) {
                    if (inputs[10] < 0.6525) {
                        var129 = -0.026803112;
                    } else {
                        var129 = -0.0000044577564;
                    }
                } else {
                    if (inputs[11] < 0.39) {
                        var129 = 0.0004871326;
                    } else {
                        var129 = 0.023172606;
                    }
                }
            } else {
                var129 = -0.02789001;
            }
        } else {
            if (inputs[15] < 0.43066666) {
                var129 = 0.028875917;
            } else {
                if (inputs[1] < 72.715904) {
                    if (inputs[22] < 1.0) {
                        var129 = -0.0030130458;
                    } else {
                        var129 = 0.028916398;
                    }
                } else {
                    var129 = -0.019745851;
                }
            }
        }
    }
    double var130;
    if (inputs[17] < 0.96067894) {
        if (inputs[9] < 3.685) {
            var130 = -0.03510331;
        } else {
            var130 = -0.009863606;
        }
    } else {
        if (inputs[23] < -59.855896) {
            var130 = -0.018111577;
        } else {
            if (inputs[15] < 0.30321214) {
                if (inputs[16] < 0.16592482) {
                    if (inputs[17] < 1.1380615) {
                        var130 = 0.021106195;
                    } else {
                        var130 = 0.0019944413;
                    }
                } else {
                    var130 = 0.030094488;
                }
            } else {
                if (inputs[15] < 0.3818788) {
                    var130 = -0.029549856;
                } else {
                    if (inputs[21] < 2.3521504) {
                        var130 = -0.011184197;
                    } else {
                        var130 = 0.007622005;
                    }
                }
            }
        }
    }
    double var131;
    if (inputs[23] < 10.910757) {
        if (inputs[13] < 1850.37) {
            if (inputs[16] < 0.15609023) {
                if (inputs[15] < 0.3398788) {
                    if (inputs[9] < 4.7025) {
                        var131 = -0.009520952;
                    } else {
                        var131 = 0.009430242;
                    }
                } else {
                    var131 = 0.018294895;
                }
            } else {
                if (inputs[15] < 0.35369697) {
                    var131 = -0.004279108;
                } else {
                    var131 = -0.027599458;
                }
            }
        } else {
            if (inputs[15] < 0.25624242) {
                if (inputs[23] < -2.358174) {
                    var131 = -0.013050581;
                } else {
                    var131 = 0.010612226;
                }
            } else {
                if (inputs[13] < 1916.76) {
                    var131 = 0.03032063;
                } else {
                    var131 = 0.010937424;
                }
            }
        }
    } else {
        var131 = -0.019249672;
    }
    double var132;
    if (inputs[16] < -0.044586465) {
        if (inputs[11] < 0.34) {
            if (inputs[22] < 1.0) {
                var132 = -0.017465297;
            } else {
                if (inputs[5] < 1802.1625) {
                    var132 = 0.024992386;
                } else {
                    var132 = -0.0033237364;
                }
            }
        } else {
            if (inputs[20] < 0.84939736) {
                if (inputs[9] < 2.985) {
                    var132 = 0.016237909;
                } else {
                    var132 = -0.0051625064;
                }
            } else {
                var132 = 0.027133184;
            }
        }
    } else {
        if (inputs[1] < 61.282856) {
            var132 = -0.01801306;
        } else {
            if (inputs[17] < 1.1634259) {
                if (inputs[14] < 0.589) {
                    var132 = -0.0051640654;
                } else {
                    var132 = 0.02168157;
                }
            } else {
                if (inputs[16] < 0.23542857) {
                    if (inputs[15] < 0.39478788) {
                        var132 = -0.02763503;
                    } else {
                        var132 = -0.0014007114;
                    }
                } else {
                    if (inputs[1] < 69.5182) {
                        var132 = 0.02512431;
                    } else {
                        var132 = -0.008833805;
                    }
                }
            }
        }
    }
    double var133;
    if (inputs[19] < 2.144363) {
        if (inputs[15] < -0.2869091) {
            if (inputs[3] < 1716.28) {
                var133 = -0.010141525;
            } else {
                if (inputs[19] < 1.4164727) {
                    var133 = -0.004591682;
                } else {
                    if (inputs[23] < -13.575977) {
                        var133 = 0.04545433;
                    } else {
                        var133 = 0.028507806;
                    }
                }
            }
        } else {
            if (inputs[20] < -0.034633074) {
                if (inputs[25] < 2.3162615) {
                    var133 = -0.012697589;
                } else {
                    if (inputs[16] < 0.18212782) {
                        var133 = 0.0066477703;
                    } else {
                        var133 = 0.03240764;
                    }
                }
            } else {
                if (inputs[10] < 1.17) {
                    var133 = -0.0017999337;
                } else {
                    var133 = -0.035876747;
                }
            }
        }
    } else {
        if (inputs[18] < 2.7107654) {
            if (inputs[5] < 1833.2225) {
                var133 = -0.0054024025;
            } else {
                var133 = -0.031805553;
            }
        } else {
            if (inputs[20] < -0.27667353) {
                var133 = 0.019665413;
            } else {
                var133 = -0.0076670237;
            }
        }
    }
    double var134;
    if (inputs[18] < 3.397783) {
        if (inputs[11] < 0.21) {
            var134 = 0.021733597;
        } else {
            if (inputs[15] < -0.3987879) {
                if (inputs[16] < -0.09418045) {
                    if (inputs[16] < -0.2654737) {
                        var134 = -0.01812331;
                    } else {
                        var134 = 0.0073932065;
                    }
                } else {
                    var134 = -0.025891177;
                }
            } else {
                if (inputs[24] < 25.472149) {
                    if (inputs[16] < 0.2641203) {
                        var134 = 0.0041034888;
                    } else {
                        var134 = 0.026288237;
                    }
                } else {
                    var134 = -0.011850443;
                }
            }
        }
    } else {
        var134 = -0.01602372;
    }
    double var135;
    if (inputs[19] < 4.164137) {
        if (inputs[11] < 0.37) {
            if (inputs[19] < 1.3652738) {
                var135 = -0.029374337;
            } else {
                if (inputs[20] < 1.1827226) {
                    if (inputs[24] < -20.721348) {
                        var135 = 0.02284294;
                    } else {
                        var135 = 0.00024159762;
                    }
                } else {
                    var135 = -0.02263111;
                }
            }
        } else {
            if (inputs[14] < -0.855) {
                var135 = -0.012727172;
            } else {
                if (inputs[2] < 1.6728572) {
                    if (inputs[2] < 1.4471428) {
                        var135 = 0.009731073;
                    } else {
                        var135 = 0.0370559;
                    }
                } else {
                    var135 = -0.0066089374;
                }
            }
        }
    } else {
        var135 = -0.024177078;
    }
    double var136;
    if (inputs[15] < -0.71115154) {
        var136 = 0.017885607;
    } else {
        if (inputs[23] < 19.42722) {
            if (inputs[19] < 1.222446) {
                if (inputs[17] < 1.1671058) {
                    var136 = -0.0055668973;
                } else {
                    var136 = 0.023527358;
                }
            } else {
                if (inputs[19] < 1.3578346) {
                    var136 = -0.019722596;
                } else {
                    if (inputs[5] < 1667.8676) {
                        var136 = -0.019222505;
                    } else {
                        var136 = 0.0024555295;
                    }
                }
            }
        } else {
            var136 = -0.016831271;
        }
    }
    double var137;
    if (inputs[23] < -55.599304) {
        var137 = -0.01666776;
    } else {
        if (inputs[6] < 1663.805) {
            var137 = 0.018928055;
        } else {
            if (inputs[13] < 1698.54) {
                var137 = -0.022926502;
            } else {
                if (inputs[25] < 3.8830729) {
                    if (inputs[5] < 1818.8975) {
                        var137 = 0.011201425;
                    } else {
                        var137 = -0.0017900764;
                    }
                } else {
                    var137 = -0.018726578;
                }
            }
        }
    }
    double var138;
    if (inputs[18] < 3.5810971) {
        if (inputs[23] < -63.956158) {
            var138 = -0.013325483;
        } else {
            if (inputs[1] < 26.193537) {
                var138 = 0.025224073;
            } else {
                if (inputs[1] < 31.216616) {
                    var138 = -0.017409062;
                } else {
                    if (inputs[18] < 1.1529632) {
                        var138 = 0.020511592;
                    } else {
                        var138 = 0.0028841204;
                    }
                }
            }
        }
    } else {
        var138 = -0.022860961;
    }
    double var139;
    if (inputs[18] < 1.0505737) {
        var139 = 0.018876247;
    } else {
        if (inputs[19] < 1.1543068) {
            var139 = -0.018747402;
        } else {
            if (inputs[20] < -0.37495586) {
                if (inputs[9] < 5.695) {
                    if (inputs[15] < 0.27848485) {
                        var139 = 0.009250962;
                    } else {
                        var139 = -0.010006472;
                    }
                } else {
                    if (inputs[9] < 8.085) {
                        var139 = 0.03501407;
                    } else {
                        var139 = 0.0045287805;
                    }
                }
            } else {
                if (inputs[1] < 69.681725) {
                    if (inputs[24] < -7.1595545) {
                        var139 = -0.006927631;
                    } else {
                        var139 = 0.010555934;
                    }
                } else {
                    var139 = -0.025436632;
                }
            }
        }
    }
    double var140;
    if (inputs[23] < 0.3177864) {
        if (inputs[11] < 0.44) {
            if (inputs[16] < -0.16133834) {
                if (inputs[14] < -0.618) {
                    if (inputs[23] < -23.573027) {
                        var140 = -0.02315487;
                    } else {
                        var140 = 0.0024469988;
                    }
                } else {
                    var140 = 0.0161034;
                }
            } else {
                if (inputs[15] < 0.30321214) {
                    if (inputs[17] < 1.3987509) {
                        var140 = 0.008922734;
                    } else {
                        var140 = 0.028278241;
                    }
                } else {
                    if (inputs[10] < 0.48) {
                        var140 = 0.019645363;
                    } else {
                        var140 = -0.004095835;
                    }
                }
            }
        } else {
            var140 = -0.012062763;
        }
    } else {
        if (inputs[4] < 1931.365) {
            var140 = -0.025025442;
        } else {
            var140 = -0.0033679323;
        }
    }
    double var141;
    if (inputs[20] < 0.106602594) {
        if (inputs[10] < 0.6925) {
            if (inputs[14] < 0.575) {
                var141 = -0.015374379;
            } else {
                var141 = 0.014967539;
            }
        } else {
            if (inputs[10] < 0.985) {
                var141 = 0.0264076;
            } else {
                if (inputs[10] < 1.575) {
                    var141 = -0.011967895;
                } else {
                    if (inputs[10] < 2.23) {
                        var141 = 0.026149657;
                    } else {
                        var141 = 0.0042829616;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 69.46455) {
            if (inputs[20] < 0.46739486) {
                var141 = -0.02334716;
            } else {
                if (inputs[16] < -0.24480452) {
                    var141 = -0.016590975;
                } else {
                    if (inputs[25] < 2.7837949) {
                        var141 = -0.0012007732;
                    } else {
                        var141 = 0.022886552;
                    }
                }
            }
        } else {
            var141 = -0.038261805;
        }
    }
    double var142;
    if (inputs[2] < 0.96428573) {
        var142 = 0.021784503;
    } else {
        if (inputs[1] < 74.50789) {
            if (inputs[17] < 0.8829043) {
                var142 = -0.02006622;
            } else {
                if (inputs[15] < 0.52672726) {
                    if (inputs[1] < 69.5182) {
                        var142 = 0.0027135606;
                    } else {
                        var142 = -0.020773144;
                    }
                } else {
                    var142 = 0.018069765;
                }
            }
        } else {
            var142 = -0.0214889;
        }
    }
    double var143;
    if (inputs[15] < -0.71115154) {
        var143 = 0.01738921;
    } else {
        if (inputs[19] < 2.144363) {
            if (inputs[10] < 0.335) {
                if (inputs[9] < 2.795) {
                    var143 = -0.020146074;
                } else {
                    var143 = 0.00421074;
                }
            } else {
                if (inputs[10] < 2.23) {
                    if (inputs[24] < 19.951187) {
                        var143 = 0.008556562;
                    } else {
                        var143 = 0.028025495;
                    }
                } else {
                    if (inputs[10] < 3.645) {
                        var143 = -0.009817104;
                    } else {
                        var143 = 0.01703634;
                    }
                }
            }
        } else {
            if (inputs[11] < 0.28) {
                if (inputs[25] < 3.262794) {
                    var143 = -0.028113555;
                } else {
                    var143 = 0.00003141543;
                }
            } else {
                var143 = 0.009428288;
            }
        }
    }
    double var144;
    if (inputs[2] < 1.7892857) {
        if (inputs[8] < 1788.24) {
            if (inputs[20] < 0.00019193416) {
                if (inputs[9] < 4.63) {
                    var144 = -0.003773766;
                } else {
                    var144 = 0.019235117;
                }
            } else {
                if (inputs[19] < 1.3975947) {
                    var144 = -0.0043422473;
                } else {
                    var144 = -0.028926259;
                }
            }
        } else {
            if (inputs[2] < 1.5585715) {
                if (inputs[19] < 1.4164727) {
                    if (inputs[14] < 0.589) {
                        var144 = -0.014072507;
                    } else {
                        var144 = 0.011838116;
                    }
                } else {
                    var144 = 0.017943108;
                }
            } else {
                var144 = 0.029401274;
            }
        }
    } else {
        if (inputs[19] < 1.8369683) {
            var144 = -0.020463787;
        } else {
            if (inputs[19] < 2.2101338) {
                var144 = 0.01986884;
            } else {
                if (inputs[11] < 0.16) {
                    var144 = 0.01334989;
                } else {
                    if (inputs[3] < 1805.555) {
                        var144 = 0.000013341183;
                    } else {
                        var144 = -0.022685502;
                    }
                }
            }
        }
    }
    double var145;
    if (inputs[15] < 0.5938788) {
        if (inputs[16] < 0.26023307) {
            if (inputs[16] < 0.03225564) {
                if (inputs[9] < 5.285) {
                    if (inputs[20] < 0.76225996) {
                        var145 = 0.003184129;
                    } else {
                        var145 = 0.024968598;
                    }
                } else {
                    if (inputs[15] < -0.44751516) {
                        var145 = 0.0048261764;
                    } else {
                        var145 = -0.018861959;
                    }
                }
            } else {
                if (inputs[10] < 0.825) {
                    var145 = -0.026210502;
                } else {
                    if (inputs[3] < 1764.73) {
                        var145 = -0.018056935;
                    } else {
                        var145 = 0.00979926;
                    }
                }
            }
        } else {
            var145 = 0.017743954;
        }
    } else {
        var145 = -0.017828008;
    }
    double var146;
    if (inputs[23] < -29.362022) {
        if (inputs[16] < -0.11656391) {
            if (inputs[16] < -0.21651128) {
                var146 = 0.008206496;
            } else {
                var146 = -0.02318161;
            }
        } else {
            if (inputs[23] < -46.023937) {
                var146 = 0.003247286;
            } else {
                var146 = 0.027774507;
            }
        }
    } else {
        if (inputs[21] < 3.4715025) {
            if (inputs[25] < 2.3903956) {
                if (inputs[9] < 6.8425) {
                    if (inputs[9] < 3.85) {
                        var146 = -0.0036421309;
                    } else {
                        var146 = -0.043524094;
                    }
                } else {
                    var146 = 0.011052187;
                }
            } else {
                if (inputs[19] < 1.4212687) {
                    var146 = -0.010078855;
                } else {
                    if (inputs[21] < -3.3781095) {
                        var146 = -0.010650588;
                    } else {
                        var146 = 0.016754078;
                    }
                }
            }
        } else {
            var146 = -0.021707501;
        }
    }
    double var147;
    if (inputs[24] < -26.514355) {
        var147 = -0.017583733;
    } else {
        if (inputs[19] < 1.65015) {
            if (inputs[9] < 6.12) {
                if (inputs[14] < -0.814) {
                    var147 = -0.01410525;
                } else {
                    if (inputs[14] < -0.679) {
                        var147 = 0.030012513;
                    } else {
                        var147 = -0.0005433185;
                    }
                }
            } else {
                var147 = -0.0187353;
            }
        } else {
            if (inputs[20] < 0.08772628) {
                if (inputs[15] < 0.5847879) {
                    if (inputs[17] < 1.1853675) {
                        var147 = 0.006450321;
                    } else {
                        var147 = 0.031759284;
                    }
                } else {
                    var147 = -0.0048558614;
                }
            } else {
                if (inputs[20] < 0.73104346) {
                    var147 = -0.02130799;
                } else {
                    if (inputs[17] < 1.2569582) {
                        var147 = 0.027617613;
                    } else {
                        var147 = -0.0028322914;
                    }
                }
            }
        }
    }
    double var148;
    if (inputs[1] < 26.495476) {
        if (inputs[15] < -0.49993938) {
            var148 = -0.0056733284;
        } else {
            var148 = 0.02580866;
        }
    } else {
        if (inputs[15] < -0.5858182) {
            var148 = 0.01709481;
        } else {
            if (inputs[14] < -0.844) {
                if (inputs[1] < 32.738472) {
                    var148 = -0.04359898;
                } else {
                    var148 = -0.0015432973;
                }
            } else {
                if (inputs[18] < 1.2168549) {
                    if (inputs[2] < 1.2035714) {
                        var148 = 0.004879993;
                    } else {
                        var148 = -0.020647574;
                    }
                } else {
                    if (inputs[19] < 1.3074727) {
                        var148 = 0.01902428;
                    } else {
                        var148 = -0.003195009;
                    }
                }
            }
        }
    }
    double var149;
    if (inputs[15] < -0.3961212) {
        if (inputs[23] < -3.152488) {
            if (inputs[17] < 1.5168968) {
                var149 = -0.029239712;
            } else {
                var149 = -0.0025795843;
            }
        } else {
            if (inputs[20] < 0.65576893) {
                var149 = -0.009769067;
            } else {
                var149 = 0.025956806;
            }
        }
    } else {
        if (inputs[15] < -0.33327273) {
            var149 = 0.03499131;
        } else {
            if (inputs[16] < -0.14364661) {
                var149 = -0.014303881;
            } else {
                if (inputs[16] < -0.041323308) {
                    var149 = 0.020963537;
                } else {
                    if (inputs[15] < 0.25624242) {
                        var149 = -0.012260016;
                    } else {
                        var149 = 0.0035710786;
                    }
                }
            }
        }
    }
    double var150;
    if (inputs[5] < 1957.9825) {
        if (inputs[10] < 5.91) {
            if (inputs[10] < 3.8325) {
                if (inputs[25] < 1.8914771) {
                    var150 = -0.015955487;
                } else {
                    if (inputs[3] < 1819.18) {
                        var150 = 0.008715944;
                    } else {
                        var150 = -0.0032674086;
                    }
                }
            } else {
                var150 = -0.019111073;
            }
        } else {
            var150 = 0.019184895;
        }
    } else {
        var150 = -0.024190683;
    }
    double var151;
    if (inputs[4] < 1935.9) {
        if (inputs[19] < 1.4808102) {
            if (inputs[9] < 5.63) {
                if (inputs[15] < 0.23206061) {
                    if (inputs[2] < 1.36) {
                        var151 = 0.0062125684;
                    } else {
                        var151 = 0.036275763;
                    }
                } else {
                    var151 = -0.0022036638;
                }
            } else {
                var151 = -0.017402418;
            }
        } else {
            if (inputs[19] < 1.8512831) {
                if (inputs[6] < 1848.785) {
                    if (inputs[23] < -24.418097) {
                        var151 = -0.0036952617;
                    } else {
                        var151 = -0.039801415;
                    }
                } else {
                    var151 = 0.007985532;
                }
            } else {
                if (inputs[19] < 2.144363) {
                    var151 = 0.02096796;
                } else {
                    if (inputs[5] < 1837.4675) {
                        var151 = 0.0018943924;
                    } else {
                        var151 = -0.024083652;
                    }
                }
            }
        }
    } else {
        if (inputs[16] < -0.10088722) {
            var151 = 0.026252324;
        } else {
            var151 = 0.005531904;
        }
    }
    double var152;
    if (inputs[25] < 4.2767625) {
        if (inputs[23] < -55.599304) {
            var152 = -0.023087345;
        } else {
            if (inputs[20] < 1.4817988) {
                if (inputs[20] < 0.84939736) {
                    if (inputs[20] < -0.005653874) {
                        var152 = 0.0042115846;
                    } else {
                        var152 = -0.010591768;
                    }
                } else {
                    if (inputs[25] < 2.6826775) {
                        var152 = 0.0067661568;
                    } else {
                        var152 = 0.027377192;
                    }
                }
            } else {
                var152 = -0.014398361;
            }
        }
    } else {
        var152 = 0.019698894;
    }
    double var153;
    if (inputs[8] < 1972.19) {
        if (inputs[13] < 1941.72) {
            if (inputs[11] < 0.21) {
                if (inputs[9] < 11.0575) {
                    var153 = 0.026773011;
                } else {
                    var153 = 0.002552109;
                }
            } else {
                if (inputs[19] < 2.3010995) {
                    if (inputs[10] < 0.8075) {
                        var153 = -0.008216741;
                    } else {
                        var153 = 0.006477593;
                    }
                } else {
                    var153 = -0.022266809;
                }
            }
        } else {
            var153 = 0.019694576;
        }
    } else {
        var153 = -0.021415634;
    }
    double var154;
    if (inputs[23] < -50.573925) {
        if (inputs[23] < -63.956158) {
            var154 = 0.0020086535;
        } else {
            var154 = 0.026168503;
        }
    } else {
        if (inputs[9] < 4.955) {
            if (inputs[11] < 0.43) {
                if (inputs[10] < 0.85) {
                    if (inputs[10] < 0.4925) {
                        var154 = 0.0053848415;
                    } else {
                        var154 = -0.020085167;
                    }
                } else {
                    if (inputs[10] < 1.185) {
                        var154 = 0.030410955;
                    } else {
                        var154 = 0.0055321553;
                    }
                }
            } else {
                var154 = -0.016632037;
            }
        } else {
            if (inputs[19] < 1.6991948) {
                if (inputs[14] < 0.637) {
                    var154 = -0.03146086;
                } else {
                    var154 = -0.016496262;
                }
            } else {
                if (inputs[11] < 0.29) {
                    if (inputs[17] < 2.102351) {
                        var154 = -0.0006917585;
                    } else {
                        var154 = -0.03217666;
                    }
                } else {
                    var154 = 0.018413715;
                }
            }
        }
    }
    double var155;
    if (inputs[14] < 0.707) {
        if (inputs[24] < -25.921698) {
            var155 = -0.016980568;
        } else {
            if (inputs[15] < -0.68636364) {
                var155 = 0.026893474;
            } else {
                if (inputs[2] < 2.0564287) {
                    if (inputs[16] < 0.16847369) {
                        var155 = 0.0035782983;
                    } else {
                        var155 = 0.03172931;
                    }
                } else {
                    if (inputs[17] < 1.3512217) {
                        var155 = -0.019566376;
                    } else {
                        var155 = 0.0014421276;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 63.736034) {
            var155 = 0.012139894;
        } else {
            if (inputs[23] < -29.362022) {
                var155 = 0.00033500185;
            } else {
                if (inputs[15] < 0.5382424) {
                    var155 = -0.036092542;
                } else {
                    var155 = 0.0002725817;
                }
            }
        }
    }
    double var156;
    if (inputs[19] < 2.0771122) {
        if (inputs[24] < -19.664974) {
            if (inputs[19] < 1.4164727) {
                var156 = 0.00045974427;
            } else {
                var156 = 0.033541586;
            }
        } else {
            if (inputs[15] < -0.18915151) {
                if (inputs[6] < 1807.91) {
                    var156 = -0.031757683;
                } else {
                    if (inputs[4] < 1861.31) {
                        var156 = 0.022563133;
                    } else {
                        var156 = -0.008041468;
                    }
                }
            } else {
                if (inputs[16] < -0.012135338) {
                    var156 = 0.027347056;
                } else {
                    if (inputs[1] < 73.92348) {
                        var156 = -0.0011621602;
                    } else {
                        var156 = 0.018354641;
                    }
                }
            }
        }
    } else {
        if (inputs[19] < 2.5699441) {
            var156 = -0.023595896;
        } else {
            if (inputs[25] < 2.3903956) {
                var156 = -0.01681689;
            } else {
                if (inputs[2] < 2.6864285) {
                    var156 = -0.0043938244;
                } else {
                    var156 = 0.014389572;
                }
            }
        }
    }
    double var157;
    if (inputs[23] < -3.152488) {
        if (inputs[8] < 1860.04) {
            if (inputs[15] < -0.54242426) {
                var157 = -0.019978901;
            } else {
                if (inputs[16] < 0.1747594) {
                    if (inputs[2] < 1.085) {
                        var157 = -0.010971043;
                    } else {
                        var157 = 0.015027505;
                    }
                } else {
                    var157 = -0.006721275;
                }
            }
        } else {
            var157 = -0.031000836;
        }
    } else {
        if (inputs[21] < 2.851763) {
            if (inputs[10] < 3.465) {
                if (inputs[20] < 0.4051877) {
                    if (inputs[14] < -0.679) {
                        var157 = 0.012676256;
                    } else {
                        var157 = -0.01121794;
                    }
                } else {
                    var157 = 0.02001006;
                }
            } else {
                var157 = 0.02782391;
            }
        } else {
            var157 = -0.007922253;
        }
    }
    double var158;
    if (inputs[17] < 0.83912814) {
        var158 = -0.021150403;
    } else {
        if (inputs[25] < 2.3162615) {
            if (inputs[3] < 1840.35) {
                if (inputs[23] < -19.270708) {
                    var158 = -0.00031219746;
                } else {
                    var158 = -0.026373772;
                }
            } else {
                if (inputs[4] < 1913.895) {
                    var158 = 0.02477878;
                } else {
                    var158 = -0.008676962;
                }
            }
        } else {
            if (inputs[25] < 3.2322023) {
                if (inputs[22] < 1.0) {
                    if (inputs[2] < 1.4685714) {
                        var158 = 0.012582583;
                    } else {
                        var158 = -0.014089779;
                    }
                } else {
                    if (inputs[3] < 1810.135) {
                        var158 = 0.041220855;
                    } else {
                        var158 = 0.014883097;
                    }
                }
            } else {
                if (inputs[3] < 1704.66) {
                    var158 = -0.026823558;
                } else {
                    if (inputs[6] < 1880.255) {
                        var158 = 0.014044045;
                    } else {
                        var158 = -0.014067004;
                    }
                }
            }
        }
    }
    double var159;
    if (inputs[14] < 1.058) {
        if (inputs[24] < 22.278522) {
            if (inputs[1] < 31.394823) {
                if (inputs[10] < 2.1375) {
                    if (inputs[9] < 4.745) {
                        var159 = -0.020664116;
                    } else {
                        var159 = 0.021968378;
                    }
                } else {
                    var159 = -0.018254606;
                }
            } else {
                if (inputs[1] < 35.918762) {
                    if (inputs[2] < 1.3721429) {
                        var159 = 0.024196077;
                    } else {
                        var159 = 0.004544983;
                    }
                } else {
                    if (inputs[17] < 0.9873723) {
                        var159 = 0.01393985;
                    } else {
                        var159 = -0.0069783204;
                    }
                }
            }
        } else {
            var159 = -0.018398406;
        }
    } else {
        if (inputs[23] < -10.96624) {
            var159 = 0.00202145;
        } else {
            var159 = 0.025724418;
        }
    }
    double var160;
    if (inputs[24] < -26.514355) {
        var160 = -0.017088205;
    } else {
        if (inputs[24] < -20.653982) {
            if (inputs[17] < 1.2962098) {
                var160 = 0.026387062;
            } else {
                var160 = 0.0036750264;
            }
        } else {
            if (inputs[21] < -2.872818) {
                var160 = -0.01629046;
            } else {
                if (inputs[23] < 0.3177864) {
                    if (inputs[1] < 63.875416) {
                        var160 = 0.01114189;
                    } else {
                        var160 = -0.0007941041;
                    }
                } else {
                    if (inputs[23] < 14.560352) {
                        var160 = -0.019292848;
                    } else {
                        var160 = -0.0015001096;
                    }
                }
            }
        }
    }
    double var161;
    if (inputs[25] < 4.2767625) {
        if (inputs[25] < 3.8263185) {
            if (inputs[21] < 2.9065473) {
                if (inputs[11] < 0.36) {
                    if (inputs[22] < 1.0) {
                        var161 = -0.021484904;
                    } else {
                        var161 = 0.0019346635;
                    }
                } else {
                    if (inputs[20] < 0.86715806) {
                        var161 = -0.002045326;
                    } else {
                        var161 = 0.0151877655;
                    }
                }
            } else {
                if (inputs[20] < -0.09276572) {
                    var161 = 0.019880643;
                } else {
                    var161 = -0.0074027134;
                }
            }
        } else {
            var161 = -0.02131557;
        }
    } else {
        var161 = 0.018024694;
    }
    double var162;
    if (inputs[17] < 0.9489573) {
        if (inputs[15] < 0.32963637) {
            var162 = -0.025654377;
        } else {
            var162 = 0.0059269746;
        }
    } else {
        if (inputs[23] < 4.9678183) {
            if (inputs[25] < 1.6261823) {
                var162 = 0.027765337;
            } else {
                if (inputs[25] < 4.0183487) {
                    if (inputs[23] < -56.702133) {
                        var162 = -0.01873192;
                    } else {
                        var162 = 0.0039173653;
                    }
                } else {
                    var162 = 0.023309309;
                }
            }
        } else {
            var162 = -0.01662488;
        }
    }
    double var163;
    if (inputs[15] < -0.3987879) {
        if (inputs[21] < -3.181065) {
            var163 = -0.022015365;
        } else {
            if (inputs[16] < -0.08757143) {
                if (inputs[1] < 30.595419) {
                    var163 = -0.005217362;
                } else {
                    var163 = 0.01901799;
                }
            } else {
                var163 = -0.018625902;
            }
        }
    } else {
        if (inputs[21] < -3.0461998) {
            var163 = 0.02272618;
        } else {
            if (inputs[10] < 4.7325) {
                if (inputs[16] < -0.11742105) {
                    var163 = -0.017919578;
                } else {
                    if (inputs[1] < 63.736034) {
                        var163 = 0.013161338;
                    } else {
                        var163 = -0.005920293;
                    }
                }
            } else {
                var163 = 0.018679677;
            }
        }
    }
    double var164;
    if (inputs[18] < 1.3965604) {
        if (inputs[9] < 5.63) {
            if (inputs[10] < 0.795) {
                if (inputs[18] < 1.1484094) {
                    var164 = 0.0066702613;
                } else {
                    var164 = -0.0353679;
                }
            } else {
                if (inputs[3] < 1827.035) {
                    var164 = 0.01975962;
                } else {
                    var164 = -0.014540976;
                }
            }
        } else {
            var164 = -0.021807559;
        }
    } else {
        if (inputs[18] < 3.5044434) {
            if (inputs[18] < 2.5222814) {
                if (inputs[2] < 1.7264286) {
                    if (inputs[14] < -0.805) {
                        var164 = -0.009952957;
                    } else {
                        var164 = 0.018201742;
                    }
                } else {
                    if (inputs[18] < 1.8450803) {
                        var164 = -0.017706834;
                    } else {
                        var164 = 0.0024210804;
                    }
                }
            } else {
                var164 = 0.027597612;
            }
        } else {
            var164 = -0.014058415;
        }
    }
    double var165;
    if (inputs[8] < 1902.8) {
        if (inputs[11] < 0.44) {
            if (inputs[21] < 2.765644) {
                if (inputs[1] < 64.21748) {
                    if (inputs[17] < 1.8387017) {
                        var165 = 0.0009822573;
                    } else {
                        var165 = 0.018178875;
                    }
                } else {
                    var165 = -0.015556144;
                }
            } else {
                if (inputs[19] < 1.283395) {
                    var165 = 0.03250245;
                } else {
                    if (inputs[20] < -0.4338425) {
                        var165 = 0.023659248;
                    } else {
                        var165 = -0.010259437;
                    }
                }
            }
        } else {
            var165 = -0.019468753;
        }
    } else {
        if (inputs[14] < -0.768) {
            var165 = 0.013501723;
        } else {
            if (inputs[25] < 2.792573) {
                var165 = -0.0064648134;
            } else {
                var165 = -0.038377974;
            }
        }
    }
    double var166;
    if (inputs[15] < 0.3798788) {
        if (inputs[25] < 1.9651604) {
            var166 = 0.010849752;
        } else {
            if (inputs[9] < 10.075) {
                if (inputs[20] < -0.09276572) {
                    if (inputs[20] < -1.1626294) {
                        var166 = -0.015551561;
                    } else {
                        var166 = 0.008178868;
                    }
                } else {
                    if (inputs[2] < 1.6985714) {
                        var166 = -0.0075370953;
                    } else {
                        var166 = -0.031172747;
                    }
                }
            } else {
                var166 = 0.014818266;
            }
        }
    } else {
        if (inputs[15] < 0.42757577) {
            var166 = 0.030415948;
        } else {
            if (inputs[19] < 2.7001708) {
                if (inputs[21] < 2.497582) {
                    var166 = 0.011060253;
                } else {
                    var166 = -0.014225565;
                }
            } else {
                var166 = 0.018322606;
            }
        }
    }
    double var167;
    if (inputs[25] < 4.345679) {
        if (inputs[15] < -0.71115154) {
            var167 = 0.015943471;
        } else {
            if (inputs[16] < -0.2654737) {
                var167 = -0.027515944;
            } else {
                if (inputs[1] < 75.88933) {
                    if (inputs[21] < 3.369159) {
                        var167 = -0.0010934467;
                    } else {
                        var167 = 0.017861158;
                    }
                } else {
                    var167 = -0.018482093;
                }
            }
        }
    } else {
        var167 = 0.019160792;
    }
    double var168;
    if (inputs[16] < -0.2654737) {
        if (inputs[14] < -0.86) {
            var168 = 0.0016769456;
        } else {
            var168 = -0.02271519;
        }
    } else {
        if (inputs[16] < -0.20408271) {
            var168 = 0.01830833;
        } else {
            if (inputs[10] < 5.0575) {
                if (inputs[16] < 0.12944362) {
                    if (inputs[24] < 9.025055) {
                        var168 = -0.0029211014;
                    } else {
                        var168 = 0.016746335;
                    }
                } else {
                    if (inputs[25] < 2.7594762) {
                        var168 = -0.028951252;
                    } else {
                        var168 = 0.00065873435;
                    }
                }
            } else {
                var168 = 0.014995424;
            }
        }
    }
    double var169;
    if (inputs[14] < 0.641) {
        if (inputs[19] < 1.3897288) {
            if (inputs[1] < 35.097878) {
                var169 = -0.00528039;
            } else {
                var169 = -0.03281319;
            }
        } else {
            if (inputs[10] < 0.63) {
                var169 = -0.01569367;
            } else {
                if (inputs[2] < 2.1321428) {
                    if (inputs[14] < -0.816) {
                        var169 = -0.0008862401;
                    } else {
                        var169 = 0.030647045;
                    }
                } else {
                    if (inputs[14] < -0.953) {
                        var169 = 0.017197508;
                    } else {
                        var169 = -0.025495254;
                    }
                }
            }
        }
    } else {
        if (inputs[10] < 1.4525) {
            if (inputs[9] < 3.3475) {
                var169 = 0.0039258604;
            } else {
                var169 = 0.029742425;
            }
        } else {
            if (inputs[17] < 1.7418909) {
                if (inputs[3] < 1818.325) {
                    var169 = -0.0031401648;
                } else {
                    var169 = 0.02016004;
                }
            } else {
                var169 = -0.02152898;
            }
        }
    }
    double var170;
    if (inputs[20] < 0.11182756) {
        if (inputs[19] < 1.5862585) {
            if (inputs[14] < 0.612) {
                if (inputs[25] < 2.5490096) {
                    var170 = 0.005884367;
                } else {
                    var170 = -0.031887405;
                }
            } else {
                if (inputs[17] < 1.2933152) {
                    var170 = 0.027165135;
                } else {
                    var170 = -0.01249282;
                }
            }
        } else {
            if (inputs[2] < 2.0564287) {
                if (inputs[25] < 3.2477732) {
                    var170 = 0.03340315;
                } else {
                    var170 = 0.0052214456;
                }
            } else {
                if (inputs[20] < -0.8018117) {
                    var170 = -0.0054241824;
                } else {
                    var170 = 0.018270297;
                }
            }
        }
    } else {
        if (inputs[16] < 0.16383459) {
            if (inputs[1] < 34.081207) {
                if (inputs[20] < 0.84939736) {
                    var170 = -0.03074742;
                } else {
                    var170 = 0.0035852478;
                }
            } else {
                if (inputs[6] < 1862.325) {
                    var170 = 0.0006103155;
                } else {
                    var170 = 0.0260944;
                }
            }
        } else {
            var170 = -0.02991932;
        }
    }
    double var171;
    if (inputs[19] < 1.1154667) {
        var171 = 0.0176839;
    } else {
        if (inputs[19] < 1.3897288) {
            if (inputs[21] < -2.5060918) {
                var171 = -0.030828247;
            } else {
                if (inputs[1] < 63.651924) {
                    var171 = 0.008821462;
                } else {
                    var171 = -0.013543801;
                }
            }
        } else {
            if (inputs[19] < 1.4670558) {
                var171 = 0.022640556;
            } else {
                if (inputs[5] < 1667.8676) {
                    var171 = -0.024446499;
                } else {
                    if (inputs[11] < 0.38) {
                        var171 = 0.004442262;
                    } else {
                        var171 = -0.017860595;
                    }
                }
            }
        }
    }
    double var172;
    if (inputs[10] < 1.185) {
        if (inputs[22] < 1.0) {
            if (inputs[16] < 0.12596993) {
                if (inputs[25] < 2.0046566) {
                    var172 = 0.02770692;
                } else {
                    if (inputs[25] < 3.052375) {
                        var172 = -0.014052004;
                    } else {
                        var172 = 0.009171475;
                    }
                }
            } else {
                var172 = -0.029001279;
            }
        } else {
            var172 = 0.019818207;
        }
    } else {
        if (inputs[2] < 1.2021428) {
            if (inputs[11] < 0.39) {
                var172 = -0.009156235;
            } else {
                var172 = 0.02841022;
            }
        } else {
            if (inputs[19] < 1.3897288) {
                var172 = -0.027097877;
            } else {
                if (inputs[17] < 2.102351) {
                    if (inputs[25] < 2.3162615) {
                        var172 = -0.01061068;
                    } else {
                        var172 = 0.008345837;
                    }
                } else {
                    var172 = -0.022020096;
                }
            }
        }
    }
    double var173;
    if (inputs[21] < -2.3628435) {
        if (inputs[1] < 34.17677) {
            if (inputs[23] < -3.152488) {
                if (inputs[13] < 1812.22) {
                    var173 = 0.004479886;
                } else {
                    var173 = -0.021889701;
                }
            } else {
                var173 = 0.015241737;
            }
        } else {
            var173 = 0.027534679;
        }
    } else {
        if (inputs[20] < 0.106602594) {
            if (inputs[16] < 0.16592482) {
                if (inputs[16] < 0.035654135) {
                    var173 = 0.005577066;
                } else {
                    if (inputs[2] < 1.3421428) {
                        var173 = 0.0011240358;
                    } else {
                        var173 = -0.027636098;
                    }
                }
            } else {
                if (inputs[24] < 15.2785225) {
                    var173 = 0.02924391;
                } else {
                    var173 = 0.0016113236;
                }
            }
        } else {
            if (inputs[10] < 1.365) {
                if (inputs[25] < 2.2714326) {
                    var173 = 0.01244821;
                } else {
                    var173 = -0.014167319;
                }
            } else {
                var173 = -0.022593142;
            }
        }
    }
    double var174;
    if (inputs[2] < 2.78) {
        if (inputs[18] < 2.2988102) {
            if (inputs[11] < 0.44) {
                if (inputs[24] < -18.610117) {
                    if (inputs[16] < -0.17421053) {
                        var174 = 0.0013884362;
                    } else {
                        var174 = 0.023971064;
                    }
                } else {
                    if (inputs[21] < -2.872818) {
                        var174 = -0.020080276;
                    } else {
                        var174 = 0.00254312;
                    }
                }
            } else {
                var174 = -0.014692303;
            }
        } else {
            var174 = -0.016127117;
        }
    } else {
        if (inputs[9] < 11.365) {
            var174 = 0.017891727;
        } else {
            var174 = 0.0005731443;
        }
    }
    double var175;
    if (inputs[13] < 1665.19) {
        var175 = 0.015144014;
    } else {
        if (inputs[15] < 0.6335152) {
            if (inputs[18] < 1.5751876) {
                if (inputs[11] < 0.4) {
                    if (inputs[9] < 2.505) {
                        var175 = 0.010916657;
                    } else {
                        var175 = -0.020542696;
                    }
                } else {
                    if (inputs[10] < 1.685) {
                        var175 = -0.005755499;
                    } else {
                        var175 = 0.026491802;
                    }
                }
            } else {
                if (inputs[16] < -0.31618798) {
                    var175 = -0.016816717;
                } else {
                    if (inputs[17] < 1.3926234) {
                        var175 = 0.0006298479;
                    } else {
                        var175 = 0.018018162;
                    }
                }
            }
        } else {
            var175 = -0.01849258;
        }
    }
    double var176;
    if (inputs[24] < -23.786545) {
        var176 = 0.019145984;
    } else {
        if (inputs[21] < -3.327291) {
            var176 = -0.016881358;
        } else {
            if (inputs[10] < 0.55) {
                if (inputs[16] < -0.044586465) {
                    var176 = 0.03003078;
                } else {
                    if (inputs[1] < 67.05072) {
                        var176 = -0.01655231;
                    } else {
                        var176 = 0.016519478;
                    }
                }
            } else {
                if (inputs[20] < -0.018309461) {
                    if (inputs[23] < -4.5796494) {
                        var176 = 0.016041068;
                    } else {
                        var176 = -0.005896179;
                    }
                } else {
                    if (inputs[17] < 1.1304936) {
                        var176 = 0.012555;
                    } else {
                        var176 = -0.013237711;
                    }
                }
            }
        }
    }
    double var177;
    if (inputs[18] < 3.397783) {
        if (inputs[9] < 1.41) {
            var177 = -0.023832634;
        } else {
            if (inputs[14] < 1.193) {
                if (inputs[18] < 1.0600189) {
                    var177 = 0.015221512;
                } else {
                    if (inputs[18] < 1.6192594) {
                        var177 = -0.0052301264;
                    } else {
                        var177 = 0.0061830664;
                    }
                }
            } else {
                var177 = 0.020393085;
            }
        }
    } else {
        var177 = -0.025591815;
    }
    double var178;
    if (inputs[23] < 10.910757) {
        if (inputs[8] < 1942.16) {
            if (inputs[19] < 1.2444535) {
                if (inputs[14] < 0.641) {
                    if (inputs[16] < -0.08642857) {
                        var178 = 0.019085322;
                    } else {
                        var178 = -0.009189842;
                    }
                } else {
                    var178 = 0.029403899;
                }
            } else {
                if (inputs[19] < 1.4164727) {
                    var178 = -0.012331708;
                } else {
                    if (inputs[5] < 1719.8925) {
                        var178 = -0.009544416;
                    } else {
                        var178 = 0.008678916;
                    }
                }
            }
        } else {
            var178 = 0.024119476;
        }
    } else {
        var178 = -0.009537054;
    }
    double var179;
    if (inputs[16] < 0.2641203) {
        if (inputs[10] < 0.3275) {
            if (inputs[14] < -0.594) {
                var179 = -0.0009059522;
            } else {
                var179 = -0.026841959;
            }
        } else {
            if (inputs[18] < 1.0147359) {
                var179 = -0.019711392;
            } else {
                if (inputs[24] < 1.2061857) {
                    if (inputs[1] < 36.89342) {
                        var179 = 0.00029099203;
                    } else {
                        var179 = -0.030120058;
                    }
                } else {
                    if (inputs[24] < 10.666371) {
                        var179 = 0.026629245;
                    } else {
                        var179 = 0.0052132676;
                    }
                }
            }
        }
    } else {
        if (inputs[3] < 1856.84) {
            var179 = 0.025464434;
        } else {
            var179 = 0.00024787273;
        }
    }
    double var180;
    if (inputs[21] < -3.593429) {
        var180 = 0.015892971;
    } else {
        if (inputs[24] < 18.969734) {
            if (inputs[25] < 3.1514523) {
                if (inputs[15] < -0.57878786) {
                    var180 = 0.013357456;
                } else {
                    if (inputs[16] < 0.21485715) {
                        var180 = -0.0061388523;
                    } else {
                        var180 = 0.015914219;
                    }
                }
            } else {
                if (inputs[18] < 1.3334782) {
                    var180 = 0.006274124;
                } else {
                    var180 = -0.030855779;
                }
            }
        } else {
            if (inputs[1] < 74.59002) {
                if (inputs[9] < 4.215) {
                    var180 = 0.004468856;
                } else {
                    var180 = 0.030840252;
                }
            } else {
                var180 = -0.0064905584;
            }
        }
    }
    double var181;
    if (inputs[10] < 0.3275) {
        if (inputs[17] < 1.3817728) {
            var181 = -0.027848559;
        } else {
            var181 = 0.003577469;
        }
    } else {
        if (inputs[9] < 2.95) {
            if (inputs[9] < 1.5625) {
                var181 = -0.001961454;
            } else {
                var181 = 0.024373194;
            }
        } else {
            if (inputs[11] < 0.36) {
                if (inputs[9] < 4.745) {
                    var181 = -0.028669434;
                } else {
                    if (inputs[19] < 1.8027071) {
                        var181 = -0.01590568;
                    } else {
                        var181 = 0.0026760455;
                    }
                }
            } else {
                if (inputs[6] < 1773.21) {
                    var181 = 0.021556284;
                } else {
                    if (inputs[18] < 1.3492947) {
                        var181 = -0.017686725;
                    } else {
                        var181 = 0.008616149;
                    }
                }
            }
        }
    }
    double var182;
    if (inputs[16] < -0.041323308) {
        if (inputs[1] < 31.394823) {
            if (inputs[21] < -3.593429) {
                var182 = 0.014531314;
            } else {
                if (inputs[3] < 1808.22) {
                    var182 = -0.0032278395;
                } else {
                    var182 = -0.023040019;
                }
            }
        } else {
            if (inputs[19] < 1.3527143) {
                var182 = 0.03239718;
            } else {
                if (inputs[24] < -12.6547575) {
                    var182 = 0.02160362;
                } else {
                    var182 = 0.0012203705;
                }
            }
        }
    } else {
        if (inputs[25] < 2.334938) {
            if (inputs[10] < 1.2175) {
                var182 = -0.0018982249;
            } else {
                var182 = -0.024793847;
            }
        } else {
            if (inputs[9] < 2.635) {
                var182 = -0.015511478;
            } else {
                if (inputs[14] < 0.905) {
                    if (inputs[15] < 0.2969697) {
                        var182 = 0.011173686;
                    } else {
                        var182 = -0.008948199;
                    }
                } else {
                    var182 = 0.013768102;
                }
            }
        }
    }
    double var183;
    if (inputs[13] < 1652.48) {
        var183 = 0.018816317;
    } else {
        if (inputs[16] < -0.3430827) {
            var183 = -0.01815069;
        } else {
            if (inputs[25] < 1.7660819) {
                var183 = 0.017702332;
            } else {
                if (inputs[24] < -20.12975) {
                    if (inputs[11] < 0.35) {
                        var183 = 0.02162943;
                    } else {
                        var183 = 0.0036363953;
                    }
                } else {
                    if (inputs[15] < -0.3961212) {
                        var183 = -0.015103436;
                    } else {
                        var183 = 0.00086830964;
                    }
                }
            }
        }
    }
    double var184;
    if (inputs[10] < 5.0575) {
        if (inputs[13] < 1908.07) {
            if (inputs[12] < 1854.18) {
                if (inputs[13] < 1820.89) {
                    if (inputs[17] < 0.91476774) {
                        var184 = 0.01806996;
                    } else {
                        var184 = -0.0016242386;
                    }
                } else {
                    var184 = -0.015078299;
                }
            } else {
                var184 = 0.014966579;
            }
        } else {
            if (inputs[14] < 0.589) {
                var184 = -0.021786086;
            } else {
                var184 = -0.002286937;
            }
        }
    } else {
        var184 = 0.011847527;
    }
    double var185;
    if (inputs[1] < 31.216616) {
        if (inputs[1] < 26.193537) {
            var185 = 0.0017227618;
        } else {
            if (inputs[2] < 1.4878571) {
                var185 = -0.032117605;
            } else {
                var185 = -0.008742628;
            }
        }
    } else {
        if (inputs[20] < 1.4817988) {
            if (inputs[20] < -0.17853628) {
                if (inputs[25] < 2.9921925) {
                    if (inputs[1] < 63.736034) {
                        var185 = 0.000039754166;
                    } else {
                        var185 = -0.021580802;
                    }
                } else {
                    if (inputs[20] < -1.1184866) {
                        var185 = 0.027722238;
                    } else {
                        var185 = -0.0041568517;
                    }
                }
            } else {
                if (inputs[25] < 3.0357554) {
                    if (inputs[20] < 0.106602594) {
                        var185 = 0.031043792;
                    } else {
                        var185 = 0.008673438;
                    }
                } else {
                    var185 = -0.0016110099;
                }
            }
        } else {
            var185 = -0.01570939;
        }
    }
    double var186;
    if (inputs[2] < 0.9892857) {
        var186 = -0.014999472;
    } else {
        if (inputs[13] < 1779.85) {
            if (inputs[13] < 1731.27) {
                if (inputs[20] < -0.45424098) {
                    var186 = 0.023445785;
                } else {
                    if (inputs[25] < 2.490501) {
                        var186 = 0.0028106777;
                    } else {
                        var186 = -0.020512378;
                    }
                }
            } else {
                var186 = -0.021553874;
            }
        } else {
            if (inputs[24] < 23.498146) {
                if (inputs[16] < 0.15609023) {
                    if (inputs[15] < -0.5891515) {
                        var186 = 0.02170712;
                    } else {
                        var186 = 0.0047981255;
                    }
                } else {
                    if (inputs[24] < 15.2785225) {
                        var186 = 0.0033291809;
                    } else {
                        var186 = -0.02701122;
                    }
                }
            } else {
                var186 = 0.02115256;
            }
        }
    }
    double var187;
    if (inputs[14] < 0.813) {
        if (inputs[4] < 1930.55) {
            if (inputs[21] < -3.7546778) {
                var187 = 0.015965432;
            } else {
                if (inputs[18] < 1.928612) {
                    if (inputs[14] < -0.733) {
                        var187 = -0.018522657;
                    } else {
                        var187 = -0.0027050509;
                    }
                } else {
                    if (inputs[5] < 1837.4675) {
                        var187 = 0.015421384;
                    } else {
                        var187 = -0.0041252896;
                    }
                }
            }
        } else {
            if (inputs[23] < 10.910757) {
                var187 = 0.021852687;
            } else {
                var187 = 0.0020579107;
            }
        }
    } else {
        if (inputs[3] < 1830.71) {
            if (inputs[3] < 1727.94) {
                var187 = 0.016462201;
            } else {
                var187 = -0.0072549623;
            }
        } else {
            var187 = 0.022078756;
        }
    }
    double var188;
    if (inputs[18] < 3.5044434) {
        if (inputs[11] < 0.21) {
            var188 = 0.017982438;
        } else {
            if (inputs[6] < 1939.405) {
                if (inputs[18] < 1.0505737) {
                    var188 = 0.017600846;
                } else {
                    if (inputs[20] < 1.6006042) {
                        var188 = -0.0053705727;
                    } else {
                        var188 = 0.014755703;
                    }
                }
            } else {
                var188 = 0.01975266;
            }
        }
    } else {
        var188 = -0.016579269;
    }
    double var189;
    if (inputs[23] < -29.161388) {
        if (inputs[2] < 1.5992857) {
            if (inputs[25] < 3.3075356) {
                if (inputs[9] < 4.725) {
                    var189 = 0.013513139;
                } else {
                    var189 = 0.037916176;
                }
            } else {
                var189 = 0.003692909;
            }
        } else {
            var189 = -0.009298792;
        }
    } else {
        if (inputs[5] < 1761.0675) {
            if (inputs[19] < 1.974569) {
                var189 = -0.026019065;
            } else {
                var189 = -0.008382751;
            }
        } else {
            if (inputs[8] < 1973.41) {
                if (inputs[20] < -1.1626294) {
                    var189 = -0.0118608475;
                } else {
                    if (inputs[10] < 0.465) {
                        var189 = 0.022914944;
                    } else {
                        var189 = 0.00042293468;
                    }
                }
            } else {
                var189 = -0.021190051;
            }
        }
    }
    double var190;
    if (inputs[10] < 1.16) {
        if (inputs[2] < 1.2635714) {
            var190 = -0.008457428;
        } else {
            if (inputs[19] < 1.3315202) {
                var190 = 0.03262555;
            } else {
                if (inputs[11] < 0.25) {
                    var190 = 0.02417603;
                } else {
                    if (inputs[18] < 1.8450803) {
                        var190 = -0.012049671;
                    } else {
                        var190 = 0.014426949;
                    }
                }
            }
        }
    } else {
        if (inputs[2] < 1.4407142) {
            if (inputs[24] < -18.783993) {
                var190 = 0.02134384;
            } else {
                if (inputs[11] < 0.4) {
                    var190 = -0.014951185;
                } else {
                    var190 = 0.012737168;
                }
            }
        } else {
            if (inputs[13] < 1779.85) {
                var190 = -0.03333799;
            } else {
                if (inputs[8] < 1942.43) {
                    if (inputs[2] < 2.3585715) {
                        var190 = -0.011134107;
                    } else {
                        var190 = 0.015288282;
                    }
                } else {
                    var190 = -0.027247442;
                }
            }
        }
    }
    double var191;
    if (inputs[18] < 3.397783) {
        if (inputs[8] < 1706.09) {
            if (inputs[10] < 1.2175) {
                var191 = 0.0030361803;
            } else {
                var191 = -0.020734705;
            }
        } else {
            if (inputs[4] < 1722.175) {
                var191 = 0.019085294;
            } else {
                if (inputs[19] < 1.3542114) {
                    if (inputs[10] < 1.74) {
                        var191 = 0.001263721;
                    } else {
                        var191 = -0.025841272;
                    }
                } else {
                    if (inputs[19] < 1.9347545) {
                        var191 = 0.011119928;
                    } else {
                        var191 = -0.007303865;
                    }
                }
            }
        }
    } else {
        var191 = -0.018432094;
    }
    double var192;
    if (inputs[18] < 1.1484094) {
        if (inputs[23] < -36.490715) {
            var192 = -0.004301611;
        } else {
            var192 = 0.014651471;
        }
    } else {
        if (inputs[21] < -3.593429) {
            var192 = 0.011132816;
        } else {
            if (inputs[4] < 1935.9) {
                if (inputs[16] < -0.16878195) {
                    if (inputs[9] < 5.95) {
                        var192 = -0.03192364;
                    } else {
                        var192 = -0.012058616;
                    }
                } else {
                    if (inputs[13] < 1909.43) {
                        var192 = -0.00058596145;
                    } else {
                        var192 = -0.023788776;
                    }
                }
            } else {
                if (inputs[6] < 1962.17) {
                    var192 = 0.018017229;
                } else {
                    var192 = -0.009138039;
                }
            }
        }
    }
    double var193;
    if (inputs[17] < 0.83912814) {
        var193 = -0.016329;
    } else {
        if (inputs[19] < 1.222446) {
            if (inputs[6] < 1766.785) {
                var193 = 0.026853228;
            } else {
                var193 = 0.000845882;
            }
        } else {
            if (inputs[1] < 69.5182) {
                if (inputs[21] < 2.3521504) {
                    if (inputs[11] < 0.41) {
                        var193 = 0.0035964674;
                    } else {
                        var193 = -0.019962417;
                    }
                } else {
                    var193 = 0.017730182;
                }
            } else {
                if (inputs[4] < 1819.245) {
                    var193 = -0.028201256;
                } else {
                    var193 = 0.0020636325;
                }
            }
        }
    }
    double var194;
    if (inputs[11] < 0.16) {
        var194 = 0.019942477;
    } else {
        if (inputs[17] < 1.037709) {
            if (inputs[19] < 1.2721828) {
                var194 = -0.010623009;
            } else {
                if (inputs[23] < -16.327755) {
                    var194 = 0.0047929655;
                } else {
                    var194 = 0.025736256;
                }
            }
        } else {
            if (inputs[25] < 3.964557) {
                if (inputs[15] < 0.45345455) {
                    if (inputs[21] < -2.872818) {
                        var194 = -0.017489826;
                    } else {
                        var194 = 0.00025056725;
                    }
                } else {
                    if (inputs[15] < 0.6229697) {
                        var194 = -0.027364114;
                    } else {
                        var194 = -0.006205761;
                    }
                }
            } else {
                var194 = 0.01733179;
            }
        }
    }
    double var195;
    if (inputs[17] < 2.5874202) {
        if (inputs[9] < 1.41) {
            var195 = -0.014002231;
        } else {
            if (inputs[13] < 1665.19) {
                var195 = 0.01600199;
            } else {
                if (inputs[13] < 1716.21) {
                    var195 = -0.01692734;
                } else {
                    if (inputs[19] < 1.3652738) {
                        var195 = -0.0031823514;
                    } else {
                        var195 = 0.0066929865;
                    }
                }
            }
        }
    } else {
        var195 = -0.014377981;
    }
    double var196;
    if (inputs[19] < 2.144363) {
        if (inputs[11] < 0.45) {
            if (inputs[11] < 0.41) {
                if (inputs[15] < -0.44751516) {
                    var196 = 0.019408809;
                } else {
                    if (inputs[10] < 2.23) {
                        var196 = 0.0048491373;
                    } else {
                        var196 = -0.014987744;
                    }
                }
            } else {
                if (inputs[16] < 0.051766917) {
                    var196 = 0.024817437;
                } else {
                    var196 = 0.004797683;
                }
            }
        } else {
            var196 = -0.011802635;
        }
    } else {
        if (inputs[17] < 1.3030641) {
            var196 = -0.028234635;
        } else {
            if (inputs[10] < 1.9575) {
                var196 = -0.012558767;
            } else {
                if (inputs[18] < 3.397783) {
                    var196 = 0.01920462;
                } else {
                    var196 = -0.004676192;
                }
            }
        }
    }
    double var197;
    if (inputs[1] < 63.875416) {
        if (inputs[1] < 61.282856) {
            if (inputs[15] < -0.26) {
                if (inputs[21] < -3.7546778) {
                    var197 = 0.022268547;
                } else {
                    if (inputs[16] < -0.17421053) {
                        var197 = -0.00968224;
                    } else {
                        var197 = 0.01035581;
                    }
                }
            } else {
                if (inputs[8] < 1821.29) {
                    var197 = -0.024290131;
                } else {
                    var197 = -0.005187118;
                }
            }
        } else {
            var197 = 0.022903629;
        }
    } else {
        if (inputs[21] < 2.3521504) {
            var197 = -0.030387392;
        } else {
            if (inputs[20] < -0.4953674) {
                if (inputs[17] < 1.335979) {
                    var197 = -0.008791037;
                } else {
                    var197 = 0.024043987;
                }
            } else {
                if (inputs[1] < 69.5182) {
                    var197 = 0.0034789173;
                } else {
                    var197 = -0.023297025;
                }
            }
        }
    }
    double var198;
    if (inputs[16] < 0.051766917) {
        if (inputs[25] < 3.3829618) {
            if (inputs[13] < 1731.27) {
                var198 = 0.021739235;
            } else {
                if (inputs[23] < -20.647436) {
                    var198 = -0.010492337;
                } else {
                    if (inputs[9] < 4.955) {
                        var198 = 0.01988679;
                    } else {
                        var198 = 0.0007333103;
                    }
                }
            }
        } else {
            if (inputs[4] < 1820.875) {
                var198 = -0.017166134;
            } else {
                var198 = 0.010156339;
            }
        }
    } else {
        if (inputs[21] < 2.805) {
            if (inputs[9] < 2.93) {
                var198 = 0.0030225334;
            } else {
                if (inputs[16] < 0.19354135) {
                    var198 = -0.040195223;
                } else {
                    var198 = -0.012429981;
                }
            }
        } else {
            if (inputs[25] < 3.689655) {
                if (inputs[18] < 1.4647648) {
                    var198 = -0.0019022814;
                } else {
                    var198 = 0.021362783;
                }
            } else {
                var198 = -0.007318683;
            }
        }
    }
    double var199;
    if (inputs[16] < -0.16803007) {
        if (inputs[19] < 1.6515522) {
            var199 = -0.023831319;
        } else {
            if (inputs[9] < 7.365) {
                var199 = 0.00822399;
            } else {
                var199 = -0.020520236;
            }
        }
    } else {
        if (inputs[2] < 1.8114285) {
            if (inputs[25] < 2.2597165) {
                var199 = 0.024407683;
            } else {
                if (inputs[25] < 3.964557) {
                    if (inputs[20] < -0.9729088) {
                        var199 = 0.011714716;
                    } else {
                        var199 = -0.005159203;
                    }
                } else {
                    var199 = 0.023889786;
                }
            }
        } else {
            if (inputs[17] < 2.0010457) {
                if (inputs[19] < 1.8107111) {
                    var199 = -0.029650323;
                } else {
                    var199 = -0.0063903327;
                }
            } else {
                var199 = 0.014164893;
            }
        }
    }
    double var200;
    if (inputs[21] < 2.2659361) {
        if (inputs[19] < 1.1290221) {
            var200 = 0.024605813;
        } else {
            if (inputs[19] < 1.3652738) {
                if (inputs[16] < -0.122894734) {
                    var200 = -0.02345578;
                } else {
                    var200 = 0.00706141;
                }
            } else {
                if (inputs[19] < 1.4670558) {
                    var200 = 0.024075083;
                } else {
                    if (inputs[18] < 2.8816252) {
                        var200 = 0.00081848516;
                    } else {
                        var200 = 0.019791739;
                    }
                }
            }
        }
    } else {
        if (inputs[23] < -2.358174) {
            if (inputs[21] < 2.9065473) {
                var200 = -0.0126000745;
            } else {
                if (inputs[20] < -0.4081105) {
                    var200 = 0.02684557;
                } else {
                    var200 = -0.0014350682;
                }
            }
        } else {
            if (inputs[16] < 0.18491729) {
                var200 = -0.031172985;
            } else {
                var200 = -0.002993969;
            }
        }
    }
    double var201;
    if (inputs[13] < 1963.6) {
        if (inputs[15] < 0.3798788) {
            if (inputs[15] < 0.30430302) {
                if (inputs[20] < -1.0853318) {
                    var201 = 0.017627856;
                } else {
                    if (inputs[13] < 1917.19) {
                        var201 = -0.0072995503;
                    } else {
                        var201 = 0.016923398;
                    }
                }
            } else {
                var201 = -0.022196626;
            }
        } else {
            if (inputs[19] < 2.7001708) {
                if (inputs[11] < 0.33) {
                    var201 = -0.014150205;
                } else {
                    var201 = 0.011849347;
                }
            } else {
                var201 = 0.022573847;
            }
        }
    } else {
        var201 = -0.014607281;
    }
    double var202;
    if (inputs[2] < 0.96428573) {
        var202 = 0.019807318;
    } else {
        if (inputs[17] < 0.9174443) {
            var202 = 0.017060425;
        } else {
            if (inputs[2] < 1.0985714) {
                var202 = -0.023241553;
            } else {
                if (inputs[13] < 1725.03) {
                    if (inputs[14] < -0.733) {
                        var202 = -0.006596685;
                    } else {
                        var202 = 0.020731421;
                    }
                } else {
                    if (inputs[13] < 1779.85) {
                        var202 = -0.028913;
                    } else {
                        var202 = 0.0012527556;
                    }
                }
            }
        }
    }
    double var203;
    if (inputs[24] < 18.969734) {
        if (inputs[23] < 20.818884) {
            if (inputs[24] < 16.068623) {
                if (inputs[16] < -0.16803007) {
                    if (inputs[15] < -0.31478786) {
                        var203 = 0.000003173517;
                    } else {
                        var203 = -0.025890602;
                    }
                } else {
                    if (inputs[16] < -0.12616542) {
                        var203 = 0.023229064;
                    } else {
                        var203 = 0.0037082266;
                    }
                }
            } else {
                var203 = -0.021947626;
            }
        } else {
            var203 = -0.026840398;
        }
    } else {
        if (inputs[1] < 69.681725) {
            var203 = 0.021058278;
        } else {
            if (inputs[23] < -29.161388) {
                var203 = 0.016760288;
            } else {
                var203 = -0.010238823;
            }
        }
    }
    double var204;
    if (inputs[1] < 26.495476) {
        var204 = 0.012602529;
    } else {
        if (inputs[1] < 31.216616) {
            if (inputs[21] < -2.9766355) {
                var204 = -0.026832463;
            } else {
                var204 = -0.004742555;
            }
        } else {
            if (inputs[14] < -0.906) {
                var204 = 0.017582428;
            } else {
                if (inputs[15] < 0.36454546) {
                    if (inputs[11] < 0.36) {
                        var204 = -0.01747509;
                    } else {
                        var204 = 0.0033278305;
                    }
                } else {
                    if (inputs[23] < -23.777779) {
                        var204 = 0.017417224;
                    } else {
                        var204 = -0.0000009567041;
                    }
                }
            }
        }
    }
    double var205;
    if (inputs[2] < 1.6985714) {
        if (inputs[25] < 3.3016887) {
            if (inputs[11] < 0.44) {
                if (inputs[25] < 2.6388013) {
                    var205 = 0.021323739;
                } else {
                    if (inputs[18] < 1.2731335) {
                        var205 = 0.018227512;
                    } else {
                        var205 = -0.0049883425;
                    }
                }
            } else {
                var205 = -0.0047408445;
            }
        } else {
            if (inputs[25] < 3.964557) {
                if (inputs[10] < 1.1225) {
                    var205 = -0.006105517;
                } else {
                    var205 = -0.035276007;
                }
            } else {
                var205 = 0.014658499;
            }
        }
    } else {
        if (inputs[19] < 1.6991948) {
            var205 = -0.020610351;
        } else {
            if (inputs[19] < 2.144363) {
                var205 = 0.011106334;
            } else {
                if (inputs[19] < 3.0992258) {
                    var205 = -0.018619398;
                } else {
                    if (inputs[15] < -0.25133333) {
                        var205 = 0.012260439;
                    } else {
                        var205 = -0.00387091;
                    }
                }
            }
        }
    }
    double var206;
    if (inputs[16] < 0.2694436) {
        if (inputs[24] < -20.653982) {
            if (inputs[19] < 2.0921564) {
                var206 = 0.016688736;
            } else {
                var206 = -0.0009018622;
            }
        } else {
            if (inputs[16] < 0.19440602) {
                if (inputs[17] < 0.90888065) {
                    var206 = -0.02416886;
                } else {
                    if (inputs[23] < -32.103245) {
                        var206 = 0.006900548;
                    } else {
                        var206 = -0.0073370025;
                    }
                }
            } else {
                var206 = -0.024477398;
            }
        }
    } else {
        if (inputs[5] < 1837.4675) {
            var206 = 0.02420812;
        } else {
            var206 = 0.005629128;
        }
    }
    double var207;
    if (inputs[17] < 2.5874202) {
        if (inputs[2] < 2.67) {
            if (inputs[2] < 2.0564287) {
                if (inputs[9] < 6.4875) {
                    if (inputs[17] < 1.2178605) {
                        var207 = 0.011031196;
                    } else {
                        var207 = -0.0005520299;
                    }
                } else {
                    var207 = -0.011548699;
                }
            } else {
                var207 = -0.0131883295;
            }
        } else {
            if (inputs[6] < 1908.58) {
                var207 = 0.035003424;
            } else {
                var207 = -0.00007320459;
            }
        }
    } else {
        var207 = -0.014390982;
    }
    double var208;
    if (inputs[2] < 3.0985715) {
        if (inputs[1] < 26.495476) {
            var208 = 0.01647943;
        } else {
            if (inputs[2] < 1.2657143) {
                if (inputs[1] < 73.44284) {
                    if (inputs[23] < -42.158447) {
                        var208 = -0.0018594282;
                    } else {
                        var208 = -0.023440877;
                    }
                } else {
                    var208 = 0.011996628;
                }
            } else {
                if (inputs[2] < 1.3721429) {
                    var208 = 0.020086387;
                } else {
                    if (inputs[23] < 0.3177864) {
                        var208 = 0.005261036;
                    } else {
                        var208 = -0.014023186;
                    }
                }
            }
        }
    } else {
        var208 = -0.020335566;
    }
    double var209;
    if (inputs[25] < 1.6261823) {
        var209 = 0.014323769;
    } else {
        if (inputs[18] < 1.0147359) {
            var209 = 0.013456013;
        } else {
            if (inputs[25] < 4.034082) {
                if (inputs[14] < 1.16) {
                    if (inputs[9] < 2.985) {
                        var209 = 0.0015836342;
                    } else {
                        var209 = -0.012424651;
                    }
                } else {
                    var209 = 0.011730567;
                }
            } else {
                var209 = 0.014011989;
            }
        }
    }
    double var210;
    if (inputs[16] < -0.30206767) {
        var210 = -0.013656336;
    } else {
        if (inputs[20] < 0.4305812) {
            if (inputs[20] < -0.005653874) {
                if (inputs[16] < 0.16592482) {
                    if (inputs[24] < -13.781551) {
                        var210 = 0.009025604;
                    } else {
                        var210 = -0.009673436;
                    }
                } else {
                    if (inputs[19] < 2.0771122) {
                        var210 = 0.028259503;
                    } else {
                        var210 = -0.005775071;
                    }
                }
            } else {
                var210 = -0.022529526;
            }
        } else {
            if (inputs[8] < 1791.47) {
                var210 = -0.002501238;
            } else {
                if (inputs[19] < 1.4212687) {
                    var210 = 0.0007746998;
                } else {
                    if (inputs[2] < 1.8407143) {
                        var210 = 0.03540335;
                    } else {
                        var210 = 0.015201286;
                    }
                }
            }
        }
    }
    double var211;
    if (inputs[14] < -0.685) {
        if (inputs[20] < -0.27667353) {
            var211 = 0.020809617;
        } else {
            if (inputs[1] < 32.738472) {
                if (inputs[21] < -2.8556485) {
                    var211 = 0.004330121;
                } else {
                    var211 = -0.022056747;
                }
            } else {
                var211 = 0.013823911;
            }
        }
    } else {
        if (inputs[21] < 2.334938) {
            if (inputs[24] < 12.70107) {
                if (inputs[2] < 1.4471428) {
                    var211 = -0.025581704;
                } else {
                    if (inputs[2] < 2.1121428) {
                        var211 = 0.016386652;
                    } else {
                        var211 = -0.0069141425;
                    }
                }
            } else {
                var211 = -0.027122179;
            }
        } else {
            if (inputs[20] < 0.11182756) {
                if (inputs[15] < 0.4121212) {
                    if (inputs[18] < 1.2347971) {
                        var211 = 0.007885135;
                    } else {
                        var211 = 0.030541908;
                    }
                } else {
                    var211 = -0.0021491018;
                }
            } else {
                var211 = -0.0067375787;
            }
        }
    }
    double var212;
    if (inputs[13] < 1935.06) {
        if (inputs[12] < 1898.44) {
            if (inputs[11] < 0.2) {
                var212 = 0.019697176;
            } else {
                if (inputs[15] < -0.55) {
                    var212 = -0.023144096;
                } else {
                    if (inputs[15] < -0.26) {
                        var212 = 0.010193048;
                    } else {
                        var212 = -0.005311174;
                    }
                }
            }
        } else {
            var212 = -0.018131776;
        }
    } else {
        if (inputs[23] < 10.910757) {
            var212 = 0.024974655;
        } else {
            var212 = -0.004320479;
        }
    }
    double var213;
    if (inputs[15] < -0.6484848) {
        var213 = 0.017994143;
    } else {
        if (inputs[18] < 2.2016084) {
            if (inputs[15] < 0.49248484) {
                if (inputs[23] < -18.51324) {
                    if (inputs[14] < 0.636) {
                        var213 = -0.00026248966;
                    } else {
                        var213 = 0.013877418;
                    }
                } else {
                    if (inputs[20] < -0.27097872) {
                        var213 = -0.018186565;
                    } else {
                        var213 = 0.0018186934;
                    }
                }
            } else {
                var213 = 0.017882053;
            }
        } else {
            var213 = -0.013585233;
        }
    }
    double var214;
    if (inputs[15] < 0.39478788) {
        if (inputs[15] < 0.30430302) {
            if (inputs[15] < 0.21018182) {
                if (inputs[21] < -1.6590085) {
                    if (inputs[2] < 2.67) {
                        var214 = -0.0022365162;
                    } else {
                        var214 = 0.015587722;
                    }
                } else {
                    var214 = -0.0215418;
                }
            } else {
                var214 = 0.017210992;
            }
        } else {
            var214 = -0.023488972;
        }
    } else {
        if (inputs[20] < 0.3660248) {
            if (inputs[11] < 0.28) {
                var214 = -0.021582374;
            } else {
                if (inputs[24] < 18.969734) {
                    var214 = 0.0014649875;
                } else {
                    var214 = 0.019519528;
                }
            }
        } else {
            var214 = 0.026658852;
        }
    }
    double var215;
    if (inputs[18] < 1.0707176) {
        var215 = -0.015966991;
    } else {
        if (inputs[9] < 1.41) {
            var215 = -0.019213963;
        } else {
            if (inputs[24] < -25.921698) {
                var215 = -0.015706735;
            } else {
                if (inputs[13] < 1674.35) {
                    var215 = 0.017988369;
                } else {
                    if (inputs[19] < 2.0286694) {
                        var215 = 0.0037728173;
                    } else {
                        var215 = -0.006301223;
                    }
                }
            }
        }
    }
    double var216;
    if (inputs[14] < 1.198) {
        if (inputs[17] < 2.102351) {
            if (inputs[16] < -0.19412781) {
                if (inputs[13] < 1804.33) {
                    var216 = -0.0044606975;
                } else {
                    var216 = 0.021301957;
                }
            } else {
                if (inputs[24] < -9.991037) {
                    if (inputs[24] < -19.664974) {
                        var216 = 0.0015964303;
                    } else {
                        var216 = -0.030907486;
                    }
                } else {
                    if (inputs[25] < 1.9651604) {
                        var216 = 0.015108917;
                    } else {
                        var216 = -0.0039866427;
                    }
                }
            }
        } else {
            var216 = -0.017959394;
        }
    } else {
        var216 = 0.01610847;
    }
    double var217;
    if (inputs[6] < 1870.87) {
        if (inputs[4] < 1832.945) {
            if (inputs[25] < 3.3337195) {
                if (inputs[23] < -6.3145747) {
                    if (inputs[6] < 1762.775) {
                        var217 = 0.00195603;
                    } else {
                        var217 = 0.026933292;
                    }
                } else {
                    if (inputs[19] < 1.6401807) {
                        var217 = -0.019057212;
                    } else {
                        var217 = 0.0032424058;
                    }
                }
            } else {
                if (inputs[25] < 3.7687862) {
                    var217 = -0.033189178;
                } else {
                    var217 = -0.00091773283;
                }
            }
        } else {
            var217 = -0.019278856;
        }
    } else {
        if (inputs[5] < 1913.09) {
            var217 = 0.022708025;
        } else {
            if (inputs[10] < 0.9575) {
                var217 = 0.012800638;
            } else {
                if (inputs[25] < 2.4213746) {
                    var217 = -0.0021928926;
                } else {
                    var217 = -0.020192696;
                }
            }
        }
    }
    double var218;
    if (inputs[2] < 3.335) {
        if (inputs[13] < 1953.42) {
            if (inputs[16] < 0.03968421) {
                if (inputs[14] < -0.57) {
                    if (inputs[14] < -0.685) {
                        var218 = 0.0029012654;
                    } else {
                        var218 = -0.019935252;
                    }
                } else {
                    if (inputs[23] < -19.498507) {
                        var218 = 0.027004587;
                    } else {
                        var218 = 0.011355923;
                    }
                }
            } else {
                if (inputs[25] < 2.7594762) {
                    if (inputs[23] < -13.575977) {
                        var218 = -0.03324051;
                    } else {
                        var218 = -0.00008573508;
                    }
                } else {
                    if (inputs[20] < -0.9396294) {
                        var218 = 0.022292593;
                    } else {
                        var218 = -0.0060681696;
                    }
                }
            }
        } else {
            var218 = -0.017654333;
        }
    } else {
        var218 = 0.01697942;
    }
    double var219;
    if (inputs[21] < 3.8316658) {
        if (inputs[11] < 0.21) {
            if (inputs[25] < 2.8216243) {
                var219 = -0.0016419904;
            } else {
                var219 = 0.0286891;
            }
        } else {
            if (inputs[11] < 0.29) {
                if (inputs[19] < 2.2892873) {
                    var219 = 0.004454495;
                } else {
                    var219 = -0.026570356;
                }
            } else {
                if (inputs[18] < 1.928612) {
                    if (inputs[21] < 3.1700976) {
                        var219 = 0.0023977368;
                    } else {
                        var219 = -0.015874786;
                    }
                } else {
                    var219 = 0.017950289;
                }
            }
        }
    } else {
        var219 = -0.01551385;
    }
    double var220;
    if (inputs[17] < 1.2208292) {
        if (inputs[24] < -13.781551) {
            var220 = 0.023510762;
        } else {
            if (inputs[5] < 1813.98) {
                if (inputs[17] < 0.9873723) {
                    var220 = -0.004304187;
                } else {
                    var220 = -0.026255999;
                }
            } else {
                if (inputs[14] < 0.569) {
                    var220 = -0.0020342907;
                } else {
                    var220 = 0.02100466;
                }
            }
        }
    } else {
        if (inputs[10] < 4.3425) {
            if (inputs[6] < 1931.85) {
                if (inputs[19] < 1.222446) {
                    var220 = 0.008165124;
                } else {
                    if (inputs[20] < -0.22793856) {
                        var220 = -0.0036403835;
                    } else {
                        var220 = -0.02281179;
                    }
                }
            } else {
                var220 = 0.0076497463;
            }
        } else {
            var220 = 0.011240434;
        }
    }
    double var221;
    if (inputs[18] < 1.1294512) {
        if (inputs[18] < 0.9965987) {
            var221 = -0.00014300674;
        } else {
            var221 = 0.018252602;
        }
    } else {
        if (inputs[19] < 1.3897288) {
            if (inputs[3] < 1727.94) {
                var221 = 0.008318871;
            } else {
                if (inputs[16] < -0.0798797) {
                    var221 = -0.0003452437;
                } else {
                    var221 = -0.027786756;
                }
            }
        } else {
            if (inputs[2] < 1.4407142) {
                if (inputs[2] < 1.2164285) {
                    var221 = -0.0029543005;
                } else {
                    var221 = 0.017773172;
                }
            } else {
                if (inputs[19] < 1.6359477) {
                    var221 = -0.023872742;
                } else {
                    if (inputs[16] < -0.32465413) {
                        var221 = -0.018901912;
                    } else {
                        var221 = 0.00333298;
                    }
                }
            }
        }
    }
    double var222;
    if (inputs[15] < -0.3987879) {
        if (inputs[20] < 0.76225996) {
            if (inputs[20] < -0.8543823) {
                var222 = 0.00047315483;
            } else {
                var222 = -0.027189683;
            }
        } else {
            if (inputs[10] < 2.4975) {
                var222 = 0.01657801;
            } else {
                var222 = -0.0019485836;
            }
        }
    } else {
        if (inputs[15] < -0.2869091) {
            var222 = 0.01683861;
        } else {
            if (inputs[14] < 0.452) {
                if (inputs[11] < 0.37) {
                    var222 = -0.024776775;
                } else {
                    var222 = 0.006436531;
                }
            } else {
                if (inputs[16] < 0.11279699) {
                    if (inputs[2] < 1.305) {
                        var222 = 0.021486463;
                    } else {
                        var222 = 0.0063776392;
                    }
                } else {
                    if (inputs[2] < 1.2535714) {
                        var222 = -0.014968336;
                    } else {
                        var222 = 0.0048801955;
                    }
                }
            }
        }
    }
    double var223;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < 0.19874436) {
            if (inputs[20] < -1.2484047) {
                if (inputs[15] < 0.27042425) {
                    var223 = 0.003331161;
                } else {
                    var223 = -0.026821537;
                }
            } else {
                if (inputs[9] < 5.0) {
                    if (inputs[10] < 1.575) {
                        var223 = 0.0033301641;
                    } else {
                        var223 = 0.021979135;
                    }
                } else {
                    if (inputs[18] < 1.3881196) {
                        var223 = -0.019045658;
                    } else {
                        var223 = 0.00015036229;
                    }
                }
            }
        } else {
            var223 = -0.016750222;
        }
    } else {
        if (inputs[3] < 1847.285) {
            var223 = 0.022120107;
        } else {
            var223 = 0.00036665512;
        }
    }
    double var224;
    if (inputs[10] < 0.63) {
        if (inputs[15] < -0.3961212) {
            var224 = -0.02475423;
        } else {
            if (inputs[16] < 0.14719549) {
                if (inputs[10] < 0.3275) {
                    var224 = -0.0040238216;
                } else {
                    var224 = 0.014497803;
                }
            } else {
                var224 = -0.019282132;
            }
        }
    } else {
        if (inputs[20] < -0.24402282) {
            if (inputs[18] < 1.8878146) {
                if (inputs[18] < 1.2328702) {
                    var224 = 0.0004602224;
                } else {
                    if (inputs[10] < 2.0625) {
                        var224 = 0.009454902;
                    } else {
                        var224 = 0.035264175;
                    }
                }
            } else {
                var224 = -0.0033709614;
            }
        } else {
            if (inputs[10] < 3.925) {
                if (inputs[11] < 0.34) {
                    if (inputs[20] < 0.5199615) {
                        var224 = -0.005920063;
                    } else {
                        var224 = -0.03432105;
                    }
                } else {
                    if (inputs[19] < 1.3578346) {
                        var224 = -0.009791215;
                    } else {
                        var224 = 0.020359743;
                    }
                }
            } else {
                var224 = 0.012595411;
            }
        }
    }
    double var225;
    if (inputs[23] < -50.30599) {
        if (inputs[21] < -2.8088937) {
            var225 = -0.00035940242;
        } else {
            var225 = 0.020171642;
        }
    } else {
        if (inputs[17] < 0.87206423) {
            var225 = -0.019972472;
        } else {
            if (inputs[20] < 0.28234375) {
                if (inputs[21] < -2.6912065) {
                    var225 = -0.012456129;
                } else {
                    if (inputs[14] < -0.774) {
                        var225 = 0.026510397;
                    } else {
                        var225 = 0.0031811579;
                    }
                }
            } else {
                if (inputs[17] < 1.1634259) {
                    var225 = 0.009520323;
                } else {
                    if (inputs[2] < 2.4271429) {
                        var225 = -0.019352166;
                    } else {
                        var225 = 0.001223566;
                    }
                }
            }
        }
    }
    double var226;
    if (inputs[25] < 1.6705577) {
        var226 = -0.021272862;
    } else {
        if (inputs[15] < 0.5938788) {
            if (inputs[10] < 5.0575) {
                if (inputs[18] < 1.1976143) {
                    if (inputs[19] < 1.4670558) {
                        var226 = 0.0050972356;
                    } else {
                        var226 = -0.028204234;
                    }
                } else {
                    if (inputs[20] < 1.4213508) {
                        var226 = 0.003314787;
                    } else {
                        var226 = 0.024488164;
                    }
                }
            } else {
                var226 = 0.021613743;
            }
        } else {
            var226 = -0.015862465;
        }
    }
    double var227;
    if (inputs[17] < 1.535552) {
        if (inputs[19] < 1.8369683) {
            if (inputs[20] < 1.3536164) {
                if (inputs[9] < 5.63) {
                    if (inputs[10] < 1.1375) {
                        var227 = 0.0023644199;
                    } else {
                        var227 = 0.017138764;
                    }
                } else {
                    var227 = -0.015458296;
                }
            } else {
                var227 = -0.022130769;
            }
        } else {
            if (inputs[19] < 2.2633247) {
                var227 = 0.024173692;
            } else {
                var227 = 0.0042460402;
            }
        }
    } else {
        if (inputs[19] < 1.4617916) {
            var227 = -0.021519842;
        } else {
            if (inputs[16] < -0.19068421) {
                var227 = -0.013268075;
            } else {
                if (inputs[9] < 7.915) {
                    if (inputs[10] < 0.95) {
                        var227 = 0.00896935;
                    } else {
                        var227 = -0.015442849;
                    }
                } else {
                    var227 = 0.023570124;
                }
            }
        }
    }
    double var228;
    if (inputs[10] < 1.16) {
        if (inputs[11] < 0.25) {
            var228 = 0.024904812;
        } else {
            if (inputs[20] < -1.120416) {
                var228 = -0.01541857;
            } else {
                if (inputs[10] < 0.8075) {
                    if (inputs[2] < 1.3978572) {
                        var228 = 0.01040415;
                    } else {
                        var228 = -0.009278092;
                    }
                } else {
                    var228 = 0.023888407;
                }
            }
        }
    } else {
        if (inputs[20] < -0.8732041) {
            if (inputs[21] < 2.497582) {
                var228 = -0.00647253;
            } else {
                var228 = 0.021012371;
            }
        } else {
            if (inputs[15] < -0.2869091) {
                if (inputs[15] < -0.3987879) {
                    if (inputs[25] < 2.7594762) {
                        var228 = -0.020185662;
                    } else {
                        var228 = 0.0020908727;
                    }
                } else {
                    var228 = 0.01968401;
                }
            } else {
                if (inputs[3] < 1727.315) {
                    var228 = 0.0019958264;
                } else {
                    if (inputs[13] < 1875.69) {
                        var228 = -0.039556284;
                    } else {
                        var228 = -0.0064185564;
                    }
                }
            }
        }
    }
    double var229;
    if (inputs[16] < -0.041323308) {
        if (inputs[1] < 34.17677) {
            if (inputs[17] < 1.8829083) {
                if (inputs[9] < 4.3075) {
                    var229 = -0.0069249035;
                } else {
                    if (inputs[9] < 5.695) {
                        var229 = 0.025410451;
                    } else {
                        var229 = 0.0051973374;
                    }
                }
            } else {
                var229 = -0.013766177;
            }
        } else {
            if (inputs[14] < -0.79) {
                var229 = 0.034833726;
            } else {
                var229 = 0.009229931;
            }
        }
    } else {
        if (inputs[17] < 1.0105919) {
            var229 = 0.012229517;
        } else {
            if (inputs[14] < 0.641) {
                var229 = -0.021605605;
            } else {
                if (inputs[2] < 2.4021428) {
                    if (inputs[13] < 1850.37) {
                        var229 = -0.010166162;
                    } else {
                        var229 = 0.006091556;
                    }
                } else {
                    var229 = 0.018539539;
                }
            }
        }
    }
    double var230;
    if (inputs[10] < 4.7325) {
        if (inputs[17] < 1.2208292) {
            if (inputs[19] < 2.0462637) {
                if (inputs[11] < 0.36) {
                    var230 = -0.012868455;
                } else {
                    if (inputs[23] < -23.777779) {
                        var230 = -0.00033365213;
                    } else {
                        var230 = 0.016653324;
                    }
                }
            } else {
                var230 = 0.023913939;
            }
        } else {
            if (inputs[23] < -35.493023) {
                var230 = -0.014484189;
            } else {
                if (inputs[23] < -24.184532) {
                    var230 = 0.014991026;
                } else {
                    if (inputs[24] < 17.166454) {
                        var230 = -0.000039211587;
                    } else {
                        var230 = -0.01753025;
                    }
                }
            }
        }
    } else {
        if (inputs[11] < 0.2) {
            var230 = 0.003827919;
        } else {
            var230 = 0.021183625;
        }
    }
    double var231;
    if (inputs[23] < -55.599304) {
        var231 = -0.015142349;
    } else {
        if (inputs[20] < 0.9026732) {
            if (inputs[18] < 1.1529632) {
                var231 = 0.018151699;
            } else {
                if (inputs[15] < -0.5891515) {
                    var231 = 0.018299202;
                } else {
                    if (inputs[14] < -0.869) {
                        var231 = -0.012575139;
                    } else {
                        var231 = 0.004226616;
                    }
                }
            }
        } else {
            if (inputs[16] < -0.028947368) {
                var231 = 0.00426019;
            } else {
                var231 = -0.019100737;
            }
        }
    }
    double var232;
    if (inputs[2] < 1.7892857) {
        if (inputs[5] < 1930.0225) {
            if (inputs[14] < 0.935) {
                if (inputs[2] < 1.01) {
                    var232 = 0.013521664;
                } else {
                    if (inputs[24] < -22.04852) {
                        var232 = 0.008214287;
                    } else {
                        var232 = -0.0123201255;
                    }
                }
            } else {
                var232 = 0.021005407;
            }
        } else {
            var232 = 0.021174638;
        }
    } else {
        if (inputs[17] < 1.3030641) {
            var232 = -0.02069218;
        } else {
            if (inputs[9] < 2.985) {
                var232 = 0.015754765;
            } else {
                if (inputs[9] < 7.065) {
                    var232 = -0.02374411;
                } else {
                    if (inputs[25] < 2.4191177) {
                        var232 = 0.015088123;
                    } else {
                        var232 = -0.007810527;
                    }
                }
            }
        }
    }
    double var233;
    if (inputs[17] < 0.87206423) {
        var233 = -0.016161539;
    } else {
        if (inputs[19] < 1.1154667) {
            var233 = 0.019685172;
        } else {
            if (inputs[19] < 1.4164727) {
                if (inputs[24] < 15.588893) {
                    if (inputs[16] < -0.077203006) {
                        var233 = -0.009184961;
                    } else {
                        var233 = -0.025311548;
                    }
                } else {
                    var233 = 0.012334983;
                }
            } else {
                if (inputs[1] < 73.153046) {
                    if (inputs[16] < 0.21254887) {
                        var233 = 0.0033702524;
                    } else {
                        var233 = 0.018620905;
                    }
                } else {
                    var233 = -0.009778659;
                }
            }
        }
    }
    double var234;
    if (inputs[18] < 1.2363172) {
        if (inputs[17] < 0.9764753) {
            var234 = -0.024315886;
        } else {
            if (inputs[23] < -18.51324) {
                var234 = 0.00378168;
            } else {
                var234 = -0.014649818;
            }
        }
    } else {
        if (inputs[14] < 0.993) {
            if (inputs[10] < 2.835) {
                if (inputs[21] < -2.872818) {
                    var234 = -0.015072614;
                } else {
                    if (inputs[25] < 1.9213322) {
                        var234 = -0.012212877;
                    } else {
                        var234 = 0.012836323;
                    }
                }
            } else {
                if (inputs[11] < 0.25) {
                    var234 = 0.004717044;
                } else {
                    var234 = 0.026866293;
                }
            }
        } else {
            if (inputs[11] < 0.31) {
                var234 = -0.019014148;
            } else {
                var234 = 0.006785279;
            }
        }
    }
    double var235;
    if (inputs[13] < 1820.89) {
        if (inputs[25] < 2.193455) {
            if (inputs[9] < 3.22) {
                var235 = 0.0021617974;
            } else {
                var235 = -0.016146973;
            }
        } else {
            if (inputs[2] < 1.5607142) {
                if (inputs[23] < -39.6866) {
                    var235 = 0.015759215;
                } else {
                    if (inputs[2] < 1.1535715) {
                        var235 = 0.010180611;
                    } else {
                        var235 = -0.0142444;
                    }
                }
            } else {
                if (inputs[23] < -18.384315) {
                    var235 = 0.010884286;
                } else {
                    var235 = 0.028275834;
                }
            }
        }
    } else {
        if (inputs[19] < 1.2678864) {
            var235 = -0.025961393;
        } else {
            if (inputs[2] < 1.7892857) {
                if (inputs[21] < 2.2659361) {
                    var235 = 0.019203782;
                } else {
                    var235 = -0.0022172502;
                }
            } else {
                if (inputs[19] < 2.9961197) {
                    if (inputs[19] < 2.0286694) {
                        var235 = -0.009858348;
                    } else {
                        var235 = -0.029932048;
                    }
                } else {
                    var235 = 0.0053633912;
                }
            }
        }
    }
    double var236;
    if (inputs[10] < 1.74) {
        if (inputs[20] < -0.27097872) {
            if (inputs[10] < 0.66) {
                var236 = -0.015644545;
            } else {
                if (inputs[25] < 2.525816) {
                    var236 = -0.0016192053;
                } else {
                    var236 = 0.011248613;
                }
            }
        } else {
            if (inputs[1] < 69.681725) {
                if (inputs[19] < 1.8428277) {
                    if (inputs[11] < 0.36) {
                        var236 = -0.01626929;
                    } else {
                        var236 = 0.017148316;
                    }
                } else {
                    var236 = 0.028121652;
                }
            } else {
                var236 = -0.010761009;
            }
        }
    } else {
        if (inputs[17] < 1.075472) {
            var236 = -0.024936425;
        } else {
            if (inputs[11] < 0.38) {
                if (inputs[19] < 1.7639654) {
                    var236 = -0.022504203;
                } else {
                    if (inputs[17] < 1.9122196) {
                        var236 = 0.010490643;
                    } else {
                        var236 = -0.010426451;
                    }
                }
            } else {
                var236 = 0.012314064;
            }
        }
    }
    double var237;
    if (inputs[15] < -0.5891515) {
        var237 = 0.010619364;
    } else {
        if (inputs[14] < -0.844) {
            if (inputs[20] < 0.5072141) {
                var237 = -0.02890419;
            } else {
                var237 = -0.0034399831;
            }
        } else {
            if (inputs[15] < -0.31369698) {
                if (inputs[14] < -0.653) {
                    var237 = 0.025795912;
                } else {
                    var237 = 0.0011351166;
                }
            } else {
                if (inputs[14] < 0.452) {
                    if (inputs[11] < 0.41) {
                        var237 = -0.0312061;
                    } else {
                        var237 = 0.0024355657;
                    }
                } else {
                    if (inputs[13] < 1852.78) {
                        var237 = -0.0027566121;
                    } else {
                        var237 = 0.010443731;
                    }
                }
            }
        }
    }
    double var238;
    if (inputs[23] < 10.910757) {
        if (inputs[1] < 30.82347) {
            if (inputs[10] < 2.1375) {
                var238 = 0.008324881;
            } else {
                var238 = -0.016319197;
            }
        } else {
            if (inputs[1] < 69.46455) {
                if (inputs[20] < -0.92651445) {
                    if (inputs[18] < 1.4082543) {
                        var238 = 0.010755137;
                    } else {
                        var238 = -0.016271094;
                    }
                } else {
                    if (inputs[18] < 2.0697653) {
                        var238 = 0.011258308;
                    } else {
                        var238 = 0.028901333;
                    }
                }
            } else {
                if (inputs[20] < -0.3115604) {
                    var238 = 0.0069826418;
                } else {
                    var238 = -0.017937144;
                }
            }
        }
    } else {
        var238 = -0.010297983;
    }
    double var239;
    if (inputs[10] < 0.575) {
        if (inputs[19] < 1.3315202) {
            var239 = 0.021772048;
        } else {
            if (inputs[17] < 1.394165) {
                var239 = -0.008627231;
            } else {
                var239 = 0.018935096;
            }
        }
    } else {
        if (inputs[21] < -3.593429) {
            var239 = 0.013607831;
        } else {
            if (inputs[11] < 0.3) {
                if (inputs[1] < 68.044624) {
                    if (inputs[21] < -1.9237132) {
                        var239 = -0.017607538;
                    } else {
                        var239 = 0.003250826;
                    }
                } else {
                    var239 = -0.029162472;
                }
            } else {
                if (inputs[16] < 0.18212782) {
                    if (inputs[20] < -1.2484047) {
                        var239 = -0.022351013;
                    } else {
                        var239 = 0.0008161162;
                    }
                } else {
                    var239 = 0.017005846;
                }
            }
        }
    }
    double var240;
    if (inputs[21] < -3.3781095) {
        var240 = -0.012359062;
    } else {
        if (inputs[21] < -3.0357554) {
            var240 = 0.019498501;
        } else {
            if (inputs[8] < 1860.04) {
                if (inputs[16] < -0.17063157) {
                    var240 = -0.013839778;
                } else {
                    if (inputs[15] < 0.41484848) {
                        var240 = 0.011523782;
                    } else {
                        var240 = -0.0034666841;
                    }
                }
            } else {
                if (inputs[17] < 1.3926234) {
                    if (inputs[5] < 1928.2574) {
                        var240 = -0.036970645;
                    } else {
                        var240 = -0.0025792003;
                    }
                } else {
                    if (inputs[10] < 2.1375) {
                        var240 = 0.015300414;
                    } else {
                        var240 = -0.0060535376;
                    }
                }
            }
        }
    }
    double var241;
    if (inputs[3] < 1662.8) {
        var241 = 0.015335574;
    } else {
        if (inputs[16] < -0.32465413) {
            var241 = -0.015549382;
        } else {
            if (inputs[19] < 1.3652738) {
                if (inputs[15] < -0.18448485) {
                    var241 = -0.020786582;
                } else {
                    if (inputs[8] < 1843.5) {
                        var241 = -0.0105071105;
                    } else {
                        var241 = 0.021800093;
                    }
                }
            } else {
                if (inputs[24] < -20.721348) {
                    var241 = 0.021891298;
                } else {
                    if (inputs[15] < -0.4021818) {
                        var241 = -0.01296315;
                    } else {
                        var241 = 0.0043323743;
                    }
                }
            }
        }
    }
    double var242;
    if (inputs[5] < 1754.47) {
        if (inputs[17] < 1.075472) {
            var242 = -0.024911998;
        } else {
            if (inputs[21] < -2.3628435) {
                var242 = 0.009359852;
            } else {
                if (inputs[14] < 0.832) {
                    var242 = -0.023210632;
                } else {
                    var242 = -0.00045703977;
                }
            }
        }
    } else {
        if (inputs[24] < -10.426248) {
            if (inputs[20] < 0.86715806) {
                if (inputs[20] < -0.11844581) {
                    var242 = -0.006274913;
                } else {
                    var242 = -0.022781665;
                }
            } else {
                var242 = 0.0063521704;
            }
        } else {
            if (inputs[10] < 2.1375) {
                if (inputs[15] < 0.41733333) {
                    if (inputs[20] < 0.4358175) {
                        var242 = 0.023549795;
                    } else {
                        var242 = 0.0044864514;
                    }
                } else {
                    var242 = -0.0033736466;
                }
            } else {
                if (inputs[15] < 0.39175758) {
                    var242 = -0.01713303;
                } else {
                    var242 = 0.0014565552;
                }
            }
        }
    }
    double var243;
    if (inputs[18] < 1.4627376) {
        if (inputs[21] < -3.210553) {
            var243 = 0.008402654;
        } else {
            if (inputs[14] < 0.589) {
                if (inputs[11] < 0.39) {
                    var243 = -0.032942396;
                } else {
                    var243 = -0.00907624;
                }
            } else {
                if (inputs[11] < 0.4) {
                    var243 = -0.008208798;
                } else {
                    var243 = 0.010527922;
                }
            }
        }
    } else {
        if (inputs[10] < 1.16) {
            if (inputs[11] < 0.27) {
                var243 = 0.030177021;
            } else {
                if (inputs[18] < 1.9109424) {
                    var243 = -0.004484184;
                } else {
                    var243 = 0.020683333;
                }
            }
        } else {
            if (inputs[25] < 2.7594762) {
                if (inputs[14] < -0.906) {
                    var243 = 0.0021242986;
                } else {
                    var243 = -0.017857807;
                }
            } else {
                if (inputs[17] < 1.5036888) {
                    var243 = 0.02046934;
                } else {
                    var243 = -0.00592408;
                }
            }
        }
    }
    double var244;
    if (inputs[23] < 20.818884) {
        if (inputs[19] < 1.1199208) {
            var244 = 0.014295773;
        } else {
            if (inputs[20] < -0.5177981) {
                if (inputs[21] < 2.5301204) {
                    if (inputs[11] < 0.31) {
                        var244 = -0.0008862019;
                    } else {
                        var244 = -0.02811578;
                    }
                } else {
                    var244 = 0.006116108;
                }
            } else {
                if (inputs[2] < 2.67) {
                    if (inputs[2] < 2.0564287) {
                        var244 = 0.0025854004;
                    } else {
                        var244 = -0.021507017;
                    }
                } else {
                    var244 = 0.013442168;
                }
            }
        }
    } else {
        var244 = -0.020644918;
    }
    double var245;
    if (inputs[10] < 2.1375) {
        if (inputs[10] < 1.8475) {
            if (inputs[18] < 1.8571904) {
                if (inputs[10] < 1.43) {
                    if (inputs[10] < 0.9675) {
                        var245 = 0.0025308582;
                    } else {
                        var245 = -0.024911549;
                    }
                } else {
                    var245 = 0.013086758;
                }
            } else {
                if (inputs[10] < 0.95) {
                    var245 = 0.024582973;
                } else {
                    var245 = 0.003547032;
                }
            }
        } else {
            var245 = 0.027670309;
        }
    } else {
        if (inputs[20] < -1.1184866) {
            var245 = 0.012686679;
        } else {
            if (inputs[16] < -0.23129323) {
                var245 = 0.007316093;
            } else {
                if (inputs[16] < 0.13461654) {
                    var245 = -0.023287361;
                } else {
                    var245 = -0.005113697;
                }
            }
        }
    }
    double var246;
    if (inputs[24] < -20.653982) {
        if (inputs[20] < 0.6413026) {
            var246 = 0.02260231;
        } else {
            var246 = -0.005095276;
        }
    } else {
        if (inputs[23] < -32.626118) {
            if (inputs[13] < 1820.89) {
                if (inputs[11] < 0.36) {
                    var246 = -0.0048941965;
                } else {
                    var246 = 0.02350149;
                }
            } else {
                var246 = -0.0095857605;
            }
        } else {
            if (inputs[24] < -8.892423) {
                if (inputs[21] < -2.3657753) {
                    var246 = -0.0015246599;
                } else {
                    var246 = -0.031761564;
                }
            } else {
                if (inputs[21] < 1.6705577) {
                    var246 = 0.01235743;
                } else {
                    if (inputs[24] < 20.301311) {
                        var246 = -0.010439482;
                    } else {
                        var246 = 0.007331906;
                    }
                }
            }
        }
    }
    double var247;
    if (inputs[21] < -1.6590085) {
        if (inputs[16] < -0.11742105) {
            if (inputs[10] < 0.71) {
                var247 = -0.015957635;
            } else {
                if (inputs[17] < 1.3955787) {
                    if (inputs[24] < -18.488583) {
                        var247 = 0.021805001;
                    } else {
                        var247 = 0.0056647463;
                    }
                } else {
                    var247 = -0.003248291;
                }
            }
        } else {
            if (inputs[2] < 1.4764286) {
                var247 = -0.00674532;
            } else {
                var247 = 0.028491814;
            }
        }
    } else {
        if (inputs[14] < 0.452) {
            var247 = -0.027212402;
        } else {
            if (inputs[13] < 1725.03) {
                var247 = 0.008599524;
            } else {
                if (inputs[9] < 3.3475) {
                    var247 = -0.020551085;
                } else {
                    if (inputs[10] < 1.74) {
                        var247 = 0.015092268;
                    } else {
                        var247 = -0.015164116;
                    }
                }
            }
        }
    }
    double var248;
    if (inputs[21] < 3.2769408) {
        if (inputs[9] < 11.0575) {
            if (inputs[23] < -3.152488) {
                if (inputs[17] < 1.034381) {
                    var248 = -0.02104852;
                } else {
                    if (inputs[13] < 1731.27) {
                        var248 = 0.007814572;
                    } else {
                        var248 = -0.009599772;
                    }
                }
            } else {
                if (inputs[23] < 9.677591) {
                    if (inputs[16] < -0.14654887) {
                        var248 = 0.027400443;
                    } else {
                        var248 = 0.004179546;
                    }
                } else {
                    var248 = -0.011567577;
                }
            }
        } else {
            var248 = -0.019023938;
        }
    } else {
        if (inputs[23] < -16.599993) {
            var248 = 0.023743488;
        } else {
            var248 = -0.00021952903;
        }
    }
    double var249;
    if (inputs[24] < 18.969734) {
        if (inputs[15] < -0.25381818) {
            if (inputs[15] < -0.3961212) {
                if (inputs[25] < 3.1700976) {
                    if (inputs[19] < 1.6515522) {
                        var249 = -0.006703835;
                    } else {
                        var249 = 0.0101619875;
                    }
                } else {
                    var249 = -0.019751703;
                }
            } else {
                if (inputs[15] < -0.33557576) {
                    var249 = 0.028998673;
                } else {
                    var249 = 0.005897224;
                }
            }
        } else {
            if (inputs[17] < 0.9873723) {
                var249 = 0.0046704523;
            } else {
                if (inputs[25] < 2.0046566) {
                    var249 = 0.0047935587;
                } else {
                    if (inputs[2] < 1.3114285) {
                        var249 = -0.0014168582;
                    } else {
                        var249 = -0.027303843;
                    }
                }
            }
        }
    } else {
        if (inputs[24] < 25.151962) {
            var249 = 0.014509499;
        } else {
            var249 = -0.0041440907;
        }
    }
    double var250;
    if (inputs[10] < 1.16) {
        if (inputs[18] < 1.9109424) {
            if (inputs[2] < 1.4764286) {
                if (inputs[20] < 0.07103209) {
                    var250 = 0.005789973;
                } else {
                    var250 = -0.029300012;
                }
            } else {
                if (inputs[18] < 1.4906445) {
                    var250 = 0.018686011;
                } else {
                    var250 = -0.003465901;
                }
            }
        } else {
            var250 = 0.02345727;
        }
    } else {
        if (inputs[19] < 2.0771122) {
            if (inputs[19] < 1.7022699) {
                if (inputs[2] < 1.4685714) {
                    if (inputs[20] < 0.00019193416) {
                        var250 = 0.01916897;
                    } else {
                        var250 = -0.012367242;
                    }
                } else {
                    var250 = -0.02596136;
                }
            } else {
                var250 = 0.018198263;
            }
        } else {
            if (inputs[2] < 2.8128572) {
                var250 = -0.02614954;
            } else {
                var250 = -0.003901536;
            }
        }
    }
    double var251;
    if (inputs[25] < 4.115349) {
        if (inputs[13] < 1850.37) {
            if (inputs[2] < 1.325) {
                if (inputs[25] < 3.1700976) {
                    var251 = 0.020450458;
                } else {
                    var251 = -0.006109435;
                }
            } else {
                if (inputs[2] < 1.9007143) {
                    if (inputs[17] < 1.1974373) {
                        var251 = -0.003299683;
                    } else {
                        var251 = -0.027563164;
                    }
                } else {
                    if (inputs[20] < -0.16443706) {
                        var251 = -0.011777422;
                    } else {
                        var251 = 0.011001666;
                    }
                }
            }
        } else {
            if (inputs[18] < 1.34489) {
                var251 = -0.006225853;
            } else {
                if (inputs[18] < 2.1924095) {
                    if (inputs[15] < 0.25624242) {
                        var251 = -0.00009783775;
                    } else {
                        var251 = 0.025118554;
                    }
                } else {
                    var251 = 0.00016889963;
                }
            }
        }
    } else {
        var251 = 0.017487943;
    }
    double var252;
    if (inputs[16] < 0.05800752) {
        if (inputs[6] < 1934.43) {
            if (inputs[3] < 1863.91) {
                if (inputs[16] < -0.16878195) {
                    if (inputs[15] < -0.49042425) {
                        var252 = -0.020318825;
                    } else {
                        var252 = 0.007254421;
                    }
                } else {
                    if (inputs[9] < 2.26) {
                        var252 = -0.008722659;
                    } else {
                        var252 = 0.01778807;
                    }
                }
            } else {
                var252 = -0.0117016;
            }
        } else {
            var252 = 0.01815362;
        }
    } else {
        if (inputs[15] < 0.2620606) {
            var252 = -0.018683704;
        } else {
            if (inputs[10] < 3.3075) {
                if (inputs[18] < 1.2593713) {
                    var252 = -0.0121542895;
                } else {
                    if (inputs[19] < 1.658906) {
                        var252 = 0.0144325765;
                    } else {
                        var252 = -0.0021275578;
                    }
                }
            } else {
                var252 = -0.016390609;
            }
        }
    }
    double var253;
    if (inputs[15] < -0.2869091) {
        if (inputs[15] < -0.3961212) {
            if (inputs[2] < 1.4878571) {
                var253 = -0.011070355;
            } else {
                if (inputs[2] < 1.9735714) {
                    var253 = 0.019840347;
                } else {
                    var253 = 0.00074111397;
                }
            }
        } else {
            var253 = 0.021924889;
        }
    } else {
        if (inputs[15] < -0.15684849) {
            var253 = -0.01712124;
        } else {
            if (inputs[23] < 0.0) {
                if (inputs[20] < -0.005653874) {
                    if (inputs[14] < 0.722) {
                        var253 = 0.001239435;
                    } else {
                        var253 = 0.025763243;
                    }
                } else {
                    var253 = -0.0036307904;
                }
            } else {
                if (inputs[21] < 2.2095516) {
                    var253 = 0.006890394;
                } else {
                    if (inputs[16] < 0.18491729) {
                        var253 = -0.028468555;
                    } else {
                        var253 = -0.00080968026;
                    }
                }
            }
        }
    }
    double var254;
    if (inputs[24] < -25.921698) {
        var254 = -0.015461509;
    } else {
        if (inputs[21] < -3.0357554) {
            if (inputs[23] < -20.966377) {
                var254 = 0.0024636725;
            } else {
                var254 = 0.02370502;
            }
        } else {
            if (inputs[14] < -0.973) {
                var254 = 0.012794216;
            } else {
                if (inputs[21] < -2.4886897) {
                    var254 = -0.019085864;
                } else {
                    if (inputs[2] < 2.9221427) {
                        var254 = 0.00019010704;
                    } else {
                        var254 = -0.018150263;
                    }
                }
            }
        }
    }
    double var255;
    if (inputs[4] < 1935.9) {
        if (inputs[21] < -3.593429) {
            var255 = 0.017107;
        } else {
            if (inputs[16] < -0.16803007) {
                if (inputs[23] < -13.268932) {
                    var255 = -0.021216525;
                } else {
                    var255 = -0.0054803253;
                }
            } else {
                if (inputs[13] < 1909.43) {
                    if (inputs[20] < -0.005653874) {
                        var255 = 0.007328602;
                    } else {
                        var255 = -0.0030481697;
                    }
                } else {
                    var255 = -0.016755069;
                }
            }
        }
    } else {
        if (inputs[25] < 2.4323606) {
            var255 = 0.032513954;
        } else {
            var255 = 0.0018640724;
        }
    }
    double var256;
    if (inputs[10] < 5.0575) {
        if (inputs[10] < 3.22) {
            if (inputs[10] < 2.57) {
                if (inputs[20] < 0.92384934) {
                    if (inputs[8] < 1668.26) {
                        var256 = 0.01442848;
                    } else {
                        var256 = -0.00717875;
                    }
                } else {
                    if (inputs[16] < -0.041323308) {
                        var256 = 0.018428572;
                    } else {
                        var256 = -0.0031108756;
                    }
                }
            } else {
                var256 = 0.014807423;
            }
        } else {
            var256 = -0.017531425;
        }
    } else {
        if (inputs[19] < 3.6598387) {
            var256 = 0.020945461;
        } else {
            var256 = 0.00022849492;
        }
    }
    double var257;
    if (inputs[12] < 1944.22) {
        if (inputs[20] < 0.4305812) {
            if (inputs[10] < 2.5575) {
                if (inputs[20] < 0.00019193416) {
                    if (inputs[18] < 1.1484094) {
                        var257 = 0.007913848;
                    } else {
                        var257 = -0.010018731;
                    }
                } else {
                    var257 = -0.023530344;
                }
            } else {
                if (inputs[2] < 1.6878572) {
                    var257 = 0.022103403;
                } else {
                    var257 = 0.0007760635;
                }
            }
        } else {
            if (inputs[15] < 0.39175758) {
                if (inputs[16] < -0.077203006) {
                    if (inputs[14] < -0.795) {
                        var257 = -0.0008859424;
                    } else {
                        var257 = 0.017137958;
                    }
                } else {
                    var257 = -0.01186713;
                }
            } else {
                var257 = 0.028365944;
            }
        }
    } else {
        var257 = -0.018155051;
    }
    double var258;
    if (inputs[1] < 30.82347) {
        if (inputs[10] < 2.1375) {
            if (inputs[10] < 0.825) {
                var258 = -0.010391073;
            } else {
                var258 = 0.017936882;
            }
        } else {
            var258 = -0.020082666;
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[10] < 0.545) {
                var258 = 0.029485993;
            } else {
                if (inputs[24] < -12.059401) {
                    var258 = 0.019881863;
                } else {
                    var258 = -0.006571001;
                }
            }
        } else {
            if (inputs[8] < 1902.8) {
                if (inputs[10] < 0.39) {
                    var258 = -0.014375543;
                } else {
                    if (inputs[2] < 1.9821428) {
                        var258 = 0.0022166364;
                    } else {
                        var258 = 0.017177025;
                    }
                }
            } else {
                var258 = -0.014180327;
            }
        }
    }
    double var259;
    if (inputs[21] < 3.6998076) {
        if (inputs[2] < 1.1064286) {
            var259 = -0.011560874;
        } else {
            if (inputs[17] < 0.9943239) {
                var259 = 0.016755613;
            } else {
                if (inputs[14] < 0.832) {
                    if (inputs[15] < -0.24606061) {
                        var259 = 0.0042274618;
                    } else {
                        var259 = -0.013801903;
                    }
                } else {
                    if (inputs[10] < 1.365) {
                        var259 = 0.018164951;
                    } else {
                        var259 = -0.0023559933;
                    }
                }
            }
        }
    } else {
        var259 = -0.01451859;
    }
    double var260;
    if (inputs[10] < 0.3275) {
        if (inputs[6] < 1826.5) {
            var260 = -0.022484824;
        } else {
            var260 = -0.00011672673;
        }
    } else {
        if (inputs[9] < 1.5625) {
            var260 = -0.013331124;
        } else {
            if (inputs[9] < 2.985) {
                var260 = 0.017959878;
            } else {
                if (inputs[2] < 1.6985714) {
                    if (inputs[15] < -0.296) {
                        var260 = 0.016015047;
                    } else {
                        var260 = 0.0012618515;
                    }
                } else {
                    if (inputs[14] < 0.926) {
                        var260 = -0.00018646075;
                    } else {
                        var260 = -0.02413754;
                    }
                }
            }
        }
    }
    double var261;
    if (inputs[4] < 1906.7) {
        if (inputs[17] < 1.9682418) {
            if (inputs[18] < 2.0385132) {
                if (inputs[24] < 11.083017) {
                    if (inputs[16] < -0.077203006) {
                        var261 = -0.0005559814;
                    } else {
                        var261 = -0.02401166;
                    }
                } else {
                    if (inputs[16] < 0.12596993) {
                        var261 = 0.017003074;
                    } else {
                        var261 = -0.0016975474;
                    }
                }
            } else {
                var261 = 0.014327063;
            }
        } else {
            var261 = -0.017417299;
        }
    } else {
        if (inputs[13] < 1963.6) {
            if (inputs[20] < -0.29775542) {
                var261 = 0.026272139;
            } else {
                var261 = 0.008404094;
            }
        } else {
            var261 = -0.004739551;
        }
    }
    double var262;
    if (inputs[11] < 0.44) {
        if (inputs[21] < -3.593429) {
            var262 = 0.01668845;
        } else {
            if (inputs[24] < -15.948699) {
                if (inputs[9] < 4.935) {
                    var262 = 0.0003472549;
                } else {
                    var262 = -0.020707758;
                }
            } else {
                if (inputs[23] < 0.3177864) {
                    if (inputs[24] < -9.592173) {
                        var262 = 0.022332964;
                    } else {
                        var262 = 0.004222171;
                    }
                } else {
                    var262 = -0.010784307;
                }
            }
        }
    } else {
        var262 = -0.016129678;
    }
    double var263;
    if (inputs[16] < 0.2694436) {
        if (inputs[21] < -3.3781095) {
            var263 = -0.014465218;
        } else {
            if (inputs[1] < 64.21748) {
                if (inputs[1] < 60.820408) {
                    if (inputs[21] < -1.6590085) {
                        var263 = 0.0026131754;
                    } else {
                        var263 = -0.018957999;
                    }
                } else {
                    var263 = 0.01887237;
                }
            } else {
                if (inputs[21] < 2.7344482) {
                    var263 = -0.020697778;
                } else {
                    if (inputs[20] < -0.8732041) {
                        var263 = 0.01291337;
                    } else {
                        var263 = -0.011633756;
                    }
                }
            }
        }
    } else {
        if (inputs[14] < 0.679) {
            var263 = 0.020906199;
        } else {
            var263 = 0.0005259832;
        }
    }
    double var264;
    if (inputs[17] < 2.5590653) {
        if (inputs[15] < -0.5689697) {
            var264 = -0.011133751;
        } else {
            if (inputs[1] < 26.495476) {
                var264 = 0.021147499;
            } else {
                if (inputs[1] < 31.467228) {
                    var264 = -0.009792403;
                } else {
                    if (inputs[16] < -0.08324812) {
                        var264 = 0.014434882;
                    } else {
                        var264 = 0.0013897363;
                    }
                }
            }
        }
    } else {
        var264 = -0.016107347;
    }
    double var265;
    if (inputs[23] < 10.910757) {
        if (inputs[2] < 2.67) {
            if (inputs[14] < -0.869) {
                if (inputs[11] < 0.33) {
                    var265 = -0.005886878;
                } else {
                    var265 = -0.030294895;
                }
            } else {
                if (inputs[6] < 1870.87) {
                    if (inputs[10] < 1.03) {
                        var265 = 0.004405042;
                    } else {
                        var265 = -0.0083119515;
                    }
                } else {
                    if (inputs[9] < 4.725) {
                        var265 = 0.000113612405;
                    } else {
                        var265 = 0.02303313;
                    }
                }
            }
        } else {
            if (inputs[2] < 3.5028572) {
                var265 = 0.0201447;
            } else {
                var265 = -0.0013368971;
            }
        }
    } else {
        var265 = -0.017209;
    }
    double var266;
    if (inputs[10] < 5.0575) {
        if (inputs[16] < -0.17063157) {
            if (inputs[17] < 1.2055439) {
                var266 = 0.0024740126;
            } else {
                var266 = -0.015339299;
            }
        } else {
            if (inputs[3] < 1672.695) {
                var266 = -0.012228109;
            } else {
                if (inputs[3] < 1924.035) {
                    if (inputs[14] < 0.727) {
                        var266 = 0.013710362;
                    } else {
                        var266 = 0.0007426912;
                    }
                } else {
                    var266 = -0.00815304;
                }
            }
        }
    } else {
        if (inputs[3] < 1858.2) {
            var266 = 0.022015434;
        } else {
            var266 = 0.006291044;
        }
    }
    double var267;
    if (inputs[23] < -3.152488) {
        if (inputs[15] < 0.3798788) {
            if (inputs[13] < 1818.98) {
                if (inputs[9] < 6.19) {
                    if (inputs[19] < 1.4808102) {
                        var267 = -0.0006738272;
                    } else {
                        var267 = -0.02970932;
                    }
                } else {
                    var267 = 0.016693447;
                }
            } else {
                var267 = -0.023091517;
            }
        } else {
            if (inputs[16] < 0.18751879) {
                var267 = 0.021052822;
            } else {
                var267 = -0.008435261;
            }
        }
    } else {
        if (inputs[15] < 0.43066666) {
            if (inputs[18] < 1.3334782) {
                if (inputs[18] < 1.1384819) {
                    var267 = 0.019658951;
                } else {
                    var267 = -0.018829864;
                }
            } else {
                if (inputs[24] < 2.1432385) {
                    if (inputs[15] < -0.5082424) {
                        var267 = 0.015991183;
                    } else {
                        var267 = -0.0006546894;
                    }
                } else {
                    var267 = 0.033392686;
                }
            }
        } else {
            var267 = -0.0053193183;
        }
    }
    double var268;
    if (inputs[19] < 2.144363) {
        if (inputs[10] < 3.395) {
            if (inputs[15] < 0.41733333) {
                if (inputs[16] < 0.16592482) {
                    if (inputs[2] < 1.0985714) {
                        var268 = -0.015675846;
                    } else {
                        var268 = 0.0029153686;
                    }
                } else {
                    var268 = 0.021772044;
                }
            } else {
                var268 = -0.015101971;
            }
        } else {
            var268 = 0.02293508;
        }
    } else {
        if (inputs[9] < 7.365) {
            if (inputs[18] < 2.2895815) {
                var268 = -0.0063296715;
            } else {
                var268 = 0.009585343;
            }
        } else {
            if (inputs[9] < 12.01) {
                var268 = -0.03007368;
            } else {
                var268 = -0.008471218;
            }
        }
    }
    double var269;
    if (inputs[20] < -1.6100832) {
        var269 = -0.012767022;
    } else {
        if (inputs[17] < 2.5874202) {
            if (inputs[25] < 3.964557) {
                if (inputs[16] < 0.12944362) {
                    if (inputs[24] < -8.892423) {
                        var269 = 0.00034237313;
                    } else {
                        var269 = 0.0161431;
                    }
                } else {
                    if (inputs[25] < 3.1190884) {
                        var269 = 0.002319419;
                    } else {
                        var269 = -0.022843607;
                    }
                }
            } else {
                var269 = 0.01997883;
            }
        } else {
            var269 = -0.0149616115;
        }
    }
    double var270;
    if (inputs[10] < 2.1375) {
        if (inputs[10] < 1.8475) {
            if (inputs[3] < 1931.905) {
                if (inputs[1] < 32.20932) {
                    var270 = 0.013361804;
                } else {
                    if (inputs[10] < 0.8625) {
                        var270 = -0.013223155;
                    } else {
                        var270 = 0.0052443068;
                    }
                }
            } else {
                var270 = 0.0161627;
            }
        } else {
            var270 = 0.024537353;
        }
    } else {
        if (inputs[1] < 34.988297) {
            if (inputs[15] < -0.48763636) {
                var270 = -0.008503843;
            } else {
                var270 = -0.030015403;
            }
        } else {
            if (inputs[24] < 7.3783484) {
                var270 = 0.016789014;
            } else {
                if (inputs[14] < 0.873) {
                    var270 = 0.0024484703;
                } else {
                    var270 = -0.015302726;
                }
            }
        }
    }
    double var271;
    if (inputs[25] < 1.8835075) {
        var271 = -0.013698358;
    } else {
        if (inputs[17] < 2.5590653) {
            if (inputs[16] < 0.12596993) {
                if (inputs[21] < -2.00622) {
                    if (inputs[19] < 1.3118387) {
                        var271 = -0.011580113;
                    } else {
                        var271 = 0.0063204467;
                    }
                } else {
                    if (inputs[9] < 4.19) {
                        var271 = 0.028119411;
                    } else {
                        var271 = 0.002572298;
                    }
                }
            } else {
                if (inputs[10] < 1.355) {
                    var271 = -0.015944278;
                } else {
                    if (inputs[14] < 0.832) {
                        var271 = 0.016544824;
                    } else {
                        var271 = -0.0046161674;
                    }
                }
            }
        } else {
            var271 = -0.016864827;
        }
    }
    double var272;
    if (inputs[10] < 0.55) {
        if (inputs[9] < 2.835) {
            var272 = 0.00024920935;
        } else {
            if (inputs[16] < 0.0073533836) {
                var272 = 0.011071225;
            } else {
                var272 = 0.02945097;
            }
        }
    } else {
        if (inputs[19] < 2.0921564) {
            if (inputs[19] < 1.8369683) {
                if (inputs[24] < -18.783993) {
                    var272 = 0.018827217;
                } else {
                    if (inputs[3] < 1839.26) {
                        var272 = -0.010866725;
                    } else {
                        var272 = 0.0077779205;
                    }
                }
            } else {
                var272 = 0.0230434;
            }
        } else {
            if (inputs[20] < 0.6004593) {
                if (inputs[24] < 8.137291) {
                    var272 = 0.013458721;
                } else {
                    var272 = -0.017118642;
                }
            } else {
                var272 = -0.021614421;
            }
        }
    }
    double var273;
    if (inputs[16] < 0.2694436) {
        if (inputs[1] < 73.75911) {
            if (inputs[6] < 1934.43) {
                if (inputs[17] < 0.9764753) {
                    var273 = -0.020434406;
                } else {
                    if (inputs[6] < 1909.36) {
                        var273 = -0.0016650376;
                    } else {
                        var273 = -0.02395935;
                    }
                }
            } else {
                var273 = 0.009824614;
            }
        } else {
            var273 = 0.015000773;
        }
    } else {
        if (inputs[5] < 1842.8375) {
            var273 = 0.024651252;
        } else {
            var273 = 0.00030239596;
        }
    }
    double var274;
    if (inputs[24] < -25.683517) {
        var274 = -0.012762725;
    } else {
        if (inputs[15] < -0.6610909) {
            var274 = 0.018589523;
        } else {
            if (inputs[2] < 1.7892857) {
                if (inputs[3] < 1670.645) {
                    var274 = -0.011561394;
                } else {
                    if (inputs[14] < 0.926) {
                        var274 = 0.003942297;
                    } else {
                        var274 = 0.022970537;
                    }
                }
            } else {
                if (inputs[10] < 5.0575) {
                    if (inputs[10] < 1.865) {
                        var274 = -0.0049274177;
                    } else {
                        var274 = -0.02646708;
                    }
                } else {
                    var274 = 0.011433046;
                }
            }
        }
    }
    double var275;
    if (inputs[9] < 1.41) {
        var275 = -0.018805185;
    } else {
        if (inputs[18] < 1.1976143) {
            if (inputs[19] < 1.4670558) {
                if (inputs[11] < 0.42) {
                    var275 = 0.011664794;
                } else {
                    var275 = -0.009399171;
                }
            } else {
                var275 = -0.024670126;
            }
        } else {
            if (inputs[3] < 1715.54) {
                if (inputs[11] < 0.33) {
                    var275 = -0.020274382;
                } else {
                    var275 = 0.009621037;
                }
            } else {
                if (inputs[19] < 1.3897288) {
                    if (inputs[20] < 0.14538299) {
                        var275 = -0.009588341;
                    } else {
                        var275 = 0.004247689;
                    }
                } else {
                    if (inputs[16] < -0.17063157) {
                        var275 = 0.0026943404;
                    } else {
                        var275 = 0.01546025;
                    }
                }
            }
        }
    }
    double var276;
    if (inputs[16] < 0.054278195) {
        if (inputs[25] < 3.3337195) {
            if (inputs[16] < -0.28039098) {
                var276 = -0.0037763587;
            } else {
                if (inputs[15] < -0.5082424) {
                    var276 = 0.027177472;
                } else {
                    if (inputs[17] < 1.192805) {
                        var276 = 0.023294792;
                    } else {
                        var276 = 0.0063276673;
                    }
                }
            }
        } else {
            if (inputs[11] < 0.3) {
                var276 = 0.0066752196;
            } else {
                var276 = -0.023672713;
            }
        }
    } else {
        if (inputs[1] < 62.81552) {
            var276 = -0.026851788;
        } else {
            if (inputs[23] < -29.847906) {
                var276 = 0.010356175;
            } else {
                if (inputs[20] < -1.1419783) {
                    var276 = 0.010282247;
                } else {
                    if (inputs[1] < 69.681725) {
                        var276 = -0.0010288093;
                    } else {
                        var276 = -0.023473486;
                    }
                }
            }
        }
    }
    double var277;
    if (inputs[24] < 25.472149) {
        if (inputs[16] < 0.2641203) {
            if (inputs[1] < 71.35617) {
                if (inputs[1] < 66.54701) {
                    if (inputs[23] < -35.493023) {
                        var277 = -0.00929386;
                    } else {
                        var277 = 0.002889583;
                    }
                } else {
                    var277 = -0.017285692;
                }
            } else {
                var277 = 0.017499678;
            }
        } else {
            var277 = 0.016309354;
        }
    } else {
        var277 = -0.018777717;
    }
    double var278;
    if (inputs[15] < -0.55) {
        if (inputs[21] < -2.4886897) {
            var278 = -0.02334693;
        } else {
            var278 = 0.0010913023;
        }
    } else {
        if (inputs[10] < 5.0575) {
            if (inputs[10] < 3.0775) {
                if (inputs[16] < -0.21651128) {
                    var278 = 0.019153092;
                } else {
                    if (inputs[1] < 31.528812) {
                        var278 = -0.018711593;
                    } else {
                        var278 = 0.0024949631;
                    }
                }
            } else {
                var278 = -0.017583255;
            }
        } else {
            var278 = 0.02028853;
        }
    }
    double var279;
    if (inputs[24] < -25.921698) {
        var279 = -0.019611873;
    } else {
        if (inputs[20] < -1.7409832) {
            var279 = -0.018109951;
        } else {
            if (inputs[24] < 24.900513) {
                if (inputs[19] < 1.160412) {
                    var279 = -0.010130595;
                } else {
                    if (inputs[24] < 18.969734) {
                        var279 = 0.0027479304;
                    } else {
                        var279 = 0.020797659;
                    }
                }
            } else {
                var279 = -0.014274117;
            }
        }
    }
    double var280;
    if (inputs[14] < -1.185) {
        var280 = 0.011291659;
    } else {
        if (inputs[11] < 0.36) {
            if (inputs[20] < 0.9026732) {
                if (inputs[9] < 6.9625) {
                    if (inputs[17] < 1.3323122) {
                        var280 = -0.019629141;
                    } else {
                        var280 = 0.0015066036;
                    }
                } else {
                    if (inputs[5] < 1840.62) {
                        var280 = 0.021750083;
                    } else {
                        var280 = 0.0010539544;
                    }
                }
            } else {
                var280 = -0.019837853;
            }
        } else {
            if (inputs[9] < 2.635) {
                if (inputs[16] < -0.044586465) {
                    var280 = 0.0051522055;
                } else {
                    var280 = -0.016940195;
                }
            } else {
                if (inputs[10] < 2.1375) {
                    if (inputs[5] < 1837.9325) {
                        var280 = 0.020398177;
                    } else {
                        var280 = 0.006986313;
                    }
                } else {
                    var280 = -0.001686841;
                }
            }
        }
    }
    double var281;
    if (inputs[17] < 0.83912814) {
        var281 = -0.017345952;
    } else {
        if (inputs[25] < 4.034082) {
            if (inputs[21] < -3.3407135) {
                var281 = -0.01925974;
            } else {
                if (inputs[11] < 0.19) {
                    var281 = 0.01750849;
                } else {
                    if (inputs[11] < 0.29) {
                        var281 = -0.010464466;
                    } else {
                        var281 = 0.002325553;
                    }
                }
            }
        } else {
            var281 = 0.014827816;
        }
    }
    double var282;
    if (inputs[23] < 0.3177864) {
        if (inputs[16] < -0.18431579) {
            if (inputs[21] < -3.0357554) {
                var282 = 0.002027055;
            } else {
                var282 = -0.021927768;
            }
        } else {
            if (inputs[20] < 1.163589) {
                if (inputs[20] < 0.535828) {
                    if (inputs[25] < 3.1034484) {
                        var282 = 0.0052913227;
                    } else {
                        var282 = -0.010086618;
                    }
                } else {
                    var282 = 0.022965336;
                }
            } else {
                var282 = -0.008453305;
            }
        }
    } else {
        if (inputs[20] < -0.14515267) {
            var282 = -0.024348645;
        } else {
            var282 = -0.0031308807;
        }
    }
    double var283;
    if (inputs[14] < -1.185) {
        var283 = 0.013901569;
    } else {
        if (inputs[1] < 26.495476) {
            var283 = 0.017326197;
        } else {
            if (inputs[20] < 0.95593303) {
                if (inputs[21] < -2.4323606) {
                    var283 = -0.014091822;
                } else {
                    if (inputs[19] < 1.3074727) {
                        var283 = 0.014557123;
                    } else {
                        var283 = -0.000769726;
                    }
                }
            } else {
                if (inputs[5] < 1813.395) {
                    var283 = -0.032100633;
                } else {
                    var283 = -0.0019570906;
                }
            }
        }
    }
    double var284;
    if (inputs[15] < 0.36454546) {
        if (inputs[15] < 0.30321214) {
            if (inputs[15] < 0.20787878) {
                if (inputs[9] < 2.4475) {
                    var284 = 0.014339238;
                } else {
                    if (inputs[15] < -0.44751516) {
                        var284 = 0.0036659813;
                    } else {
                        var284 = -0.016286336;
                    }
                }
            } else {
                var284 = 0.017251475;
            }
        } else {
            var284 = -0.0241469;
        }
    } else {
        if (inputs[15] < 0.41733333) {
            var284 = 0.019605158;
        } else {
            if (inputs[9] < 5.0) {
                if (inputs[23] < -2.358174) {
                    var284 = 0.0017207226;
                } else {
                    var284 = -0.014699231;
                }
            } else {
                var284 = 0.013011247;
            }
        }
    }
    double var285;
    if (inputs[16] < 0.2641203) {
        if (inputs[9] < 5.63) {
            if (inputs[10] < 0.8075) {
                if (inputs[23] < -38.481567) {
                    var285 = 0.015279091;
                } else {
                    if (inputs[9] < 2.695) {
                        var285 = -0.023438841;
                    } else {
                        var285 = 0.00058037555;
                    }
                }
            } else {
                if (inputs[23] < -37.702194) {
                    var285 = -0.0059425775;
                } else {
                    if (inputs[14] < -0.755) {
                        var285 = 0.028216403;
                    } else {
                        var285 = 0.0076457877;
                    }
                }
            }
        } else {
            if (inputs[18] < 1.5694613) {
                var285 = -0.020143138;
            } else {
                if (inputs[17] < 1.9682418) {
                    var285 = 0.010657124;
                } else {
                    var285 = -0.0131379785;
                }
            }
        }
    } else {
        if (inputs[21] < 3.2294042) {
            var285 = 0.01879038;
        } else {
            var285 = -0.0002045057;
        }
    }
    double var286;
    if (inputs[13] < 1737.78) {
        if (inputs[17] < 1.1144038) {
            var286 = -0.013421781;
        } else {
            if (inputs[14] < -0.667) {
                var286 = 0.0015079431;
            } else {
                var286 = 0.028719142;
            }
        }
    } else {
        if (inputs[17] < 1.4689125) {
            if (inputs[4] < 1920.875) {
                if (inputs[11] < 0.4) {
                    if (inputs[17] < 1.1489543) {
                        var286 = 0.003462484;
                    } else {
                        var286 = -0.019127766;
                    }
                } else {
                    if (inputs[4] < 1823.46) {
                        var286 = 0.020352818;
                    } else {
                        var286 = -0.00010097448;
                    }
                }
            } else {
                if (inputs[20] < -0.19728385) {
                    var286 = -0.0001661383;
                } else {
                    var286 = 0.026723485;
                }
            }
        } else {
            if (inputs[23] < -14.929883) {
                var286 = -0.030453764;
            } else {
                if (inputs[5] < 1912.105) {
                    var286 = 0.005708269;
                } else {
                    var286 = -0.014375648;
                }
            }
        }
    }
    double var287;
    if (inputs[11] < 0.36) {
        if (inputs[17] < 1.0965656) {
            var287 = -0.020714104;
        } else {
            if (inputs[10] < 0.48) {
                var287 = 0.018677425;
            } else {
                if (inputs[20] < -0.4211998) {
                    if (inputs[18] < 1.8878146) {
                        var287 = 0.01976784;
                    } else {
                        var287 = 0.00013183423;
                    }
                } else {
                    if (inputs[15] < -0.25133333) {
                        var287 = -0.0026505892;
                    } else {
                        var287 = -0.024149192;
                    }
                }
            }
        }
    } else {
        if (inputs[16] < 0.035654135) {
            if (inputs[15] < -0.21109091) {
                if (inputs[19] < 1.3690054) {
                    var287 = -0.0030854186;
                } else {
                    var287 = 0.01918232;
                }
            } else {
                var287 = 0.028055957;
            }
        } else {
            if (inputs[15] < 0.3429091) {
                var287 = -0.014624791;
            } else {
                var287 = 0.009851063;
            }
        }
    }
    double var288;
    if (inputs[14] < -0.563) {
        if (inputs[15] < -0.32460606) {
            if (inputs[18] < 1.3577441) {
                var288 = 0.024432069;
            } else {
                if (inputs[23] < -1.2926564) {
                    if (inputs[24] < -16.129517) {
                        var288 = -0.025369998;
                    } else {
                        var288 = -0.0016813516;
                    }
                } else {
                    var288 = 0.0028658528;
                }
            }
        } else {
            var288 = -0.014843788;
        }
    } else {
        if (inputs[24] < -5.0908914) {
            var288 = 0.020090492;
        } else {
            if (inputs[15] < 0.5062424) {
                if (inputs[15] < 0.43024242) {
                    if (inputs[2] < 1.6985714) {
                        var288 = 0.008305318;
                    } else {
                        var288 = -0.010772362;
                    }
                } else {
                    var288 = -0.020584159;
                }
            } else {
                if (inputs[9] < 5.0) {
                    var288 = -0.00025288996;
                } else {
                    var288 = 0.017744876;
                }
            }
        }
    }
    double var289;
    if (inputs[16] < 0.2641203) {
        if (inputs[16] < 0.19218796) {
            if (inputs[9] < 5.5325) {
                if (inputs[10] < 0.8075) {
                    if (inputs[2] < 1.6828572) {
                        var289 = 0.0014509007;
                    } else {
                        var289 = -0.021365557;
                    }
                } else {
                    if (inputs[17] < 1.6396024) {
                        var289 = 0.0085139815;
                    } else {
                        var289 = 0.029930443;
                    }
                }
            } else {
                if (inputs[2] < 2.67) {
                    if (inputs[25] < 2.860633) {
                        var289 = -0.031948492;
                    } else {
                        var289 = -0.00693832;
                    }
                } else {
                    var289 = 0.0090125315;
                }
            }
        } else {
            var289 = -0.0204449;
        }
    } else {
        if (inputs[5] < 1844.8) {
            var289 = 0.02422302;
        } else {
            var289 = -0.0027212389;
        }
    }
    double var290;
    if (inputs[2] < 1.0985714) {
        if (inputs[10] < 1.505) {
            var290 = -0.027241144;
        } else {
            var290 = -0.0043231705;
        }
    } else {
        if (inputs[23] < -35.493023) {
            if (inputs[8] < 1715.02) {
                var290 = 0.004809964;
            } else {
                var290 = -0.020344127;
            }
        } else {
            if (inputs[23] < -29.362022) {
                var290 = 0.02409929;
            } else {
                if (inputs[15] < -0.65) {
                    var290 = 0.021208756;
                } else {
                    if (inputs[10] < 4.7325) {
                        var290 = -0.0029451733;
                    } else {
                        var290 = 0.013189146;
                    }
                }
            }
        }
    }
    double var291;
    if (inputs[10] < 7.3) {
        if (inputs[6] < 1940.265) {
            if (inputs[9] < 8.15) {
                if (inputs[25] < 2.6826775) {
                    if (inputs[2] < 1.4592857) {
                        var291 = -0.02505144;
                    } else {
                        var291 = -0.0023902794;
                    }
                } else {
                    if (inputs[15] < 0.41484848) {
                        var291 = 0.0078325495;
                    } else {
                        var291 = -0.010466132;
                    }
                }
            } else {
                var291 = -0.01871553;
            }
        } else {
            var291 = 0.0125926575;
        }
    } else {
        var291 = 0.017971486;
    }
    double var292;
    if (inputs[20] < -1.6100832) {
        var292 = -0.014604819;
    } else {
        if (inputs[18] < 3.397783) {
            if (inputs[5] < 1761.0675) {
                if (inputs[18] < 1.7339365) {
                    if (inputs[25] < 2.7594762) {
                        var292 = -0.013573375;
                    } else {
                        var292 = 0.011465169;
                    }
                } else {
                    var292 = -0.023342228;
                }
            } else {
                if (inputs[23] < -36.984165) {
                    var292 = -0.010603969;
                } else {
                    if (inputs[18] < 1.1529632) {
                        var292 = 0.023942774;
                    } else {
                        var292 = 0.007474992;
                    }
                }
            }
        } else {
            var292 = -0.018438596;
        }
    }
    double var293;
    if (inputs[20] < -0.16443706) {
        if (inputs[15] < 0.4121212) {
            if (inputs[16] < 0.16592482) {
                if (inputs[11] < 0.38) {
                    if (inputs[10] < 0.985) {
                        var293 = 0.008847529;
                    } else {
                        var293 = -0.010432361;
                    }
                } else {
                    var293 = -0.01660135;
                }
            } else {
                var293 = 0.016336724;
            }
        } else {
            var293 = -0.018719759;
        }
    } else {
        if (inputs[2] < 1.9107143) {
            if (inputs[17] < 1.535552) {
                if (inputs[18] < 1.3492947) {
                    if (inputs[21] < -2.6752014) {
                        var293 = 0.007999814;
                    } else {
                        var293 = -0.015057457;
                    }
                } else {
                    if (inputs[18] < 1.5062274) {
                        var293 = 0.020783057;
                    } else {
                        var293 = 0.0029685528;
                    }
                }
            } else {
                var293 = -0.015460207;
            }
        } else {
            if (inputs[6] < 1913.68) {
                if (inputs[21] < -1.6925602) {
                    var293 = 0.027504306;
                } else {
                    var293 = 0.012362839;
                }
            } else {
                var293 = 0.0025000293;
            }
        }
    }
    double var294;
    if (inputs[5] < 1913.09) {
        if (inputs[20] < 1.4345536) {
            if (inputs[23] < -54.69902) {
                var294 = -0.017568592;
            } else {
                if (inputs[18] < 1.1294512) {
                    var294 = 0.014724379;
                } else {
                    if (inputs[15] < 0.5382424) {
                        var294 = -0.0037405554;
                    } else {
                        var294 = 0.0114486925;
                    }
                }
            }
        } else {
            var294 = 0.016534347;
        }
    } else {
        if (inputs[16] < 0.03968421) {
            if (inputs[24] < -14.935743) {
                var294 = -0.013324223;
            } else {
                var294 = 0.005524348;
            }
        } else {
            var294 = -0.025493888;
        }
    }
    double var295;
    if (inputs[18] < 2.2016084) {
        if (inputs[1] < 26.495476) {
            var295 = 0.016956188;
        } else {
            if (inputs[1] < 30.82347) {
                var295 = -0.017374823;
            } else {
                if (inputs[19] < 1.65015) {
                    if (inputs[2] < 1.6878572) {
                        var295 = 0.0048299287;
                    } else {
                        var295 = -0.016283594;
                    }
                } else {
                    if (inputs[3] < 1914.265) {
                        var295 = 0.0036365157;
                    } else {
                        var295 = 0.024211565;
                    }
                }
            }
        }
    } else {
        if (inputs[10] < 1.185) {
            var295 = 0.005994548;
        } else {
            var295 = -0.016506534;
        }
    }
    double var296;
    if (inputs[9] < 11.0575) {
        if (inputs[15] < -0.2869091) {
            if (inputs[15] < -0.39169696) {
                if (inputs[25] < 3.2037778) {
                    if (inputs[1] < 32.96693) {
                        var296 = 0.015471863;
                    } else {
                        var296 = -0.004319369;
                    }
                } else {
                    var296 = -0.016323807;
                }
            } else {
                var296 = 0.023912296;
            }
        } else {
            if (inputs[16] < -0.11422557) {
                var296 = -0.02034227;
            } else {
                if (inputs[20] < 0.11182756) {
                    if (inputs[16] < 0.16592482) {
                        var296 = -0.0019226131;
                    } else {
                        var296 = 0.0162753;
                    }
                } else {
                    if (inputs[20] < 0.76225996) {
                        var296 = -0.022084711;
                    } else {
                        var296 = 0.003029452;
                    }
                }
            }
        }
    } else {
        var296 = -0.017236752;
    }
    double var297;
    if (inputs[11] < 0.36) {
        if (inputs[20] < 0.10010364) {
            if (inputs[23] < -23.777779) {
                var297 = 0.015361517;
            } else {
                if (inputs[2] < 2.78) {
                    if (inputs[2] < 1.9157143) {
                        var297 = 0.0045524775;
                    } else {
                        var297 = -0.024788901;
                    }
                } else {
                    var297 = 0.01565894;
                }
            }
        } else {
            if (inputs[17] < 1.3987509) {
                var297 = 0.0010812853;
            } else {
                var297 = -0.02502014;
            }
        }
    } else {
        if (inputs[11] < 0.45) {
            if (inputs[19] < 1.6250788) {
                if (inputs[20] < -0.5601386) {
                    var297 = -0.0058846893;
                } else {
                    if (inputs[13] < 1760.58) {
                        var297 = -0.0024341217;
                    } else {
                        var297 = 0.0144947115;
                    }
                }
            } else {
                var297 = 0.024068158;
            }
        } else {
            var297 = -0.010749535;
        }
    }
    double var298;
    if (inputs[24] < 18.969734) {
        if (inputs[4] < 1935.9) {
            if (inputs[10] < 0.66) {
                if (inputs[10] < 0.3125) {
                    var298 = -0.003205946;
                } else {
                    var298 = -0.022418082;
                }
            } else {
                if (inputs[10] < 1.105) {
                    var298 = 0.016129479;
                } else {
                    if (inputs[20] < 1.4213508) {
                        var298 = -0.006289722;
                    } else {
                        var298 = 0.013874983;
                    }
                }
            }
        } else {
            if (inputs[8] < 1972.19) {
                var298 = 0.018603887;
            } else {
                var298 = 0.002180435;
            }
        }
    } else {
        if (inputs[24] < 25.472149) {
            var298 = 0.020468472;
        } else {
            var298 = -0.0016711336;
        }
    }
    double var299;
    if (inputs[15] < -0.71115154) {
        var299 = 0.017715717;
    } else {
        if (inputs[3] < 1666.325) {
            var299 = 0.014159025;
        } else {
            if (inputs[16] < -0.26983458) {
                var299 = -0.01826076;
            } else {
                if (inputs[3] < 1707.455) {
                    var299 = -0.014987132;
                } else {
                    if (inputs[20] < -0.5177981) {
                        var299 = -0.004135512;
                    } else {
                        var299 = 0.0061947186;
                    }
                }
            }
        }
    }
    double var300;
    if (inputs[14] < 0.873) {
        if (inputs[14] < 0.641) {
            if (inputs[14] < -0.685) {
                if (inputs[17] < 1.2178605) {
                    var300 = 0.018406862;
                } else {
                    if (inputs[20] < -0.27667353) {
                        var300 = 0.008308233;
                    } else {
                        var300 = -0.0047564614;
                    }
                }
            } else {
                if (inputs[2] < 1.445) {
                    var300 = -0.020681424;
                } else {
                    if (inputs[2] < 2.0564287) {
                        var300 = 0.01747992;
                    } else {
                        var300 = -0.012360535;
                    }
                }
            }
        } else {
            if (inputs[3] < 1811.79) {
                var300 = -0.0008212434;
            } else {
                var300 = 0.024603259;
            }
        }
    } else {
        if (inputs[14] < 1.193) {
            var300 = -0.019581253;
        } else {
            var300 = 0.0038929465;
        }
    }
    double var301;
    if (inputs[17] < 1.1651713) {
        if (inputs[23] < -41.405205) {
            var301 = 0.020617446;
        } else {
            if (inputs[24] < 14.88337) {
                if (inputs[10] < 0.985) {
                    var301 = 0.005582926;
                } else {
                    var301 = -0.017617386;
                }
            } else {
                var301 = 0.015329424;
            }
        }
    } else {
        if (inputs[15] < -0.594) {
            var301 = 0.011155553;
        } else {
            if (inputs[10] < 5.0575) {
                if (inputs[2] < 2.4578571) {
                    if (inputs[15] < -0.21109091) {
                        var301 = -0.0124978805;
                    } else {
                        var301 = -0.0008910131;
                    }
                } else {
                    var301 = -0.023776473;
                }
            } else {
                var301 = 0.009431001;
            }
        }
    }
    double var302;
    if (inputs[17] < 0.83912814) {
        var302 = -0.015814478;
    } else {
        if (inputs[25] < 4.034082) {
            if (inputs[1] < 69.5182) {
                if (inputs[24] < 1.2061857) {
                    if (inputs[10] < 0.765) {
                        var302 = 0.009516315;
                    } else {
                        var302 = -0.0056817355;
                    }
                } else {
                    if (inputs[4] < 1818.645) {
                        var302 = 0.019719625;
                    } else {
                        var302 = 0.0027555283;
                    }
                }
            } else {
                if (inputs[24] < 23.25806) {
                    var302 = -0.021662846;
                } else {
                    var302 = 0.0026296382;
                }
            }
        } else {
            var302 = 0.021670008;
        }
    }
    double var303;
    if (inputs[3] < 1818.325) {
        if (inputs[25] < 3.3872244) {
            if (inputs[25] < 2.186767) {
                var303 = -0.007319219;
            } else {
                if (inputs[5] < 1781.945) {
                    if (inputs[21] < 2.4249263) {
                        var303 = 0.0037286843;
                    } else {
                        var303 = 0.022338733;
                    }
                } else {
                    var303 = 0.031044725;
                }
            }
        } else {
            var303 = -0.007899962;
        }
    } else {
        if (inputs[13] < 1875.69) {
            if (inputs[16] < -0.08642857) {
                var303 = -0.0053490405;
            } else {
                var303 = -0.030247957;
            }
        } else {
            if (inputs[23] < 10.910757) {
                if (inputs[10] < 3.61) {
                    if (inputs[20] < -0.17853628) {
                        var303 = -0.010160013;
                    } else {
                        var303 = 0.013604428;
                    }
                } else {
                    var303 = 0.020646738;
                }
            } else {
                var303 = -0.011765366;
            }
        }
    }
    double var304;
    if (inputs[9] < 11.0575) {
        if (inputs[4] < 1668.015) {
            var304 = -0.007857377;
        } else {
            if (inputs[9] < 4.14) {
                if (inputs[1] < 32.738472) {
                    var304 = -0.014879489;
                } else {
                    if (inputs[20] < -0.3163457) {
                        var304 = -0.0059367623;
                    } else {
                        var304 = 0.009424818;
                    }
                }
            } else {
                if (inputs[13] < 1926.67) {
                    if (inputs[14] < 0.873) {
                        var304 = 0.01702899;
                    } else {
                        var304 = -0.004488571;
                    }
                } else {
                    var304 = -0.007653673;
                }
            }
        }
    } else {
        var304 = -0.017889597;
    }
    double var305;
    if (inputs[15] < 0.54818183) {
        if (inputs[15] < 0.43066666) {
            if (inputs[15] < 0.39478788) {
                if (inputs[15] < 0.30430302) {
                    if (inputs[24] < 6.0591626) {
                        var305 = -0.0024495055;
                    } else {
                        var305 = 0.013367021;
                    }
                } else {
                    var305 = -0.01439736;
                }
            } else {
                var305 = 0.018462542;
            }
        } else {
            var305 = -0.014330783;
        }
    } else {
        if (inputs[10] < 1.2175) {
            var305 = 0.020843044;
        } else {
            var305 = 0.003459119;
        }
    }
    double var306;
    if (inputs[9] < 11.365) {
        if (inputs[2] < 0.9728571) {
            var306 = 0.016724782;
        } else {
            if (inputs[9] < 2.985) {
                if (inputs[9] < 1.64) {
                    var306 = -0.0034476118;
                } else {
                    if (inputs[19] < 1.527784) {
                        var306 = 0.005923628;
                    } else {
                        var306 = 0.023389513;
                    }
                }
            } else {
                if (inputs[9] < 4.725) {
                    if (inputs[10] < 0.4925) {
                        var306 = 0.004643245;
                    } else {
                        var306 = -0.020324728;
                    }
                } else {
                    if (inputs[25] < 3.1034484) {
                        var306 = 0.009738722;
                    } else {
                        var306 = -0.0067455117;
                    }
                }
            }
        }
    } else {
        var306 = -0.017851809;
    }
    double var307;
    if (inputs[14] < -1.185) {
        var307 = 0.010597683;
    } else {
        if (inputs[21] < -3.470752) {
            var307 = 0.013536496;
        } else {
            if (inputs[15] < -0.18915151) {
                if (inputs[16] < -0.21990977) {
                    var307 = 0.0063771023;
                } else {
                    if (inputs[19] < 1.3975947) {
                        var307 = -0.011475504;
                    } else {
                        var307 = -0.029882504;
                    }
                }
            } else {
                if (inputs[1] < 63.736034) {
                    if (inputs[19] < 1.658906) {
                        var307 = 0.019783951;
                    } else {
                        var307 = -0.003018331;
                    }
                } else {
                    if (inputs[2] < 1.7664286) {
                        var307 = 0.0025182946;
                    } else {
                        var307 = -0.015825337;
                    }
                }
            }
        }
    }
    double var308;
    if (inputs[23] < -63.956158) {
        var308 = -0.0203065;
    } else {
        if (inputs[13] < 1657.82) {
            var308 = 0.025154864;
        } else {
            if (inputs[12] < 1717.17) {
                var308 = -0.022717033;
            } else {
                if (inputs[19] < 1.3578346) {
                    if (inputs[16] < 0.07323308) {
                        var308 = -0.017698998;
                    } else {
                        var308 = 0.0060589733;
                    }
                } else {
                    if (inputs[13] < 1835.71) {
                        var308 = 0.011802238;
                    } else {
                        var308 = -0.00081866654;
                    }
                }
            }
        }
    }
    double var309;
    if (inputs[17] < 0.9647051) {
        if (inputs[20] < -0.30427587) {
            var309 = -0.019054282;
        } else {
            var309 = -0.0014943605;
        }
    } else {
        if (inputs[12] < 1842.26) {
            if (inputs[24] < -13.713003) {
                if (inputs[18] < 1.5333036) {
                    var309 = 0.020280648;
                } else {
                    var309 = -0.005681643;
                }
            } else {
                if (inputs[17] < 1.192805) {
                    var309 = -0.022278376;
                } else {
                    if (inputs[19] < 1.8027071) {
                        var309 = -0.009428651;
                    } else {
                        var309 = 0.0075619975;
                    }
                }
            }
        } else {
            if (inputs[24] < -16.809072) {
                var309 = -0.0098478105;
            } else {
                if (inputs[17] < 1.2083145) {
                    var309 = 0.027880087;
                } else {
                    if (inputs[23] < -4.5796494) {
                        var309 = -0.0054559694;
                    } else {
                        var309 = 0.013276633;
                    }
                }
            }
        }
    }
    double var310;
    if (inputs[19] < 1.658906) {
        if (inputs[21] < -3.0357554) {
            var310 = 0.014660666;
        } else {
            if (inputs[4] < 1923.46) {
                if (inputs[17] < 1.2055439) {
                    if (inputs[25] < 2.860633) {
                        var310 = 0.022107476;
                    } else {
                        var310 = 0.003077217;
                    }
                } else {
                    if (inputs[17] < 1.4078722) {
                        var310 = -0.022855109;
                    } else {
                        var310 = 0.012990535;
                    }
                }
            } else {
                var310 = -0.018730545;
            }
        }
    } else {
        if (inputs[23] < -16.034887) {
            if (inputs[11] < 0.25) {
                var310 = -0.0011185433;
            } else {
                var310 = -0.021645248;
            }
        } else {
            if (inputs[20] < -0.04057971) {
                if (inputs[17] < 1.3840954) {
                    var310 = 0.0006385966;
                } else {
                    var310 = 0.018776445;
                }
            } else {
                var310 = -0.007824866;
            }
        }
    }
    double var311;
    if (inputs[2] < 1.2635714) {
        if (inputs[18] < 1.2731335) {
            if (inputs[24] < 12.70107) {
                var311 = 0.006579061;
            } else {
                var311 = -0.009351704;
            }
        } else {
            var311 = -0.016852986;
        }
    } else {
        if (inputs[13] < 1779.85) {
            if (inputs[17] < 1.2774255) {
                var311 = -0.020715944;
            } else {
                if (inputs[11] < 0.3) {
                    var311 = -0.011720491;
                } else {
                    var311 = 0.013837339;
                }
            }
        } else {
            if (inputs[5] < 1923.6274) {
                if (inputs[21] < 2.5301204) {
                    if (inputs[24] < 4.263343) {
                        var311 = 0.013975136;
                    } else {
                        var311 = -0.0069474624;
                    }
                } else {
                    var311 = 0.02796681;
                }
            } else {
                if (inputs[25] < 2.4294116) {
                    var311 = 0.005595361;
                } else {
                    var311 = -0.022053085;
                }
            }
        }
    }
    double var312;
    if (inputs[21] < 3.6998076) {
        if (inputs[23] < -54.69902) {
            var312 = -0.008959293;
        } else {
            if (inputs[21] < 3.2096531) {
                if (inputs[1] < 63.875416) {
                    if (inputs[1] < 60.9473) {
                        var312 = 0.0023396946;
                    } else {
                        var312 = 0.0251284;
                    }
                } else {
                    if (inputs[13] < 1831.86) {
                        var312 = 0.009469919;
                    } else {
                        var312 = -0.019368635;
                    }
                }
            } else {
                var312 = 0.02450217;
            }
        }
    } else {
        var312 = -0.01066478;
    }
    double var313;
    if (inputs[10] < 5.0575) {
        if (inputs[13] < 1902.11) {
            if (inputs[20] < 1.4213508) {
                if (inputs[16] < 0.23195489) {
                    if (inputs[13] < 1805.83) {
                        var313 = 0.000828877;
                    } else {
                        var313 = -0.014588055;
                    }
                } else {
                    var313 = 0.014797983;
                }
            } else {
                var313 = 0.01417089;
            }
        } else {
            if (inputs[6] < 1933.575) {
                var313 = -0.029120583;
            } else {
                var313 = 0.002136457;
            }
        }
    } else {
        var313 = 0.0088835405;
    }
    double var314;
    if (inputs[25] < 3.021015) {
        if (inputs[20] < -1.5872867) {
            var314 = -0.024451151;
        } else {
            if (inputs[10] < 0.35) {
                var314 = -0.014222253;
            } else {
                if (inputs[9] < 2.985) {
                    if (inputs[9] < 2.07) {
                        var314 = 0.003213599;
                    } else {
                        var314 = 0.022577798;
                    }
                } else {
                    if (inputs[11] < 0.37) {
                        var314 = -0.0076487307;
                    } else {
                        var314 = 0.0062306174;
                    }
                }
            }
        }
    } else {
        if (inputs[20] < -0.8732041) {
            var314 = 0.01950303;
        } else {
            if (inputs[2] < 1.1721429) {
                if (inputs[25] < 3.7546778) {
                    var314 = -0.018429672;
                } else {
                    var314 = 0.008305475;
                }
            } else {
                if (inputs[17] < 1.493846) {
                    var314 = 0.020404952;
                } else {
                    var314 = -0.0013493783;
                }
            }
        }
    }
    double var315;
    if (inputs[20] < 0.535828) {
        if (inputs[19] < 1.6401807) {
            if (inputs[10] < 2.1375) {
                if (inputs[25] < 3.1034484) {
                    if (inputs[10] < 0.825) {
                        var315 = -0.028515968;
                    } else {
                        var315 = -0.004657713;
                    }
                } else {
                    var315 = 0.012895144;
                }
            } else {
                var315 = -0.029236639;
            }
        } else {
            if (inputs[20] < 0.052936934) {
                if (inputs[25] < 3.3872244) {
                    if (inputs[15] < 0.43024242) {
                        var315 = 0.023695061;
                    } else {
                        var315 = -0.006334943;
                    }
                } else {
                    var315 = -0.0048158737;
                }
            } else {
                var315 = -0.013276239;
            }
        }
    } else {
        if (inputs[16] < 0.14074436) {
            if (inputs[15] < -0.21109091) {
                if (inputs[18] < 1.4247512) {
                    var315 = -0.00493584;
                } else {
                    var315 = 0.012245892;
                }
            } else {
                var315 = 0.023882467;
            }
        } else {
            var315 = -0.01223052;
        }
    }
    double var316;
    if (inputs[10] < 0.4925) {
        if (inputs[16] < -0.041323308) {
            var316 = 0.021383937;
        } else {
            var316 = -0.0006885982;
        }
    } else {
        if (inputs[25] < 3.181065) {
            if (inputs[10] < 0.85) {
                var316 = -0.012681117;
            } else {
                if (inputs[8] < 1823.48) {
                    if (inputs[13] < 1778.21) {
                        var316 = 0.0052553355;
                    } else {
                        var316 = 0.027115433;
                    }
                } else {
                    if (inputs[19] < 1.6359477) {
                        var316 = -0.018014126;
                    } else {
                        var316 = 0.0033684927;
                    }
                }
            }
        } else {
            if (inputs[3] < 1812.825) {
                var316 = -0.01938564;
            } else {
                var316 = 0.0029962696;
            }
        }
    }
    double var317;
    if (inputs[1] < 26.495476) {
        var317 = 0.014094994;
    } else {
        if (inputs[25] < 3.3075356) {
            if (inputs[16] < 0.2641203) {
                if (inputs[23] < -50.573925) {
                    var317 = 0.01972808;
                } else {
                    if (inputs[20] < 1.2750442) {
                        var317 = 0.0014750588;
                    } else {
                        var317 = -0.019681599;
                    }
                }
            } else {
                var317 = 0.017175918;
            }
        } else {
            if (inputs[18] < 1.568082) {
                if (inputs[23] < -24.418097) {
                    var317 = -0.0049560866;
                } else {
                    var317 = -0.03165559;
                }
            } else {
                var317 = 0.0027535907;
            }
        }
    }
    double var318;
    if (inputs[19] < 2.144363) {
        if (inputs[19] < 1.8369683) {
            if (inputs[23] < -49.099266) {
                var318 = 0.012715463;
            } else {
                if (inputs[20] < 1.2404754) {
                    if (inputs[20] < -0.27097872) {
                        var318 = -0.0047633136;
                    } else {
                        var318 = 0.009537789;
                    }
                } else {
                    var318 = -0.015154729;
                }
            }
        } else {
            var318 = 0.018323585;
        }
    } else {
        if (inputs[15] < 0.48466668) {
            if (inputs[14] < -0.985) {
                var318 = 0.0034289223;
            } else {
                var318 = -0.02814289;
            }
        } else {
            var318 = 0.010963516;
        }
    }
    double var319;
    if (inputs[23] < 0.3177864) {
        if (inputs[10] < 0.8625) {
            if (inputs[14] < 0.813) {
                if (inputs[24] < 2.5631194) {
                    if (inputs[2] < 1.64) {
                        var319 = -0.016723685;
                    } else {
                        var319 = 0.007122097;
                    }
                } else {
                    var319 = -0.025108756;
                }
            } else {
                var319 = 0.011444831;
            }
        } else {
            if (inputs[1] < 25.359453) {
                var319 = -0.007476096;
            } else {
                if (inputs[2] < 2.78) {
                    if (inputs[11] < 0.3) {
                        var319 = -0.007369971;
                    } else {
                        var319 = 0.010668497;
                    }
                } else {
                    var319 = 0.02449591;
                }
            }
        }
    } else {
        if (inputs[2] < 1.7892857) {
            var319 = -0.0005063564;
        } else {
            var319 = -0.027247412;
        }
    }
    double var320;
    if (inputs[13] < 1940.95) {
        if (inputs[15] < -0.594) {
            var320 = 0.011861311;
        } else {
            if (inputs[12] < 1898.44) {
                if (inputs[24] < -18.783993) {
                    if (inputs[17] < 1.2718899) {
                        var320 = 0.012708481;
                    } else {
                        var320 = 0.0018242922;
                    }
                } else {
                    if (inputs[14] < 0.967) {
                        var320 = -0.008901114;
                    } else {
                        var320 = 0.0069458745;
                    }
                }
            } else {
                var320 = -0.019247152;
            }
        }
    } else {
        if (inputs[10] < 1.615) {
            var320 = 0.022546524;
        } else {
            var320 = 0.00047440443;
        }
    }
    double var321;
    if (inputs[23] < -35.493023) {
        if (inputs[11] < 0.35) {
            var321 = -0.023080785;
        } else {
            if (inputs[16] < -0.041323308) {
                var321 = 0.013136172;
            } else {
                var321 = -0.008934701;
            }
        }
    } else {
        if (inputs[20] < 1.0724006) {
            if (inputs[5] < 1913.09) {
                if (inputs[20] < 0.65576893) {
                    if (inputs[25] < 2.0631578) {
                        var321 = -0.010235463;
                    } else {
                        var321 = 0.010188419;
                    }
                } else {
                    var321 = 0.02488961;
                }
            } else {
                if (inputs[2] < 1.8742857) {
                    var321 = 0.0071802153;
                } else {
                    var321 = -0.016051123;
                }
            }
        } else {
            var321 = -0.010931416;
        }
    }
    double var322;
    if (inputs[21] < -2.3217247) {
        if (inputs[1] < 33.718754) {
            if (inputs[17] < 1.3955787) {
                if (inputs[1] < 27.259417) {
                    var322 = 0.021305868;
                } else {
                    var322 = -0.0013787512;
                }
            } else {
                var322 = -0.007604539;
            }
        } else {
            var322 = 0.021291075;
        }
    } else {
        if (inputs[24] < -8.892423) {
            var322 = -0.023586921;
        } else {
            if (inputs[20] < -0.34501442) {
                if (inputs[2] < 1.7664286) {
                    if (inputs[10] < 1.9575) {
                        var322 = -0.012842694;
                    } else {
                        var322 = 0.01299198;
                    }
                } else {
                    var322 = -0.026837444;
                }
            } else {
                if (inputs[25] < 2.8523908) {
                    if (inputs[17] < 1.5340065) {
                        var322 = 0.0217665;
                    } else {
                        var322 = 0.001984828;
                    }
                } else {
                    var322 = -0.011708539;
                }
            }
        }
    }
    double var323;
    if (inputs[14] < 0.727) {
        if (inputs[13] < 1894.76) {
            if (inputs[15] < -0.3987879) {
                if (inputs[10] < 1.8475) {
                    var323 = 0.0000020114785;
                } else {
                    var323 = -0.017279206;
                }
            } else {
                if (inputs[15] < -0.25133333) {
                    var323 = 0.018059269;
                } else {
                    if (inputs[9] < 4.67) {
                        var323 = 0.007747469;
                    } else {
                        var323 = -0.020006591;
                    }
                }
            }
        } else {
            if (inputs[14] < -0.755) {
                var323 = 0.02239535;
            } else {
                var323 = 0.0045229313;
            }
        }
    } else {
        if (inputs[14] < 0.832) {
            var323 = -0.021794958;
        } else {
            if (inputs[23] < 0.0) {
                var323 = 0.008249991;
            } else {
                var323 = -0.0096352855;
            }
        }
    }
    double var324;
    if (inputs[20] < -1.7698505) {
        var324 = -0.015124989;
    } else {
        if (inputs[12] < 1849.13) {
            if (inputs[2] < 1.9985714) {
                if (inputs[17] < 1.1380615) {
                    if (inputs[19] < 1.3379697) {
                        var324 = -0.0040541594;
                    } else {
                        var324 = 0.014683328;
                    }
                } else {
                    if (inputs[2] < 1.3507143) {
                        var324 = -0.0005948109;
                    } else {
                        var324 = -0.024670469;
                    }
                }
            } else {
                if (inputs[25] < 2.3162615) {
                    var324 = -0.0022515422;
                } else {
                    var324 = 0.018680178;
                }
            }
        } else {
            if (inputs[25] < 2.4323606) {
                if (inputs[21] < 1.3996278) {
                    var324 = 0.0026870002;
                } else {
                    var324 = 0.028651431;
                }
            } else {
                if (inputs[14] < -0.736) {
                    var324 = 0.015142756;
                } else {
                    var324 = -0.008617291;
                }
            }
        }
    }
    double var325;
    if (inputs[9] < 11.365) {
        if (inputs[9] < 7.13) {
            if (inputs[2] < 1.325) {
                if (inputs[23] < -39.6866) {
                    if (inputs[23] < -56.702133) {
                        var325 = 0.0026016708;
                    } else {
                        var325 = 0.02576696;
                    }
                } else {
                    if (inputs[10] < 1.505) {
                        var325 = -0.015655339;
                    } else {
                        var325 = 0.005213164;
                    }
                }
            } else {
                if (inputs[20] < -1.1626294) {
                    var325 = -0.023594009;
                } else {
                    if (inputs[23] < -37.702194) {
                        var325 = -0.021366347;
                    } else {
                        var325 = 0.0017082585;
                    }
                }
            }
        } else {
            if (inputs[2] < 2.1185715) {
                var325 = 0.0006571156;
            } else {
                var325 = 0.026190931;
            }
        }
    } else {
        var325 = -0.01949363;
    }
    double var326;
    if (inputs[3] < 1715.54) {
        if (inputs[18] < 1.3539162) {
            var326 = 0.0058986987;
        } else {
            var326 = -0.022038393;
        }
    } else {
        if (inputs[9] < 2.73) {
            if (inputs[14] < 0.412) {
                var326 = 0.0026098927;
            } else {
                var326 = -0.02175794;
            }
        } else {
            if (inputs[10] < 0.4925) {
                var326 = 0.019404326;
            } else {
                if (inputs[9] < 4.215) {
                    var326 = -0.016733786;
                } else {
                    if (inputs[20] < -1.1184866) {
                        var326 = 0.02101691;
                    } else {
                        var326 = -0.0005130312;
                    }
                }
            }
        }
    }
    double var327;
    if (inputs[24] < 25.472149) {
        if (inputs[16] < 0.2641203) {
            if (inputs[5] < 1842.8375) {
                if (inputs[13] < 1813.96) {
                    if (inputs[15] < -0.3987879) {
                        var327 = -0.008033436;
                    } else {
                        var327 = 0.004718606;
                    }
                } else {
                    var327 = -0.027499055;
                }
            } else {
                if (inputs[9] < 3.3) {
                    var327 = 0.02150959;
                } else {
                    if (inputs[18] < 1.568082) {
                        var327 = -0.017883345;
                    } else {
                        var327 = 0.009557098;
                    }
                }
            }
        } else {
            var327 = 0.015946012;
        }
    } else {
        var327 = -0.017487396;
    }
    double var328;
    if (inputs[18] < 2.8816252) {
        if (inputs[17] < 1.9122196) {
            if (inputs[1] < 28.362093) {
                var328 = 0.015017344;
            } else {
                if (inputs[1] < 31.394823) {
                    var328 = -0.020091726;
                } else {
                    if (inputs[17] < 1.394165) {
                        var328 = -0.0034927446;
                    } else {
                        var328 = 0.009780747;
                    }
                }
            }
        } else {
            var328 = -0.015828973;
        }
    } else {
        var328 = 0.012076559;
    }
    double var329;
    if (inputs[1] < 70.92806) {
        if (inputs[12] < 1942.07) {
            if (inputs[3] < 1862.555) {
                if (inputs[3] < 1844.935) {
                    if (inputs[13] < 1813.96) {
                        var329 = 0.0026779277;
                    } else {
                        var329 = -0.015271978;
                    }
                } else {
                    var329 = 0.018224126;
                }
            } else {
                if (inputs[18] < 1.5272669) {
                    var329 = -0.020891886;
                } else {
                    var329 = -0.000913392;
                }
            }
        } else {
            var329 = 0.0123130595;
        }
    } else {
        if (inputs[20] < -0.24402282) {
            var329 = 0.019302817;
        } else {
            var329 = -0.000968478;
        }
    }
    double var330;
    if (inputs[23] < 10.910757) {
        if (inputs[14] < 1.16) {
            if (inputs[15] < 0.4578788) {
                if (inputs[15] < 0.3798788) {
                    if (inputs[15] < 0.2969697) {
                        var330 = 0.0008987036;
                    } else {
                        var330 = -0.017913442;
                    }
                } else {
                    var330 = 0.018239353;
                }
            } else {
                var330 = -0.012782609;
            }
        } else {
            var330 = 0.015151518;
        }
    } else {
        var330 = -0.013114667;
    }
    double var331;
    if (inputs[23] < -63.956158) {
        var331 = -0.016651293;
    } else {
        if (inputs[21] < -3.593429) {
            var331 = 0.023305919;
        } else {
            if (inputs[20] < -1.7409832) {
                var331 = -0.017688677;
            } else {
                if (inputs[20] < -0.9081138) {
                    if (inputs[18] < 1.4149307) {
                        var331 = 0.024400836;
                    } else {
                        var331 = 0.0053130565;
                    }
                } else {
                    if (inputs[3] < 1665.805) {
                        var331 = 0.017795889;
                    } else {
                        var331 = -0.0023026136;
                    }
                }
            }
        }
    }
    double var332;
    if (inputs[1] < 26.495476) {
        var332 = 0.010757312;
    } else {
        if (inputs[15] < -0.3987879) {
            if (inputs[10] < 1.68) {
                var332 = -0.019343605;
            } else {
                var332 = 0.0012274515;
            }
        } else {
            if (inputs[15] < -0.2869091) {
                var332 = 0.017270384;
            } else {
                if (inputs[25] < 2.6420665) {
                    if (inputs[25] < 2.2597165) {
                        var332 = -0.0007508435;
                    } else {
                        var332 = -0.01977615;
                    }
                } else {
                    if (inputs[25] < 3.3075356) {
                        var332 = 0.011058826;
                    } else {
                        var332 = -0.0030435028;
                    }
                }
            }
        }
    }
    double var333;
    if (inputs[25] < 3.9062004) {
        if (inputs[10] < 5.0575) {
            if (inputs[10] < 3.19) {
                if (inputs[24] < -21.768507) {
                    var333 = 0.015959224;
                } else {
                    if (inputs[11] < 0.25) {
                        var333 = 0.016506987;
                    } else {
                        var333 = -0.0004712741;
                    }
                }
            } else {
                var333 = -0.017853776;
            }
        } else {
            var333 = 0.014729107;
        }
    } else {
        var333 = -0.010428169;
    }
    double var334;
    if (inputs[13] < 1779.85) {
        if (inputs[23] < -6.3145747) {
            if (inputs[25] < 3.4653466) {
                if (inputs[4] < 1668.655) {
                    var334 = -0.0088525;
                } else {
                    if (inputs[23] < -31.334112) {
                        var334 = -0.0017906226;
                    } else {
                        var334 = 0.023347009;
                    }
                }
            } else {
                var334 = -0.012761537;
            }
        } else {
            var334 = -0.017760733;
        }
    } else {
        if (inputs[13] < 1805.83) {
            var334 = 0.015481177;
        } else {
            if (inputs[3] < 1826.565) {
                var334 = -0.01907819;
            } else {
                if (inputs[24] < -9.013856) {
                    if (inputs[23] < -2.358174) {
                        var334 = -0.016572777;
                    } else {
                        var334 = 0.0072653745;
                    }
                } else {
                    if (inputs[8] < 1860.04) {
                        var334 = 0.02629858;
                    } else {
                        var334 = 0.0048542423;
                    }
                }
            }
        }
    }
    double var335;
    if (inputs[24] < -26.2384) {
        var335 = -0.02158744;
    } else {
        if (inputs[25] < 1.9720739) {
            if (inputs[8] < 1845.57) {
                var335 = 0.002019144;
            } else {
                var335 = 0.020986818;
            }
        } else {
            if (inputs[25] < 2.3162615) {
                var335 = -0.009621204;
            } else {
                if (inputs[20] < -0.9081138) {
                    if (inputs[15] < 0.2930303) {
                        var335 = 0.019292003;
                    } else {
                        var335 = 0.0031237022;
                    }
                } else {
                    if (inputs[25] < 2.4294116) {
                        var335 = 0.017506735;
                    } else {
                        var335 = -0.0023887544;
                    }
                }
            }
        }
    }
    double var336;
    if (inputs[20] < 1.1827226) {
        if (inputs[20] < 0.4305812) {
            if (inputs[15] < -0.3961212) {
                if (inputs[15] < -0.56218183) {
                    var336 = -0.004407315;
                } else {
                    var336 = -0.023177715;
                }
            } else {
                if (inputs[15] < 0.43066666) {
                    if (inputs[18] < 1.2363172) {
                        var336 = -0.0037552037;
                    } else {
                        var336 = 0.017036686;
                    }
                } else {
                    if (inputs[22] < 1.0) {
                        var336 = 0.0006712652;
                    } else {
                        var336 = -0.014766546;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.155) {
                var336 = 0.021002261;
            } else {
                var336 = 0.0011460418;
            }
        }
    } else {
        if (inputs[1] < 35.621807) {
            var336 = 0.0025802522;
        } else {
            var336 = -0.025331724;
        }
    }
    double var337;
    if (inputs[8] < 1965.13) {
        if (inputs[15] < 0.49248484) {
            if (inputs[25] < 3.2477732) {
                if (inputs[9] < 4.725) {
                    if (inputs[10] < 1.23) {
                        var337 = 0.0021012928;
                    } else {
                        var337 = -0.017023314;
                    }
                } else {
                    if (inputs[6] < 1853.395) {
                        var337 = 0.018505309;
                    } else {
                        var337 = -0.008569835;
                    }
                }
            } else {
                if (inputs[19] < 1.2613323) {
                    var337 = 0.007819064;
                } else {
                    if (inputs[21] < -3.5357788) {
                        var337 = -0.0037832921;
                    } else {
                        var337 = -0.021740653;
                    }
                }
            }
        } else {
            if (inputs[15] < 0.60048485) {
                var337 = 0.025935236;
            } else {
                var337 = 0.000054159744;
            }
        }
    } else {
        var337 = -0.013372361;
    }
    double var338;
    if (inputs[5] < 1664.2325) {
        var338 = -0.012953105;
    } else {
        if (inputs[18] < 1.1985592) {
            if (inputs[11] < 0.4) {
                var338 = -0.020202495;
            } else {
                var338 = 0.0045077307;
            }
        } else {
            if (inputs[2] < 1.4657143) {
                if (inputs[15] < -0.39169696) {
                    var338 = -0.00326279;
                } else {
                    if (inputs[16] < 0.11796992) {
                        var338 = 0.032840785;
                    } else {
                        var338 = 0.005187296;
                    }
                }
            } else {
                if (inputs[17] < 1.1727062) {
                    var338 = 0.013112846;
                } else {
                    if (inputs[10] < 0.48) {
                        var338 = 0.015780114;
                    } else {
                        var338 = -0.0068043973;
                    }
                }
            }
        }
    }
    double var339;
    if (inputs[24] < 18.969734) {
        if (inputs[13] < 1815.74) {
            if (inputs[12] < 1781.69) {
                if (inputs[10] < 1.155) {
                    if (inputs[24] < -6.4063554) {
                        var339 = 0.01711925;
                    } else {
                        var339 = -0.004615191;
                    }
                } else {
                    if (inputs[17] < 1.38704) {
                        var339 = -0.019835355;
                    } else {
                        var339 = 0.00019610937;
                    }
                }
            } else {
                var339 = 0.015826881;
            }
        } else {
            if (inputs[11] < 0.29) {
                var339 = -0.02207729;
            } else {
                if (inputs[13] < 1884.03) {
                    var339 = -0.012266354;
                } else {
                    if (inputs[9] < 4.35) {
                        var339 = -0.00031504035;
                    } else {
                        var339 = 0.021800656;
                    }
                }
            }
        }
    } else {
        if (inputs[3] < 1830.71) {
            var339 = -0.0008296723;
        } else {
            var339 = 0.027673095;
        }
    }
    double var340;
    if (inputs[13] < 1667.96) {
        var340 = 0.016432302;
    } else {
        if (inputs[24] < 18.969734) {
            if (inputs[8] < 1712.7) {
                var340 = -0.025303457;
            } else {
                if (inputs[19] < 2.0771122) {
                    if (inputs[25] < 3.4425182) {
                        var340 = -0.0033725398;
                    } else {
                        var340 = 0.015038748;
                    }
                } else {
                    if (inputs[3] < 1934.6) {
                        var340 = -0.021887582;
                    } else {
                        var340 = 0.0011561821;
                    }
                }
            }
        } else {
            if (inputs[14] < 0.801) {
                var340 = 0.019781724;
            } else {
                var340 = 0.0000013453975;
            }
        }
    }
    double var341;
    if (inputs[19] < 1.1199208) {
        var341 = 0.012392337;
    } else {
        if (inputs[4] < 1935.9) {
            if (inputs[14] < -0.594) {
                if (inputs[13] < 1834.2) {
                    if (inputs[9] < 4.78) {
                        var341 = -0.01559875;
                    } else {
                        var341 = 0.0024345606;
                    }
                } else {
                    var341 = -0.031047102;
                }
            } else {
                if (inputs[20] < 0.53802454) {
                    if (inputs[25] < 2.5411365) {
                        var341 = -0.016269632;
                    } else {
                        var341 = 0.0014737218;
                    }
                } else {
                    var341 = 0.014926287;
                }
            }
        } else {
            if (inputs[16] < -0.08757143) {
                var341 = 0.016494356;
            } else {
                var341 = 0.00080318167;
            }
        }
    }
    double var342;
    if (inputs[17] < 0.83912814) {
        var342 = -0.01713163;
    } else {
        if (inputs[19] < 2.7001708) {
            if (inputs[19] < 2.0664175) {
                if (inputs[4] < 1814.075) {
                    if (inputs[10] < 0.795) {
                        var342 = -0.019664858;
                    } else {
                        var342 = 0.0035614262;
                    }
                } else {
                    if (inputs[19] < 1.3542114) {
                        var342 = -0.005051064;
                    } else {
                        var342 = 0.012552585;
                    }
                }
            } else {
                var342 = -0.0151502015;
            }
        } else {
            if (inputs[6] < 1837.475) {
                var342 = 0.020390589;
            } else {
                var342 = -0.0023810198;
            }
        }
    }
    double var343;
    if (inputs[19] < 1.1199208) {
        var343 = 0.01545898;
    } else {
        if (inputs[24] < -18.488583) {
            if (inputs[16] < -0.17421053) {
                if (inputs[18] < 1.7713611) {
                    var343 = 0.01087049;
                } else {
                    var343 = -0.01588624;
                }
            } else {
                var343 = 0.024360385;
            }
        } else {
            if (inputs[17] < 1.1031845) {
                if (inputs[19] < 1.4847727) {
                    var343 = -0.00023864952;
                } else {
                    var343 = -0.021316519;
                }
            } else {
                if (inputs[16] < 0.21254887) {
                    if (inputs[10] < 2.79) {
                        var343 = 0.00018227258;
                    } else {
                        var343 = -0.021816682;
                    }
                } else {
                    var343 = 0.009676966;
                }
            }
        }
    }
    double var344;
    if (inputs[2] < 0.9671429) {
        var344 = 0.0179289;
    } else {
        if (inputs[23] < -35.493023) {
            if (inputs[23] < -47.24976) {
                var344 = -0.0032987334;
            } else {
                var344 = -0.02340524;
            }
        } else {
            if (inputs[14] < -1.185) {
                var344 = 0.014481917;
            } else {
                if (inputs[25] < 3.4425182) {
                    if (inputs[24] < -14.111691) {
                        var344 = -0.02053158;
                    } else {
                        var344 = 0.00026647703;
                    }
                } else {
                    var344 = 0.013508242;
                }
            }
        }
    }
    double var345;
    if (inputs[14] < -0.563) {
        if (inputs[16] < -0.17063157) {
            if (inputs[9] < 6.0375) {
                var345 = -0.02015216;
            } else {
                var345 = -0.002264359;
            }
        } else {
            if (inputs[6] < 1853.94) {
                if (inputs[5] < 1786.4475) {
                    var345 = 0.0027530654;
                } else {
                    var345 = 0.02393913;
                }
            } else {
                var345 = -0.0120782945;
            }
        }
    } else {
        if (inputs[19] < 1.196023) {
            var345 = -0.00273082;
        } else {
            if (inputs[24] < 25.472149) {
                if (inputs[23] < -29.362022) {
                    var345 = 0.030238086;
                } else {
                    if (inputs[1] < 61.282856) {
                        var345 = -0.0036913024;
                    } else {
                        var345 = 0.0127090085;
                    }
                }
            } else {
                var345 = -0.006637182;
            }
        }
    }
    double var346;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < 0.1893985) {
            if (inputs[5] < 1923.6274) {
                if (inputs[9] < 2.73) {
                    if (inputs[20] < -0.61608714) {
                        var346 = -0.024147108;
                    } else {
                        var346 = 0.00061028637;
                    }
                } else {
                    if (inputs[23] < -36.984165) {
                        var346 = -0.004191082;
                    } else {
                        var346 = 0.009757204;
                    }
                }
            } else {
                if (inputs[13] < 1941.72) {
                    var346 = -0.025287775;
                } else {
                    var346 = 0.00332292;
                }
            }
        } else {
            var346 = -0.01553502;
        }
    } else {
        if (inputs[3] < 1860.39) {
            var346 = 0.015722096;
        } else {
            var346 = 0.0020636888;
        }
    }
    double var347;
    if (inputs[5] < 1669.84) {
        var347 = -0.010776513;
    } else {
        if (inputs[5] < 1707.6025) {
            var347 = 0.018094916;
        } else {
            if (inputs[3] < 1932.205) {
                if (inputs[19] < 2.0771122) {
                    if (inputs[17] < 0.96067894) {
                        var347 = -0.016037673;
                    } else {
                        var347 = 0.0062063783;
                    }
                } else {
                    if (inputs[5] < 1837.4675) {
                        var347 = -0.003910967;
                    } else {
                        var347 = -0.028785069;
                    }
                }
            } else {
                if (inputs[22] < 1.0) {
                    var347 = -0.0011111386;
                } else {
                    var347 = 0.025609575;
                }
            }
        }
    }
    double var348;
    if (inputs[21] < -3.3781095) {
        var348 = -0.011767588;
    } else {
        if (inputs[5] < 1818.8975) {
            if (inputs[8] < 1712.04) {
                if (inputs[20] < -0.44777) {
                    var348 = 0.004305657;
                } else {
                    var348 = -0.012639031;
                }
            } else {
                if (inputs[25] < 2.3162615) {
                    var348 = -0.0013721165;
                } else {
                    if (inputs[9] < 6.19) {
                        var348 = 0.02471878;
                    } else {
                        var348 = 0.004430646;
                    }
                }
            }
        } else {
            if (inputs[13] < 1850.37) {
                var348 = -0.019058198;
            } else {
                if (inputs[14] < -0.827) {
                    var348 = 0.020482907;
                } else {
                    if (inputs[2] < 1.7807143) {
                        var348 = 0.0066464506;
                    } else {
                        var348 = -0.011770877;
                    }
                }
            }
        }
    }
    double var349;
    if (inputs[12] < 1839.26) {
        if (inputs[23] < -20.507849) {
            if (inputs[23] < -35.493023) {
                if (inputs[2] < 1.3507143) {
                    var349 = 0.0051499503;
                } else {
                    var349 = -0.021599613;
                }
            } else {
                var349 = 0.014812312;
            }
        } else {
            if (inputs[5] < 1786.4475) {
                var349 = -0.019939944;
            } else {
                var349 = -0.0006263424;
            }
        }
    } else {
        if (inputs[11] < 0.29) {
            if (inputs[4] < 1931.365) {
                var349 = -0.011784451;
            } else {
                var349 = 0.0035361375;
            }
        } else {
            if (inputs[25] < 2.2597165) {
                var349 = 0.021195149;
            } else {
                if (inputs[19] < 1.5229329) {
                    var349 = -0.0063055675;
                } else {
                    var349 = 0.020701885;
                }
            }
        }
    }
    double var350;
    if (inputs[14] < -1.185) {
        var350 = 0.012464663;
    } else {
        if (inputs[17] < 1.5340065) {
            if (inputs[17] < 1.394165) {
                if (inputs[9] < 2.4575) {
                    if (inputs[18] < 1.3521128) {
                        var350 = 0.001235628;
                    } else {
                        var350 = 0.023028253;
                    }
                } else {
                    if (inputs[23] < -20.966377) {
                        var350 = -0.009820926;
                    } else {
                        var350 = 0.004918588;
                    }
                }
            } else {
                var350 = 0.017610716;
            }
        } else {
            if (inputs[13] < 1894.76) {
                if (inputs[14] < 1.181) {
                    var350 = -0.007866341;
                } else {
                    var350 = 0.012128101;
                }
            } else {
                var350 = -0.021973832;
            }
        }
    }
    double var351;
    if (inputs[18] < 1.9960701) {
        if (inputs[16] < -0.19412781) {
            var351 = 0.012286591;
        } else {
            if (inputs[8] < 1695.86) {
                var351 = -0.019802144;
            } else {
                if (inputs[8] < 1726.94) {
                    var351 = 0.016462304;
                } else {
                    if (inputs[24] < -12.362671) {
                        var351 = -0.024543244;
                    } else {
                        var351 = 0.00014871906;
                    }
                }
            }
        }
    } else {
        if (inputs[11] < 0.29) {
            if (inputs[2] < 3.2471428) {
                var351 = -0.0071115633;
            } else {
                var351 = 0.021118255;
            }
        } else {
            var351 = 0.02027648;
        }
    }
    double var352;
    if (inputs[15] < -0.65) {
        var352 = 0.012771092;
    } else {
        if (inputs[15] < -0.3987879) {
            if (inputs[24] < -18.783993) {
                var352 = 0.0047761947;
            } else {
                var352 = -0.017325055;
            }
        } else {
            if (inputs[23] < 0.3177864) {
                if (inputs[25] < 3.2769408) {
                    if (inputs[25] < 1.9720739) {
                        var352 = 0.015655916;
                    } else {
                        var352 = -0.0050530727;
                    }
                } else {
                    if (inputs[18] < 1.1802728) {
                        var352 = -0.0040945867;
                    } else {
                        var352 = 0.022186864;
                    }
                }
            } else {
                var352 = -0.009893686;
            }
        }
    }
    double var353;
    if (inputs[20] < 1.0302223) {
        if (inputs[9] < 3.0) {
            if (inputs[11] < 0.38) {
                var353 = 0.017109636;
            } else {
                var353 = 0.00030585713;
            }
        } else {
            if (inputs[9] < 3.825) {
                var353 = -0.018563997;
            } else {
                if (inputs[20] < 0.7422704) {
                    if (inputs[20] < -0.44777) {
                        var353 = 0.006611593;
                    } else {
                        var353 = -0.009049356;
                    }
                } else {
                    var353 = 0.014919676;
                }
            }
        }
    } else {
        if (inputs[23] < -32.103245) {
            var353 = 0.0051981593;
        } else {
            var353 = -0.025118183;
        }
    }
    double var354;
    if (inputs[16] < 0.035654135) {
        if (inputs[17] < 1.9682418) {
            if (inputs[21] < -2.5398834) {
                if (inputs[21] < -2.9921925) {
                    if (inputs[16] < -0.239203) {
                        var354 = 0.021215111;
                    } else {
                        var354 = -0.0012646579;
                    }
                } else {
                    var354 = -0.017197292;
                }
            } else {
                if (inputs[16] < -0.1591203) {
                    var354 = 0.0024934444;
                } else {
                    if (inputs[16] < -0.05399248) {
                        var354 = 0.035220556;
                    } else {
                        var354 = 0.0037890824;
                    }
                }
            }
        } else {
            var354 = -0.014299464;
        }
    } else {
        if (inputs[15] < 0.25624242) {
            var354 = -0.024930548;
        } else {
            if (inputs[6] < 1726.36) {
                var354 = -0.019642944;
            } else {
                if (inputs[23] < 0.0) {
                    var354 = 0.015232368;
                } else {
                    if (inputs[20] < -0.30427587) {
                        var354 = -0.018167669;
                    } else {
                        var354 = 0.0098886285;
                    }
                }
            }
        }
    }
    double var355;
    if (inputs[2] < 2.0564287) {
        if (inputs[25] < 2.2597165) {
            var355 = 0.012947437;
        } else {
            if (inputs[3] < 1712.06) {
                var355 = 0.0089070005;
            } else {
                if (inputs[25] < 2.5868802) {
                    var355 = -0.019171098;
                } else {
                    if (inputs[19] < 1.1429343) {
                        var355 = -0.015575484;
                    } else {
                        var355 = 0.0015794152;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 61.282856) {
            if (inputs[1] < 37.129726) {
                var355 = -0.007637612;
            } else {
                var355 = -0.033621833;
            }
        } else {
            var355 = 0.0024611002;
        }
    }
    double var356;
    if (inputs[15] < 0.3798788) {
        if (inputs[15] < 0.30321214) {
            if (inputs[11] < 0.21) {
                var356 = 0.015205556;
            } else {
                if (inputs[24] < 10.990605) {
                    if (inputs[11] < 0.27) {
                        var356 = -0.018004492;
                    } else {
                        var356 = -0.00039882967;
                    }
                } else {
                    var356 = 0.013957686;
                }
            }
        } else {
            var356 = -0.019116625;
        }
    } else {
        if (inputs[1] < 74.73677) {
            if (inputs[20] < -0.8543823) {
                var356 = -0.00092816557;
            } else {
                if (inputs[19] < 2.1828222) {
                    var356 = 0.011351317;
                } else {
                    var356 = 0.031184137;
                }
            }
        } else {
            var356 = -0.0061705676;
        }
    }
    double var357;
    if (inputs[14] < -1.185) {
        var357 = 0.013207837;
    } else {
        if (inputs[9] < 2.2225) {
            if (inputs[2] < 1.53) {
                var357 = -0.024787392;
            } else {
                var357 = 0.0051974333;
            }
        } else {
            if (inputs[1] < 27.259417) {
                var357 = 0.015544319;
            } else {
                if (inputs[1] < 30.82347) {
                    var357 = -0.013322561;
                } else {
                    if (inputs[15] < -0.2869091) {
                        var357 = 0.0112496065;
                    } else {
                        var357 = -0.0008566112;
                    }
                }
            }
        }
    }
    double var358;
    if (inputs[10] < 4.7325) {
        if (inputs[14] < 0.993) {
            if (inputs[1] < 30.82347) {
                if (inputs[10] < 1.9) {
                    var358 = 0.0023071403;
                } else {
                    var358 = -0.017983243;
                }
            } else {
                if (inputs[14] < -0.906) {
                    var358 = 0.016024077;
                } else {
                    if (inputs[2] < 1.8114285) {
                        var358 = 0.005857237;
                    } else {
                        var358 = -0.009900642;
                    }
                }
            }
        } else {
            var358 = -0.01381867;
        }
    } else {
        var358 = 0.013354402;
    }
    double var359;
    if (inputs[17] < 2.5874202) {
        if (inputs[16] < 0.2694436) {
            if (inputs[16] < 0.12944362) {
                if (inputs[14] < 0.844) {
                    if (inputs[20] < 0.84939736) {
                        var359 = -0.0033654037;
                    } else {
                        var359 = 0.008321713;
                    }
                } else {
                    var359 = 0.015618842;
                }
            } else {
                if (inputs[20] < -0.67136014) {
                    var359 = 0.008344648;
                } else {
                    var359 = -0.023834858;
                }
            }
        } else {
            var359 = 0.01116451;
        }
    } else {
        var359 = -0.015105895;
    }
    double var360;
    if (inputs[15] < -0.71115154) {
        var360 = 0.017233742;
    } else {
        if (inputs[15] < -0.55) {
            var360 = -0.017352311;
        } else {
            if (inputs[14] < 0.696) {
                if (inputs[16] < 0.2733158) {
                    if (inputs[10] < 0.23) {
                        var360 = -0.012734122;
                    } else {
                        var360 = 0.005357761;
                    }
                } else {
                    var360 = 0.020370502;
                }
            } else {
                if (inputs[15] < 0.36539394) {
                    var360 = -0.016816143;
                } else {
                    if (inputs[10] < 1.2175) {
                        var360 = 0.008889433;
                    } else {
                        var360 = -0.010363268;
                    }
                }
            }
        }
    }
    double var361;
    if (inputs[15] < -0.71115154) {
        var361 = 0.016809115;
    } else {
        if (inputs[3] < 1727.94) {
            if (inputs[10] < 0.67) {
                var361 = -0.0060582934;
            } else {
                if (inputs[5] < 1668.7925) {
                    var361 = 0.0023236207;
                } else {
                    var361 = 0.022155767;
                }
            }
        } else {
            if (inputs[13] < 1769.16) {
                var361 = -0.018093847;
            } else {
                if (inputs[19] < 2.110528) {
                    if (inputs[19] < 1.8027071) {
                        var361 = 0.001421291;
                    } else {
                        var361 = 0.020929307;
                    }
                } else {
                    if (inputs[25] < 2.7837949) {
                        var361 = 0.000030887437;
                    } else {
                        var361 = -0.023316963;
                    }
                }
            }
        }
    }
    double var362;
    if (inputs[18] < 2.8816252) {
        if (inputs[19] < 1.1199208) {
            var362 = 0.00984202;
        } else {
            if (inputs[23] < -53.761097) {
                var362 = -0.017283646;
            } else {
                if (inputs[25] < 2.7594762) {
                    if (inputs[1] < 64.21748) {
                        var362 = -0.0020536035;
                    } else {
                        var362 = -0.017614359;
                    }
                } else {
                    if (inputs[15] < 0.32775757) {
                        var362 = 0.008062682;
                    } else {
                        var362 = -0.0043965797;
                    }
                }
            }
        }
    } else {
        var362 = 0.011229973;
    }
    double var363;
    if (inputs[20] < -0.5177981) {
        if (inputs[10] < 0.6925) {
            var363 = -0.02796903;
        } else {
            if (inputs[15] < 0.35036364) {
                if (inputs[11] < 0.34) {
                    var363 = 0.023606995;
                } else {
                    var363 = 0.0008853907;
                }
            } else {
                var363 = -0.008127614;
            }
        }
    } else {
        if (inputs[25] < 3.3727934) {
            if (inputs[16] < 0.23965414) {
                if (inputs[9] < 4.955) {
                    if (inputs[20] < -0.04057971) {
                        var363 = 0.027812408;
                    } else {
                        var363 = 0.0032267617;
                    }
                } else {
                    if (inputs[13] < 1829.68) {
                        var363 = 0.007075426;
                    } else {
                        var363 = -0.020520784;
                    }
                }
            } else {
                var363 = 0.021973286;
            }
        } else {
            if (inputs[19] < 1.4277356) {
                var363 = 0.009439202;
            } else {
                var363 = -0.016181227;
            }
        }
    }
    double var364;
    if (inputs[24] < 25.472149) {
        if (inputs[2] < 2.6864285) {
            if (inputs[1] < 72.143906) {
                if (inputs[3] < 1935.66) {
                    if (inputs[13] < 1835.06) {
                        var364 = 0.0010764308;
                    } else {
                        var364 = -0.014419207;
                    }
                } else {
                    var364 = 0.013267151;
                }
            } else {
                var364 = 0.014772975;
            }
        } else {
            if (inputs[6] < 1925.67) {
                var364 = 0.024639117;
            } else {
                var364 = 0.0010592403;
            }
        }
    } else {
        var364 = -0.018372776;
    }
    double var365;
    if (inputs[21] < -3.4881837) {
        var365 = 0.013535025;
    } else {
        if (inputs[3] < 1929.455) {
            if (inputs[12] < 1664.07) {
                var365 = 0.014378497;
            } else {
                if (inputs[14] < 0.55) {
                    if (inputs[15] < -0.25133333) {
                        var365 = -0.004844729;
                    } else {
                        var365 = -0.03091017;
                    }
                } else {
                    if (inputs[13] < 1852.78) {
                        var365 = -0.0060687405;
                    } else {
                        var365 = 0.01643962;
                    }
                }
            }
        } else {
            if (inputs[2] < 1.7892857) {
                var365 = 0.020250442;
            } else {
                var365 = 0.0018361761;
            }
        }
    }
    double var366;
    if (inputs[11] < 0.3) {
        if (inputs[25] < 2.3162615) {
            var366 = -0.018865911;
        } else {
            if (inputs[2] < 2.732143) {
                if (inputs[18] < 1.661657) {
                    var366 = 0.0031454887;
                } else {
                    var366 = -0.019701261;
                }
            } else {
                var366 = 0.0146081615;
            }
        }
    } else {
        if (inputs[20] < 1.5817401) {
            if (inputs[16] < -0.14364661) {
                if (inputs[19] < 1.5801452) {
                    var366 = -0.026756436;
                } else {
                    var366 = 0.010480081;
                }
            } else {
                if (inputs[15] < 0.2969697) {
                    if (inputs[17] < 1.4805945) {
                        var366 = 0.016950525;
                    } else {
                        var366 = -0.004752683;
                    }
                } else {
                    if (inputs[18] < 1.3965604) {
                        var366 = -0.017210966;
                    } else {
                        var366 = 0.004776924;
                    }
                }
            }
        } else {
            var366 = 0.019760385;
        }
    }
    double var367;
    if (inputs[15] < 0.3429091) {
        if (inputs[21] < -1.6590085) {
            if (inputs[24] < -25.921698) {
                var367 = -0.01360831;
            } else {
                if (inputs[24] < -21.768507) {
                    var367 = 0.019810313;
                } else {
                    if (inputs[1] < 34.038666) {
                        var367 = -0.0061627743;
                    } else {
                        var367 = 0.011085132;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.6525) {
                var367 = -0.02614035;
            } else {
                var367 = -0.0022831701;
            }
        }
    } else {
        if (inputs[18] < 1.4421706) {
            var367 = 0.024380343;
        } else {
            if (inputs[15] < 0.47775757) {
                var367 = -0.0105220005;
            } else {
                if (inputs[15] < 0.5761818) {
                    var367 = 0.01565729;
                } else {
                    var367 = -0.0007255213;
                }
            }
        }
    }
    double var368;
    if (inputs[9] < 2.985) {
        if (inputs[24] < -13.473006) {
            var368 = 0.025890967;
        } else {
            if (inputs[25] < 2.2597165) {
                var368 = 0.015577344;
            } else {
                var368 = -0.008915518;
            }
        }
    } else {
        if (inputs[25] < 2.334938) {
            if (inputs[17] < 1.3284427) {
                var368 = 0.0043123155;
            } else {
                var368 = -0.0197007;
            }
        } else {
            if (inputs[10] < 5.375) {
                if (inputs[16] < -0.239203) {
                    var368 = -0.021915069;
                } else {
                    if (inputs[16] < -0.12382707) {
                        var368 = 0.016565079;
                    } else {
                        var368 = -0.0005782559;
                    }
                }
            } else {
                var368 = 0.021688577;
            }
        }
    }
    double var369;
    if (inputs[19] < 1.0929826) {
        var369 = 0.015270166;
    } else {
        if (inputs[15] < 0.3481818) {
            if (inputs[16] < -0.06378947) {
                if (inputs[15] < -0.25381818) {
                    if (inputs[1] < 25.359453) {
                        var369 = -0.0068260864;
                    } else {
                        var369 = 0.009286667;
                    }
                } else {
                    var369 = -0.0136352265;
                }
            } else {
                if (inputs[16] < 0.16592482) {
                    var369 = -0.019384563;
                } else {
                    var369 = -0.00037346818;
                }
            }
        } else {
            if (inputs[18] < 1.4866812) {
                var369 = 0.021855101;
            } else {
                if (inputs[15] < 0.5062424) {
                    var369 = -0.011858608;
                } else {
                    if (inputs[15] < 0.6472727) {
                        var369 = 0.016969988;
                    } else {
                        var369 = -0.004102765;
                    }
                }
            }
        }
    }
    double var370;
    if (inputs[18] < 2.2016084) {
        if (inputs[2] < 0.96428573) {
            var370 = 0.019202767;
        } else {
            if (inputs[14] < -0.814) {
                if (inputs[15] < -0.3987879) {
                    var370 = -0.017762063;
                } else {
                    var370 = 0.0027164049;
                }
            } else {
                if (inputs[23] < 4.9678183) {
                    if (inputs[20] < -0.034633074) {
                        var370 = 0.013606887;
                    } else {
                        var370 = -0.00047106037;
                    }
                } else {
                    var370 = -0.010365383;
                }
            }
        }
    } else {
        if (inputs[14] < -0.873) {
            var370 = 0.0006389886;
        } else {
            var370 = -0.017272683;
        }
    }
    double var371;
    if (inputs[9] < 3.0) {
        if (inputs[13] < 1855.77) {
            if (inputs[2] < 1.5785714) {
                var371 = -0.010223178;
            } else {
                var371 = 0.014665087;
            }
        } else {
            var371 = 0.023523146;
        }
    } else {
        if (inputs[2] < 1.3192858) {
            if (inputs[25] < 3.3337195) {
                var371 = 0.017244149;
            } else {
                var371 = -0.0013014824;
            }
        } else {
            if (inputs[23] < -32.886917) {
                var371 = -0.020581;
            } else {
                if (inputs[23] < -19.73212) {
                    var371 = 0.008042047;
                } else {
                    if (inputs[9] < 4.67) {
                        var371 = -0.020681174;
                    } else {
                        var371 = -0.00048620513;
                    }
                }
            }
        }
    }
    double var372;
    if (inputs[15] < 0.30430302) {
        if (inputs[15] < 0.20787878) {
            if (inputs[16] < -0.21651128) {
                if (inputs[15] < -0.55) {
                    var372 = 0.00093746703;
                } else {
                    var372 = 0.021420982;
                }
            } else {
                if (inputs[16] < -0.17063157) {
                    var372 = -0.01717449;
                } else {
                    if (inputs[14] < -0.653) {
                        var372 = 0.010322513;
                    } else {
                        var372 = -0.011306904;
                    }
                }
            }
        } else {
            var372 = 0.026716027;
        }
    } else {
        if (inputs[17] < 1.0105919) {
            var372 = 0.009957641;
        } else {
            if (inputs[20] < -1.0853318) {
                var372 = -0.03017173;
            } else {
                if (inputs[16] < 0.15609023) {
                    var372 = 0.012988982;
                } else {
                    var372 = -0.0107020205;
                }
            }
        }
    }
    double var373;
    if (inputs[19] < 4.343226) {
        if (inputs[19] < 1.8027071) {
            if (inputs[11] < 0.41) {
                if (inputs[17] < 1.394165) {
                    if (inputs[14] < -0.667) {
                        var373 = -0.008042792;
                    } else {
                        var373 = -0.028441943;
                    }
                } else {
                    if (inputs[13] < 1813.96) {
                        var373 = -0.0054386174;
                    } else {
                        var373 = 0.00960413;
                    }
                }
            } else {
                if (inputs[16] < 0.014992481) {
                    var373 = 0.016951822;
                } else {
                    var373 = -0.00846021;
                }
            }
        } else {
            if (inputs[14] < -0.594) {
                var373 = -0.0062019886;
            } else {
                if (inputs[1] < 63.736034) {
                    var373 = 0.023310104;
                } else {
                    var373 = 0.0015377697;
                }
            }
        }
    } else {
        var373 = -0.018034963;
    }
    double var374;
    if (inputs[17] < 2.5874202) {
        if (inputs[2] < 2.67) {
            if (inputs[2] < 2.1771429) {
                if (inputs[17] < 0.9245842) {
                    var374 = 0.0140312705;
                } else {
                    if (inputs[2] < 1.08) {
                        var374 = -0.010778238;
                    } else {
                        var374 = 0.0047467165;
                    }
                }
            } else {
                var374 = -0.017399916;
            }
        } else {
            var374 = 0.012220603;
        }
    } else {
        var374 = -0.012510443;
    }
    double var375;
    if (inputs[14] < -1.315) {
        var375 = 0.013107687;
    } else {
        if (inputs[14] < -0.844) {
            if (inputs[2] < 1.6828572) {
                var375 = -0.022703685;
            } else {
                var375 = -0.0007409169;
            }
        } else {
            if (inputs[13] < 1667.96) {
                var375 = 0.01866024;
            } else {
                if (inputs[10] < 0.3275) {
                    var375 = -0.013220136;
                } else {
                    if (inputs[18] < 2.2422855) {
                        var375 = 0.0041245744;
                    } else {
                        var375 = -0.014963646;
                    }
                }
            }
        }
    }
    double var376;
    if (inputs[5] < 1942.015) {
        if (inputs[14] < 1.153) {
            if (inputs[19] < 2.3010995) {
                if (inputs[9] < 4.745) {
                    if (inputs[19] < 1.4808102) {
                        var376 = 0.0054000667;
                    } else {
                        var376 = -0.010745486;
                    }
                } else {
                    if (inputs[11] < 0.32) {
                        var376 = 0.02425984;
                    } else {
                        var376 = 0.0022316212;
                    }
                }
            } else {
                var376 = -0.009803644;
            }
        } else {
            var376 = 0.015717767;
        }
    } else {
        var376 = -0.018576333;
    }
    double var377;
    if (inputs[19] < 4.164137) {
        if (inputs[24] < 25.151962) {
            if (inputs[1] < 71.632515) {
                if (inputs[1] < 67.69596) {
                    if (inputs[21] < 2.334938) {
                        var377 = -0.0007474284;
                    } else {
                        var377 = 0.014545011;
                    }
                } else {
                    var377 = -0.01417272;
                }
            } else {
                var377 = 0.014738097;
            }
        } else {
            var377 = -0.012376125;
        }
    } else {
        var377 = -0.019230526;
    }
    double var378;
    if (inputs[19] < 3.9578204) {
        if (inputs[16] < 0.2694436) {
            if (inputs[16] < 0.19354135) {
                if (inputs[15] < 0.41484848) {
                    if (inputs[14] < 0.608) {
                        var378 = -0.00075629825;
                    } else {
                        var378 = 0.016588714;
                    }
                } else {
                    var378 = -0.011827403;
                }
            } else {
                var378 = -0.018698025;
            }
        } else {
            var378 = 0.013396841;
        }
    } else {
        var378 = -0.016169338;
    }
    double var379;
    if (inputs[10] < 4.7325) {
        if (inputs[11] < 0.29) {
            if (inputs[10] < 0.74) {
                var379 = 0.002555875;
            } else {
                var379 = -0.019751757;
            }
        } else {
            if (inputs[2] < 1.0707142) {
                var379 = -0.011226081;
            } else {
                if (inputs[24] < 12.462233) {
                    if (inputs[15] < -0.26) {
                        var379 = 0.0037704015;
                    } else {
                        var379 = -0.012132334;
                    }
                } else {
                    if (inputs[16] < 0.13930075) {
                        var379 = 0.018783756;
                    } else {
                        var379 = -0.0033750536;
                    }
                }
            }
        }
    } else {
        var379 = 0.0108456025;
    }
    double var380;
    if (inputs[8] < 1667.8) {
        var380 = 0.010530076;
    } else {
        if (inputs[19] < 2.0286694) {
            if (inputs[20] < -1.3344076) {
                var380 = 0.011941953;
            } else {
                if (inputs[15] < -0.2869091) {
                    if (inputs[2] < 1.3464285) {
                        var380 = -0.0049029277;
                    } else {
                        var380 = 0.016521635;
                    }
                } else {
                    if (inputs[9] < 4.4375) {
                        var380 = 0.0038830412;
                    } else {
                        var380 = -0.02848556;
                    }
                }
            }
        } else {
            if (inputs[23] < -18.223389) {
                var380 = -0.025657654;
            } else {
                if (inputs[25] < 2.525816) {
                    var380 = -0.012845395;
                } else {
                    var380 = 0.009058213;
                }
            }
        }
    }
    double var381;
    if (inputs[18] < 2.8816252) {
        if (inputs[11] < 0.36) {
            if (inputs[23] < -35.493023) {
                var381 = -0.021244824;
            } else {
                if (inputs[23] < -24.184532) {
                    var381 = 0.018329915;
                } else {
                    if (inputs[10] < 0.66) {
                        var381 = 0.0060789133;
                    } else {
                        var381 = -0.015314264;
                    }
                }
            }
        } else {
            if (inputs[20] < -1.1419783) {
                var381 = -0.009172215;
            } else {
                if (inputs[20] < 0.1593122) {
                    if (inputs[18] < 1.3219777) {
                        var381 = 0.025096362;
                    } else {
                        var381 = 0.006045413;
                    }
                } else {
                    if (inputs[16] < -0.041323308) {
                        var381 = 0.008929119;
                    } else {
                        var381 = -0.010572365;
                    }
                }
            }
        }
    } else {
        var381 = 0.0149124935;
    }
    double var382;
    if (inputs[25] < 2.4323606) {
        if (inputs[12] < 1931.8) {
            if (inputs[20] < -0.5177981) {
                var382 = -0.00972862;
            } else {
                if (inputs[24] < -7.1595545) {
                    var382 = -0.0061812554;
                } else {
                    var382 = 0.013160003;
                }
            }
        } else {
            var382 = 0.025701338;
        }
    } else {
        if (inputs[13] < 1943.89) {
            if (inputs[11] < 0.27) {
                if (inputs[16] < -0.20408271) {
                    var382 = 0.0014651236;
                } else {
                    var382 = 0.018358663;
                }
            } else {
                if (inputs[2] < 1.4407142) {
                    if (inputs[14] < 0.608) {
                        var382 = -0.0051522586;
                    } else {
                        var382 = 0.010407106;
                    }
                } else {
                    var382 = -0.015709741;
                }
            }
        } else {
            var382 = -0.020604908;
        }
    }
    double var383;
    if (inputs[14] < -0.685) {
        if (inputs[16] < -0.16803007) {
            if (inputs[10] < 1.42) {
                var383 = -0.019775037;
            } else {
                var383 = 0.0071118367;
            }
        } else {
            if (inputs[16] < -0.08642857) {
                var383 = 0.024584288;
            } else {
                var383 = -0.0050960053;
            }
        }
    } else {
        if (inputs[17] < 0.9943239) {
            if (inputs[2] < 1.445) {
                var383 = -0.0052093365;
            } else {
                var383 = 0.021411972;
            }
        } else {
            if (inputs[17] < 1.3070486) {
                if (inputs[23] < -18.51324) {
                    var383 = -0.003550962;
                } else {
                    var383 = -0.036930654;
                }
            } else {
                if (inputs[1] < 63.736034) {
                    var383 = 0.010057887;
                } else {
                    if (inputs[2] < 1.7664286) {
                        var383 = 0.0013105306;
                    } else {
                        var383 = -0.019188369;
                    }
                }
            }
        }
    }
    double var384;
    if (inputs[1] < 31.394823) {
        if (inputs[15] < -0.4562424) {
            var384 = 0.0016123106;
        } else {
            var384 = -0.014015813;
        }
    } else {
        if (inputs[10] < 0.545) {
            if (inputs[9] < 2.73) {
                var384 = 0.00013292629;
            } else {
                var384 = 0.018308364;
            }
        } else {
            if (inputs[11] < 0.42) {
                if (inputs[18] < 1.568082) {
                    if (inputs[18] < 1.2042425) {
                        var384 = 0.0024938441;
                    } else {
                        var384 = -0.019086381;
                    }
                } else {
                    if (inputs[15] < 0.60048485) {
                        var384 = 0.0081082545;
                    } else {
                        var384 = -0.009887139;
                    }
                }
            } else {
                var384 = 0.011746032;
            }
        }
    }
    double var385;
    if (inputs[5] < 1667.8676) {
        var385 = -0.0140998475;
    } else {
        if (inputs[15] < 0.42757577) {
            if (inputs[15] < 0.3481818) {
                if (inputs[9] < 2.2225) {
                    var385 = -0.010997236;
                } else {
                    if (inputs[25] < 2.368317) {
                        var385 = -0.0049633924;
                    } else {
                        var385 = 0.005873336;
                    }
                }
            } else {
                var385 = 0.015764069;
            }
        } else {
            if (inputs[21] < 2.7837949) {
                var385 = -0.028301166;
            } else {
                var385 = 0.006988502;
            }
        }
    }
    double var386;
    if (inputs[18] < 1.012366) {
        var386 = 0.014868941;
    } else {
        if (inputs[25] < 4.034082) {
            if (inputs[19] < 1.4164727) {
                if (inputs[3] < 1720.46) {
                    var386 = 0.009398959;
                } else {
                    if (inputs[1] < 34.498104) {
                        var386 = -0.029222688;
                    } else {
                        var386 = -0.006061968;
                    }
                }
            } else {
                if (inputs[19] < 1.658906) {
                    if (inputs[2] < 1.4471428) {
                        var386 = 0.01868799;
                    } else {
                        var386 = 0.0012693902;
                    }
                } else {
                    if (inputs[2] < 1.5607142) {
                        var386 = -0.01716901;
                    } else {
                        var386 = 0.0004964511;
                    }
                }
            }
        } else {
            var386 = 0.015998099;
        }
    }
    double var387;
    if (inputs[18] < 1.012366) {
        var387 = 0.018050749;
    } else {
        if (inputs[9] < 7.405) {
            if (inputs[2] < 1.1878572) {
                if (inputs[10] < 1.355) {
                    var387 = -0.020347863;
                } else {
                    var387 = 0.0029435656;
                }
            } else {
                if (inputs[20] < -1.4885291) {
                    var387 = -0.013513619;
                } else {
                    if (inputs[9] < 2.505) {
                        var387 = 0.018478092;
                    } else {
                        var387 = 0.0024106642;
                    }
                }
            }
        } else {
            if (inputs[2] < 2.6864285) {
                var387 = -0.021259515;
            } else {
                var387 = -0.0036480436;
            }
        }
    }
    double var388;
    if (inputs[2] < 1.2635714) {
        if (inputs[12] < 1712.35) {
            var388 = 0.008776159;
        } else {
            if (inputs[20] < 0.14538299) {
                var388 = -0.021709034;
            } else {
                var388 = -0.0008499575;
            }
        }
    } else {
        if (inputs[20] < 0.9026732) {
            if (inputs[2] < 1.6985714) {
                if (inputs[2] < 1.5585715) {
                    if (inputs[8] < 1812.01) {
                        var388 = 0.015255853;
                    } else {
                        var388 = -0.0032197533;
                    }
                } else {
                    var388 = 0.023764545;
                }
            } else {
                if (inputs[19] < 1.8107111) {
                    var388 = -0.013802226;
                } else {
                    if (inputs[20] < -0.8018117) {
                        var388 = -0.006332225;
                    } else {
                        var388 = 0.012798579;
                    }
                }
            }
        } else {
            if (inputs[19] < 1.7740611) {
                var388 = 0.0033873317;
            } else {
                var388 = -0.022428405;
            }
        }
    }
    double var389;
    if (inputs[2] < 0.9671429) {
        var389 = 0.017428268;
    } else {
        if (inputs[2] < 1.0985714) {
            var389 = -0.013880668;
        } else {
            if (inputs[20] < 0.08772628) {
                if (inputs[20] < -0.16443706) {
                    if (inputs[19] < 1.65015) {
                        var389 = -0.0041791103;
                    } else {
                        var389 = 0.007357616;
                    }
                } else {
                    var389 = 0.019649051;
                }
            } else {
                if (inputs[16] < 0.16383459) {
                    if (inputs[11] < 0.35) {
                        var389 = -0.0045444244;
                    } else {
                        var389 = 0.01016579;
                    }
                } else {
                    var389 = -0.023651468;
                }
            }
        }
    }
    double var390;
    if (inputs[24] < 25.472149) {
        if (inputs[17] < 0.9489573) {
            var390 = -0.01093665;
        } else {
            if (inputs[15] < -0.2869091) {
                if (inputs[17] < 1.2208292) {
                    var390 = 0.01946752;
                } else {
                    if (inputs[18] < 1.7805179) {
                        var390 = -0.00692243;
                    } else {
                        var390 = 0.010569176;
                    }
                }
            } else {
                if (inputs[14] < 0.813) {
                    if (inputs[9] < 3.22) {
                        var390 = 0.004675867;
                    } else {
                        var390 = -0.018659985;
                    }
                } else {
                    if (inputs[2] < 1.7664286) {
                        var390 = 0.017773632;
                    } else {
                        var390 = -0.0036362607;
                    }
                }
            }
        }
    } else {
        var390 = -0.016724005;
    }
    double var391;
    if (inputs[9] < 6.0675) {
        if (inputs[11] < 0.33) {
            if (inputs[24] < 9.025055) {
                var391 = -0.01873746;
            } else {
                var391 = 0.00045737583;
            }
        } else {
            if (inputs[20] < 0.7862127) {
                if (inputs[20] < -0.034633074) {
                    if (inputs[15] < 0.3481818) {
                        var391 = -0.0032387234;
                    } else {
                        var391 = 0.01691821;
                    }
                } else {
                    var391 = -0.016242832;
                }
            } else {
                if (inputs[14] < -0.706) {
                    var391 = 0.019077327;
                } else {
                    var391 = -0.00016680454;
                }
            }
        }
    } else {
        if (inputs[17] < 1.4130478) {
            if (inputs[20] < -0.4338425) {
                var391 = 0.017540356;
            } else {
                var391 = 0.011115279;
            }
        } else {
            if (inputs[2] < 2.6864285) {
                var391 = -0.009156579;
            } else {
                var391 = 0.009815286;
            }
        }
    }
    double var392;
    if (inputs[17] < 2.5874202) {
        if (inputs[24] < -20.653982) {
            if (inputs[24] < -25.921698) {
                var392 = 0.0021887277;
            } else {
                var392 = 0.02290684;
            }
        } else {
            if (inputs[17] < 2.020202) {
                if (inputs[8] < 1712.04) {
                    var392 = -0.010315585;
                } else {
                    if (inputs[2] < 1.7892857) {
                        var392 = 0.007480999;
                    } else {
                        var392 = -0.006937412;
                    }
                }
            } else {
                var392 = 0.01563569;
            }
        }
    } else {
        var392 = -0.010944567;
    }
    double var393;
    if (inputs[25] < 2.471551) {
        if (inputs[17] < 1.1304936) {
            var393 = 0.018366221;
        } else {
            if (inputs[25] < 2.3162615) {
                if (inputs[5] < 1827.1575) {
                    var393 = -0.014189627;
                } else {
                    var393 = 0.0041671703;
                }
            } else {
                var393 = 0.01433153;
            }
        }
    } else {
        if (inputs[25] < 3.021015) {
            if (inputs[3] < 1820.745) {
                var393 = 0.0005676696;
            } else {
                var393 = -0.025533738;
            }
        } else {
            if (inputs[19] < 1.3379697) {
                var393 = -0.007633932;
            } else {
                if (inputs[4] < 1715.68) {
                    var393 = -0.010011123;
                } else {
                    if (inputs[10] < 1.2175) {
                        var393 = 0.021535425;
                    } else {
                        var393 = 0.0035552694;
                    }
                }
            }
        }
    }
    double var394;
    if (inputs[25] < 4.08563) {
        if (inputs[24] < -17.368395) {
            if (inputs[9] < 4.8925) {
                var394 = -0.0018661586;
            } else {
                var394 = -0.020300115;
            }
        } else {
            if (inputs[23] < -54.118874) {
                var394 = -0.015402108;
            } else {
                if (inputs[14] < -0.706) {
                    if (inputs[21] < -2.3996015) {
                        var394 = 0.024142902;
                    } else {
                        var394 = -0.000514882;
                    }
                } else {
                    if (inputs[16] < 0.18570676) {
                        var394 = -0.0069868434;
                    } else {
                        var394 = 0.007958275;
                    }
                }
            }
        }
    } else {
        var394 = 0.016721964;
    }
    double var395;
    if (inputs[24] < 26.124598) {
        if (inputs[24] < 19.951187) {
            if (inputs[21] < 3.0345144) {
                if (inputs[21] < 2.030157) {
                    if (inputs[12] < 1687.86) {
                        var395 = 0.013548189;
                    } else {
                        var395 = -0.0038310192;
                    }
                } else {
                    var395 = 0.012326081;
                }
            } else {
                var395 = -0.020234281;
            }
        } else {
            var395 = 0.011530521;
        }
    } else {
        var395 = -0.016663242;
    }
    double var396;
    if (inputs[24] < 23.498146) {
        if (inputs[16] < -0.19412781) {
            if (inputs[11] < 0.27) {
                var396 = -0.0035881328;
            } else {
                var396 = 0.016658707;
            }
        } else {
            if (inputs[10] < 1.74) {
                if (inputs[23] < -36.984165) {
                    var396 = -0.014165101;
                } else {
                    if (inputs[23] < -19.73212) {
                        var396 = 0.019843368;
                    } else {
                        var396 = -0.00059920026;
                    }
                }
            } else {
                if (inputs[5] < 1852.1875) {
                    if (inputs[19] < 1.5133178) {
                        var396 = -0.009661419;
                    } else {
                        var396 = 0.009106627;
                    }
                } else {
                    var396 = -0.025495464;
                }
            }
        }
    } else {
        var396 = 0.012104176;
    }
    double var397;
    if (inputs[18] < 1.3073698) {
        if (inputs[18] < 1.1484094) {
            if (inputs[20] < -0.09276572) {
                var397 = 0.010182393;
            } else {
                var397 = -0.008500186;
            }
        } else {
            var397 = -0.017346807;
        }
    } else {
        if (inputs[17] < 1.037709) {
            var397 = 0.0178124;
        } else {
            if (inputs[25] < 2.3594332) {
                if (inputs[18] < 1.8450803) {
                    var397 = -0.023554318;
                } else {
                    if (inputs[11] < 0.29) {
                        var397 = -0.017356694;
                    } else {
                        var397 = 0.015192148;
                    }
                }
            } else {
                if (inputs[13] < 1737.78) {
                    var397 = 0.017716495;
                } else {
                    if (inputs[19] < 2.0286694) {
                        var397 = 0.008925028;
                    } else {
                        var397 = -0.011334575;
                    }
                }
            }
        }
    }
    double var398;
    if (inputs[20] < 0.4305812) {
        if (inputs[1] < 27.044325) {
            var398 = 0.011161175;
        } else {
            if (inputs[14] < -0.752) {
                var398 = 0.0060366066;
            } else {
                if (inputs[14] < 0.452) {
                    var398 = -0.01931577;
                } else {
                    if (inputs[13] < 1726.24) {
                        var398 = 0.013578837;
                    } else {
                        var398 = -0.0058293305;
                    }
                }
            }
        }
    } else {
        if (inputs[13] < 1779.85) {
            var398 = -0.0014849141;
        } else {
            if (inputs[23] < -8.969337) {
                var398 = -0.000062389474;
            } else {
                if (inputs[6] < 1921.19) {
                    var398 = 0.03748458;
                } else {
                    var398 = 0.00036231673;
                }
            }
        }
    }
    double var399;
    if (inputs[25] < 3.1514523) {
        if (inputs[14] < -1.185) {
            var399 = 0.02565243;
        } else {
            if (inputs[3] < 1820.745) {
                if (inputs[13] < 1773.17) {
                    if (inputs[2] < 1.5028571) {
                        var399 = 0.012052736;
                    } else {
                        var399 = -0.0049463455;
                    }
                } else {
                    var399 = 0.02603511;
                }
            } else {
                if (inputs[25] < 2.2714326) {
                    var399 = 0.005103767;
                } else {
                    if (inputs[3] < 1930.325) {
                        var399 = -0.025890674;
                    } else {
                        var399 = 0.0065612746;
                    }
                }
            }
        }
    } else {
        if (inputs[10] < 0.8875) {
            var399 = 0.0095108;
        } else {
            if (inputs[25] < 3.555118) {
                var399 = -0.022211233;
            } else {
                var399 = -0.0035463395;
            }
        }
    }
    double var400;
    if (inputs[25] < 3.9062004) {
        if (inputs[4] < 1719.46) {
            if (inputs[12] < 1664.07) {
                var400 = 0.0055496776;
            } else {
                var400 = -0.022519628;
            }
        } else {
            if (inputs[17] < 0.9943239) {
                var400 = 0.016598657;
            } else {
                if (inputs[25] < 2.6744187) {
                    if (inputs[6] < 1934.96) {
                        var400 = -0.010457998;
                    } else {
                        var400 = 0.012938934;
                    }
                } else {
                    if (inputs[6] < 1923.51) {
                        var400 = 0.011231958;
                    } else {
                        var400 = -0.009926066;
                    }
                }
            }
        }
    } else {
        var400 = -0.017574498;
    }
    double var401;
    if (inputs[15] < -0.2869091) {
        if (inputs[20] < 1.4213508) {
            if (inputs[15] < -0.4021818) {
                if (inputs[2] < 1.4764286) {
                    var401 = -0.013238455;
                } else {
                    if (inputs[20] < 0.1593122) {
                        var401 = 0.014710889;
                    } else {
                        var401 = -0.0027372695;
                    }
                }
            } else {
                var401 = 0.0154661;
            }
        } else {
            var401 = 0.018714271;
        }
    } else {
        if (inputs[20] < 0.11182756) {
            if (inputs[1] < 61.282856) {
                var401 = -0.011524431;
            } else {
                if (inputs[1] < 64.21748) {
                    var401 = 0.025973117;
                } else {
                    if (inputs[21] < 2.5932102) {
                        var401 = -0.016091619;
                    } else {
                        var401 = 0.0071833413;
                    }
                }
            }
        } else {
            if (inputs[11] < 0.37) {
                var401 = -0.016071316;
            } else {
                var401 = 0.00078732223;
            }
        }
    }
    double var402;
    if (inputs[19] < 3.9578204) {
        if (inputs[24] < -15.301786) {
            if (inputs[6] < 1726.36) {
                var402 = 0.024623027;
            } else {
                if (inputs[19] < 1.4164727) {
                    var402 = -0.009813665;
                } else {
                    var402 = 0.008755198;
                }
            }
        } else {
            if (inputs[10] < 2.4825) {
                if (inputs[9] < 4.725) {
                    if (inputs[15] < -0.3089697) {
                        var402 = -0.013438523;
                    } else {
                        var402 = 0.0013555093;
                    }
                } else {
                    var402 = 0.01231071;
                }
            } else {
                var402 = -0.01158658;
            }
        }
    } else {
        var402 = -0.020351991;
    }
    double var403;
    if (inputs[2] < 1.6985714) {
        if (inputs[23] < -34.595486) {
            if (inputs[21] < -2.946502) {
                var403 = -0.0036380168;
            } else {
                if (inputs[2] < 1.2114285) {
                    var403 = 0.027849458;
                } else {
                    var403 = 0.010381926;
                }
            }
        } else {
            if (inputs[13] < 1778.21) {
                var403 = -0.017383955;
            } else {
                if (inputs[10] < 0.85) {
                    var403 = -0.0055138348;
                } else {
                    if (inputs[13] < 1859.61) {
                        var403 = 0.019331984;
                    } else {
                        var403 = 0.0026570442;
                    }
                }
            }
        }
    } else {
        if (inputs[19] < 1.8369683) {
            var403 = -0.018813673;
        } else {
            if (inputs[19] < 2.2101338) {
                var403 = 0.01605987;
            } else {
                if (inputs[18] < 2.766253) {
                    var403 = -0.01590912;
                } else {
                    var403 = 0.002825381;
                }
            }
        }
    }
    double var404;
    if (inputs[15] < 0.6335152) {
        if (inputs[5] < 1926.6324) {
            if (inputs[3] < 1899.9) {
                if (inputs[20] < 1.1929622) {
                    if (inputs[19] < 1.160412) {
                        var404 = -0.0090759015;
                    } else {
                        var404 = 0.0060767;
                    }
                } else {
                    var404 = -0.0075089806;
                }
            } else {
                var404 = -0.014751526;
            }
        } else {
            if (inputs[25] < 2.6467662) {
                var404 = 0.019388787;
            } else {
                var404 = -0.0028971173;
            }
        }
    } else {
        var404 = -0.017009627;
    }
    double var405;
    if (inputs[23] < 1.182681) {
        if (inputs[21] < 3.4954956) {
            if (inputs[1] < 25.359453) {
                var405 = -0.011102226;
            } else {
                if (inputs[18] < 1.0600189) {
                    var405 = 0.021492608;
                } else {
                    if (inputs[20] < 0.69257766) {
                        var405 = -0.00079500827;
                    } else {
                        var405 = 0.0111713875;
                    }
                }
            }
        } else {
            var405 = -0.012955773;
        }
    } else {
        if (inputs[4] < 1933.555) {
            var405 = -0.019741833;
        } else {
            var405 = -0.0022118776;
        }
    }
    double var406;
    if (inputs[1] < 30.82347) {
        if (inputs[1] < 26.193537) {
            var406 = 0.006534858;
        } else {
            var406 = -0.021841262;
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[16] < -0.15118045) {
                var406 = 0.00081404235;
            } else {
                var406 = 0.020451343;
            }
        } else {
            if (inputs[1] < 57.8123) {
                var406 = -0.02079134;
            } else {
                if (inputs[18] < 1.2593713) {
                    var406 = -0.0066777086;
                } else {
                    if (inputs[14] < 0.696) {
                        var406 = 0.018251747;
                    } else {
                        var406 = 0.0037977367;
                    }
                }
            }
        }
    }
    double var407;
    if (inputs[14] < 0.641) {
        if (inputs[1] < 37.719723) {
            if (inputs[18] < 2.4188137) {
                if (inputs[6] < 1903.015) {
                    if (inputs[20] < 0.32226107) {
                        var407 = -0.016864894;
                    } else {
                        var407 = 0.0032858597;
                    }
                } else {
                    var407 = 0.013545474;
                }
            } else {
                var407 = 0.01773143;
            }
        } else {
            if (inputs[2] < 1.8407143) {
                var407 = -0.0015099787;
            } else {
                var407 = -0.025218628;
            }
        }
    } else {
        if (inputs[15] < 0.5062424) {
            if (inputs[16] < 0.12596993) {
                var407 = 0.015453388;
            } else {
                var407 = -0.008133112;
            }
        } else {
            var407 = 0.017781544;
        }
    }
    double var408;
    if (inputs[16] < 0.3573609) {
        if (inputs[23] < -32.103245) {
            if (inputs[20] < 0.38807276) {
                if (inputs[17] < 1.1827426) {
                    var408 = 0.012850179;
                } else {
                    var408 = -0.01381547;
                }
            } else {
                var408 = 0.01589041;
            }
        } else {
            if (inputs[5] < 1761.0675) {
                var408 = -0.015085995;
            } else {
                if (inputs[18] < 1.1702119) {
                    var408 = 0.0182414;
                } else {
                    if (inputs[24] < -23.626337) {
                        var408 = 0.016463194;
                    } else {
                        var408 = -0.005966514;
                    }
                }
            }
        }
    } else {
        var408 = -0.024114339;
    }
    double var409;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < 0.19440602) {
            if (inputs[25] < 2.471551) {
                if (inputs[17] < 1.1247827) {
                    var409 = 0.022424702;
                } else {
                    if (inputs[14] < -1.01) {
                        var409 = 0.01651319;
                    } else {
                        var409 = -0.008691404;
                    }
                }
            } else {
                if (inputs[17] < 0.96067894) {
                    var409 = -0.020274583;
                } else {
                    if (inputs[4] < 1791.09) {
                        var409 = 0.0074528106;
                    } else {
                        var409 = -0.0068000783;
                    }
                }
            }
        } else {
            var409 = -0.019407364;
        }
    } else {
        if (inputs[5] < 1842.8375) {
            var409 = 0.022631181;
        } else {
            var409 = -0.00035782336;
        }
    }
    double var410;
    if (inputs[3] < 1839.26) {
        if (inputs[14] < -0.834) {
            var410 = -0.018427461;
        } else {
            if (inputs[14] < -0.685) {
                var410 = 0.01529592;
            } else {
                if (inputs[23] < -32.626118) {
                    if (inputs[16] < 0.06320301) {
                        var410 = -0.0024580818;
                    } else {
                        var410 = 0.005923638;
                    }
                } else {
                    if (inputs[10] < 0.8425) {
                        var410 = -0.028436976;
                    } else {
                        var410 = -0.0049587414;
                    }
                }
            }
        }
    } else {
        if (inputs[5] < 1912.105) {
            if (inputs[23] < -14.196849) {
                var410 = 0.0006252042;
            } else {
                var410 = 0.025447;
            }
        } else {
            if (inputs[2] < 1.8742857) {
                var410 = 0.0047925715;
            } else {
                var410 = -0.01646372;
            }
        }
    }
    double var411;
    if (inputs[15] < 0.3798788) {
        if (inputs[15] < 0.2969697) {
            if (inputs[15] < 0.20787878) {
                if (inputs[17] < 0.96067894) {
                    var411 = -0.018146468;
                } else {
                    if (inputs[21] < -3.593429) {
                        var411 = 0.013711692;
                    } else {
                        var411 = -0.0020062272;
                    }
                }
            } else {
                var411 = 0.01853191;
            }
        } else {
            var411 = -0.015868887;
        }
    } else {
        if (inputs[23] < -22.89667) {
            var411 = 0.017234161;
        } else {
            if (inputs[19] < 2.0462637) {
                var411 = -0.017829835;
            } else {
                var411 = 0.012107891;
            }
        }
    }
    double var412;
    if (inputs[25] < 3.8830729) {
        if (inputs[11] < 0.23) {
            if (inputs[20] < 0.10010364) {
                var412 = 0.0015281885;
            } else {
                var412 = 0.020776415;
            }
        } else {
            if (inputs[17] < 1.2208292) {
                if (inputs[9] < 4.885) {
                    if (inputs[9] < 2.985) {
                        var412 = 0.010814021;
                    } else {
                        var412 = -0.007015279;
                    }
                } else {
                    var412 = 0.02050421;
                }
            } else {
                if (inputs[19] < 1.2613323) {
                    var412 = 0.009073186;
                } else {
                    if (inputs[3] < 1773.065) {
                        var412 = -0.021617435;
                    } else {
                        var412 = 0.00016686083;
                    }
                }
            }
        }
    } else {
        var412 = -0.009085807;
    }
    double var413;
    if (inputs[17] < 0.9489573) {
        var413 = -0.015938558;
    } else {
        if (inputs[3] < 1899.9) {
            if (inputs[16] < -0.17063157) {
                if (inputs[2] < 1.5785714) {
                    var413 = 0.0015989924;
                } else {
                    var413 = -0.012771327;
                }
            } else {
                if (inputs[16] < -0.041323308) {
                    var413 = 0.016689079;
                } else {
                    if (inputs[2] < 1.9821428) {
                        var413 = -0.0017955138;
                    } else {
                        var413 = 0.016423672;
                    }
                }
            }
        } else {
            if (inputs[14] < -0.755) {
                var413 = 0.0037557017;
            } else {
                var413 = -0.016875757;
            }
        }
    }
    double var414;
    if (inputs[14] < 0.696) {
        if (inputs[2] < 2.0564287) {
            if (inputs[19] < 1.3527143) {
                if (inputs[19] < 1.2010673) {
                    var414 = 0.006318192;
                } else {
                    var414 = -0.013522729;
                }
            } else {
                if (inputs[14] < -0.816) {
                    var414 = -0.0018850317;
                } else {
                    if (inputs[9] < 2.965) {
                        var414 = 0.028653461;
                    } else {
                        var414 = 0.011228135;
                    }
                }
            }
        } else {
            if (inputs[25] < 2.1050558) {
                var414 = -0.018845804;
            } else {
                var414 = 0.0024465448;
            }
        }
    } else {
        if (inputs[2] < 2.4714286) {
            if (inputs[2] < 1.4471428) {
                var414 = -0.0019028813;
            } else {
                var414 = -0.02671492;
            }
        } else {
            var414 = 0.011694131;
        }
    }
    double var415;
    if (inputs[6] < 1666.91) {
        var415 = -0.009378087;
    } else {
        if (inputs[5] < 1707.6025) {
            var415 = 0.016006324;
        } else {
            if (inputs[20] < 0.9026732) {
                if (inputs[13] < 1953.42) {
                    if (inputs[1] < 73.23786) {
                        var415 = 0.003009562;
                    } else {
                        var415 = 0.020157974;
                    }
                } else {
                    var415 = -0.009429705;
                }
            } else {
                if (inputs[11] < 0.35) {
                    var415 = -0.025906561;
                } else {
                    var415 = 0.004855483;
                }
            }
        }
    }
    double var416;
    if (inputs[15] < -0.54242426) {
        if (inputs[15] < -0.71115154) {
            var416 = 0.0022250186;
        } else {
            var416 = -0.0235221;
        }
    } else {
        if (inputs[20] < 0.8231325) {
            if (inputs[15] < -0.39169696) {
                var416 = -0.01633655;
            } else {
                if (inputs[15] < -0.296) {
                    var416 = 0.021524686;
                } else {
                    if (inputs[24] < 5.416885) {
                        var416 = -0.015587489;
                    } else {
                        var416 = 0.0020489779;
                    }
                }
            }
        } else {
            if (inputs[21] < -1.6925602) {
                var416 = 0.015779248;
            } else {
                var416 = -0.0043666624;
            }
        }
    }
    double var417;
    if (inputs[19] < 1.8369683) {
        if (inputs[9] < 5.75) {
            if (inputs[15] < 0.41733333) {
                if (inputs[9] < 2.3175) {
                    var417 = -0.010703235;
                } else {
                    if (inputs[8] < 1824.63) {
                        var417 = 0.015784202;
                    } else {
                        var417 = -0.0026983656;
                    }
                }
            } else {
                var417 = -0.015334418;
            }
        } else {
            var417 = -0.016384779;
        }
    } else {
        if (inputs[17] < 1.6396024) {
            if (inputs[13] < 1864.02) {
                var417 = 0.021029629;
            } else {
                var417 = -0.002436144;
            }
        } else {
            if (inputs[16] < 0.13461654) {
                var417 = -0.010812644;
            } else {
                var417 = 0.008040279;
            }
        }
    }
    double var418;
    if (inputs[20] < -1.3405008) {
        if (inputs[9] < 4.68) {
            var418 = -0.0023018268;
        } else {
            var418 = 0.017944502;
        }
    } else {
        if (inputs[15] < -0.55) {
            var418 = -0.012668382;
        } else {
            if (inputs[16] < 0.12944362) {
                if (inputs[14] < -0.835) {
                    var418 = -0.00723635;
                } else {
                    if (inputs[17] < 0.9764753) {
                        var418 = -0.0068797655;
                    } else {
                        var418 = 0.010892634;
                    }
                }
            } else {
                if (inputs[18] < 2.0769498) {
                    if (inputs[14] < 0.707) {
                        var418 = -0.0067395805;
                    } else {
                        var418 = -0.025397288;
                    }
                } else {
                    var418 = 0.010241278;
                }
            }
        }
    }
    double var419;
    if (inputs[19] < 1.4808102) {
        if (inputs[9] < 5.31) {
            if (inputs[3] < 1864.75) {
                if (inputs[17] < 1.0965656) {
                    var419 = 0.028192962;
                } else {
                    if (inputs[13] < 1766.29) {
                        var419 = 0.020404011;
                    } else {
                        var419 = -0.0012355238;
                    }
                }
            } else {
                var419 = -0.0042375005;
            }
        } else {
            var419 = -0.0070076953;
        }
    } else {
        if (inputs[10] < 4.7325) {
            if (inputs[20] < -0.07321377) {
                if (inputs[10] < 1.105) {
                    var419 = 0.011085717;
                } else {
                    var419 = -0.0057547446;
                }
            } else {
                if (inputs[2] < 1.53) {
                    var419 = -0.023179691;
                } else {
                    if (inputs[17] < 1.7418909) {
                        var419 = 0.0019759038;
                    } else {
                        var419 = -0.01539749;
                    }
                }
            }
        } else {
            var419 = 0.013098586;
        }
    }
    double var420;
    if (inputs[24] < 18.969734) {
        if (inputs[16] < 0.051766917) {
            if (inputs[19] < 1.1847426) {
                var420 = 0.01838756;
            } else {
                if (inputs[19] < 1.3652738) {
                    var420 = -0.011380275;
                } else {
                    if (inputs[16] < -0.2654737) {
                        var420 = -0.0033070147;
                    } else {
                        var420 = 0.0079932;
                    }
                }
            }
        } else {
            if (inputs[16] < 0.14938346) {
                var420 = -0.026316872;
            } else {
                if (inputs[24] < 11.700734) {
                    var420 = 0.011626873;
                } else {
                    var420 = -0.010874854;
                }
            }
        }
    } else {
        if (inputs[24] < 22.278522) {
            var420 = 0.02292677;
        } else {
            var420 = 0.0002875762;
        }
    }
    double var421;
    if (inputs[17] < 1.9122196) {
        if (inputs[16] < -0.041323308) {
            if (inputs[2] < 1.2821429) {
                if (inputs[12] < 1802.41) {
                    var421 = 0.011330101;
                } else {
                    var421 = -0.013704712;
                }
            } else {
                if (inputs[15] < -0.4398788) {
                    var421 = 0.023693731;
                } else {
                    var421 = 0.007622206;
                }
            }
        } else {
            if (inputs[24] < 6.0591626) {
                var421 = -0.015013299;
            } else {
                if (inputs[16] < 0.12944362) {
                    var421 = 0.010472739;
                } else {
                    if (inputs[14] < 0.727) {
                        var421 = 0.005544667;
                    } else {
                        var421 = -0.012722109;
                    }
                }
            }
        }
    } else {
        if (inputs[23] < -14.196849) {
            var421 = -0.018829696;
        } else {
            var421 = 0.005881216;
        }
    }
    double var422;
    if (inputs[16] < 0.2694436) {
        if (inputs[15] < -0.53818184) {
            if (inputs[20] < 0.28880712) {
                var422 = -0.0037086608;
            } else {
                var422 = -0.0254095;
            }
        } else {
            if (inputs[11] < 0.31) {
                if (inputs[8] < 1785.93) {
                    var422 = 0.018483158;
                } else {
                    var422 = 0.0020521728;
                }
            } else {
                if (inputs[2] < 1.7292857) {
                    if (inputs[9] < 3.82) {
                        var422 = 0.005580238;
                    } else {
                        var422 = -0.005433892;
                    }
                } else {
                    var422 = -0.015921764;
                }
            }
        }
    } else {
        if (inputs[23] < 0.0) {
            var422 = 0.010888537;
        } else {
            var422 = 0.019585803;
        }
    }
    double var423;
    if (inputs[18] < 3.397783) {
        if (inputs[11] < 0.21) {
            var423 = 0.0137082655;
        } else {
            if (inputs[20] < -0.005653874) {
                if (inputs[20] < -0.5083069) {
                    if (inputs[10] < 0.63) {
                        var423 = -0.013699812;
                    } else {
                        var423 = 0.0031722991;
                    }
                } else {
                    var423 = 0.011007556;
                }
            } else {
                if (inputs[20] < 0.535828) {
                    var423 = -0.018029308;
                } else {
                    if (inputs[23] < -29.847906) {
                        var423 = 0.010756656;
                    } else {
                        var423 = -0.011597626;
                    }
                }
            }
        }
    } else {
        var423 = -0.014296921;
    }
    double var424;
    if (inputs[18] < 1.5035175) {
        if (inputs[15] < 0.3481818) {
            if (inputs[3] < 1903.175) {
                if (inputs[17] < 1.2962098) {
                    if (inputs[16] < -0.08324812) {
                        var424 = 0.0016334193;
                    } else {
                        var424 = -0.018197201;
                    }
                } else {
                    var424 = -0.021860836;
                }
            } else {
                var424 = 0.0070867767;
            }
        } else {
            var424 = 0.010649951;
        }
    } else {
        if (inputs[2] < 1.3721429) {
            var424 = 0.015412437;
        } else {
            if (inputs[2] < 1.6571429) {
                var424 = -0.016931877;
            } else {
                if (inputs[17] < 1.67642) {
                    if (inputs[17] < 1.3638827) {
                        var424 = 0.005717646;
                    } else {
                        var424 = 0.020674717;
                    }
                } else {
                    if (inputs[15] < 0.4257576) {
                        var424 = 0.0039019661;
                    } else {
                        var424 = -0.010360857;
                    }
                }
            }
        }
    }
    double var425;
    if (inputs[16] < -0.32465413) {
        var425 = -0.0130652655;
    } else {
        if (inputs[18] < 1.568082) {
            if (inputs[24] < -18.783993) {
                var425 = 0.011384928;
            } else {
                if (inputs[18] < 1.1294512) {
                    var425 = 0.0065932414;
                } else {
                    if (inputs[15] < 0.3798788) {
                        var425 = -0.015267151;
                    } else {
                        var425 = 0.0062832623;
                    }
                }
            }
        } else {
            if (inputs[18] < 2.2016084) {
                if (inputs[10] < 0.8625) {
                    var425 = 0.00096327876;
                } else {
                    if (inputs[18] < 1.8482535) {
                        var425 = 0.02788249;
                    } else {
                        var425 = 0.01343377;
                    }
                }
            } else {
                if (inputs[18] < 2.8816252) {
                    var425 = -0.010532959;
                } else {
                    var425 = 0.006862447;
                }
            }
        }
    }
    double var426;
    if (inputs[18] < 1.5401887) {
        if (inputs[3] < 1930.325) {
            if (inputs[15] < -0.18915151) {
                if (inputs[17] < 1.1335008) {
                    var426 = -0.0034177788;
                } else {
                    var426 = -0.025270294;
                }
            } else {
                if (inputs[23] < -32.626118) {
                    var426 = 0.011271068;
                } else {
                    if (inputs[13] < 1816.88) {
                        var426 = -0.018337712;
                    } else {
                        var426 = 0.0027971196;
                    }
                }
            }
        } else {
            var426 = 0.010011244;
        }
    } else {
        if (inputs[9] < 11.365) {
            if (inputs[21] < -2.9117208) {
                var426 = -0.009413872;
            } else {
                if (inputs[15] < -0.5229697) {
                    var426 = 0.021612572;
                } else {
                    if (inputs[25] < 1.9440994) {
                        var426 = -0.006934111;
                    } else {
                        var426 = 0.0107197305;
                    }
                }
            }
        } else {
            var426 = -0.010989708;
        }
    }
    double var427;
    if (inputs[16] < -0.17063157) {
        if (inputs[3] < 1809.09) {
            var427 = -0.016828481;
        } else {
            if (inputs[14] < -0.834) {
                var427 = 0.009848098;
            } else {
                var427 = -0.008476076;
            }
        }
    } else {
        if (inputs[18] < 2.9643025) {
            if (inputs[19] < 2.2101338) {
                if (inputs[19] < 1.8369683) {
                    if (inputs[16] < -0.10088722) {
                        var427 = 0.010884901;
                    } else {
                        var427 = -0.0024458237;
                    }
                } else {
                    var427 = 0.018327313;
                }
            } else {
                var427 = -0.01201538;
            }
        } else {
            var427 = 0.015677018;
        }
    }
    double var428;
    if (inputs[24] < 25.472149) {
        if (inputs[13] < 1893.62) {
            if (inputs[9] < 4.745) {
                if (inputs[17] < 1.0105919) {
                    var428 = 0.007631431;
                } else {
                    if (inputs[23] < -19.498507) {
                        var428 = -0.0036626405;
                    } else {
                        var428 = -0.026282666;
                    }
                }
            } else {
                if (inputs[19] < 2.6437445) {
                    if (inputs[19] < 1.8428277) {
                        var428 = 0.00075691147;
                    } else {
                        var428 = 0.024045445;
                    }
                } else {
                    var428 = -0.011309805;
                }
            }
        } else {
            if (inputs[6] < 1924.28) {
                var428 = 0.028350618;
            } else {
                if (inputs[2] < 1.7892857) {
                    var428 = 0.012886567;
                } else {
                    var428 = -0.008803551;
                }
            }
        }
    } else {
        var428 = -0.014743382;
    }
    double var429;
    if (inputs[2] < 1.0507143) {
        var429 = -0.009533182;
    } else {
        if (inputs[25] < 2.3162615) {
            if (inputs[5] < 1827.1575) {
                var429 = -0.01512647;
            } else {
                if (inputs[17] < 1.4689125) {
                    var429 = 0.01685221;
                } else {
                    var429 = -0.008385667;
                }
            }
        } else {
            if (inputs[25] < 2.4260485) {
                var429 = 0.020962132;
            } else {
                if (inputs[25] < 2.6388013) {
                    var429 = -0.009657508;
                } else {
                    if (inputs[20] < -0.8277281) {
                        var429 = 0.013638578;
                    } else {
                        var429 = 0.0024769932;
                    }
                }
            }
        }
    }
    double var430;
    if (inputs[18] < 1.0786825) {
        var430 = -0.010550893;
    } else {
        if (inputs[13] < 1682.78) {
            var430 = 0.010048098;
        } else {
            if (inputs[15] < -0.3987879) {
                if (inputs[10] < 2.705) {
                    if (inputs[23] < -3.152488) {
                        var430 = -0.02303022;
                    } else {
                        var430 = -0.0023821243;
                    }
                } else {
                    var430 = 0.0050854157;
                }
            } else {
                if (inputs[14] < 0.412) {
                    if (inputs[1] < 34.988297) {
                        var430 = 0.00173872;
                    } else {
                        var430 = 0.024234077;
                    }
                } else {
                    if (inputs[2] < 1.4471428) {
                        var430 = 0.005931505;
                    } else {
                        var430 = -0.0075506624;
                    }
                }
            }
        }
    }
    double var431;
    if (inputs[20] < -0.27097872) {
        if (inputs[19] < 1.2010673) {
            var431 = -0.020040726;
        } else {
            if (inputs[15] < 0.4121212) {
                if (inputs[2] < 1.9157143) {
                    if (inputs[16] < -0.0726391) {
                        var431 = 0.00056887785;
                    } else {
                        var431 = 0.018781932;
                    }
                } else {
                    var431 = -0.0061922655;
                }
            } else {
                var431 = -0.010856731;
            }
        }
    } else {
        if (inputs[15] < 0.39175758) {
            if (inputs[21] < -2.6420665) {
                if (inputs[23] < -25.04989) {
                    var431 = -0.002302179;
                } else {
                    var431 = 0.022122111;
                }
            } else {
                if (inputs[25] < 1.943489) {
                    var431 = 0.014872424;
                } else {
                    if (inputs[20] < 0.54795927) {
                        var431 = -0.002004691;
                    } else {
                        var431 = -0.02007313;
                    }
                }
            }
        } else {
            var431 = 0.019256465;
        }
    }
    double var432;
    if (inputs[11] < 0.17) {
        var432 = 0.017850306;
    } else {
        if (inputs[17] < 0.93402356) {
            var432 = 0.012451951;
        } else {
            if (inputs[25] < 4.0183487) {
                if (inputs[25] < 3.3337195) {
                    if (inputs[13] < 1893.62) {
                        var432 = -0.0022908188;
                    } else {
                        var432 = 0.008759616;
                    }
                } else {
                    var432 = -0.013865105;
                }
            } else {
                var432 = 0.0140624875;
            }
        }
    }
    double var433;
    if (inputs[13] < 1667.96) {
        var433 = 0.013759282;
    } else {
        if (inputs[16] < -0.22264662) {
            var433 = -0.01296757;
        } else {
            if (inputs[11] < 0.34) {
                if (inputs[2] < 1.4407142) {
                    var433 = 0.022221096;
                } else {
                    if (inputs[19] < 1.8027071) {
                        var433 = -0.00960691;
                    } else {
                        var433 = 0.007860575;
                    }
                }
            } else {
                if (inputs[13] < 1845.64) {
                    if (inputs[11] < 0.39) {
                        var433 = -0.023562683;
                    } else {
                        var433 = -0.00036751502;
                    }
                } else {
                    if (inputs[11] < 0.39) {
                        var433 = 0.019644441;
                    } else {
                        var433 = -0.0051880395;
                    }
                }
            }
        }
    }
    double var434;
    if (inputs[11] < 0.44) {
        if (inputs[15] < 0.43066666) {
            if (inputs[9] < 5.695) {
                if (inputs[15] < 0.3481818) {
                    if (inputs[10] < 1.43) {
                        var434 = -0.00033787393;
                    } else {
                        var434 = 0.018311905;
                    }
                } else {
                    var434 = 0.021408714;
                }
            } else {
                if (inputs[10] < 3.645) {
                    if (inputs[20] < -0.07321377) {
                        var434 = -0.003017723;
                    } else {
                        var434 = -0.018046543;
                    }
                } else {
                    var434 = 0.0056037367;
                }
            }
        } else {
            if (inputs[9] < 3.7975) {
                var434 = -0.018906852;
            } else {
                var434 = 0.000018541;
            }
        }
    } else {
        var434 = -0.011715184;
    }
    double var435;
    if (inputs[20] < 0.28880712) {
        if (inputs[19] < 1.5862585) {
            if (inputs[16] < 0.14074436) {
                if (inputs[18] < 1.4082543) {
                    var435 = 0.00026859916;
                } else {
                    var435 = -0.023071783;
                }
            } else {
                var435 = 0.017355457;
            }
        } else {
            if (inputs[15] < -0.25381818) {
                var435 = 0.01911178;
            } else {
                if (inputs[24] < 19.300243) {
                    var435 = -0.004334788;
                } else {
                    var435 = 0.011935858;
                }
            }
        }
    } else {
        if (inputs[20] < 0.84939736) {
            var435 = -0.013915992;
        } else {
            if (inputs[5] < 1786.4475) {
                var435 = -0.009742291;
            } else {
                if (inputs[21] < -2.2965488) {
                    var435 = 0.012826916;
                } else {
                    var435 = -0.0024596334;
                }
            }
        }
    }
    double var436;
    if (inputs[25] < 1.9720739) {
        if (inputs[10] < 1.185) {
            var436 = 0.02193924;
        } else {
            var436 = -0.00027787697;
        }
    } else {
        if (inputs[4] < 1716.565) {
            if (inputs[20] < -0.27667353) {
                var436 = -0.00014113005;
            } else {
                var436 = -0.021206195;
            }
        } else {
            if (inputs[5] < 1923.6274) {
                if (inputs[23] < -36.490715) {
                    var436 = -0.0066495314;
                } else {
                    if (inputs[17] < 1.5406674) {
                        var436 = 0.0007654522;
                    } else {
                        var436 = 0.021020683;
                    }
                }
            } else {
                var436 = -0.0074423123;
            }
        }
    }
    double var437;
    if (inputs[24] < -25.921698) {
        var437 = -0.01771704;
    } else {
        if (inputs[24] < -20.653982) {
            var437 = 0.01723911;
        } else {
            if (inputs[13] < 1675.32) {
                var437 = 0.012339449;
            } else {
                if (inputs[11] < 0.36) {
                    if (inputs[19] < 1.8027071) {
                        var437 = -0.022561295;
                    } else {
                        var437 = 0.0007471478;
                    }
                } else {
                    if (inputs[9] < 4.725) {
                        var437 = -0.001642368;
                    } else {
                        var437 = 0.01378232;
                    }
                }
            }
        }
    }
    double var438;
    if (inputs[23] < -54.69902) {
        var438 = -0.011889483;
    } else {
        if (inputs[23] < -32.626118) {
            if (inputs[4] < 1718.505) {
                var438 = 0.024626087;
            } else {
                var438 = 0.0053425725;
            }
        } else {
            if (inputs[18] < 1.34489) {
                if (inputs[20] < -0.034633074) {
                    var438 = 0.0012522163;
                } else {
                    var438 = -0.02466666;
                }
            } else {
                if (inputs[16] < -0.18678947) {
                    var438 = -0.006947473;
                } else {
                    if (inputs[1] < 64.21748) {
                        var438 = 0.013380182;
                    } else {
                        var438 = 0.0017224838;
                    }
                }
            }
        }
    }
    double var439;
    if (inputs[1] < 61.282856) {
        if (inputs[10] < 0.9575) {
            if (inputs[14] < -0.835) {
                var439 = -0.010311859;
            } else {
                var439 = 0.009217244;
            }
        } else {
            if (inputs[15] < -0.29218182) {
                if (inputs[13] < 1779.85) {
                    var439 = -0.016287118;
                } else {
                    if (inputs[20] < 0.76225996) {
                        var439 = -0.007735359;
                    } else {
                        var439 = 0.010500155;
                    }
                }
            } else {
                var439 = -0.028351603;
            }
        }
    } else {
        if (inputs[1] < 63.736034) {
            var439 = 0.02695285;
        } else {
            if (inputs[9] < 4.725) {
                if (inputs[20] < 0.106602594) {
                    var439 = 0.0011522602;
                } else {
                    var439 = -0.020961415;
                }
            } else {
                if (inputs[10] < 3.655) {
                    if (inputs[24] < 20.648184) {
                        var439 = 0.019711131;
                    } else {
                        var439 = 0.0019917607;
                    }
                } else {
                    var439 = -0.005907585;
                }
            }
        }
    }
    double var440;
    if (inputs[17] < 0.96067894) {
        if (inputs[19] < 1.5801452) {
            var440 = -0.020786367;
        } else {
            var440 = 0.0013748097;
        }
    } else {
        if (inputs[19] < 1.1199208) {
            var440 = 0.015622569;
        } else {
            if (inputs[5] < 1675.4875) {
                var440 = -0.0115496265;
            } else {
                if (inputs[25] < 3.644769) {
                    if (inputs[2] < 1.2635714) {
                        var440 = -0.019639045;
                    } else {
                        var440 = 0.002139603;
                    }
                } else {
                    var440 = 0.011361281;
                }
            }
        }
    }
    double var441;
    if (inputs[24] < -25.801088) {
        var441 = -0.016359407;
    } else {
        if (inputs[24] < -20.653982) {
            var441 = 0.012314695;
        } else {
            if (inputs[19] < 1.1199208) {
                var441 = 0.012497588;
            } else {
                if (inputs[25] < 3.3872244) {
                    if (inputs[16] < 0.2641203) {
                        var441 = -0.0034826053;
                    } else {
                        var441 = 0.011893542;
                    }
                } else {
                    var441 = -0.012940974;
                }
            }
        }
    }
    double var442;
    if (inputs[20] < 0.1593122) {
        if (inputs[13] < 1854.9) {
            if (inputs[25] < 3.1700976) {
                if (inputs[23] < -27.927595) {
                    var442 = -0.011364132;
                } else {
                    if (inputs[17] < 1.4130478) {
                        var442 = 0.0006701651;
                    } else {
                        var442 = 0.022565482;
                    }
                }
            } else {
                var442 = -0.011677039;
            }
        } else {
            if (inputs[19] < 1.5631452) {
                var442 = -0.00030740365;
            } else {
                var442 = 0.018324815;
            }
        }
    } else {
        if (inputs[15] < -0.55) {
            var442 = -0.020698246;
        } else {
            if (inputs[18] < 1.4690953) {
                if (inputs[11] < 0.41) {
                    var442 = -0.02156736;
                } else {
                    var442 = 0.0008307658;
                }
            } else {
                if (inputs[24] < 7.5238104) {
                    var442 = 0.018172504;
                } else {
                    var442 = -0.0012990419;
                }
            }
        }
    }
    double var443;
    if (inputs[1] < 59.171814) {
        if (inputs[21] < -3.6396563) {
            var443 = 0.007009505;
        } else {
            if (inputs[24] < -16.179045) {
                if (inputs[16] < -0.18193233) {
                    var443 = -0.027654685;
                } else {
                    var443 = -0.006589847;
                }
            } else {
                if (inputs[14] < -0.706) {
                    var443 = 0.0067246757;
                } else {
                    var443 = -0.013867611;
                }
            }
        }
    } else {
        if (inputs[1] < 63.736034) {
            var443 = 0.014730121;
        } else {
            if (inputs[2] < 1.7264286) {
                if (inputs[6] < 1739.185) {
                    var443 = -0.009279461;
                } else {
                    if (inputs[18] < 1.3577441) {
                        var443 = 0.0007446353;
                    } else {
                        var443 = 0.019446619;
                    }
                }
            } else {
                var443 = -0.0075371573;
            }
        }
    }
    double var444;
    if (inputs[24] < 9.541509) {
        if (inputs[14] < 0.359) {
            if (inputs[2] < 1.2821429) {
                if (inputs[18] < 1.2435127) {
                    var444 = 0.0053603216;
                } else {
                    var444 = -0.019221086;
                }
            } else {
                if (inputs[1] < 34.081207) {
                    if (inputs[15] < -0.4398788) {
                        var444 = 0.0058420408;
                    } else {
                        var444 = -0.01428659;
                    }
                } else {
                    if (inputs[13] < 1837.94) {
                        var444 = -0.0005265906;
                    } else {
                        var444 = 0.029094977;
                    }
                }
            }
        } else {
            var444 = -0.01546325;
        }
    } else {
        if (inputs[16] < 0.15609023) {
            if (inputs[21] < 2.334938) {
                var444 = 0.0031094332;
            } else {
                var444 = 0.020612404;
            }
        } else {
            if (inputs[1] < 69.681725) {
                var444 = 0.015041318;
            } else {
                var444 = -0.009378123;
            }
        }
    }
    double var445;
    if (inputs[23] < -35.40706) {
        if (inputs[10] < 1.155) {
            var445 = 0.003167656;
        } else {
            var445 = -0.01608172;
        }
    } else {
        if (inputs[2] < 2.9728572) {
            if (inputs[4] < 1930.55) {
                if (inputs[17] < 1.3227305) {
                    if (inputs[5] < 1791.5825) {
                        var445 = -0.01600816;
                    } else {
                        var445 = 0.005106736;
                    }
                } else {
                    if (inputs[20] < 0.5199615) {
                        var445 = 0.002021228;
                    } else {
                        var445 = 0.02082581;
                    }
                }
            } else {
                var445 = 0.015328777;
            }
        } else {
            var445 = -0.010165896;
        }
    }
    double var446;
    if (inputs[3] < 1687.62) {
        if (inputs[3] < 1653.715) {
            var446 = 0.0019388384;
        } else {
            var446 = 0.023910621;
        }
    } else {
        if (inputs[23] < 6.9063735) {
            if (inputs[16] < -0.17063157) {
                if (inputs[21] < -2.8800974) {
                    var446 = -0.00522993;
                } else {
                    var446 = -0.02313665;
                }
            } else {
                if (inputs[17] < 0.9489573) {
                    var446 = -0.015734104;
                } else {
                    if (inputs[5] < 1912.105) {
                        var446 = 0.0051486297;
                    } else {
                        var446 = -0.014959679;
                    }
                }
            }
        } else {
            var446 = 0.010019119;
        }
    }
    double var447;
    if (inputs[24] < 25.151962) {
        if (inputs[1] < 72.38545) {
            if (inputs[3] < 1670.175) {
                var447 = -0.015941871;
            } else {
                if (inputs[13] < 1713.27) {
                    var447 = 0.012756715;
                } else {
                    if (inputs[2] < 1.2635714) {
                        var447 = -0.008853837;
                    } else {
                        var447 = 0.0005862065;
                    }
                }
            }
        } else {
            var447 = 0.01782998;
        }
    } else {
        var447 = -0.013804324;
    }
    double var448;
    if (inputs[19] < 2.144363) {
        if (inputs[10] < 0.22) {
            var448 = -0.009451301;
        } else {
            if (inputs[18] < 1.5751876) {
                if (inputs[18] < 1.4293709) {
                    if (inputs[23] < -2.358174) {
                        var448 = -0.0005889237;
                    } else {
                        var448 = 0.014725731;
                    }
                } else {
                    var448 = -0.016958114;
                }
            } else {
                if (inputs[18] < 1.751718) {
                    var448 = 0.024165776;
                } else {
                    var448 = 0.005326943;
                }
            }
        }
    } else {
        if (inputs[10] < 5.7875) {
            if (inputs[16] < -0.068789475) {
                var448 = -0.007298028;
            } else {
                var448 = -0.030114917;
            }
        } else {
            var448 = 0.011892943;
        }
    }
    double var449;
    if (inputs[13] < 1725.03) {
        if (inputs[25] < 3.2850122) {
            if (inputs[15] < -0.17866667) {
                var449 = 0.0046087117;
            } else {
                var449 = 0.021846266;
            }
        } else {
            var449 = -0.0013113619;
        }
    } else {
        if (inputs[25] < 3.689655) {
            if (inputs[24] < 23.25806) {
                if (inputs[23] < -8.969337) {
                    if (inputs[15] < -0.26) {
                        var449 = -0.002969321;
                    } else {
                        var449 = -0.021157501;
                    }
                } else {
                    if (inputs[17] < 2.0461183) {
                        var449 = -0.0005337024;
                    } else {
                        var449 = 0.014482433;
                    }
                }
            } else {
                var449 = 0.0182215;
            }
        } else {
            var449 = -0.017855845;
        }
    }
    double var450;
    if (inputs[21] < -2.3628435) {
        if (inputs[17] < 1.0674193) {
            var450 = -0.007411205;
        } else {
            if (inputs[9] < 5.8425) {
                if (inputs[10] < 0.8925) {
                    var450 = 0.00462225;
                } else {
                    var450 = 0.025419155;
                }
            } else {
                var450 = 0.0015414173;
            }
        }
    } else {
        if (inputs[20] < -0.4338425) {
            if (inputs[14] < 0.506) {
                var450 = -0.012037987;
            } else {
                if (inputs[21] < 2.5411365) {
                    var450 = -0.0037950252;
                } else {
                    var450 = 0.01584869;
                }
            }
        } else {
            if (inputs[10] < 1.16) {
                if (inputs[4] < 1839.86) {
                    var450 = -0.010914315;
                } else {
                    var450 = 0.012352928;
                }
            } else {
                if (inputs[16] < 0.10293985) {
                    var450 = -0.0118626;
                } else {
                    var450 = -0.026126176;
                }
            }
        }
    }
    double var451;
    if (inputs[15] < -0.68636364) {
        var451 = 0.017853847;
    } else {
        if (inputs[15] < -0.3961212) {
            if (inputs[8] < 1816.73) {
                var451 = -0.00055787334;
            } else {
                var451 = -0.022195445;
            }
        } else {
            if (inputs[15] < -0.2869091) {
                var451 = 0.01564329;
            } else {
                if (inputs[5] < 1712.2325) {
                    var451 = 0.009577711;
                } else {
                    if (inputs[10] < 0.975) {
                        var451 = 0.0051356563;
                    } else {
                        var451 = -0.0107931215;
                    }
                }
            }
        }
    }
    double var452;
    if (inputs[9] < 5.2025) {
        if (inputs[9] < 4.725) {
            if (inputs[14] < -0.632) {
                if (inputs[1] < 32.738472) {
                    var452 = -0.0036681225;
                } else {
                    var452 = 0.017270405;
                }
            } else {
                if (inputs[10] < 1.155) {
                    if (inputs[25] < 2.2597165) {
                        var452 = 0.014463713;
                    } else {
                        var452 = -0.0070283096;
                    }
                } else {
                    var452 = -0.015154857;
                }
            }
        } else {
            var452 = 0.01845798;
        }
    } else {
        if (inputs[9] < 6.0375) {
            var452 = -0.026730305;
        } else {
            if (inputs[19] < 1.6515522) {
                var452 = -0.015480946;
            } else {
                if (inputs[19] < 2.0921564) {
                    var452 = 0.019785395;
                } else {
                    if (inputs[5] < 1837.4675) {
                        var452 = 0.009039695;
                    } else {
                        var452 = -0.014636011;
                    }
                }
            }
        }
    }
    double var453;
    if (inputs[19] < 2.5699441) {
        if (inputs[16] < 0.2281203) {
            if (inputs[2] < 1.4335715) {
                if (inputs[13] < 1805.83) {
                    if (inputs[24] < -13.781551) {
                        var453 = 0.019790158;
                    } else {
                        var453 = 0.00534578;
                    }
                } else {
                    if (inputs[13] < 1882.85) {
                        var453 = -0.013982409;
                    } else {
                        var453 = 0.0098365825;
                    }
                }
            } else {
                if (inputs[10] < 1.365) {
                    if (inputs[10] < 0.8075) {
                        var453 = -0.0069346437;
                    } else {
                        var453 = 0.019017369;
                    }
                } else {
                    if (inputs[19] < 1.6925792) {
                        var453 = -0.022591399;
                    } else {
                        var453 = -0.00335555;
                    }
                }
            }
        } else {
            var453 = -0.015627453;
        }
    } else {
        if (inputs[17] < 1.572875) {
            var453 = 0.018729236;
        } else {
            if (inputs[3] < 1844.99) {
                var453 = -0.0027327316;
            } else {
                var453 = 0.006123621;
            }
        }
    }
    double var454;
    if (inputs[23] < -45.13154) {
        if (inputs[17] < 1.3103373) {
            var454 = 0.015843626;
        } else {
            var454 = 0.0002499011;
        }
    } else {
        if (inputs[15] < 0.5792121) {
            if (inputs[4] < 1761.285) {
                if (inputs[13] < 1682.78) {
                    var454 = -0.0019391439;
                } else {
                    var454 = -0.021273922;
                }
            } else {
                if (inputs[20] < 0.6004593) {
                    if (inputs[17] < 1.054571) {
                        var454 = 0.014770453;
                    } else {
                        var454 = 0.00071107456;
                    }
                } else {
                    if (inputs[14] < -0.742) {
                        var454 = 0.0035236436;
                    } else {
                        var454 = -0.018224372;
                    }
                }
            }
        } else {
            var454 = 0.010499954;
        }
    }
    double var455;
    if (inputs[19] < 1.3897288) {
        if (inputs[2] < 1.2035714) {
            if (inputs[2] < 0.9892857) {
                var455 = -0.0078927195;
            } else {
                var455 = 0.014013805;
            }
        } else {
            if (inputs[16] < -0.004045113) {
                var455 = -0.0030232617;
            } else {
                var455 = -0.027301094;
            }
        }
    } else {
        if (inputs[19] < 1.4670558) {
            var455 = 0.019619541;
        } else {
            if (inputs[3] < 1830.305) {
                if (inputs[9] < 6.0675) {
                    if (inputs[9] < 2.965) {
                        var455 = -0.000121361016;
                    } else {
                        var455 = -0.019795595;
                    }
                } else {
                    var455 = 0.0046557332;
                }
            } else {
                if (inputs[17] < 1.1144038) {
                    var455 = -0.0062371613;
                } else {
                    if (inputs[11] < 0.29) {
                        var455 = 0.0022005104;
                    } else {
                        var455 = 0.024703927;
                    }
                }
            }
        }
    }
    double var456;
    if (inputs[15] < 0.3798788) {
        if (inputs[15] < 0.30430302) {
            if (inputs[20] < -1.4698488) {
                var456 = 0.01727584;
            } else {
                if (inputs[9] < 2.4475) {
                    var456 = 0.010984906;
                } else {
                    if (inputs[23] < -23.573027) {
                        var456 = -0.012708104;
                    } else {
                        var456 = 0.0033973986;
                    }
                }
            }
        } else {
            var456 = -0.01622292;
        }
    } else {
        if (inputs[19] < 2.5699441) {
            if (inputs[19] < 1.658906) {
                var456 = 0.014616898;
            } else {
                var456 = -0.0075869183;
            }
        } else {
            var456 = 0.017410178;
        }
    }
    double var457;
    if (inputs[23] < -36.984165) {
        if (inputs[14] < -0.726) {
            var457 = -0.02423568;
        } else {
            var457 = 0.0010553483;
        }
    } else {
        if (inputs[18] < 3.0511932) {
            if (inputs[10] < 4.7325) {
                if (inputs[14] < -0.742) {
                    if (inputs[1] < 31.125147) {
                        var457 = -0.00015204206;
                    } else {
                        var457 = 0.02005009;
                    }
                } else {
                    if (inputs[14] < 0.55) {
                        var457 = -0.013526077;
                    } else {
                        var457 = 0.0059252116;
                    }
                }
            } else {
                var457 = 0.019642616;
            }
        } else {
            var457 = -0.010681051;
        }
    }
    double var458;
    if (inputs[23] < -39.6866) {
        if (inputs[2] < 1.3507143) {
            if (inputs[23] < -58.484043) {
                var458 = 0.005754801;
            } else {
                var458 = 0.02630911;
            }
        } else {
            var458 = -0.007998035;
        }
    } else {
        if (inputs[20] < 1.3536164) {
            if (inputs[20] < 0.84939736) {
                if (inputs[20] < 0.28880712) {
                    if (inputs[13] < 1771.07) {
                        var458 = -0.01140009;
                    } else {
                        var458 = 0.003540995;
                    }
                } else {
                    var458 = -0.015753208;
                }
            } else {
                var458 = 0.014729127;
            }
        } else {
            var458 = -0.018608833;
        }
    }
    double var459;
    if (inputs[1] < 66.34869) {
        if (inputs[12] < 1900.89) {
            if (inputs[23] < -35.493023) {
                if (inputs[20] < 0.38807276) {
                    var459 = -0.012961462;
                } else {
                    var459 = 0.0050208652;
                }
            } else {
                if (inputs[13] < 1792.66) {
                    if (inputs[19] < 1.6401807) {
                        var459 = -0.008047695;
                    } else {
                        var459 = 0.012857476;
                    }
                } else {
                    if (inputs[2] < 1.8057142) {
                        var459 = 0.033743467;
                    } else {
                        var459 = 0.0073455507;
                    }
                }
            }
        } else {
            if (inputs[8] < 1933.74) {
                var459 = -0.015498793;
            } else {
                var459 = 0.007396491;
            }
        }
    } else {
        if (inputs[18] < 1.4421706) {
            var459 = 0.0021744368;
        } else {
            if (inputs[14] < 1.016) {
                var459 = -0.02768717;
            } else {
                var459 = -0.0010160585;
            }
        }
    }
    double var460;
    if (inputs[16] < -0.31618798) {
        var460 = -0.01449487;
    } else {
        if (inputs[25] < 2.2597165) {
            if (inputs[2] < 2.0564287) {
                var460 = 0.015471849;
            } else {
                if (inputs[17] < 1.6942372) {
                    var460 = -0.005545377;
                } else {
                    var460 = 0.00654972;
                }
            }
        } else {
            if (inputs[24] < -19.664974) {
                var460 = 0.00922593;
            } else {
                if (inputs[13] < 1794.36) {
                    if (inputs[19] < 1.450696) {
                        var460 = -0.0018613787;
                    } else {
                        var460 = -0.025578972;
                    }
                } else {
                    if (inputs[10] < 0.4925) {
                        var460 = 0.015250418;
                    } else {
                        var460 = -0.0045217215;
                    }
                }
            }
        }
    }
    double var461;
    if (inputs[15] < 0.6229697) {
        if (inputs[10] < 0.39) {
            if (inputs[10] < 0.1625) {
                var461 = 0.0011913085;
            } else {
                var461 = -0.01589048;
            }
        } else {
            if (inputs[21] < 3.0345144) {
                if (inputs[14] < -0.594) {
                    if (inputs[2] < 1.3) {
                        var461 = 0.016381852;
                    } else {
                        var461 = -0.0030974876;
                    }
                } else {
                    if (inputs[15] < 0.2969697) {
                        var461 = 0.021997381;
                    } else {
                        var461 = 0.0015791544;
                    }
                }
            } else {
                var461 = -0.005773912;
            }
        }
    } else {
        var461 = -0.018094525;
    }
    double var462;
    if (inputs[17] < 0.83912814) {
        var462 = -0.015223387;
    } else {
        if (inputs[25] < 4.0183487) {
            if (inputs[23] < 10.910757) {
                if (inputs[14] < -0.609) {
                    if (inputs[19] < 1.2559031) {
                        var462 = 0.010422749;
                    } else {
                        var462 = -0.008664977;
                    }
                } else {
                    if (inputs[24] < 7.5238104) {
                        var462 = 0.021663569;
                    } else {
                        var462 = -0.00042462882;
                    }
                }
            } else {
                var462 = -0.015763512;
            }
        } else {
            var462 = 0.016407823;
        }
    }
    double var463;
    if (inputs[15] < -0.594) {
        var463 = 0.01316245;
    } else {
        if (inputs[14] < -0.835) {
            if (inputs[20] < 0.6413026) {
                var463 = -0.022558246;
            } else {
                var463 = 0.0035126593;
            }
        } else {
            if (inputs[18] < 2.2641952) {
                if (inputs[14] < -0.706) {
                    var463 = 0.0155707635;
                } else {
                    if (inputs[18] < 1.568082) {
                        var463 = -0.0019750122;
                    } else {
                        var463 = 0.01209363;
                    }
                }
            } else {
                var463 = -0.012330068;
            }
        }
    }
    double var464;
    if (inputs[21] < 2.3521504) {
        if (inputs[17] < 1.3576244) {
            if (inputs[21] < -3.4344738) {
                var464 = 0.014936774;
            } else {
                if (inputs[11] < 0.37) {
                    var464 = -0.016074859;
                } else {
                    if (inputs[23] < -26.356808) {
                        var464 = -0.007396571;
                    } else {
                        var464 = 0.017054893;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.16) {
                var464 = 0.0020927545;
            } else {
                if (inputs[14] < -1.034) {
                    var464 = -0.010495426;
                } else {
                    var464 = -0.029302664;
                }
            }
        }
    } else {
        if (inputs[18] < 1.5035175) {
            if (inputs[23] < -20.507849) {
                var464 = 0.010256088;
            } else {
                var464 = -0.011673391;
            }
        } else {
            if (inputs[9] < 5.0) {
                var464 = 0.0068401974;
            } else {
                var464 = 0.025922092;
            }
        }
    }
    double var465;
    if (inputs[21] < -3.2411575) {
        var465 = -0.009476963;
    } else {
        if (inputs[15] < -0.6610909) {
            var465 = 0.018944772;
        } else {
            if (inputs[23] < -32.103245) {
                if (inputs[10] < 1.155) {
                    var465 = 0.021094786;
                } else {
                    var465 = -0.0005937864;
                }
            } else {
                if (inputs[16] < 0.22166166) {
                    if (inputs[9] < 2.795) {
                        var465 = -0.020256419;
                    } else {
                        var465 = -0.0017936532;
                    }
                } else {
                    if (inputs[6] < 1839.16) {
                        var465 = 0.017088424;
                    } else {
                        var465 = 0.00020642384;
                    }
                }
            }
        }
    }
    double var466;
    if (inputs[5] < 1668.7925) {
        var466 = -0.008229193;
    } else {
        if (inputs[20] < 1.4468069) {
            if (inputs[14] < 0.641) {
                if (inputs[23] < 0.3177864) {
                    if (inputs[24] < -21.15462) {
                        var466 = 0.006527861;
                    } else {
                        var466 = -0.011088797;
                    }
                } else {
                    var466 = 0.009190242;
                }
            } else {
                if (inputs[1] < 67.69596) {
                    var466 = 0.018983109;
                } else {
                    if (inputs[3] < 1796.48) {
                        var466 = 0.016916031;
                    } else {
                        var466 = -0.012014738;
                    }
                }
            }
        } else {
            var466 = 0.0168969;
        }
    }
    double var467;
    if (inputs[16] < -0.17063157) {
        if (inputs[12] < 1776.72) {
            var467 = -0.020657443;
        } else {
            if (inputs[10] < 1.6525) {
                var467 = -0.010282021;
            } else {
                var467 = 0.008698676;
            }
        }
    } else {
        if (inputs[16] < 0.19354135) {
            if (inputs[14] < 0.641) {
                if (inputs[16] < 0.05006015) {
                    if (inputs[9] < 2.595) {
                        var467 = -0.0058629597;
                    } else {
                        var467 = 0.012449823;
                    }
                } else {
                    var467 = -0.018474264;
                }
            } else {
                if (inputs[10] < 1.4525) {
                    var467 = 0.019187178;
                } else {
                    var467 = 0.005010778;
                }
            }
        } else {
            if (inputs[20] < -0.72686684) {
                var467 = 0.0062986575;
            } else {
                if (inputs[10] < 1.03) {
                    var467 = 0.003108498;
                } else {
                    var467 = -0.023334304;
                }
            }
        }
    }
    double var468;
    if (inputs[24] < 25.151962) {
        if (inputs[24] < 19.88604) {
            if (inputs[23] < 10.910757) {
                if (inputs[8] < 1936.44) {
                    if (inputs[2] < 2.4435713) {
                        var468 = 0.0038157066;
                    } else {
                        var468 = -0.008113655;
                    }
                } else {
                    var468 = 0.015052534;
                }
            } else {
                var468 = -0.013101895;
            }
        } else {
            var468 = 0.019368736;
        }
    } else {
        var468 = -0.010801669;
    }
    double var469;
    if (inputs[17] < 2.5874202) {
        if (inputs[24] < -20.653982) {
            if (inputs[24] < -25.231743) {
                var469 = -0.0030988387;
            } else {
                var469 = 0.018913189;
            }
        } else {
            if (inputs[16] < 0.22516541) {
                if (inputs[22] < 1.0) {
                    if (inputs[25] < 2.0) {
                        var469 = 0.0076549207;
                    } else {
                        var469 = -0.0050085867;
                    }
                } else {
                    var469 = -0.015716113;
                }
            } else {
                if (inputs[21] < 3.0500233) {
                    var469 = 0.014316946;
                } else {
                    var469 = -0.003375132;
                }
            }
        }
    } else {
        var469 = -0.015094737;
    }
    double var470;
    if (inputs[9] < 1.8525) {
        var470 = -0.010951787;
    } else {
        if (inputs[9] < 2.4575) {
            var470 = 0.014170489;
        } else {
            if (inputs[16] < -0.239203) {
                var470 = -0.0098683685;
            } else {
                if (inputs[16] < -0.08324812) {
                    if (inputs[25] < 2.525816) {
                        var470 = 0.020556102;
                    } else {
                        var470 = 0.00077623513;
                    }
                } else {
                    if (inputs[1] < 60.9473) {
                        var470 = -0.021970239;
                    } else {
                        var470 = 0.002932396;
                    }
                }
            }
        }
    }
    double var471;
    if (inputs[9] < 11.0575) {
        if (inputs[2] < 0.9671429) {
            var471 = 0.019150797;
        } else {
            if (inputs[11] < 0.39) {
                if (inputs[18] < 1.3881196) {
                    if (inputs[20] < -0.19728385) {
                        var471 = 0.0038041666;
                    } else {
                        var471 = -0.01718632;
                    }
                } else {
                    if (inputs[14] < 0.993) {
                        var471 = 0.0149167795;
                    } else {
                        var471 = -0.0027180929;
                    }
                }
            } else {
                if (inputs[17] < 1.2962098) {
                    if (inputs[3] < 1827.035) {
                        var471 = 0.011589519;
                    } else {
                        var471 = -0.0077029034;
                    }
                } else {
                    var471 = -0.023137119;
                }
            }
        }
    } else {
        var471 = -0.0135901;
    }
    double var472;
    if (inputs[14] < 0.93) {
        if (inputs[25] < 1.7660819) {
            var472 = 0.011892124;
        } else {
            if (inputs[20] < -1.3344076) {
                var472 = 0.008889609;
            } else {
                if (inputs[10] < 3.8325) {
                    if (inputs[15] < -0.4398788) {
                        var472 = 0.008097954;
                    } else {
                        var472 = -0.008500701;
                    }
                } else {
                    var472 = -0.022850443;
                }
            }
        }
    } else {
        if (inputs[2] < 1.735) {
            var472 = 0.020418702;
        } else {
            var472 = 0.00048696596;
        }
    }
    double var473;
    if (inputs[20] < -1.1543432) {
        if (inputs[24] < 12.106855) {
            var473 = -0.026840791;
        } else {
            var473 = -0.0027624783;
        }
    } else {
        if (inputs[15] < -0.6342424) {
            var473 = 0.01665228;
        } else {
            if (inputs[8] < 1667.8) {
                var473 = 0.015613869;
            } else {
                if (inputs[25] < 2.2597165) {
                    if (inputs[23] < -1.9876205) {
                        var473 = -0.00021079874;
                    } else {
                        var473 = 0.0151790455;
                    }
                } else {
                    if (inputs[10] < 0.41) {
                        var473 = 0.006271992;
                    } else {
                        var473 = -0.009245481;
                    }
                }
            }
        }
    }
    double var474;
    if (inputs[23] < -35.40706) {
        if (inputs[18] < 1.3219777) {
            var474 = 0.005456099;
        } else {
            var474 = -0.016604919;
        }
    } else {
        if (inputs[23] < -29.362022) {
            var474 = 0.023730071;
        } else {
            if (inputs[25] < 1.8835075) {
                var474 = -0.0139980465;
            } else {
                if (inputs[14] < -0.742) {
                    if (inputs[24] < -16.809072) {
                        var474 = 0.0023389186;
                    } else {
                        var474 = 0.022378236;
                    }
                } else {
                    if (inputs[23] < -14.929883) {
                        var474 = -0.016165448;
                    } else {
                        var474 = 0.0028185442;
                    }
                }
            }
        }
    }
    double var475;
    if (inputs[18] < 3.1273727) {
        if (inputs[10] < 5.0575) {
            if (inputs[24] < -9.013856) {
                if (inputs[24] < -20.653982) {
                    var475 = 0.0051592323;
                } else {
                    if (inputs[16] < -0.13556391) {
                        var475 = -0.0023338883;
                    } else {
                        var475 = -0.020169495;
                    }
                }
            } else {
                if (inputs[13] < 1711.63) {
                    var475 = -0.006819208;
                } else {
                    if (inputs[16] < 0.19440602) {
                        var475 = 0.011790966;
                    } else {
                        var475 = -0.00033167683;
                    }
                }
            }
        } else {
            var475 = 0.017945908;
        }
    } else {
        var475 = -0.014864601;
    }
    double var476;
    if (inputs[25] < 3.964557) {
        if (inputs[16] < 0.2694436) {
            if (inputs[15] < 0.41733333) {
                if (inputs[24] < 5.416885) {
                    if (inputs[18] < 2.0385132) {
                        var476 = -0.010703317;
                    } else {
                        var476 = 0.005084432;
                    }
                } else {
                    var476 = 0.00800672;
                }
            } else {
                var476 = -0.015242175;
            }
        } else {
            var476 = 0.009982844;
        }
    } else {
        var476 = 0.013648115;
    }
    double var477;
    if (inputs[5] < 1887.76) {
        if (inputs[17] < 2.2499475) {
            if (inputs[14] < 0.914) {
                if (inputs[17] < 1.2055439) {
                    if (inputs[17] < 0.96067894) {
                        var477 = -0.0049717217;
                    } else {
                        var477 = 0.013926534;
                    }
                } else {
                    if (inputs[23] < -19.270708) {
                        var477 = 0.0036235957;
                    } else {
                        var477 = -0.016793296;
                    }
                }
            } else {
                var477 = 0.016568908;
            }
        } else {
            var477 = -0.010305343;
        }
    } else {
        if (inputs[4] < 1931.365) {
            var477 = -0.018582068;
        } else {
            if (inputs[25] < 2.6826775) {
                var477 = 0.016287133;
            } else {
                var477 = -0.0133416345;
            }
        }
    }
    double var478;
    if (inputs[14] < 0.641) {
        if (inputs[23] < -35.493023) {
            if (inputs[13] < 1713.77) {
                var478 = -0.0036136229;
            } else {
                var478 = -0.028387092;
            }
        } else {
            if (inputs[20] < -0.8543823) {
                var478 = 0.0076506063;
            } else {
                if (inputs[20] < -0.005653874) {
                    var478 = -0.0135010015;
                } else {
                    if (inputs[14] < -0.991) {
                        var478 = -0.012157764;
                    } else {
                        var478 = 0.0051309606;
                    }
                }
            }
        }
    } else {
        if (inputs[2] < 1.3421428) {
            var478 = 0.01336209;
        } else {
            if (inputs[2] < 1.9985714) {
                var478 = -0.011568318;
            } else {
                var478 = 0.010921393;
            }
        }
    }
    double var479;
    if (inputs[17] < 1.7418909) {
        if (inputs[16] < -0.041323308) {
            if (inputs[1] < 30.82347) {
                if (inputs[1] < 27.259417) {
                    var479 = 0.010368092;
                } else {
                    var479 = -0.010523171;
                }
            } else {
                if (inputs[19] < 1.4670558) {
                    var479 = 0.028281378;
                } else {
                    var479 = 0.008006309;
                }
            }
        } else {
            if (inputs[14] < 0.641) {
                if (inputs[16] < 0.16847369) {
                    var479 = -0.023006488;
                } else {
                    var479 = 0.002276535;
                }
            } else {
                if (inputs[1] < 71.35617) {
                    if (inputs[10] < 1.0175) {
                        var479 = 0.006584193;
                    } else {
                        var479 = 0.024640802;
                    }
                } else {
                    var479 = -0.0068850718;
                }
            }
        }
    } else {
        if (inputs[24] < -9.592173) {
            var479 = 0.0036642703;
        } else {
            var479 = -0.016281314;
        }
    }
    double var480;
    if (inputs[18] < 2.0385132) {
        if (inputs[8] < 1712.04) {
            if (inputs[12] < 1664.07) {
                var480 = -0.0018184122;
            } else {
                var480 = -0.023566741;
            }
        } else {
            if (inputs[11] < 0.4) {
                if (inputs[16] < -0.12787218) {
                    var480 = 0.005083654;
                } else {
                    if (inputs[18] < 1.3965604) {
                        var480 = -0.022031803;
                    } else {
                        var480 = -0.0019839532;
                    }
                }
            } else {
                if (inputs[9] < 4.105) {
                    var480 = -0.005587672;
                } else {
                    var480 = 0.022347247;
                }
            }
        }
    } else {
        if (inputs[25] < 2.7251277) {
            if (inputs[11] < 0.28) {
                var480 = -0.0074137333;
            } else {
                var480 = 0.0059534595;
            }
        } else {
            var480 = 0.01844181;
        }
    }
    double var481;
    if (inputs[17] < 0.9943239) {
        if (inputs[2] < 1.4764286) {
            var481 = -0.0016107569;
        } else {
            var481 = 0.02138891;
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[16] < -0.11335339) {
                if (inputs[9] < 6.0375) {
                    if (inputs[23] < -2.358174) {
                        var481 = -0.020120349;
                    } else {
                        var481 = 0.0007836566;
                    }
                } else {
                    var481 = 0.00938406;
                }
            } else {
                var481 = 0.02062004;
            }
        } else {
            if (inputs[25] < 3.021015) {
                if (inputs[8] < 1813.39) {
                    var481 = -0.0012213336;
                } else {
                    if (inputs[15] < 0.3798788) {
                        var481 = -0.034561127;
                    } else {
                        var481 = -0.01157472;
                    }
                }
            } else {
                if (inputs[18] < 1.5582554) {
                    var481 = -0.0045473417;
                } else {
                    var481 = 0.011438174;
                }
            }
        }
    }
    double var482;
    if (inputs[20] < -1.5872867) {
        var482 = -0.01231515;
    } else {
        if (inputs[9] < 2.505) {
            if (inputs[11] < 0.38) {
                var482 = 0.01881334;
            } else {
                var482 = -0.0006785848;
            }
        } else {
            if (inputs[9] < 3.17) {
                var482 = -0.012994839;
            } else {
                if (inputs[10] < 0.48) {
                    var482 = 0.01766404;
                } else {
                    if (inputs[11] < 0.37) {
                        var482 = -0.006781477;
                    } else {
                        var482 = 0.0083622085;
                    }
                }
            }
        }
    }
    double var483;
    if (inputs[18] < 1.1976143) {
        if (inputs[2] < 1.2035714) {
            var483 = 0.011665386;
        } else {
            var483 = -0.027161576;
        }
    } else {
        if (inputs[10] < 2.705) {
            if (inputs[10] < 1.43) {
                if (inputs[5] < 1818.8975) {
                    if (inputs[18] < 1.629514) {
                        var483 = 0.021229237;
                    } else {
                        var483 = 0.00081735256;
                    }
                } else {
                    if (inputs[19] < 1.5862585) {
                        var483 = -0.01706552;
                    } else {
                        var483 = 0.0072982563;
                    }
                }
            } else {
                if (inputs[18] < 1.8130751) {
                    var483 = -0.0005768784;
                } else {
                    var483 = -0.02005621;
                }
            }
        } else {
            if (inputs[24] < 8.700077) {
                var483 = 0.01721389;
            } else {
                var483 = -0.003984681;
            }
        }
    }
    double var484;
    if (inputs[5] < 1813.98) {
        if (inputs[8] < 1782.18) {
            if (inputs[21] < -2.3217247) {
                var484 = 0.009806851;
            } else {
                if (inputs[20] < -0.37495586) {
                    var484 = 0.0027710085;
                } else {
                    var484 = -0.016794847;
                }
            }
        } else {
            var484 = -0.020068405;
        }
    } else {
        if (inputs[19] < 1.2641958) {
            var484 = -0.01112283;
        } else {
            if (inputs[4] < 1844.99) {
                var484 = 0.021148046;
            } else {
                if (inputs[1] < 32.795147) {
                    var484 = -0.009356962;
                } else {
                    if (inputs[19] < 1.9153448) {
                        var484 = 0.014585402;
                    } else {
                        var484 = -0.0020348341;
                    }
                }
            }
        }
    }
    double var485;
    if (inputs[17] < 0.9943239) {
        if (inputs[20] < -0.2025137) {
            var485 = 0.001400158;
        } else {
            var485 = 0.019554613;
        }
    } else {
        if (inputs[5] < 1713.6725) {
            if (inputs[6] < 1666.91) {
                var485 = -0.0017954415;
            } else {
                var485 = 0.016919455;
            }
        } else {
            if (inputs[3] < 1795.83) {
                var485 = -0.017375892;
            } else {
                if (inputs[9] < 4.47) {
                    if (inputs[19] < 1.4735361) {
                        var485 = -0.0040442715;
                    } else {
                        var485 = 0.016693536;
                    }
                } else {
                    if (inputs[9] < 6.2225) {
                        var485 = -0.016615758;
                    } else {
                        var485 = 0.0011199573;
                    }
                }
            }
        }
    }
    double var486;
    if (inputs[24] < 25.472149) {
        if (inputs[16] < 0.21254887) {
            if (inputs[20] < -1.0704633) {
                if (inputs[9] < 4.14) {
                    var486 = -0.017292006;
                } else {
                    var486 = 0.004937536;
                }
            } else {
                if (inputs[11] < 0.36) {
                    if (inputs[17] < 1.3323122) {
                        var486 = -0.014143553;
                    } else {
                        var486 = 0.0068547763;
                    }
                } else {
                    if (inputs[15] < -0.18915151) {
                        var486 = 0.0017685931;
                    } else {
                        var486 = 0.01824894;
                    }
                }
            }
        } else {
            if (inputs[18] < 1.7295618) {
                var486 = 0.019494468;
            } else {
                var486 = 0.006941055;
            }
        }
    } else {
        var486 = -0.014823243;
    }
    double var487;
    if (inputs[1] < 61.282856) {
        if (inputs[1] < 36.326664) {
            if (inputs[18] < 1.4568651) {
                if (inputs[3] < 1808.22) {
                    var487 = 0.0038156998;
                } else {
                    var487 = -0.019038178;
                }
            } else {
                if (inputs[24] < -16.129517) {
                    if (inputs[15] < -0.55496967) {
                        var487 = -0.009786531;
                    } else {
                        var487 = 0.017287988;
                    }
                } else {
                    var487 = 0.016704675;
                }
            }
        } else {
            if (inputs[9] < 2.4475) {
                var487 = -0.0011553824;
            } else {
                var487 = -0.025123954;
            }
        }
    } else {
        if (inputs[2] < 2.152857) {
            if (inputs[2] < 1.45) {
                if (inputs[20] < -0.4338425) {
                    var487 = 0.01868087;
                } else {
                    var487 = -0.0036333974;
                }
            } else {
                if (inputs[24] < 15.376207) {
                    var487 = 0.0020414132;
                } else {
                    var487 = -0.014195023;
                }
            }
        } else {
            var487 = 0.015427308;
        }
    }
    double var488;
    if (inputs[5] < 1781.945) {
        if (inputs[19] < 1.2559031) {
            var488 = 0.00412726;
        } else {
            if (inputs[2] < 1.9985714) {
                if (inputs[20] < -0.07321377) {
                    var488 = -0.0096874;
                } else {
                    var488 = -0.028293222;
                }
            } else {
                var488 = 0.0028778831;
            }
        }
    } else {
        if (inputs[4] < 1803.93) {
            var488 = 0.016568182;
        } else {
            if (inputs[2] < 1.7892857) {
                if (inputs[2] < 1.5521429) {
                    if (inputs[20] < -0.11844581) {
                        var488 = 0.007976995;
                    } else {
                        var488 = -0.008246428;
                    }
                } else {
                    var488 = 0.017829234;
                }
            } else {
                if (inputs[18] < 2.5222814) {
                    var488 = -0.015105179;
                } else {
                    var488 = 0.0050725415;
                }
            }
        }
    }
    double var489;
    if (inputs[19] < 3.3177214) {
        if (inputs[13] < 1921.61) {
            if (inputs[10] < 0.2475) {
                var489 = -0.015093818;
            } else {
                if (inputs[13] < 1893.62) {
                    if (inputs[4] < 1844.99) {
                        var489 = 0.0028897692;
                    } else {
                        var489 = -0.016709723;
                    }
                } else {
                    var489 = 0.019899193;
                }
            }
        } else {
            var489 = -0.011339636;
        }
    } else {
        var489 = 0.012008115;
    }
    double var490;
    if (inputs[20] < -1.2425932) {
        if (inputs[3] < 1814.065) {
            var490 = -0.022690685;
        } else {
            var490 = -0.0024699543;
        }
    } else {
        if (inputs[24] < -25.683517) {
            var490 = -0.013536769;
        } else {
            if (inputs[16] < -0.18002255) {
                if (inputs[24] < -16.555937) {
                    var490 = 0.023048518;
                } else {
                    var490 = 0.0055823824;
                }
            } else {
                if (inputs[8] < 1824.63) {
                    if (inputs[4] < 1761.285) {
                        var490 = -0.004159797;
                    } else {
                        var490 = 0.018886678;
                    }
                } else {
                    if (inputs[10] < 1.615) {
                        var490 = 0.0011776618;
                    } else {
                        var490 = -0.014507822;
                    }
                }
            }
        }
    }
    double var491;
    if (inputs[10] < 2.105) {
        if (inputs[15] < -0.56218183) {
            var491 = 0.018149072;
        } else {
            if (inputs[14] < -0.869) {
                var491 = -0.011402224;
            } else {
                if (inputs[16] < -0.041323308) {
                    if (inputs[16] < -0.13228571) {
                        var491 = 0.0064571416;
                    } else {
                        var491 = 0.025190622;
                    }
                } else {
                    if (inputs[16] < 0.05710526) {
                        var491 = -0.009968397;
                    } else {
                        var491 = 0.007938225;
                    }
                }
            }
        }
    } else {
        if (inputs[10] < 2.9375) {
            var491 = -0.019409088;
        } else {
            if (inputs[11] < 0.27) {
                var491 = -0.0046373247;
            } else {
                var491 = 0.009997947;
            }
        }
    }
    double var492;
    if (inputs[17] < 0.86311066) {
        var492 = -0.01819669;
    } else {
        if (inputs[19] < 1.222446) {
            if (inputs[24] < -5.0908914) {
                var492 = 0.017136889;
            } else {
                var492 = 0.002357132;
            }
        } else {
            if (inputs[19] < 1.65015) {
                if (inputs[10] < 1.75) {
                    if (inputs[10] < 0.8075) {
                        var492 = -0.011671047;
                    } else {
                        var492 = 0.0066731684;
                    }
                } else {
                    var492 = -0.03142497;
                }
            } else {
                if (inputs[17] < 1.1727062) {
                    var492 = 0.014841045;
                } else {
                    if (inputs[5] < 1707.6025) {
                        var492 = 0.0115547;
                    } else {
                        var492 = -0.0042752605;
                    }
                }
            }
        }
    }
    double var493;
    if (inputs[19] < 1.160412) {
        var493 = -0.01079756;
    } else {
        if (inputs[25] < 2.3162615) {
            if (inputs[9] < 3.455) {
                var493 = 0.0034091068;
            } else {
                var493 = -0.014623048;
            }
        } else {
            if (inputs[24] < 25.151962) {
                if (inputs[2] < 1.1321429) {
                    var493 = 0.01893685;
                } else {
                    if (inputs[20] < -0.018309461) {
                        var493 = -0.001944917;
                    } else {
                        var493 = 0.0093668355;
                    }
                }
            } else {
                var493 = -0.012620031;
            }
        }
    }
    double var494;
    if (inputs[15] < -0.65) {
        var494 = 0.013861146;
    } else {
        if (inputs[23] < -32.103245) {
            if (inputs[9] < 4.725) {
                var494 = -0.0008355967;
            } else {
                var494 = 0.01327861;
            }
        } else {
            if (inputs[4] < 1761.285) {
                var494 = -0.012694637;
            } else {
                if (inputs[6] < 1952.795) {
                    if (inputs[20] < 0.4787216) {
                        var494 = -0.0021821472;
                    } else {
                        var494 = 0.011037276;
                    }
                } else {
                    var494 = -0.012127608;
                }
            }
        }
    }
    double var495;
    if (inputs[19] < 1.1353892) {
        var495 = -0.016033718;
    } else {
        if (inputs[15] < -0.39169696) {
            if (inputs[1] < 32.96693) {
                if (inputs[21] < -2.9628253) {
                    var495 = -0.006911035;
                } else {
                    var495 = 0.012868819;
                }
            } else {
                var495 = -0.015316767;
            }
        } else {
            if (inputs[16] < 0.19874436) {
                if (inputs[1] < 65.03897) {
                    if (inputs[15] < -0.31369698) {
                        var495 = 0.016388873;
                    } else {
                        var495 = 0.00025294433;
                    }
                } else {
                    var495 = 0.019825647;
                }
            } else {
                if (inputs[14] < 0.679) {
                    var495 = 0.010935095;
                } else {
                    var495 = -0.01450181;
                }
            }
        }
    }
    double var496;
    if (inputs[10] < 1.185) {
        if (inputs[17] < 1.4250249) {
            if (inputs[9] < 2.4125) {
                var496 = 0.010534996;
            } else {
                if (inputs[21] < 2.0631578) {
                    var496 = -0.014114696;
                } else {
                    var496 = 0.001757061;
                }
            }
        } else {
            var496 = 0.01498137;
        }
    } else {
        if (inputs[3] < 1703.815) {
            var496 = -0.02027037;
        } else {
            if (inputs[2] < 1.2035714) {
                var496 = 0.013946816;
            } else {
                if (inputs[2] < 2.4021428) {
                    if (inputs[2] < 1.5785714) {
                        var496 = -0.007404275;
                    } else {
                        var496 = -0.024113772;
                    }
                } else {
                    var496 = 0.003918158;
                }
            }
        }
    }
    double var497;
    if (inputs[1] < 35.795807) {
        if (inputs[1] < 30.82347) {
            if (inputs[1] < 26.495476) {
                var497 = 0.007871314;
            } else {
                var497 = -0.009069576;
            }
        } else {
            if (inputs[14] < -0.844) {
                var497 = 0.0062690824;
            } else {
                var497 = 0.016618129;
            }
        }
    } else {
        if (inputs[20] < 1.163589) {
            if (inputs[20] < 0.535828) {
                if (inputs[19] < 1.9153448) {
                    if (inputs[17] < 1.2920061) {
                        var497 = 0.008724823;
                    } else {
                        var497 = -0.0078123715;
                    }
                } else {
                    var497 = -0.0118061155;
                }
            } else {
                var497 = 0.011245545;
            }
        } else {
            var497 = -0.017887484;
        }
    }
    double var498;
    if (inputs[1] < 74.73677) {
        if (inputs[16] < 0.2641203) {
            if (inputs[10] < 3.19) {
                if (inputs[9] < 6.0675) {
                    if (inputs[10] < 0.8075) {
                        var498 = -0.0030139827;
                    } else {
                        var498 = 0.005933784;
                    }
                } else {
                    var498 = 0.01641007;
                }
            } else {
                var498 = -0.006266844;
            }
        } else {
            var498 = 0.016217025;
        }
    } else {
        var498 = -0.01316206;
    }
    double var499;
    if (inputs[13] < 1654.76) {
        var499 = 0.0140685225;
    } else {
        if (inputs[15] < -0.5891515) {
            var499 = 0.008814402;
        } else {
            if (inputs[1] < 34.348347) {
                if (inputs[9] < 4.67) {
                    var499 = -0.028193817;
                } else {
                    var499 = -0.0018607085;
                }
            } else {
                if (inputs[16] < 0.03225564) {
                    if (inputs[8] < 1845.57) {
                        var499 = -0.0018213982;
                    } else {
                        var499 = 0.018835954;
                    }
                } else {
                    if (inputs[20] < 0.6004593) {
                        var499 = -0.000536784;
                    } else {
                        var499 = -0.01908905;
                    }
                }
            }
        }
    }
    double var500;
    if (inputs[14] < -0.685) {
        if (inputs[1] < 28.362093) {
            var500 = -0.005296101;
        } else {
            if (inputs[21] < -2.3657753) {
                var500 = 0.019849313;
            } else {
                var500 = 0.0021124184;
            }
        }
    } else {
        if (inputs[23] < 0.3177864) {
            if (inputs[14] < -0.412) {
                var500 = -0.011845581;
            } else {
                if (inputs[1] < 64.21748) {
                    var500 = 0.015088317;
                } else {
                    if (inputs[2] < 1.2035714) {
                        var500 = 0.011155277;
                    } else {
                        var500 = -0.0076116724;
                    }
                }
            }
        } else {
            var500 = -0.016413435;
        }
    }
    double var501;
    if (inputs[18] < 2.4188137) {
        if (inputs[10] < 0.9675) {
            if (inputs[4] < 1840.845) {
                if (inputs[13] < 1771.47) {
                    var501 = 0.00732502;
                } else {
                    var501 = -0.013651318;
                }
            } else {
                if (inputs[15] < -0.17866667) {
                    var501 = 0.0050621047;
                } else {
                    var501 = 0.019507956;
                }
            }
        } else {
            if (inputs[16] < 0.18570676) {
                if (inputs[2] < 1.2007142) {
                    var501 = 0.0049053514;
                } else {
                    if (inputs[23] < -31.092716) {
                        var501 = 0.004206577;
                    } else {
                        var501 = -0.02011231;
                    }
                }
            } else {
                var501 = 0.006643775;
            }
        }
    } else {
        if (inputs[20] < -0.005653874) {
            var501 = 0.000707384;
        } else {
            var501 = 0.02010255;
        }
    }
    double var502;
    if (inputs[18] < 2.4614255) {
        if (inputs[19] < 2.144363) {
            if (inputs[19] < 1.8428277) {
                if (inputs[4] < 1840.845) {
                    if (inputs[9] < 5.695) {
                        var502 = -0.0022754963;
                    } else {
                        var502 = -0.019589549;
                    }
                } else {
                    if (inputs[4] < 1924.325) {
                        var502 = 0.0140642505;
                    } else {
                        var502 = -0.005603014;
                    }
                }
            } else {
                var502 = 0.015105392;
            }
        } else {
            var502 = -0.015199081;
        }
    } else {
        if (inputs[13] < 1820.89) {
            var502 = 0.016676439;
        } else {
            var502 = 0.0007549516;
        }
    }
    double var503;
    if (inputs[25] < 3.3075356) {
        if (inputs[6] < 1666.48) {
            var503 = 0.012640279;
        } else {
            if (inputs[10] < 2.3575) {
                if (inputs[2] < 2.195) {
                    if (inputs[25] < 2.2597165) {
                        var503 = 0.010914207;
                    } else {
                        var503 = -0.004945906;
                    }
                } else {
                    var503 = -0.015274928;
                }
            } else {
                if (inputs[11] < 0.26) {
                    var503 = -0.0049231965;
                } else {
                    var503 = 0.013669609;
                }
            }
        }
    } else {
        if (inputs[19] < 1.4563731) {
            var503 = 0.0010463966;
        } else {
            var503 = -0.014500252;
        }
    }
    double var504;
    if (inputs[17] < 1.8443145) {
        if (inputs[1] < 26.495476) {
            var504 = 0.015781572;
        } else {
            if (inputs[14] < 0.589) {
                if (inputs[11] < 0.35) {
                    if (inputs[15] < -0.33327273) {
                        var504 = -0.004703024;
                    } else {
                        var504 = -0.022130057;
                    }
                } else {
                    if (inputs[19] < 1.4192966) {
                        var504 = -0.0072972905;
                    } else {
                        var504 = 0.01660797;
                    }
                }
            } else {
                if (inputs[13] < 1852.78) {
                    if (inputs[23] < -21.98774) {
                        var504 = 0.009726437;
                    } else {
                        var504 = -0.008034165;
                    }
                } else {
                    var504 = 0.017979512;
                }
            }
        }
    } else {
        if (inputs[4] < 1844.99) {
            var504 = 0.004219236;
        } else {
            var504 = -0.025804669;
        }
    }
    double var505;
    if (inputs[9] < 6.0675) {
        if (inputs[20] < -1.3405008) {
            var505 = 0.0065565803;
        } else {
            if (inputs[25] < 2.8374956) {
                if (inputs[19] < 1.7375969) {
                    if (inputs[19] < 1.3690054) {
                        var505 = 0.002862023;
                    } else {
                        var505 = -0.015960077;
                    }
                } else {
                    var505 = 0.009652728;
                }
            } else {
                if (inputs[17] < 1.1949059) {
                    var505 = -0.0037076175;
                } else {
                    var505 = -0.020890413;
                }
            }
        }
    } else {
        if (inputs[25] < 2.860633) {
            if (inputs[11] < 0.29) {
                var505 = -0.005665921;
            } else {
                var505 = 0.009861919;
            }
        } else {
            if (inputs[9] < 7.5) {
                var505 = 0.025632748;
            } else {
                var505 = 0.007085429;
            }
        }
    }
    double var506;
    if (inputs[11] < 0.36) {
        if (inputs[19] < 1.8027071) {
            if (inputs[15] < 0.27042425) {
                var506 = -0.0043779025;
            } else {
                var506 = -0.022925692;
            }
        } else {
            if (inputs[19] < 2.0771122) {
                var506 = 0.016688282;
            } else {
                if (inputs[10] < 1.03) {
                    var506 = 0.00895975;
                } else {
                    if (inputs[24] < 6.9411893) {
                        var506 = 0.0028678118;
                    } else {
                        var506 = -0.017755497;
                    }
                }
            }
        }
    } else {
        if (inputs[11] < 0.44) {
            if (inputs[23] < -29.847906) {
                var506 = 0.01649176;
            } else {
                if (inputs[6] < 1859.655) {
                    var506 = -0.0061569517;
                } else {
                    var506 = 0.01198029;
                }
            }
        } else {
            var506 = -0.0045724995;
        }
    }
    double var507;
    if (inputs[5] < 1923.6274) {
        if (inputs[17] < 0.96067894) {
            var507 = -0.010140785;
        } else {
            if (inputs[13] < 1884.03) {
                if (inputs[19] < 1.4932142) {
                    if (inputs[13] < 1813.96) {
                        var507 = 0.017201498;
                    } else {
                        var507 = -0.01003411;
                    }
                } else {
                    if (inputs[24] < -18.610117) {
                        var507 = 0.01325256;
                    } else {
                        var507 = -0.008477095;
                    }
                }
            } else {
                var507 = 0.020390965;
            }
        }
    } else {
        if (inputs[20] < -0.17853628) {
            var507 = -0.023737337;
        } else {
            var507 = 0.0016849474;
        }
    }
    double var508;
    if (inputs[15] < -0.55) {
        var508 = -0.010448937;
    } else {
        if (inputs[1] < 27.259417) {
            var508 = 0.020894198;
        } else {
            if (inputs[1] < 34.038666) {
                var508 = -0.011038136;
            } else {
                if (inputs[4] < 1761.285) {
                    if (inputs[25] < 2.860633) {
                        var508 = -0.018074052;
                    } else {
                        var508 = 0.003962083;
                    }
                } else {
                    if (inputs[20] < -0.3163457) {
                        var508 = -0.00015531872;
                    } else {
                        var508 = 0.014278823;
                    }
                }
            }
        }
    }
    double var509;
    if (inputs[10] < 0.12) {
        var509 = 0.012734014;
    } else {
        if (inputs[24] < -23.786545) {
            var509 = -0.012363823;
        } else {
            if (inputs[16] < -0.21651128) {
                var509 = 0.010829902;
            } else {
                if (inputs[16] < -0.15118045) {
                    var509 = -0.016845357;
                } else {
                    if (inputs[14] < 1.16) {
                        var509 = -0.0015023611;
                    } else {
                        var509 = 0.010972625;
                    }
                }
            }
        }
    }
    double var510;
    if (inputs[24] < 25.472149) {
        if (inputs[9] < 2.985) {
            if (inputs[9] < 2.2225) {
                if (inputs[2] < 1.5992857) {
                    var510 = -0.013163228;
                } else {
                    var510 = 0.010547148;
                }
            } else {
                var510 = 0.019627366;
            }
        } else {
            if (inputs[24] < 18.969734) {
                if (inputs[21] < 2.2095516) {
                    if (inputs[17] < 1.1304936) {
                        var510 = 0.008316857;
                    } else {
                        var510 = -0.008713174;
                    }
                } else {
                    var510 = -0.016030597;
                }
            } else {
                var510 = 0.011269058;
            }
        }
    } else {
        var510 = -0.019600978;
    }
    double var511;
    if (inputs[14] < 1.198) {
        if (inputs[17] < 1.7418909) {
            if (inputs[18] < 1.928612) {
                if (inputs[18] < 1.1529632) {
                    if (inputs[21] < 1.4763844) {
                        var511 = 0.014803241;
                    } else {
                        var511 = 0.00007419962;
                    }
                } else {
                    if (inputs[15] < -0.4398788) {
                        var511 = 0.009629426;
                    } else {
                        var511 = -0.005836035;
                    }
                }
            } else {
                var511 = 0.013853809;
            }
        } else {
            if (inputs[21] < -2.1050558) {
                var511 = 0.0028939154;
            } else {
                var511 = -0.022192953;
            }
        }
    } else {
        var511 = 0.01495133;
    }
    double var512;
    if (inputs[2] < 2.9221427) {
        if (inputs[2] < 1.2635714) {
            if (inputs[19] < 1.1429343) {
                var512 = -0.017690348;
            } else {
                if (inputs[23] < -41.405205) {
                    var512 = 0.013094585;
                } else {
                    var512 = -0.008549475;
                }
            }
        } else {
            if (inputs[23] < 6.166996) {
                if (inputs[10] < 0.63) {
                    var512 = -0.0032796194;
                } else {
                    if (inputs[18] < 2.063856) {
                        var512 = 0.010340726;
                    } else {
                        var512 = -0.00556563;
                    }
                }
            } else {
                var512 = 0.017840678;
            }
        }
    } else {
        var512 = -0.009087266;
    }
    double var513;
    if (inputs[15] < -0.65) {
        var513 = 0.012309127;
    } else {
        if (inputs[18] < 1.1163709) {
            var513 = 0.0072569824;
        } else {
            if (inputs[18] < 1.1985592) {
                var513 = -0.016089646;
            } else {
                if (inputs[24] < 18.138844) {
                    if (inputs[17] < 1.3987509) {
                        var513 = 0.0025207137;
                    } else {
                        var513 = -0.010634379;
                    }
                } else {
                    if (inputs[17] < 1.67642) {
                        var513 = -0.0012378958;
                    } else {
                        var513 = 0.017397096;
                    }
                }
            }
        }
    }
    double var514;
    if (inputs[13] < 1676.14) {
        var514 = 0.012108327;
    } else {
        if (inputs[5] < 1761.0675) {
            if (inputs[20] < -0.44777) {
                var514 = 0.0060080034;
            } else {
                var514 = -0.019043587;
            }
        } else {
            if (inputs[14] < -1.034) {
                var514 = -0.008380083;
            } else {
                if (inputs[20] < -0.48359513) {
                    if (inputs[18] < 1.5062274) {
                        var514 = 0.0061467625;
                    } else {
                        var514 = -0.015745714;
                    }
                } else {
                    if (inputs[6] < 1810.835) {
                        var514 = 0.023603274;
                    } else {
                        var514 = 0.005724338;
                    }
                }
            }
        }
    }
    double var515;
    if (inputs[1] < 24.926445) {
        var515 = -0.016015992;
    } else {
        if (inputs[10] < 5.7875) {
            if (inputs[10] < 0.48) {
                if (inputs[9] < 2.86) {
                    var515 = -0.0041287723;
                } else {
                    var515 = 0.016273506;
                }
            } else {
                if (inputs[20] < -0.4338425) {
                    if (inputs[18] < 1.751718) {
                        var515 = 0.010924869;
                    } else {
                        var515 = -0.0050882734;
                    }
                } else {
                    if (inputs[9] < 3.22) {
                        var515 = 0.011339485;
                    } else {
                        var515 = -0.01323087;
                    }
                }
            }
        } else {
            var515 = 0.017764874;
        }
    }
    double var516;
    if (inputs[10] < 4.61) {
        if (inputs[5] < 1675.4875) {
            var516 = -0.014746098;
        } else {
            if (inputs[13] < 1731.27) {
                var516 = 0.01646631;
            } else {
                if (inputs[19] < 2.144363) {
                    if (inputs[10] < 0.2475) {
                        var516 = -0.012684662;
                    } else {
                        var516 = 0.004817256;
                    }
                } else {
                    var516 = -0.014526052;
                }
            }
        }
    } else {
        var516 = 0.011293523;
    }
    double var517;
    if (inputs[15] < -0.3987879) {
        if (inputs[1] < 32.96693) {
            if (inputs[10] < 2.03) {
                var517 = 0.005594489;
            } else {
                var517 = -0.010393435;
            }
        } else {
            var517 = -0.015738484;
        }
    } else {
        if (inputs[13] < 1835.06) {
            if (inputs[15] < -0.25133333) {
                var517 = 0.020493574;
            } else {
                if (inputs[21] < 2.0155232) {
                    var517 = -0.0118085975;
                } else {
                    if (inputs[23] < -18.223389) {
                        var517 = -0.0027062453;
                    } else {
                        var517 = 0.021611005;
                    }
                }
            }
        } else {
            if (inputs[13] < 1941.72) {
                if (inputs[25] < 2.5308545) {
                    var517 = -0.019165227;
                } else {
                    var517 = 0.0002348489;
                }
            } else {
                var517 = 0.0059026214;
            }
        }
    }
    double var518;
    if (inputs[6] < 1923.51) {
        if (inputs[20] < 0.7422704) {
            if (inputs[25] < 2.030157) {
                var518 = -0.011738438;
            } else {
                if (inputs[24] < -20.653982) {
                    var518 = 0.015812414;
                } else {
                    if (inputs[14] < 0.506) {
                        var518 = -0.009120057;
                    } else {
                        var518 = 0.0067688213;
                    }
                }
            }
        } else {
            if (inputs[2] < 1.9285715) {
                if (inputs[3] < 1772.01) {
                    var518 = -0.0086396085;
                } else {
                    var518 = 0.0094294865;
                }
            } else {
                var518 = 0.024942515;
            }
        }
    } else {
        if (inputs[25] < 2.6388013) {
            var518 = 0.003081398;
        } else {
            var518 = -0.012968094;
        }
    }
    double var519;
    if (inputs[17] < 2.5590653) {
        if (inputs[1] < 26.495476) {
            var519 = 0.017636655;
        } else {
            if (inputs[15] < 0.50357574) {
                if (inputs[18] < 1.0600189) {
                    var519 = 0.0122645;
                } else {
                    if (inputs[2] < 1.2635714) {
                        var519 = -0.01534197;
                    } else {
                        var519 = 0.00077408674;
                    }
                }
            } else {
                var519 = 0.013481917;
            }
        }
    } else {
        var519 = -0.01227295;
    }
    double var520;
    if (inputs[11] < 0.44) {
        if (inputs[11] < 0.36) {
            if (inputs[9] < 2.985) {
                var520 = 0.010600789;
            } else {
                if (inputs[19] < 1.8369683) {
                    var520 = -0.012751184;
                } else {
                    if (inputs[15] < -0.53818184) {
                        var520 = -0.009149844;
                    } else {
                        var520 = 0.0070198625;
                    }
                }
            }
        } else {
            if (inputs[24] < 15.716133) {
                if (inputs[9] < 4.5775) {
                    if (inputs[9] < 2.89) {
                        var520 = -0.00029353896;
                    } else {
                        var520 = 0.022334976;
                    }
                } else {
                    var520 = -0.009395744;
                }
            } else {
                var520 = 0.018322965;
            }
        }
    } else {
        var520 = -0.00817407;
    }
    double var521;
    if (inputs[12] < 1956.18) {
        if (inputs[12] < 1931.8) {
            if (inputs[10] < 0.6925) {
                if (inputs[9] < 2.795) {
                    var521 = -0.018149268;
                } else {
                    var521 = 0.0010328987;
                }
            } else {
                if (inputs[10] < 1.1225) {
                    var521 = 0.018924357;
                } else {
                    if (inputs[2] < 1.2021428) {
                        var521 = 0.010426509;
                    } else {
                        var521 = -0.0030101961;
                    }
                }
            }
        } else {
            var521 = 0.016572788;
        }
    } else {
        var521 = -0.011886883;
    }
    double var522;
    if (inputs[15] < 0.5062424) {
        if (inputs[15] < 0.4121212) {
            if (inputs[23] < -2.358174) {
                if (inputs[24] < -15.776913) {
                    if (inputs[2] < 1.305) {
                        var522 = -0.0029491894;
                    } else {
                        var522 = -0.023150425;
                    }
                } else {
                    if (inputs[10] < 2.3475) {
                        var522 = -0.003665977;
                    } else {
                        var522 = 0.013753483;
                    }
                }
            } else {
                if (inputs[9] < 5.31) {
                    if (inputs[16] < -0.12896992) {
                        var522 = 0.020507209;
                    } else {
                        var522 = 0.0040308875;
                    }
                } else {
                    var522 = -0.0060465266;
                }
            }
        } else {
            var522 = -0.015496799;
        }
    } else {
        if (inputs[24] < 18.33027) {
            var522 = 0.01608649;
        } else {
            var522 = 0.0046807253;
        }
    }
    double var523;
    if (inputs[1] < 64.21748) {
        if (inputs[16] < 0.10293985) {
            if (inputs[17] < 0.9489573) {
                var523 = -0.011025402;
            } else {
                if (inputs[19] < 1.2134508) {
                    var523 = 0.01905627;
                } else {
                    if (inputs[15] < -0.31369698) {
                        var523 = 0.0040368726;
                    } else {
                        var523 = -0.009411378;
                    }
                }
            }
        } else {
            var523 = 0.016568698;
        }
    } else {
        if (inputs[21] < 2.5411365) {
            var523 = -0.0162237;
        } else {
            if (inputs[15] < 0.4257576) {
                var523 = 0.005627651;
            } else {
                var523 = -0.010360253;
            }
        }
    }
    double var524;
    if (inputs[21] < 3.6998076) {
        if (inputs[11] < 0.17) {
            var524 = 0.021282526;
        } else {
            if (inputs[17] < 0.9245842) {
                var524 = 0.011934571;
            } else {
                if (inputs[23] < 0.3177864) {
                    if (inputs[16] < -0.18431579) {
                        var524 = -0.010313737;
                    } else {
                        var524 = 0.003815678;
                    }
                } else {
                    var524 = -0.013081153;
                }
            }
        }
    } else {
        var524 = -0.014539548;
    }
    double var525;
    if (inputs[9] < 11.365) {
        if (inputs[9] < 1.64) {
            var525 = -0.014630488;
        } else {
            if (inputs[25] < 2.0) {
                var525 = 0.011894947;
            } else {
                if (inputs[4] < 1843.935) {
                    if (inputs[25] < 3.7410789) {
                        var525 = 0.00025762236;
                    } else {
                        var525 = 0.015382987;
                    }
                } else {
                    if (inputs[18] < 1.3326819) {
                        var525 = -0.021121072;
                    } else {
                        var525 = 0.0005542455;
                    }
                }
            }
        }
    } else {
        var525 = -0.016817288;
    }
    double var526;
    if (inputs[3] < 1675.03) {
        var526 = 0.010266979;
    } else {
        if (inputs[16] < -0.17063157) {
            if (inputs[10] < 1.465) {
                var526 = -0.022886556;
            } else {
                var526 = -0.0014445308;
            }
        } else {
            if (inputs[16] < -0.0798797) {
                var526 = 0.010144403;
            } else {
                if (inputs[2] < 1.735) {
                    if (inputs[14] < 0.575) {
                        var526 = -0.0133170355;
                    } else {
                        var526 = 0.008156161;
                    }
                } else {
                    if (inputs[20] < -0.06108165) {
                        var526 = -0.028512456;
                    } else {
                        var526 = 0.00035975227;
                    }
                }
            }
        }
    }
    double var527;
    if (inputs[13] < 1953.42) {
        if (inputs[15] < 0.47775757) {
            if (inputs[16] < -0.077203006) {
                if (inputs[16] < -0.18431579) {
                    if (inputs[1] < 29.539452) {
                        var527 = 0.0030568955;
                    } else {
                        var527 = -0.012392621;
                    }
                } else {
                    if (inputs[18] < 1.4690953) {
                        var527 = -0.0017954487;
                    } else {
                        var527 = 0.022604795;
                    }
                }
            } else {
                if (inputs[14] < 0.608) {
                    var527 = -0.017135166;
                } else {
                    if (inputs[14] < 0.884) {
                        var527 = 0.011394178;
                    } else {
                        var527 = -0.011683298;
                    }
                }
            }
        } else {
            if (inputs[25] < 2.7594762) {
                var527 = 0.0007478913;
            } else {
                var527 = 0.02161937;
            }
        }
    } else {
        var527 = -0.012745699;
    }
    double var528;
    if (inputs[24] < -19.664974) {
        if (inputs[5] < 1822.1) {
            var528 = 0.004132014;
        } else {
            var528 = 0.017712481;
        }
    } else {
        if (inputs[15] < -0.5229697) {
            var528 = 0.012239408;
        } else {
            if (inputs[15] < -0.3200606) {
                var528 = -0.013443613;
            } else {
                if (inputs[20] < -0.27097872) {
                    if (inputs[10] < 2.03) {
                        var528 = -0.011227763;
                    } else {
                        var528 = 0.003014716;
                    }
                } else {
                    if (inputs[20] < 0.08772628) {
                        var528 = 0.021034108;
                    } else {
                        var528 = 0.0015479818;
                    }
                }
            }
        }
    }
    double var529;
    if (inputs[10] < 0.24) {
        var529 = -0.009909851;
    } else {
        if (inputs[9] < 2.985) {
            if (inputs[11] < 0.39) {
                var529 = 0.015915183;
            } else {
                var529 = 0.000044104283;
            }
        } else {
            if (inputs[13] < 1686.58) {
                var529 = -0.014794931;
            } else {
                if (inputs[13] < 1737.78) {
                    var529 = 0.014118525;
                } else {
                    if (inputs[13] < 1923.88) {
                        var529 = -0.00009539184;
                    } else {
                        var529 = -0.013354013;
                    }
                }
            }
        }
    }
    double var530;
    if (inputs[9] < 2.985) {
        if (inputs[11] < 0.38) {
            var530 = 0.014667199;
        } else {
            var530 = -0.003188889;
        }
    } else {
        if (inputs[20] < -1.3405008) {
            var530 = 0.010184857;
        } else {
            if (inputs[19] < 1.8428277) {
                if (inputs[11] < 0.36) {
                    var530 = -0.021802891;
                } else {
                    if (inputs[10] < 1.3125) {
                        var530 = 0.017421976;
                    } else {
                        var530 = -0.0078812335;
                    }
                }
            } else {
                if (inputs[23] < -3.9755354) {
                    var530 = -0.0062811878;
                } else {
                    var530 = 0.0071489424;
                }
            }
        }
    }
    double var531;
    if (inputs[2] < 2.4714286) {
        if (inputs[14] < 0.696) {
            if (inputs[14] < 0.564) {
                if (inputs[10] < 1.75) {
                    if (inputs[10] < 0.63) {
                        var531 = -0.004946971;
                    } else {
                        var531 = 0.0102895545;
                    }
                } else {
                    if (inputs[24] < -18.783993) {
                        var531 = -0.00042581116;
                    } else {
                        var531 = -0.015025576;
                    }
                }
            } else {
                var531 = 0.018319413;
            }
        } else {
            if (inputs[16] < 0.12596993) {
                var531 = 0.0010668404;
            } else {
                var531 = -0.01632817;
            }
        }
    } else {
        if (inputs[1] < 58.76526) {
            var531 = 0.0008887338;
        } else {
            var531 = 0.01665694;
        }
    }
    double var532;
    if (inputs[24] < 24.900513) {
        if (inputs[1] < 24.926445) {
            var532 = -0.011546828;
        } else {
            if (inputs[14] < -1.185) {
                var532 = 0.02300149;
            } else {
                if (inputs[16] < -0.20523308) {
                    var532 = 0.011543274;
                } else {
                    if (inputs[24] < -8.892423) {
                        var532 = -0.012642834;
                    } else {
                        var532 = 0.0027218722;
                    }
                }
            }
        }
    } else {
        var532 = -0.014660014;
    }
    double var533;
    if (inputs[10] < 1.9575) {
        if (inputs[13] < 1676.84) {
            var533 = 0.009803443;
        } else {
            if (inputs[4] < 1763.59) {
                var533 = -0.023245996;
            } else {
                if (inputs[17] < 1.0164448) {
                    var533 = 0.008161857;
                } else {
                    if (inputs[8] < 1843.5) {
                        var533 = -0.01958756;
                    } else {
                        var533 = -0.00089316315;
                    }
                }
            }
        }
    } else {
        if (inputs[14] < -0.985) {
            var533 = 0.017217698;
        } else {
            if (inputs[14] < 0.713) {
                if (inputs[24] < -11.63682) {
                    var533 = -0.0010641653;
                } else {
                    var533 = -0.012419179;
                }
            } else {
                var533 = 0.012325894;
            }
        }
    }
    double var534;
    if (inputs[10] < 1.105) {
        if (inputs[13] < 1697.49) {
            var534 = 0.019462045;
        } else {
            if (inputs[19] < 1.5801452) {
                if (inputs[9] < 2.695) {
                    var534 = -0.014426039;
                } else {
                    var534 = 0.0030877271;
                }
            } else {
                if (inputs[14] < 0.412) {
                    var534 = 0.017155759;
                } else {
                    var534 = -0.001503207;
                }
            }
        }
    } else {
        if (inputs[19] < 1.9347545) {
            if (inputs[16] < 0.14938346) {
                if (inputs[25] < 3.077972) {
                    if (inputs[2] < 1.3678571) {
                        var534 = 0.014952001;
                    } else {
                        var534 = -0.0029877853;
                    }
                } else {
                    var534 = -0.013359516;
                }
            } else {
                var534 = 0.0147631075;
            }
        } else {
            if (inputs[17] < 1.4736539) {
                var534 = -0.021976866;
            } else {
                var534 = -0.0055924156;
            }
        }
    }
    double var535;
    if (inputs[17] < 2.0750191) {
        if (inputs[25] < 3.7410789) {
            if (inputs[14] < -0.609) {
                if (inputs[9] < 3.3) {
                    var535 = 0.000119456075;
                } else {
                    var535 = -0.019358732;
                }
            } else {
                if (inputs[19] < 1.2010673) {
                    var535 = -0.017790152;
                } else {
                    if (inputs[14] < 0.412) {
                        var535 = 0.015795054;
                    } else {
                        var535 = -0.0019345068;
                    }
                }
            }
        } else {
            var535 = 0.0056264712;
        }
    } else {
        if (inputs[11] < 0.25) {
            var535 = -0.0055163824;
        } else {
            var535 = 0.021541597;
        }
    }
    double var536;
    if (inputs[24] < 21.073282) {
        if (inputs[4] < 1935.9) {
            if (inputs[5] < 1910.0225) {
                if (inputs[9] < 2.2375) {
                    var536 = -0.006597078;
                } else {
                    if (inputs[3] < 1673.335) {
                        var536 = 0.017228339;
                    } else {
                        var536 = 0.0026438683;
                    }
                }
            } else {
                var536 = -0.0136502655;
            }
        } else {
            var536 = 0.010179037;
        }
    } else {
        var536 = -0.009515053;
    }
    double var537;
    if (inputs[16] < 0.38330826) {
        if (inputs[15] < 0.43066666) {
            if (inputs[13] < 1835.06) {
                if (inputs[5] < 1781.945) {
                    if (inputs[9] < 4.215) {
                        var537 = -0.0044642105;
                    } else {
                        var537 = 0.009555212;
                    }
                } else {
                    if (inputs[15] < -0.37333333) {
                        var537 = 0.0063319327;
                    } else {
                        var537 = 0.022777695;
                    }
                }
            } else {
                if (inputs[20] < -0.11280487) {
                    if (inputs[18] < 1.3699416) {
                        var537 = -0.004732545;
                    } else {
                        var537 = 0.013593582;
                    }
                } else {
                    if (inputs[20] < 0.76225996) {
                        var537 = -0.023247864;
                    } else {
                        var537 = -0.00448737;
                    }
                }
            }
        } else {
            var537 = -0.012960539;
        }
    } else {
        var537 = 0.013170898;
    }
    double var538;
    if (inputs[15] < 0.30321214) {
        if (inputs[20] < -0.9729088) {
            var538 = 0.018075861;
        } else {
            if (inputs[11] < 0.37) {
                if (inputs[19] < 1.7022699) {
                    var538 = -0.020401834;
                } else {
                    if (inputs[9] < 7.84) {
                        var538 = -0.0038059119;
                    } else {
                        var538 = 0.011537436;
                    }
                }
            } else {
                if (inputs[19] < 1.222446) {
                    var538 = 0.01880217;
                } else {
                    var538 = 0.00059477444;
                }
            }
        }
    } else {
        if (inputs[20] < -0.92651445) {
            var538 = -0.015434743;
        } else {
            if (inputs[18] < 1.568082) {
                var538 = -0.008754221;
            } else {
                if (inputs[24] < 17.622213) {
                    var538 = 0.016457774;
                } else {
                    var538 = -0.000042392654;
                }
            }
        }
    }
    double var539;
    if (inputs[11] < 0.39) {
        if (inputs[21] < -2.872818) {
            if (inputs[2] < 1.3721429) {
                var539 = 0.0006953641;
            } else {
                var539 = -0.013882573;
            }
        } else {
            if (inputs[18] < 1.3113737) {
                var539 = -0.00804385;
            } else {
                if (inputs[11] < 0.36) {
                    if (inputs[20] < 0.08772628) {
                        var539 = 0.012712888;
                    } else {
                        var539 = -0.0009209177;
                    }
                } else {
                    var539 = 0.025246171;
                }
            }
        }
    } else {
        if (inputs[23] < -26.356808) {
            var539 = -0.012628079;
        } else {
            var539 = 0.0031448004;
        }
    }
    double var540;
    if (inputs[15] < -0.4398788) {
        if (inputs[21] < -3.1464338) {
            var540 = -0.010519933;
        } else {
            if (inputs[18] < 2.149493) {
                var540 = 0.025480341;
            } else {
                var540 = 0.009886948;
            }
        }
    } else {
        if (inputs[12] < 1839.26) {
            if (inputs[23] < -19.270708) {
                if (inputs[23] < -42.158447) {
                    var540 = -0.009647883;
                } else {
                    var540 = 0.0044002817;
                }
            } else {
                if (inputs[20] < -0.44777) {
                    var540 = -0.0013832721;
                } else {
                    var540 = -0.027850496;
                }
            }
        } else {
            if (inputs[18] < 1.3279924) {
                var540 = -0.0070608566;
            } else {
                if (inputs[2] < 1.7807143) {
                    var540 = 0.018916957;
                } else {
                    var540 = 0.0010769854;
                }
            }
        }
    }
    double var541;
    if (inputs[16] < -0.30206767) {
        var541 = -0.014390474;
    } else {
        if (inputs[19] < 1.1543068) {
            var541 = -0.00999022;
        } else {
            if (inputs[10] < 5.0575) {
                if (inputs[19] < 1.3074727) {
                    var541 = 0.012304896;
                } else {
                    if (inputs[4] < 1762.555) {
                        var541 = -0.007848978;
                    } else {
                        var541 = 0.0029828188;
                    }
                }
            } else {
                var541 = 0.014615834;
            }
        }
    }
    double var542;
    if (inputs[21] < 3.6998076) {
        if (inputs[11] < 0.19) {
            var542 = 0.016824976;
        } else {
            if (inputs[20] < 0.8231325) {
                if (inputs[24] < 22.278522) {
                    if (inputs[9] < 4.84) {
                        var542 = -0.00584732;
                    } else {
                        var542 = 0.0060473047;
                    }
                } else {
                    var542 = -0.016559301;
                }
            } else {
                if (inputs[23] < -29.847906) {
                    var542 = 0.016311176;
                } else {
                    var542 = -0.0023466747;
                }
            }
        }
    } else {
        var542 = -0.013748428;
    }
    double var543;
    if (inputs[17] < 0.87206423) {
        var543 = -0.014147817;
    } else {
        if (inputs[8] < 1932.88) {
            if (inputs[11] < 0.21) {
                var543 = 0.012368421;
            } else {
                if (inputs[6] < 1900.295) {
                    if (inputs[1] < 70.62386) {
                        var543 = 0.003333388;
                    } else {
                        var543 = -0.013639925;
                    }
                } else {
                    var543 = -0.016323024;
                }
            }
        } else {
            if (inputs[17] < 1.5340065) {
                var543 = 0.020269401;
            } else {
                var543 = 0.0014074;
            }
        }
    }
    double var544;
    if (inputs[19] < 2.0921564) {
        if (inputs[23] < 6.166996) {
            if (inputs[10] < 3.1275) {
                if (inputs[10] < 2.1375) {
                    if (inputs[14] < -0.835) {
                        var544 = -0.011292366;
                    } else {
                        var544 = 0.005913971;
                    }
                } else {
                    var544 = -0.01299989;
                }
            } else {
                var544 = 0.013601387;
            }
        } else {
            var544 = 0.015205434;
        }
    } else {
        if (inputs[15] < -0.6610909) {
            var544 = 0.004133548;
        } else {
            if (inputs[17] < 1.535552) {
                var544 = -0.0014012043;
            } else {
                var544 = -0.024667535;
            }
        }
    }
    double var545;
    if (inputs[16] < 0.2694436) {
        if (inputs[23] < 9.677591) {
            if (inputs[16] < 0.15609023) {
                if (inputs[15] < 0.3798788) {
                    if (inputs[20] < 1.4345536) {
                        var545 = -0.0052504274;
                    } else {
                        var545 = 0.011887236;
                    }
                } else {
                    var545 = 0.012476913;
                }
            } else {
                var545 = -0.012165239;
            }
        } else {
            var545 = -0.023672136;
        }
    } else {
        var545 = 0.01147202;
    }
    double var546;
    if (inputs[24] < 19.300243) {
        if (inputs[5] < 1668.7925) {
            var546 = -0.012898198;
        } else {
            if (inputs[21] < -3.4881837) {
                var546 = 0.0132615315;
            } else {
                if (inputs[16] < -0.26983458) {
                    var546 = -0.017517487;
                } else {
                    if (inputs[16] < -0.19068421) {
                        var546 = 0.01576833;
                    } else {
                        var546 = -0.0012920216;
                    }
                }
            }
        }
    } else {
        if (inputs[16] < 0.21485715) {
            var546 = 0.015129496;
        } else {
            var546 = -0.0011186225;
        }
    }
    double var547;
    if (inputs[11] < 0.29) {
        if (inputs[25] < 2.368317) {
            var547 = -0.015979683;
        } else {
            if (inputs[5] < 1808.2675) {
                var547 = 0.011364657;
            } else {
                var547 = -0.006036689;
            }
        }
    } else {
        if (inputs[19] < 1.3578346) {
            if (inputs[9] < 3.85) {
                var547 = 0.0066842786;
            } else {
                var547 = -0.01198061;
            }
        } else {
            if (inputs[1] < 29.44858) {
                var547 = 0.021490537;
            } else {
                if (inputs[23] < -35.40706) {
                    var547 = -0.0050882655;
                } else {
                    if (inputs[10] < 1.0075) {
                        var547 = 0.001087542;
                    } else {
                        var547 = 0.016613562;
                    }
                }
            }
        }
    }
    double var548;
    if (inputs[5] < 1923.6274) {
        if (inputs[12] < 1839.26) {
            if (inputs[5] < 1802.1625) {
                if (inputs[13] < 1778.21) {
                    if (inputs[13] < 1731.27) {
                        var548 = 0.0021750506;
                    } else {
                        var548 = -0.012196176;
                    }
                } else {
                    var548 = 0.016060436;
                }
            } else {
                var548 = -0.011957963;
            }
        } else {
            if (inputs[23] < -3.9755354) {
                var548 = -0.0011798161;
            } else {
                var548 = 0.021341145;
            }
        }
    } else {
        if (inputs[25] < 2.4323606) {
            var548 = -0.0007069942;
        } else {
            var548 = -0.021273427;
        }
    }
    double var549;
    if (inputs[17] < 1.9682418) {
        if (inputs[17] < 1.4078722) {
            if (inputs[2] < 2.0085714) {
                if (inputs[19] < 1.8027071) {
                    if (inputs[11] < 0.4) {
                        var549 = -0.00964368;
                    } else {
                        var549 = 0.005082098;
                    }
                } else {
                    var549 = 0.017333811;
                }
            } else {
                var549 = -0.011986522;
            }
        } else {
            if (inputs[10] < 1.16) {
                var549 = 0.021927878;
            } else {
                var549 = 0.0039333054;
            }
        }
    } else {
        if (inputs[13] < 1820.89) {
            var549 = 0.003159913;
        } else {
            var549 = -0.019880915;
        }
    }
    double var550;
    if (inputs[11] < 0.29) {
        if (inputs[6] < 1918.47) {
            if (inputs[17] < 1.4736539) {
                var550 = -0.013215958;
            } else {
                var550 = 0.0065889903;
            }
        } else {
            var550 = -0.015663782;
        }
    } else {
        if (inputs[15] < 0.37369698) {
            if (inputs[16] < 0.035654135) {
                if (inputs[25] < 2.946502) {
                    if (inputs[10] < 0.9575) {
                        var550 = 0.016754253;
                    } else {
                        var550 = 0.00213376;
                    }
                } else {
                    var550 = -0.004283224;
                }
            } else {
                var550 = -0.009557998;
            }
        } else {
            if (inputs[3] < 1842.94) {
                var550 = 0.0016550823;
            } else {
                var550 = 0.026454784;
            }
        }
    }
    double var551;
    if (inputs[4] < 1722.175) {
        if (inputs[5] < 1669.84) {
            var551 = 0.0010594575;
        } else {
            var551 = 0.013766676;
        }
    } else {
        if (inputs[3] < 1764.25) {
            var551 = -0.017842617;
        } else {
            if (inputs[24] < -23.626337) {
                var551 = 0.013884264;
            } else {
                if (inputs[9] < 4.35) {
                    if (inputs[25] < 2.2597165) {
                        var551 = 0.013440808;
                    } else {
                        var551 = -0.0015798707;
                    }
                } else {
                    if (inputs[13] < 1893.62) {
                        var551 = -0.015650615;
                    } else {
                        var551 = 0.0009806243;
                    }
                }
            }
        }
    }
    double var552;
    if (inputs[23] < 10.910757) {
        if (inputs[13] < 1894.76) {
            if (inputs[9] < 5.75) {
                if (inputs[9] < 4.745) {
                    if (inputs[20] < 0.106602594) {
                        var552 = 0.0060920944;
                    } else {
                        var552 = -0.009594657;
                    }
                } else {
                    var552 = 0.012605416;
                }
            } else {
                if (inputs[19] < 1.6560503) {
                    var552 = -0.022370607;
                } else {
                    if (inputs[18] < 2.048424) {
                        var552 = 0.0051936614;
                    } else {
                        var552 = -0.013054082;
                    }
                }
            }
        } else {
            if (inputs[24] < 8.700077) {
                var552 = 0.017199563;
            } else {
                var552 = 0.0015243213;
            }
        }
    } else {
        var552 = -0.012398308;
    }
    double var553;
    if (inputs[9] < 2.2225) {
        var553 = -0.0116954725;
    } else {
        if (inputs[19] < 1.2613323) {
            if (inputs[19] < 1.1543068) {
                var553 = 0.0024619496;
            } else {
                var553 = 0.020195873;
            }
        } else {
            if (inputs[2] < 1.1664286) {
                var553 = -0.015861595;
            } else {
                if (inputs[20] < 0.4305812) {
                    if (inputs[18] < 2.2016084) {
                        var553 = 0.0033001257;
                    } else {
                        var553 = -0.018842855;
                    }
                } else {
                    if (inputs[23] < -3.9755354) {
                        var553 = -0.0002247618;
                    } else {
                        var553 = 0.022147026;
                    }
                }
            }
        }
    }
    double var554;
    if (inputs[4] < 1719.46) {
        if (inputs[4] < 1677.165) {
            var554 = -0.001055541;
        } else {
            var554 = -0.021847313;
        }
    } else {
        if (inputs[13] < 1805.01) {
            if (inputs[15] < -0.25133333) {
                var554 = 0.017064642;
            } else {
                var554 = -0.00095588283;
            }
        } else {
            if (inputs[19] < 1.4192966) {
                if (inputs[25] < 2.5308545) {
                    var554 = 0.00009613593;
                } else {
                    var554 = -0.02284939;
                }
            } else {
                if (inputs[2] < 1.7578571) {
                    var554 = 0.011845;
                } else {
                    if (inputs[2] < 2.6578572) {
                        var554 = -0.012714555;
                    } else {
                        var554 = 0.0059246137;
                    }
                }
            }
        }
    }
    double var555;
    if (inputs[11] < 0.25) {
        if (inputs[20] < -0.005653874) {
            var555 = -0.018870397;
        } else {
            var555 = 0.002514526;
        }
    } else {
        if (inputs[1] < 70.92806) {
            if (inputs[1] < 64.21748) {
                if (inputs[2] < 1.5464286) {
                    if (inputs[16] < -0.12616542) {
                        var555 = 0.0034248154;
                    } else {
                        var555 = -0.019778708;
                    }
                } else {
                    if (inputs[25] < 1.6705577) {
                        var555 = -0.0011874157;
                    } else {
                        var555 = 0.016916346;
                    }
                }
            } else {
                var555 = -0.011841252;
            }
        } else {
            var555 = 0.014214015;
        }
    }
    double var556;
    if (inputs[10] < 5.0575) {
        if (inputs[10] < 0.22) {
            var556 = -0.011697441;
        } else {
            if (inputs[10] < 3.19) {
                if (inputs[3] < 1715.54) {
                    var556 = -0.008149059;
                } else {
                    if (inputs[10] < 2.3475) {
                        var556 = 0.0032843167;
                    } else {
                        var556 = 0.016555924;
                    }
                }
            } else {
                var556 = -0.013920128;
            }
        }
    } else {
        var556 = 0.013315916;
    }
    double var557;
    if (inputs[1] < 30.82347) {
        if (inputs[23] < -14.196849) {
            var557 = -0.016173845;
        } else {
            var557 = 0.004337584;
        }
    } else {
        if (inputs[23] < -19.270708) {
            if (inputs[16] < 0.17361654) {
                if (inputs[2] < 1.2335714) {
                    var557 = 0.023996217;
                } else {
                    if (inputs[23] < -37.702194) {
                        var557 = -0.0053265244;
                    } else {
                        var557 = 0.018741682;
                    }
                }
            } else {
                var557 = -0.004056315;
            }
        } else {
            if (inputs[16] < -0.05399248) {
                if (inputs[14] < -0.799) {
                    var557 = 0.018853445;
                } else {
                    var557 = -0.00040664844;
                }
            } else {
                if (inputs[10] < 1.265) {
                    var557 = -0.017516555;
                } else {
                    if (inputs[21] < 2.4199445) {
                        var557 = -0.009366524;
                    } else {
                        var557 = 0.012181325;
                    }
                }
            }
        }
    }
    double var558;
    if (inputs[25] < 2.3162615) {
        if (inputs[10] < 1.185) {
            var558 = 0.0033396948;
        } else {
            var558 = -0.017303066;
        }
    } else {
        if (inputs[17] < 1.9122196) {
            if (inputs[19] < 1.3652738) {
                if (inputs[3] < 1798.5) {
                    var558 = 0.008080431;
                } else {
                    var558 = -0.011743119;
                }
            } else {
                if (inputs[14] < 0.679) {
                    if (inputs[9] < 4.84) {
                        var558 = 0.0066268877;
                    } else {
                        var558 = 0.025167389;
                    }
                } else {
                    var558 = -0.00033882595;
                }
            }
        } else {
            var558 = -0.0064624357;
        }
    }
    double var559;
    if (inputs[19] < 3.8700812) {
        if (inputs[1] < 26.023777) {
            var559 = 0.013109491;
        } else {
            if (inputs[13] < 1706.51) {
                var559 = -0.010178875;
            } else {
                if (inputs[24] < -17.368395) {
                    var559 = -0.011795014;
                } else {
                    if (inputs[11] < 0.4) {
                        var559 = 0.0002955346;
                    } else {
                        var559 = 0.009265017;
                    }
                }
            }
        }
    } else {
        var559 = -0.015985783;
    }
    double var560;
    if (inputs[25] < 4.115349) {
        if (inputs[23] < -55.599304) {
            var560 = -0.012914658;
        } else {
            if (inputs[20] < 1.4817988) {
                if (inputs[15] < 0.5382424) {
                    if (inputs[15] < 0.30321214) {
                        var560 = 0.0043568816;
                    } else {
                        var560 = -0.008590365;
                    }
                } else {
                    var560 = 0.013541065;
                }
            } else {
                var560 = -0.013196552;
            }
        }
    } else {
        var560 = 0.015655324;
    }
    double var561;
    if (inputs[9] < 4.285) {
        if (inputs[3] < 1701.985) {
            var561 = 0.011657631;
        } else {
            if (inputs[16] < -0.0798797) {
                var561 = 0.0042308387;
            } else {
                if (inputs[1] < 65.03897) {
                    var561 = -0.017034428;
                } else {
                    var561 = -0.00082244934;
                }
            }
        }
    } else {
        if (inputs[20] < -1.1184866) {
            var561 = 0.017791586;
        } else {
            if (inputs[16] < 0.2733158) {
                if (inputs[10] < 2.055) {
                    if (inputs[23] < -6.8828635) {
                        var561 = 0.0012465096;
                    } else {
                        var561 = 0.015726147;
                    }
                } else {
                    if (inputs[9] < 7.335) {
                        var561 = -0.01673961;
                    } else {
                        var561 = 0.0005942579;
                    }
                }
            } else {
                var561 = 0.014891855;
            }
        }
    }
    double var562;
    if (inputs[1] < 74.73677) {
        if (inputs[14] < 0.55) {
            if (inputs[14] < -0.685) {
                if (inputs[17] < 1.2264322) {
                    var562 = 0.016525488;
                } else {
                    if (inputs[2] < 2.1185715) {
                        var562 = -0.007628574;
                    } else {
                        var562 = 0.009279468;
                    }
                }
            } else {
                if (inputs[4] < 1841.665) {
                    var562 = -0.0033219946;
                } else {
                    var562 = -0.02386754;
                }
            }
        } else {
            if (inputs[17] < 1.2256917) {
                var562 = 0.02145766;
            } else {
                if (inputs[1] < 66.95797) {
                    var562 = -0.0082230205;
                } else {
                    var562 = 0.0061828913;
                }
            }
        }
    } else {
        var562 = -0.011381847;
    }
    double var563;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < 0.014992481) {
            if (inputs[19] < 1.1847426) {
                var563 = 0.016686242;
            } else {
                if (inputs[18] < 2.4188137) {
                    if (inputs[10] < 1.185) {
                        var563 = 0.0031267104;
                    } else {
                        var563 = -0.010647493;
                    }
                } else {
                    var563 = 0.015109807;
                }
            }
        } else {
            if (inputs[17] < 1.2178605) {
                if (inputs[3] < 1811.79) {
                    var563 = -0.009175216;
                } else {
                    var563 = 0.005977623;
                }
            } else {
                if (inputs[11] < 0.37) {
                    var563 = -0.0080259275;
                } else {
                    var563 = -0.027594682;
                }
            }
        }
    } else {
        var563 = 0.0100277485;
    }
    double var564;
    if (inputs[15] < -0.40339395) {
        if (inputs[14] < -0.787) {
            if (inputs[17] < 1.8443145) {
                var564 = 0.008227007;
            } else {
                var564 = -0.00833765;
            }
        } else {
            var564 = -0.021425495;
        }
    } else {
        if (inputs[21] < -3.0461998) {
            var564 = 0.015945269;
        } else {
            if (inputs[16] < -0.14654887) {
                var564 = -0.015029577;
            } else {
                if (inputs[24] < 7.5238104) {
                    if (inputs[18] < 1.3326819) {
                        var564 = 0.0035710845;
                    } else {
                        var564 = 0.02032835;
                    }
                } else {
                    if (inputs[14] < 0.608) {
                        var564 = -0.014998389;
                    } else {
                        var564 = 0.0030344909;
                    }
                }
            }
        }
    }
    double var565;
    if (inputs[19] < 1.1154667) {
        var565 = 0.015804151;
    } else {
        if (inputs[23] < -55.599304) {
            var565 = -0.016384622;
        } else {
            if (inputs[25] < 2.8244274) {
                if (inputs[14] < -1.203) {
                    var565 = 0.014891071;
                } else {
                    if (inputs[14] < -0.563) {
                        var565 = -0.017653737;
                    } else {
                        var565 = -0.0011934774;
                    }
                }
            } else {
                if (inputs[25] < 3.3829618) {
                    if (inputs[21] < -2.872818) {
                        var565 = 0.005969495;
                    } else {
                        var565 = 0.021499261;
                    }
                } else {
                    if (inputs[8] < 1817.61) {
                        var565 = -0.01203358;
                    } else {
                        var565 = 0.009943182;
                    }
                }
            }
        }
    }
    double var566;
    if (inputs[19] < 3.9578204) {
        if (inputs[13] < 1731.27) {
            if (inputs[20] < -0.44777) {
                var566 = 0.019619828;
            } else {
                if (inputs[9] < 5.12) {
                    var566 = -0.005179654;
                } else {
                    var566 = 0.0060651647;
                }
            }
        } else {
            if (inputs[19] < 1.4164727) {
                if (inputs[19] < 1.222446) {
                    var566 = 0.0008230253;
                } else {
                    var566 = -0.02021804;
                }
            } else {
                if (inputs[14] < 0.748) {
                    if (inputs[23] < -20.966377) {
                        var566 = 0.021017045;
                    } else {
                        var566 = 0.0013824904;
                    }
                } else {
                    var566 = -0.008161766;
                }
            }
        }
    } else {
        var566 = -0.019282233;
    }
    double var567;
    if (inputs[1] < 74.59002) {
        if (inputs[9] < 4.725) {
            if (inputs[2] < 2.0085714) {
                if (inputs[17] < 1.2962098) {
                    if (inputs[17] < 1.1588719) {
                        var567 = -0.0010518632;
                    } else {
                        var567 = 0.017573493;
                    }
                } else {
                    var567 = -0.009424868;
                }
            } else {
                var567 = -0.01661474;
            }
        } else {
            if (inputs[9] < 5.31) {
                var567 = 0.018846199;
            } else {
                if (inputs[19] < 1.6515522) {
                    var567 = -0.0077319695;
                } else {
                    if (inputs[16] < -0.2875188) {
                        var567 = -0.004068488;
                    } else {
                        var567 = 0.014634636;
                    }
                }
            }
        }
    } else {
        var567 = -0.011068169;
    }
    double var568;
    if (inputs[19] < 3.9578204) {
        if (inputs[1] < 72.715904) {
            if (inputs[3] < 1944.205) {
                if (inputs[3] < 1862.555) {
                    if (inputs[25] < 2.872818) {
                        var568 = 0.006191337;
                    } else {
                        var568 = -0.0070928093;
                    }
                } else {
                    if (inputs[2] < 1.7214285) {
                        var568 = -0.0052951397;
                    } else {
                        var568 = -0.018261869;
                    }
                }
            } else {
                var568 = 0.013878695;
            }
        } else {
            var568 = 0.013473677;
        }
    } else {
        var568 = -0.012468422;
    }
    double var569;
    if (inputs[11] < 0.17) {
        var569 = 0.013449916;
    } else {
        if (inputs[24] < 24.900513) {
            if (inputs[16] < 0.16592482) {
                if (inputs[19] < 1.3542114) {
                    if (inputs[15] < 0.23206061) {
                        var569 = -0.0020873286;
                    } else {
                        var569 = -0.021541601;
                    }
                } else {
                    if (inputs[2] < 1.435) {
                        var569 = 0.015123009;
                    } else {
                        var569 = -0.004572209;
                    }
                }
            } else {
                if (inputs[20] < -0.034633074) {
                    var569 = 0.02058544;
                } else {
                    var569 = -0.003662831;
                }
            }
        } else {
            var569 = -0.016677618;
        }
    }
    double var570;
    if (inputs[16] < -0.0798797) {
        if (inputs[16] < -0.18129323) {
            if (inputs[16] < -0.23464662) {
                var570 = 0.0061195465;
            } else {
                var570 = -0.0095275715;
            }
        } else {
            if (inputs[20] < 0.6788122) {
                var570 = 0.0041952617;
            } else {
                var570 = 0.022107117;
            }
        }
    } else {
        if (inputs[17] < 2.020202) {
            if (inputs[15] < 0.25624242) {
                var570 = -0.015157623;
            } else {
                if (inputs[2] < 1.8392857) {
                    if (inputs[17] < 1.1192747) {
                        var570 = -0.007487336;
                    } else {
                        var570 = 0.008043874;
                    }
                } else {
                    var570 = -0.012376969;
                }
            }
        } else {
            var570 = 0.010292143;
        }
    }
    double var571;
    if (inputs[10] < 0.55) {
        if (inputs[25] < 2.8755717) {
            var571 = 0.011264386;
        } else {
            var571 = -0.004074924;
        }
    } else {
        if (inputs[10] < 5.7875) {
            if (inputs[4] < 1722.175) {
                if (inputs[12] < 1668.09) {
                    var571 = -0.008422224;
                } else {
                    var571 = 0.012459639;
                }
            } else {
                if (inputs[17] < 1.0464149) {
                    var571 = 0.0093342;
                } else {
                    if (inputs[19] < 2.0664175) {
                        var571 = -0.0073679574;
                    } else {
                        var571 = -0.026787331;
                    }
                }
            }
        } else {
            var571 = 0.010212387;
        }
    }
    double var572;
    if (inputs[14] < -0.923) {
        if (inputs[15] < -0.5891515) {
            var572 = 0.018185701;
        } else {
            var572 = -0.0015783723;
        }
    } else {
        if (inputs[19] < 2.128846) {
            if (inputs[19] < 1.8027071) {
                if (inputs[2] < 1.6878572) {
                    if (inputs[25] < 2.518391) {
                        var572 = 0.013934434;
                    } else {
                        var572 = -0.0047526225;
                    }
                } else {
                    var572 = -0.015456025;
                }
            } else {
                var572 = 0.015700206;
            }
        } else {
            if (inputs[20] < -0.44777) {
                var572 = -0.0006594325;
            } else {
                var572 = -0.026859019;
            }
        }
    }
    double var573;
    if (inputs[8] < 1664.29) {
        var573 = 0.015670527;
    } else {
        if (inputs[3] < 1944.205) {
            if (inputs[11] < 0.44) {
                if (inputs[11] < 0.36) {
                    if (inputs[10] < 0.465) {
                        var573 = 0.0053018127;
                    } else {
                        var573 = -0.008965708;
                    }
                } else {
                    if (inputs[9] < 2.95) {
                        var573 = -0.003151781;
                    } else {
                        var573 = 0.011347688;
                    }
                }
            } else {
                var573 = -0.017509269;
            }
        } else {
            var573 = 0.011276992;
        }
    }
    double var574;
    if (inputs[9] < 1.7475) {
        var574 = -0.009986116;
    } else {
        if (inputs[13] < 1667.96) {
            var574 = 0.017307602;
        } else {
            if (inputs[8] < 1712.27) {
                var574 = -0.01838965;
            } else {
                if (inputs[17] < 0.9943239) {
                    var574 = 0.012165573;
                } else {
                    if (inputs[17] < 2.0750191) {
                        var574 = -0.0009450546;
                    } else {
                        var574 = 0.0107971495;
                    }
                }
            }
        }
    }
    double var575;
    if (inputs[2] < 1.7264286) {
        if (inputs[19] < 1.160412) {
            var575 = -0.009405044;
        } else {
            if (inputs[16] < 0.19440602) {
                if (inputs[1] < 65.03897) {
                    if (inputs[24] < -18.610117) {
                        var575 = 0.014110741;
                    } else {
                        var575 = -0.0031165243;
                    }
                } else {
                    var575 = 0.0202093;
                }
            } else {
                var575 = -0.0082444325;
            }
        }
    } else {
        if (inputs[2] < 2.67) {
            if (inputs[25] < 2.1488645) {
                var575 = -0.0039964486;
            } else {
                var575 = -0.019158656;
            }
        } else {
            if (inputs[24] < 1.2061857) {
                var575 = -0.0037931656;
            } else {
                var575 = 0.0142744575;
            }
        }
    }
    double var576;
    if (inputs[15] < -0.55) {
        var576 = -0.010724025;
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[20] < 0.8231325) {
                if (inputs[9] < 2.985) {
                    var576 = 0.011783081;
                } else {
                    var576 = -0.009950925;
                }
            } else {
                var576 = 0.015461272;
            }
        } else {
            if (inputs[17] < 0.9873723) {
                var576 = 0.008164574;
            } else {
                if (inputs[18] < 1.8724273) {
                    if (inputs[2] < 1.4792857) {
                        var576 = -0.0010577287;
                    } else {
                        var576 = -0.021767452;
                    }
                } else {
                    var576 = 0.004142855;
                }
            }
        }
    }
    double var577;
    if (inputs[23] < -54.69902) {
        var577 = -0.01047356;
    } else {
        if (inputs[20] < 1.4817988) {
            if (inputs[8] < 1667.8) {
                var577 = 0.017651029;
            } else {
                if (inputs[23] < -26.165287) {
                    var577 = -0.00825419;
                } else {
                    if (inputs[20] < -0.45424098) {
                        var577 = -0.0017370965;
                    } else {
                        var577 = 0.010256992;
                    }
                }
            }
        } else {
            var577 = -0.014713582;
        }
    }
    double var578;
    if (inputs[19] < 1.3578346) {
        if (inputs[23] < -19.498507) {
            if (inputs[10] < 1.4525) {
                var578 = 0.009882894;
            } else {
                var578 = -0.00706306;
            }
        } else {
            var578 = -0.015172561;
        }
    } else {
        if (inputs[19] < 1.4563731) {
            var578 = 0.015607582;
        } else {
            if (inputs[25] < 3.3075356) {
                if (inputs[25] < 3.021015) {
                    if (inputs[22] < 1.0) {
                        var578 = -0.00648661;
                    } else {
                        var578 = 0.004930102;
                    }
                } else {
                    var578 = 0.016177231;
                }
            } else {
                var578 = -0.0095871035;
            }
        }
    }
    double var579;
    if (inputs[24] < 23.387367) {
        if (inputs[19] < 1.3542114) {
            if (inputs[25] < 2.518391) {
                var579 = 0.0017739827;
            } else {
                var579 = -0.012304427;
            }
        } else {
            if (inputs[11] < 0.29) {
                if (inputs[15] < -0.68151516) {
                    var579 = 0.007172946;
                } else {
                    if (inputs[24] < 3.3011563) {
                        var579 = -0.018441824;
                    } else {
                        var579 = -0.0027389752;
                    }
                }
            } else {
                if (inputs[9] < 4.3075) {
                    if (inputs[23] < -23.777779) {
                        var579 = 0.011276566;
                    } else {
                        var579 = -0.007600457;
                    }
                } else {
                    if (inputs[2] < 1.6985714) {
                        var579 = 0.021501217;
                    } else {
                        var579 = 0.004545363;
                    }
                }
            }
        }
    } else {
        var579 = 0.011579662;
    }
    double var580;
    if (inputs[10] < 5.7875) {
        if (inputs[25] < 3.3337195) {
            if (inputs[23] < -50.573925) {
                var580 = 0.011874996;
            } else {
                if (inputs[14] < -1.17) {
                    var580 = 0.011229897;
                } else {
                    if (inputs[25] < 3.021015) {
                        var580 = -0.004647479;
                    } else {
                        var580 = 0.0066824243;
                    }
                }
            }
        } else {
            if (inputs[19] < 1.4359628) {
                var580 = 0.002745662;
            } else {
                var580 = -0.015067939;
            }
        }
    } else {
        var580 = 0.009559539;
    }
    double var581;
    if (inputs[10] < 5.7875) {
        if (inputs[1] < 72.38545) {
            if (inputs[25] < 2.471551) {
                if (inputs[9] < 5.48) {
                    if (inputs[5] < 1853.5575) {
                        var581 = -0.010930665;
                    } else {
                        var581 = 0.0051511154;
                    }
                } else {
                    var581 = 0.013413763;
                }
            } else {
                if (inputs[17] < 1.3682485) {
                    if (inputs[18] < 1.1684365) {
                        var581 = -0.0151514625;
                    } else {
                        var581 = 0.003909065;
                    }
                } else {
                    var581 = -0.019415962;
                }
            }
        } else {
            var581 = 0.006313108;
        }
    } else {
        var581 = 0.011179481;
    }
    double var582;
    if (inputs[9] < 2.4575) {
        if (inputs[25] < 2.471551) {
            var582 = 0.015725661;
        } else {
            var582 = 0.0020935799;
        }
    } else {
        if (inputs[9] < 4.285) {
            if (inputs[10] < 0.3125) {
                var582 = 0.006409849;
            } else {
                var582 = -0.018166706;
            }
        } else {
            if (inputs[25] < 3.077972) {
                if (inputs[19] < 2.0103395) {
                    if (inputs[17] < 1.2264322) {
                        var582 = 0.025578547;
                    } else {
                        var582 = 0.000432641;
                    }
                } else {
                    var582 = -0.0050182794;
                }
            } else {
                if (inputs[11] < 0.31) {
                    var582 = 0.000014948242;
                } else {
                    var582 = -0.017801102;
                }
            }
        }
    }
    double var583;
    if (inputs[11] < 0.29) {
        if (inputs[13] < 1779.85) {
            var583 = -0.019712634;
        } else {
            if (inputs[4] < 1852.03) {
                var583 = 0.01075726;
            } else {
                var583 = -0.009054793;
            }
        }
    } else {
        if (inputs[18] < 2.0385132) {
            if (inputs[17] < 0.9245842) {
                var583 = 0.010983799;
            } else {
                if (inputs[17] < 1.0672319) {
                    var583 = -0.014504829;
                } else {
                    if (inputs[17] < 1.5406674) {
                        var583 = 0.004426965;
                    } else {
                        var583 = -0.009095384;
                    }
                }
            }
        } else {
            var583 = 0.014534713;
        }
    }
    double var584;
    if (inputs[4] < 1935.9) {
        if (inputs[2] < 1.9864286) {
            if (inputs[15] < 0.41484848) {
                if (inputs[21] < 2.7344482) {
                    if (inputs[1] < 35.795807) {
                        var584 = 0.0017651038;
                    } else {
                        var584 = -0.016626406;
                    }
                } else {
                    var584 = 0.0125317685;
                }
            } else {
                var584 = -0.013781994;
            }
        } else {
            if (inputs[19] < 2.2101338) {
                var584 = 0.020786688;
            } else {
                var584 = -0.000602766;
            }
        }
    } else {
        var584 = 0.012109118;
    }
    double var585;
    if (inputs[9] < 11.365) {
        if (inputs[14] < -1.168) {
            var585 = 0.014558193;
        } else {
            if (inputs[1] < 31.467228) {
                if (inputs[2] < 1.3928572) {
                    var585 = -0.0141208125;
                } else {
                    var585 = 0.0010819129;
                }
            } else {
                if (inputs[21] < -1.6590085) {
                    if (inputs[3] < 1809.09) {
                        var585 = 0.000642893;
                    } else {
                        var585 = 0.021818185;
                    }
                } else {
                    if (inputs[1] < 62.464783) {
                        var585 = -0.013668775;
                    } else {
                        var585 = 0.0047956216;
                    }
                }
            }
        }
    } else {
        var585 = -0.013024725;
    }
    double var586;
    if (inputs[9] < 11.365) {
        if (inputs[9] < 7.84) {
            if (inputs[5] < 1803.0625) {
                if (inputs[17] < 1.1178551) {
                    var586 = -0.0061466848;
                } else {
                    if (inputs[19] < 1.3074727) {
                        var586 = 0.022026097;
                    } else {
                        var586 = 0.0033763715;
                    }
                }
            } else {
                if (inputs[20] < -0.11280487) {
                    if (inputs[6] < 1900.295) {
                        var586 = 0.013684745;
                    } else {
                        var586 = -0.003667239;
                    }
                } else {
                    if (inputs[20] < 1.1750138) {
                        var586 = -0.019525807;
                    } else {
                        var586 = 0.0068682614;
                    }
                }
            }
        } else {
            var586 = 0.016235646;
        }
    } else {
        var586 = -0.01251714;
    }
    double var587;
    if (inputs[14] < 1.16) {
        if (inputs[19] < 1.1199208) {
            var587 = 0.01284364;
        } else {
            if (inputs[19] < 1.2641958) {
                var587 = -0.023498006;
            } else {
                if (inputs[17] < 0.9245842) {
                    var587 = 0.011427161;
                } else {
                    if (inputs[17] < 1.1144038) {
                        var587 = -0.020061621;
                    } else {
                        var587 = -0.00040232367;
                    }
                }
            }
        }
    } else {
        var587 = 0.013086089;
    }
    double var588;
    if (inputs[4] < 1935.9) {
        if (inputs[5] < 1913.09) {
            if (inputs[10] < 0.24) {
                var588 = -0.009224969;
            } else {
                if (inputs[15] < 0.39478788) {
                    if (inputs[15] < -0.2869091) {
                        var588 = 0.005895986;
                    } else {
                        var588 = -0.008682797;
                    }
                } else {
                    if (inputs[19] < 1.658906) {
                        var588 = 0.019416912;
                    } else {
                        var588 = 0.0014808028;
                    }
                }
            }
        } else {
            var588 = -0.015157948;
        }
    } else {
        var588 = 0.010991537;
    }
    double var589;
    if (inputs[2] < 2.6864285) {
        if (inputs[2] < 1.6985714) {
            if (inputs[24] < 16.963268) {
                if (inputs[11] < 0.33) {
                    var589 = 0.00951932;
                } else {
                    if (inputs[11] < 0.43) {
                        var589 = -0.01173682;
                    } else {
                        var589 = 0.008001816;
                    }
                }
            } else {
                if (inputs[24] < 24.900513) {
                    var589 = 0.020298328;
                } else {
                    var589 = -0.0032448508;
                }
            }
        } else {
            if (inputs[2] < 1.9357142) {
                var589 = -0.020893838;
            } else {
                if (inputs[8] < 1818.34) {
                    var589 = 0.0061375224;
                } else {
                    var589 = -0.0118824;
                }
            }
        }
    } else {
        var589 = 0.012051811;
    }
    double var590;
    if (inputs[3] < 1666.325) {
        var590 = 0.012223347;
    } else {
        if (inputs[4] < 1716.565) {
            var590 = -0.016968677;
        } else {
            if (inputs[5] < 1802.1625) {
                if (inputs[20] < -0.3115604) {
                    var590 = -0.0012105595;
                } else {
                    var590 = 0.016652945;
                }
            } else {
                if (inputs[13] < 1850.02) {
                    if (inputs[10] < 1.17) {
                        var590 = -0.019055326;
                    } else {
                        var590 = -0.004890976;
                    }
                } else {
                    if (inputs[2] < 1.7892857) {
                        var590 = 0.007950689;
                    } else {
                        var590 = -0.0066336095;
                    }
                }
            }
        }
    }
    double var591;
    if (inputs[24] < 19.642025) {
        if (inputs[24] < 7.5238104) {
            if (inputs[14] < -0.412) {
                if (inputs[20] < -0.9081138) {
                    var591 = 0.012605188;
                } else {
                    if (inputs[9] < 3.995) {
                        var591 = -0.013830119;
                    } else {
                        var591 = -0.0010560054;
                    }
                }
            } else {
                var591 = 0.010335958;
            }
        } else {
            if (inputs[19] < 1.6883639) {
                var591 = -0.0035837826;
            } else {
                var591 = -0.017848328;
            }
        }
    } else {
        if (inputs[16] < 0.19440602) {
            var591 = 0.014560825;
        } else {
            var591 = -0.0002145897;
        }
    }
    double var592;
    if (inputs[4] < 1935.9) {
        if (inputs[10] < 3.8325) {
            if (inputs[9] < 1.8525) {
                var592 = -0.017290037;
            } else {
                if (inputs[5] < 1803.0625) {
                    if (inputs[25] < 2.3828723) {
                        var592 = -0.0055141756;
                    } else {
                        var592 = 0.011106404;
                    }
                } else {
                    if (inputs[17] < 1.0965656) {
                        var592 = 0.008080223;
                    } else {
                        var592 = -0.009476338;
                    }
                }
            }
        } else {
            var592 = -0.014831615;
        }
    } else {
        var592 = 0.010477527;
    }
    double var593;
    if (inputs[25] < 3.852713) {
        if (inputs[20] < -1.5872867) {
            var593 = -0.008642085;
        } else {
            if (inputs[20] < 0.1593122) {
                if (inputs[2] < 1.2657143) {
                    var593 = -0.0053566;
                } else {
                    if (inputs[21] < 2.6388013) {
                        var593 = 0.0062626763;
                    } else {
                        var593 = 0.022639364;
                    }
                }
            } else {
                if (inputs[25] < 2.3247232) {
                    var593 = -0.008516716;
                } else {
                    if (inputs[18] < 1.4690953) {
                        var593 = -0.0045222244;
                    } else {
                        var593 = 0.0089600645;
                    }
                }
            }
        }
    } else {
        var593 = -0.009206263;
    }
    double var594;
    if (inputs[10] < 3.22) {
        if (inputs[14] < 0.727) {
            if (inputs[16] < 0.16321805) {
                if (inputs[20] < 0.8231325) {
                    if (inputs[20] < 0.1593122) {
                        var594 = 0.0041940003;
                    } else {
                        var594 = -0.01433015;
                    }
                } else {
                    var594 = 0.012027576;
                }
            } else {
                var594 = 0.017957734;
            }
        } else {
            if (inputs[1] < 69.46455) {
                var594 = 0.0036528106;
            } else {
                var594 = -0.012892443;
            }
        }
    } else {
        if (inputs[10] < 5.7875) {
            var594 = -0.017094262;
        } else {
            var594 = -0.0011352935;
        }
    }
    double var595;
    if (inputs[10] < 5.0575) {
        if (inputs[18] < 1.0600189) {
            var595 = 0.009528469;
        } else {
            if (inputs[18] < 2.4614255) {
                if (inputs[2] < 2.0321429) {
                    if (inputs[9] < 3.895) {
                        var595 = 0.0039333133;
                    } else {
                        var595 = -0.007919791;
                    }
                } else {
                    var595 = -0.018240027;
                }
            } else {
                var595 = 0.009171176;
            }
        }
    } else {
        var595 = 0.011501535;
    }
    double var596;
    if (inputs[5] < 1802.1625) {
        if (inputs[25] < 2.3247232) {
            var596 = -0.00491597;
        } else {
            if (inputs[1] < 67.546936) {
                if (inputs[14] < -0.768) {
                    var596 = 0.008019892;
                } else {
                    var596 = 0.024378873;
                }
            } else {
                var596 = 0.0013060953;
            }
        }
    } else {
        if (inputs[1] < 32.738472) {
            var596 = -0.012828114;
        } else {
            if (inputs[21] < -1.6925602) {
                var596 = 0.015709069;
            } else {
                if (inputs[20] < 0.10010364) {
                    if (inputs[16] < 0.18570676) {
                        var596 = -0.008917639;
                    } else {
                        var596 = 0.013887295;
                    }
                } else {
                    var596 = -0.018298673;
                }
            }
        }
    }
    double var597;
    if (inputs[24] < -25.683517) {
        var597 = -0.01627101;
    } else {
        if (inputs[23] < -16.599993) {
            if (inputs[2] < 1.9864286) {
                if (inputs[2] < 1.2021428) {
                    var597 = 0.013017477;
                } else {
                    if (inputs[23] < -36.490715) {
                        var597 = -0.012391245;
                    } else {
                        var597 = 0.0024524487;
                    }
                }
            } else {
                var597 = 0.018785605;
            }
        } else {
            if (inputs[24] < 19.88604) {
                if (inputs[18] < 1.3279924) {
                    var597 = -0.018384451;
                } else {
                    if (inputs[18] < 1.629514) {
                        var597 = 0.011660131;
                    } else {
                        var597 = -0.007707819;
                    }
                }
            } else {
                var597 = 0.007974686;
            }
        }
    }
    double var598;
    if (inputs[10] < 1.74) {
        if (inputs[15] < 0.36454546) {
            if (inputs[23] < -3.152488) {
                if (inputs[20] < 0.76225996) {
                    var598 = -0.010221658;
                } else {
                    var598 = 0.005251219;
                }
            } else {
                if (inputs[14] < -0.79) {
                    var598 = 0.022283655;
                } else {
                    var598 = -0.0031106337;
                }
            }
        } else {
            if (inputs[16] < 0.15609023) {
                var598 = 0.021906175;
            } else {
                var598 = 0.0058254194;
            }
        }
    } else {
        if (inputs[4] < 1723.235) {
            var598 = 0.008089854;
        } else {
            if (inputs[25] < 2.4213746) {
                var598 = 0.004742448;
            } else {
                if (inputs[18] < 1.6869229) {
                    var598 = -0.0035561484;
                } else {
                    var598 = -0.016861273;
                }
            }
        }
    }
    double var599;
    if (inputs[20] < -1.5872867) {
        var599 = -0.006981927;
    } else {
        if (inputs[15] < 0.3481818) {
            if (inputs[24] < -18.783993) {
                if (inputs[19] < 1.7740611) {
                    var599 = 0.021348728;
                } else {
                    var599 = -0.00022591086;
                }
            } else {
                if (inputs[19] < 1.222446) {
                    var599 = 0.008627715;
                } else {
                    if (inputs[18] < 1.8130751) {
                        var599 = -0.011119201;
                    } else {
                        var599 = 0.006055538;
                    }
                }
            }
        } else {
            if (inputs[17] < 1.1489543) {
                var599 = 0.023603966;
            } else {
                if (inputs[10] < 1.0175) {
                    var599 = 0.020052256;
                } else {
                    var599 = -0.0005375486;
                }
            }
        }
    }
    double var600;
    if (inputs[12] < 1897.33) {
        if (inputs[16] < -0.16878195) {
            if (inputs[14] < -0.768) {
                var600 = -0.01747833;
            } else {
                var600 = 0.010291906;
            }
        } else {
            if (inputs[2] < 1.9864286) {
                if (inputs[16] < 0.014992481) {
                    var600 = 0.014060757;
                } else {
                    if (inputs[17] < 1.1588719) {
                        var600 = 0.009591049;
                    } else {
                        var600 = -0.009846985;
                    }
                }
            } else {
                var600 = 0.019933127;
            }
        }
    } else {
        if (inputs[21] < 2.2357414) {
            if (inputs[11] < 0.34) {
                var600 = -0.008778037;
            } else {
                var600 = 0.009786491;
            }
        } else {
            var600 = -0.016729288;
        }
    }
    double var601;
    var601 = sigmoid(var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29 + var30 + var31 + var32 + var33 + var34 + var35 + var36 + var37 + var38 + var39 + var40 + var41 + var42 + var43 + var44 + var45 + var46 + var47 + var48 + var49 + var50 + var51 + var52 + var53 + var54 + var55 + var56 + var57 + var58 + var59 + var60 + var61 + var62 + var63 + var64 + var65 + var66 + var67 + var68 + var69 + var70 + var71 + var72 + var73 + var74 + var75 + var76 + var77 + var78 + var79 + var80 + var81 + var82 + var83 + var84 + var85 + var86 + var87 + var88 + var89 + var90 + var91 + var92 + var93 + var94 + var95 + var96 + var97 + var98 + var99 + var100 + var101 + var102 + var103 + var104 + var105 + var106 + var107 + var108 + var109 + var110 + var111 + var112 + var113 + var114 + var115 + var116 + var117 + var118 + var119 + var120 + var121 + var122 + var123 + var124 + var125 + var126 + var127 + var128 + var129 + var130 + var131 + var132 + var133 + var134 + var135 + var136 + var137 + var138 + var139 + var140 + var141 + var142 + var143 + var144 + var145 + var146 + var147 + var148 + var149 + var150 + var151 + var152 + var153 + var154 + var155 + var156 + var157 + var158 + var159 + var160 + var161 + var162 + var163 + var164 + var165 + var166 + var167 + var168 + var169 + var170 + var171 + var172 + var173 + var174 + var175 + var176 + var177 + var178 + var179 + var180 + var181 + var182 + var183 + var184 + var185 + var186 + var187 + var188 + var189 + var190 + var191 + var192 + var193 + var194 + var195 + var196 + var197 + var198 + var199 + var200 + var201 + var202 + var203 + var204 + var205 + var206 + var207 + var208 + var209 + var210 + var211 + var212 + var213 + var214 + var215 + var216 + var217 + var218 + var219 + var220 + var221 + var222 + var223 + var224 + var225 + var226 + var227 + var228 + var229 + var230 + var231 + var232 + var233 + var234 + var235 + var236 + var237 + var238 + var239 + var240 + var241 + var242 + var243 + var244 + var245 + var246 + var247 + var248 + var249 + var250 + var251 + var252 + var253 + var254 + var255 + var256 + var257 + var258 + var259 + var260 + var261 + var262 + var263 + var264 + var265 + var266 + var267 + var268 + var269 + var270 + var271 + var272 + var273 + var274 + var275 + var276 + var277 + var278 + var279 + var280 + var281 + var282 + var283 + var284 + var285 + var286 + var287 + var288 + var289 + var290 + var291 + var292 + var293 + var294 + var295 + var296 + var297 + var298 + var299 + var300 + var301 + var302 + var303 + var304 + var305 + var306 + var307 + var308 + var309 + var310 + var311 + var312 + var313 + var314 + var315 + var316 + var317 + var318 + var319 + var320 + var321 + var322 + var323 + var324 + var325 + var326 + var327 + var328 + var329 + var330 + var331 + var332 + var333 + var334 + var335 + var336 + var337 + var338 + var339 + var340 + var341 + var342 + var343 + var344 + var345 + var346 + var347 + var348 + var349 + var350 + var351 + var352 + var353 + var354 + var355 + var356 + var357 + var358 + var359 + var360 + var361 + var362 + var363 + var364 + var365 + var366 + var367 + var368 + var369 + var370 + var371 + var372 + var373 + var374 + var375 + var376 + var377 + var378 + var379 + var380 + var381 + var382 + var383 + var384 + var385 + var386 + var387 + var388 + var389 + var390 + var391 + var392 + var393 + var394 + var395 + var396 + var397 + var398 + var399 + var400 + var401 + var402 + var403 + var404 + var405 + var406 + var407 + var408 + var409 + var410 + var411 + var412 + var413 + var414 + var415 + var416 + var417 + var418 + var419 + var420 + var421 + var422 + var423 + var424 + var425 + var426 + var427 + var428 + var429 + var430 + var431 + var432 + var433 + var434 + var435 + var436 + var437 + var438 + var439 + var440 + var441 + var442 + var443 + var444 + var445 + var446 + var447 + var448 + var449 + var450 + var451 + var452 + var453 + var454 + var455 + var456 + var457 + var458 + var459 + var460 + var461 + var462 + var463 + var464 + var465 + var466 + var467 + var468 + var469 + var470 + var471 + var472 + var473 + var474 + var475 + var476 + var477 + var478 + var479 + var480 + var481 + var482 + var483 + var484 + var485 + var486 + var487 + var488 + var489 + var490 + var491 + var492 + var493 + var494 + var495 + var496 + var497 + var498 + var499 + var500 + var501 + var502 + var503 + var504 + var505 + var506 + var507 + var508 + var509 + var510 + var511 + var512 + var513 + var514 + var515 + var516 + var517 + var518 + var519 + var520 + var521 + var522 + var523 + var524 + var525 + var526 + var527 + var528 + var529 + var530 + var531 + var532 + var533 + var534 + var535 + var536 + var537 + var538 + var539 + var540 + var541 + var542 + var543 + var544 + var545 + var546 + var547 + var548 + var549 + var550 + var551 + var552 + var553 + var554 + var555 + var556 + var557 + var558 + var559 + var560 + var561 + var562 + var563 + var564 + var565 + var566 + var567 + var568 + var569 + var570 + var571 + var572 + var573 + var574 + var575 + var576 + var577 + var578 + var579 + var580 + var581 + var582 + var583 + var584 + var585 + var586 + var587 + var588 + var589 + var590 + var591 + var592 + var593 + var594 + var595 + var596 + var597 + var598 + var599 + var600);
    memcpy(output, (double[]){1.0 - var601, var601}, 2 * sizeof(double));
}


// --- Fonction Wrapper pour une utilisation simple ---
// Retourne la probabilité de la classe 'Gagnant' (classe 1) pour XGBoost
double XGBoost_Predict(const double &inputs[])
{
   double prediction[2];
   xgboost_score(inputs, prediction);
   return prediction[1];
}