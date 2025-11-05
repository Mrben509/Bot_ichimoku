//+------------------------------------------------------------------+
//|   XGBoost Predictor for MQL5
//|   Généré par un script Python en utilisant m2cgen
//+------------------------------------------------------------------+
#property strict

// --- Seuil optimal trouvé pendant l'entraînement
// const double BEST_THRESHOLD = 0.390000;

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



double sigmoid_XGBoost(double x) {
    if (x < 0.0) {
        double z = exp(x);
        return z / (1.0 + z);
    }
    return 1.0 / (1.0 + exp(-x));
}
void xgboost_score(const double &inputs[], double &output[]) {
    double var0;
    if (inputs[12] < 0.07669173) {
        if (inputs[14] < 1.1808475) {
            if (inputs[13] < 1.0959854) {
                var0 = -0.019133199;
            } else {
                var0 = 0.0619751;
            }
        } else {
            if (inputs[11] < 0.45515153) {
                var0 = -0.03309096;
            } else {
                var0 = 0.03750516;
            }
        }
    } else {
        if (inputs[22] < 13.0) {
            if (inputs[12] < 0.12238346) {
                var0 = 0.056933034;
            } else {
                var0 = -0.013007066;
            }
        } else {
            if (inputs[7] < 6.095) {
                var0 = 0.023700742;
            } else {
                var0 = 0.07942477;
            }
        }
    }
    double var1;
    if (inputs[12] < -0.2844812) {
        if (inputs[9] < 0.09) {
            var1 = -0.077330016;
        } else {
            var1 = -0.026179958;
        }
    } else {
        if (inputs[2] < 1.3314285) {
            if (inputs[2] < 1.1464286) {
                var1 = -0.003758493;
            } else {
                var1 = -0.05805434;
            }
        } else {
            if (inputs[2] < 1.8671429) {
                var1 = 0.02454502;
            } else {
                var1 = -0.013586985;
            }
        }
    }
    double var2;
    if (inputs[17] < -2.6242263) {
        if (inputs[8] < 1.7975) {
            var2 = -0.07194845;
        } else {
            if (inputs[16] < 1.027653) {
                var2 = -0.02487656;
            } else {
                var2 = 0.037836667;
            }
        }
    } else {
        if (inputs[7] < 8.235) {
            if (inputs[16] < -1.0034269) {
                var2 = 0.033012748;
            } else {
                var2 = 0.0007486227;
            }
        } else {
            if (inputs[15] < 3.2574139) {
                var2 = -0.0539482;
            } else {
                var2 = -0.018430073;
            }
        }
    }
    double var3;
    if (inputs[11] < -0.286) {
        if (inputs[19] < 65.03363) {
            if (inputs[19] < 23.871965) {
                var3 = -0.034766924;
            } else {
                var3 = -0.07788332;
            }
        } else {
            if (inputs[12] < -0.2008797) {
                var3 = -0.037590787;
            } else {
                var3 = 0.016738925;
            }
        }
    } else {
        if (inputs[4] < 2023.44) {
            var3 = 0.06407072;
        } else {
            if (inputs[6] < 2033.765) {
                var3 = -0.0636228;
            } else {
                var3 = 0.014017907;
            }
        }
    }
    double var4;
    if (inputs[12] < -0.31518796) {
        if (inputs[8] < 1.035) {
            var4 = -0.030196946;
        } else {
            var4 = -0.07253575;
        }
    } else {
        if (inputs[9] < 0.13) {
            if (inputs[3] < 2324.8) {
                var4 = 0.035735935;
            } else {
                var4 = -0.0040127686;
            }
        } else {
            if (inputs[16] < -1.1376609) {
                var4 = 0.013362041;
            } else {
                var4 = -0.022293039;
            }
        }
    }
    double var5;
    if (inputs[5] < 2337.815) {
        if (inputs[12] < 0.24064662) {
            if (inputs[2] < 1.2578571) {
                var5 = -0.0137739545;
            } else {
                var5 = 0.021800842;
            }
        } else {
            var5 = 0.058365613;
        }
    } else {
        if (inputs[8] < 0.315) {
            var5 = 0.048287645;
        } else {
            if (inputs[16] < 0.9628601) {
                var5 = -0.030535268;
            } else {
                var5 = 0.029925343;
            }
        }
    }
    double var6;
    if (inputs[11] < -0.286) {
        if (inputs[15] < 1.4852071) {
            if (inputs[1] < 26.961962) {
                var6 = 0.050309222;
            } else {
                var6 = -0.016616495;
            }
        } else {
            if (inputs[7] < 5.985) {
                var6 = -0.067496486;
            } else {
                var6 = -0.019891081;
            }
        }
    } else {
        if (inputs[1] < 61.49535) {
            if (inputs[22] < 10.0) {
                var6 = 0.059661213;
            } else {
                var6 = 0.016386008;
            }
        } else {
            if (inputs[22] < 6.0) {
                var6 = -0.027862187;
            } else {
                var6 = 0.0131066805;
            }
        }
    }
    double var7;
    if (inputs[16] < 1.6773072) {
        if (inputs[16] < 0.9440991) {
            if (inputs[16] < -0.54457283) {
                var7 = 0.010591352;
            } else {
                var7 = -0.01834456;
            }
        } else {
            if (inputs[13] < 1.3235105) {
                var7 = 0.05762513;
            } else {
                var7 = 0.011165195;
            }
        }
    } else {
        var7 = -0.053207446;
    }
    double var8;
    if (inputs[2] < 1.3192858) {
        if (inputs[8] < 0.3925) {
            var8 = -0.06438221;
        } else {
            if (inputs[9] < 0.13) {
                var8 = 0.024943728;
            } else {
                var8 = -0.024961082;
            }
        }
    } else {
        if (inputs[2] < 1.8535714) {
            if (inputs[8] < 1.125) {
                var8 = 0.037223134;
            } else {
                var8 = 0.0021361348;
            }
        } else {
            if (inputs[5] < 2314.525) {
                var8 = 0.016278582;
            } else {
                var8 = -0.043543622;
            }
        }
    }
    double var9;
    if (inputs[19] >= 37.96602) {
        if (inputs[2] < 1.935) {
            if (inputs[16] < -1.0481929) {
                var9 = 0.019008059;
            } else {
                var9 = -0.0208252;
            }
        } else {
            var9 = -0.07184985;
        }
    } else {
        if (inputs[13] < 0.94887304) {
            if (inputs[20] >= 12.3672905) {
                var9 = 0.024481177;
            } else {
                var9 = -0.056467485;
            }
        } else {
            if (inputs[21] < 2.8599465) {
                var9 = 0.03270023;
            } else {
                var9 = -0.00036979734;
            }
        }
    }
    double var10;
    if (inputs[8] < 7.86) {
        if (inputs[11] < 0.3712727) {
            if (inputs[11] < 0.32236364) {
                var10 = 0.0004926336;
            } else {
                var10 = -0.0630739;
            }
        } else {
            if (inputs[9] < 0.13) {
                var10 = 0.042921524;
            } else {
                var10 = 0.000020602061;
            }
        }
    } else {
        var10 = -0.05654519;
    }
    double var11;
    if (inputs[11] < -0.5559394) {
        if (inputs[10] < -1.669) {
            var11 = -0.014028319;
        } else {
            var11 = -0.07164931;
        }
    } else {
        if (inputs[14] < 0.99904406) {
            var11 = 0.054896165;
        } else {
            if (inputs[19] < 26.237036) {
                var11 = 0.039810535;
            } else {
                var11 = 0.0016389176;
            }
        }
    }
    double var12;
    if (inputs[2] < 1.3314285) {
        if (inputs[5] < 2358.8125) {
            if (inputs[5] < 2332.8174) {
                var12 = -0.016954191;
            } else {
                var12 = 0.041574996;
            }
        } else {
            var12 = -0.076215595;
        }
    } else {
        if (inputs[17] < 2.5428717) {
            if (inputs[15] < 1.4649078) {
                var12 = 0.022953603;
            } else {
                var12 = -0.022559067;
            }
        } else {
            if (inputs[17] < 3.4171221) {
                var12 = 0.056093033;
            } else {
                var12 = 0.017884664;
            }
        }
    }
    double var13;
    if (inputs[2] < 1.8092858) {
        if (inputs[2] < 1.3192858) {
            if (inputs[21] < 4.166014) {
                var13 = -0.019106565;
            } else {
                var13 = 0.034636933;
            }
        } else {
            if (inputs[19] < 86.309265) {
                var13 = 0.006950864;
            } else {
                var13 = 0.044297483;
            }
        }
    } else {
        if (inputs[5] < 2314.525) {
            if (inputs[15] < 2.4092324) {
                var13 = -0.017591087;
            } else {
                var13 = 0.031832196;
            }
        } else {
            if (inputs[4] < 2395.295) {
                var13 = -0.07487885;
            } else {
                var13 = -0.0032504555;
            }
        }
    }
    double var14;
    if (inputs[12] < -0.1836391) {
        if (inputs[1] < 29.063995) {
            if (inputs[21] < 3.2230215) {
                var14 = -0.07161169;
            } else {
                var14 = -0.013281675;
            }
        } else {
            if (inputs[1] < 31.39021) {
                var14 = 0.028241228;
            } else {
                var14 = -0.021680623;
            }
        }
    } else {
        if (inputs[2] < 1.3178571) {
            if (inputs[22] < 12.0) {
                var14 = 0.0011354067;
            } else {
                var14 = -0.057394087;
            }
        } else {
            if (inputs[8] < 1.0975) {
                var14 = 0.028812032;
            } else {
                var14 = 0.003134963;
            }
        }
    }
    double var15;
    if (inputs[5] < 2313.88) {
        if (inputs[3] < 2047.77) {
            if (inputs[8] < 0.815) {
                var15 = -0.05585404;
            } else {
                var15 = 0.004849145;
            }
        } else {
            if (inputs[21] < 3.2896175) {
                var15 = 0.04182746;
            } else {
                var15 = -0.019813288;
            }
        }
    } else {
        if (inputs[11] < 0.36872727) {
            if (inputs[11] < 0.30254546) {
                var15 = -0.018165942;
            } else {
                var15 = -0.07509116;
            }
        } else {
            if (inputs[14] < 1.4020628) {
                var15 = 0.05614077;
            } else {
                var15 = -0.013609754;
            }
        }
    }
    double var16;
    if (inputs[21] < 4.763538) {
        if (inputs[13] < 0.98011017) {
            if (inputs[19] >= 37.920868) {
                var16 = 0.014468547;
            } else {
                var16 = -0.055383246;
            }
        } else {
            if (inputs[10] < -0.91) {
                var16 = -0.022790294;
            } else {
                var16 = 0.011271977;
            }
        }
    } else {
        var16 = 0.069184765;
    }
    double var17;
    if (inputs[2] < 1.2814286) {
        if (inputs[2] < 1.1464286) {
            if (inputs[14] < 1.2708536) {
                var17 = -0.030451158;
            } else {
                var17 = 0.01962994;
            }
        } else {
            if (inputs[1] < 61.995464) {
                var17 = -0.030410053;
            } else {
                var17 = -0.07257547;
            }
        }
    } else {
        if (inputs[2] < 1.8671429) {
            if (inputs[11] < -0.55472726) {
                var17 = -0.03048292;
            } else {
                var17 = 0.024043145;
            }
        } else {
            if (inputs[6] < 2322.655) {
                var17 = 0.018345239;
            } else {
                var17 = -0.03602812;
            }
        }
    }
    double var18;
    if (inputs[10] < 1.017) {
        if (inputs[3] < 2369.505) {
            if (inputs[19] >= 65.74466) {
                var18 = 0.036497273;
            } else {
                var18 = -0.009244939;
            }
        } else {
            if (inputs[10] < 0.713) {
                var18 = -0.009722684;
            } else {
                var18 = -0.07695574;
            }
        }
    } else {
        if (inputs[21] < 2.388913) {
            var18 = -0.030062625;
        } else {
            if (inputs[5] < 2277.2625) {
                var18 = 0.006063815;
            } else {
                var18 = 0.058939967;
            }
        }
    }
    double var19;
    if (inputs[19] < 26.237036) {
        if (inputs[10] < 0.66) {
            var19 = 0.03748796;
        } else {
            var19 = 0.07466136;
        }
    } else {
        if (inputs[1] < 61.49535) {
            if (inputs[19] < 72.65421) {
                var19 = -0.024783166;
            } else {
                var19 = 0.023558982;
            }
        } else {
            if (inputs[16] < -1.8129214) {
                var19 = -0.08031991;
            } else {
                var19 = -0.009492937;
            }
        }
    }
    double var20;
    if (inputs[19] >= 37.96602) {
        if (inputs[7] < 3.75) {
            if (inputs[8] < 0.5225) {
                var20 = -0.02123271;
            } else {
                var20 = 0.043863177;
            }
        } else {
            if (inputs[14] < 1.3491168) {
                var20 = -0.07049203;
            } else {
                var20 = -0.014844665;
            }
        }
    } else {
        if (inputs[12] < 0.24064662) {
            if (inputs[13] < 1.0851175) {
                var20 = -0.0200634;
            } else {
                var20 = 0.01800135;
            }
        } else {
            if (inputs[12] < 0.3209624) {
                var20 = 0.072736554;
            } else {
                var20 = 0.023844142;
            }
        }
    }
    double var21;
    if (inputs[10] < 1.017) {
        if (inputs[15] < 2.09165) {
            if (inputs[9] < 0.13) {
                var21 = 0.032451723;
            } else {
                var21 = -0.0055971243;
            }
        } else {
            if (inputs[7] < 4.96) {
                var21 = 0.0061585377;
            } else {
                var21 = -0.054795973;
            }
        }
    } else {
        if (inputs[10] < 1.193) {
            var21 = 0.060502723;
        } else {
            if (inputs[15] < 1.8769641) {
                var21 = -0.02438887;
            } else {
                var21 = 0.039177053;
            }
        }
    }
    double var22;
    if (inputs[13] < 1.3489907) {
        if (inputs[14] < 0.99904406) {
            var22 = 0.024881478;
        } else {
            if (inputs[16] < 0.8653556) {
                var22 = -0.03810463;
            } else {
                var22 = 0.0096236365;
            }
        }
    } else {
        if (inputs[12] < -0.2882406) {
            var22 = -0.04636455;
        } else {
            if (inputs[15] < 1.7318975) {
                var22 = 0.003545777;
            } else {
                var22 = 0.032294903;
            }
        }
    }
    double var23;
    if (inputs[21] < 4.642234) {
        if (inputs[21] < 3.4031916) {
            if (inputs[16] < -1.0034269) {
                var23 = 0.025941987;
            } else {
                var23 = 0.00031228494;
            }
        } else {
            if (inputs[8] < 1.535) {
                var23 = -0.054167446;
            } else {
                var23 = -0.0055451724;
            }
        }
    } else {
        var23 = 0.06778486;
    }
    double var24;
    if (inputs[19] < 26.237036) {
        if (inputs[0] < 1.0) {
            var24 = 0.07024208;
        } else {
            var24 = 0.004307012;
        }
    } else {
        if (inputs[4] < 2371.05) {
            if (inputs[10] < 1.245) {
                var24 = 0.009023604;
            } else {
                var24 = -0.04604448;
            }
        } else {
            if (inputs[19] >= 45.289757) {
                var24 = -0.011504439;
            } else {
                var24 = -0.054081634;
            }
        }
    }
    double var25;
    if (inputs[12] < -0.37695488) {
        var25 = -0.06212297;
    } else {
        if (inputs[13] < 0.96818596) {
            if (inputs[19] >= 67.00373) {
                var25 = 0.04021015;
            } else {
                var25 = -0.052641578;
            }
        } else {
            if (inputs[1] < 76.3198) {
                var25 = 0.010662609;
            } else {
                var25 = -0.035954535;
            }
        }
    }
    double var26;
    if (inputs[3] < 2047.77) {
        if (inputs[11] < 0.3332121) {
            if (inputs[7] < 5.285) {
                var26 = -0.07376558;
            } else {
                var26 = -0.030666992;
            }
        } else {
            var26 = 0.020535523;
        }
    } else {
        if (inputs[3] < 2178.96) {
            if (inputs[20] >= 9.35298) {
                var26 = 0.02132127;
            } else {
                var26 = 0.06732509;
            }
        } else {
            if (inputs[3] < 2286.305) {
                var26 = -0.05871923;
            } else {
                var26 = 0.0069852113;
            }
        }
    }
    double var27;
    if (inputs[17] < 2.420463) {
        if (inputs[8] < 5.5825) {
            if (inputs[7] < 5.105) {
                var27 = -0.017152583;
            } else {
                var27 = 0.013820015;
            }
        } else {
            var27 = -0.04744471;
        }
    } else {
        if (inputs[8] < 1.53) {
            if (inputs[8] < 0.38) {
                var27 = -0.0021139062;
            } else {
                var27 = 0.03938453;
            }
        } else {
            if (inputs[1] < 73.45471) {
                var27 = 0.016664116;
            } else {
                var27 = -0.036353573;
            }
        }
    }
    double var28;
    if (inputs[12] < 0.24064662) {
        if (inputs[14] < 2.5834365) {
            if (inputs[20] >= 16.252956) {
                var28 = -0.04543438;
            } else {
                var28 = -0.004472641;
            }
        } else {
            var28 = 0.042562786;
        }
    } else {
        if (inputs[3] < 2324.8) {
            var28 = 0.055499766;
        } else {
            if (inputs[17] < 3.2) {
                var28 = 0.0039096205;
            } else {
                var28 = -0.0029828178;
            }
        }
    }
    double var29;
    if (inputs[11] < 0.38963637) {
        if (inputs[2] < 1.6928571) {
            if (inputs[8] < 2.8875) {
                var29 = -0.008895585;
            } else {
                var29 = 0.03633194;
            }
        } else {
            if (inputs[4] < 2315.985) {
                var29 = -0.011689073;
            } else {
                var29 = -0.052330103;
            }
        }
    } else {
        if (inputs[14] < 1.3980948) {
            var29 = 0.05576238;
        } else {
            if (inputs[13] < 1.5374212) {
                var29 = -0.013049943;
            } else {
                var29 = 0.033527303;
            }
        }
    }
    double var30;
    if (inputs[11] < -0.5714545) {
        if (inputs[10] < -1.729) {
            var30 = 0.012095146;
        } else {
            var30 = -0.065450504;
        }
    } else {
        if (inputs[2] < 1.8671429) {
            if (inputs[1] < 77.52381) {
                var30 = 0.016493466;
            } else {
                var30 = -0.038722645;
            }
        } else {
            if (inputs[15] < 1.7318975) {
                var30 = -0.05555662;
            } else {
                var30 = 0.0057107965;
            }
        }
    }
    double var31;
    if (inputs[11] < -0.5559394) {
        if (inputs[4] < 2360.99) {
            var31 = -0.06622624;
        } else {
            var31 = -0.018906243;
        }
    } else {
        if (inputs[8] < 1.895) {
            if (inputs[13] < 1.1499044) {
                var31 = -0.013641732;
            } else {
                var31 = 0.028552419;
            }
        } else {
            if (inputs[14] < 1.1808475) {
                var31 = 0.025848806;
            } else {
                var31 = -0.026138028;
            }
        }
    }
    double var32;
    if (inputs[12] < 0.24064662) {
        if (inputs[7] < 1.32) {
            var32 = -0.05780567;
        } else {
            if (inputs[19] >= 82.71136) {
                var32 = 0.023895845;
            } else {
                var32 = -0.008932935;
            }
        }
    } else {
        if (inputs[19] >= 48.817905) {
            var32 = -0.010382649;
        } else {
            if (inputs[12] < 0.33003008) {
                var32 = 0.06630426;
            } else {
                var32 = 0.021707317;
            }
        }
    }
    double var33;
    if (inputs[20] >= 28.236462) {
        var33 = 0.06020739;
    } else {
        if (inputs[19] >= 26.237036) {
            if (inputs[12] < 0.11461654) {
                var33 = 0.00005470558;
            } else {
                var33 = -0.048607446;
            }
        } else {
            if (inputs[5] < 2025.995) {
                var33 = -0.041008204;
            } else {
                var33 = 0.0168764;
            }
        }
    }
    double var34;
    if (inputs[16] < -1.1376609) {
        if (inputs[16] < -1.8126473) {
            if (inputs[12] < -0.01568421) {
                var34 = 0.017172053;
            } else {
                var34 = -0.047942553;
            }
        } else {
            if (inputs[14] < 1.8818406) {
                var34 = 0.040420465;
            } else {
                var34 = -0.016524408;
            }
        }
    } else {
        if (inputs[12] < 0.24064662) {
            if (inputs[12] < 0.16426316) {
                var34 = -0.008990146;
            } else {
                var34 = -0.060477003;
            }
        } else {
            if (inputs[19] >= 19.627342) {
                var34 = -0.013829261;
            } else {
                var34 = 0.058970217;
            }
        }
    }
    double var35;
    if (inputs[19] >= 85.43868) {
        if (inputs[11] < 0.26369697) {
            if (inputs[16] < -0.5485916) {
                var35 = 0.07404429;
            } else {
                var35 = 0.014431824;
            }
        } else {
            var35 = -0.0013228732;
        }
    } else {
        if (inputs[6] < 2310.015) {
            if (inputs[13] < 1.0749065) {
                var35 = -0.023026105;
            } else {
                var35 = 0.024379227;
            }
        } else {
            if (inputs[11] < 0.5343636) {
                var35 = -0.022264823;
            } else {
                var35 = 0.02810274;
            }
        }
    }
    double var36;
    if (inputs[2] < 1.2814286) {
        if (inputs[15] < 1.096939) {
            var36 = 0.012611552;
        } else {
            if (inputs[21] < 4.08689) {
                var36 = -0.054177783;
            } else {
                var36 = -0.00070219644;
            }
        }
    } else {
        if (inputs[17] < 2.587775) {
            if (inputs[15] < 1.4649078) {
                var36 = 0.012045566;
            } else {
                var36 = -0.018234149;
            }
        } else {
            if (inputs[10] < 1.003) {
                var36 = 0.010237301;
            } else {
                var36 = 0.053757407;
            }
        }
    }
    double var37;
    if (inputs[21] < 4.763538) {
        if (inputs[2] < 1.3192858) {
            if (inputs[17] < -3.5866337) {
                var37 = 0.043005932;
            } else {
                var37 = -0.03120596;
            }
        } else {
            if (inputs[2] < 1.6107143) {
                var37 = 0.026933236;
            } else {
                var37 = -0.004159198;
            }
        }
    } else {
        var37 = 0.057338562;
    }
    double var38;
    if (inputs[11] < 0.5718788) {
        if (inputs[1] < 77.52381) {
            if (inputs[20] >= 26.500927) {
                var38 = 0.059991054;
            } else {
                var38 = -0.0018762627;
            }
        } else {
            var38 = -0.055707052;
        }
    } else {
        if (inputs[16] < 0.15536931) {
            var38 = 0.024030248;
        } else {
            var38 = 0.05667834;
        }
    }
    double var39;
    if (inputs[12] < -0.31799248) {
        var39 = -0.041874643;
    } else {
        if (inputs[8] < 0.365) {
            if (inputs[19] < 95.71113) {
                var39 = 0.012198222;
            } else {
                var39 = -0.062346935;
            }
        } else {
            if (inputs[8] < 1.165) {
                var39 = 0.027490886;
            } else {
                var39 = -0.0033019597;
            }
        }
    }
    double var40;
    if (inputs[13] < 1.1499044) {
        if (inputs[12] < 0.24064662) {
            if (inputs[16] < 0.84743404) {
                var40 = -0.040320188;
            } else {
                var40 = 0.008048749;
            }
        } else {
            var40 = 0.025688956;
        }
    } else {
        if (inputs[10] < -0.883) {
            if (inputs[10] < -1.11) {
                var40 = -0.008065886;
            } else {
                var40 = -0.06610347;
            }
        } else {
            if (inputs[10] < 0.811) {
                var40 = 0.0407087;
            } else {
                var40 = -0.0017985026;
            }
        }
    }
    double var41;
    if (inputs[19] < 26.237036) {
        var41 = 0.05200614;
    } else {
        if (inputs[4] < 2371.05) {
            if (inputs[8] < 0.3925) {
                var41 = -0.02203554;
            } else {
                var41 = 0.018073188;
            }
        } else {
            if (inputs[19] >= 44.345387) {
                var41 = -0.0073286234;
            } else {
                var41 = -0.05753404;
            }
        }
    }
    double var42;
    if (inputs[8] < 6.825) {
        if (inputs[14] < 2.7742078) {
            if (inputs[11] < -0.5714545) {
                var42 = -0.04755896;
            } else {
                var42 = 0.00823048;
            }
        } else {
            var42 = 0.04638495;
        }
    } else {
        var42 = -0.029853802;
    }
    double var43;
    if (inputs[21] < 4.632727) {
        if (inputs[13] < 1.0616516) {
            if (inputs[3] < 2381.505) {
                var43 = -0.042855985;
            } else {
                var43 = 0.015470806;
            }
        } else {
            if (inputs[15] < 2.09165) {
                var43 = 0.013718409;
            } else {
                var43 = -0.01887162;
            }
        }
    } else {
        var43 = 0.059629075;
    }
    double var44;
    if (inputs[17] < -2.7224422) {
        if (inputs[20] >= -22.709812) {
            var44 = -0.069711685;
        } else {
            if (inputs[16] < 0.041054778) {
                var44 = -0.04328687;
            } else {
                var44 = 0.020213712;
            }
        }
    } else {
        if (inputs[20] >= -23.788687) {
            if (inputs[22] < 6.0) {
                var44 = -0.011161117;
            } else {
                var44 = 0.016840361;
            }
        } else {
            var44 = -0.04895576;
        }
    }
    double var45;
    if (inputs[14] < 1.1932963) {
        if (inputs[14] < 1.1449803) {
            if (inputs[8] < 2.725) {
                var45 = -0.0059297225;
            } else {
                var45 = 0.040240116;
            }
        } else {
            var45 = 0.061419114;
        }
    } else {
        if (inputs[13] < 1.1480767) {
            if (inputs[19] >= 65.74466) {
                var45 = 0.0171115;
            } else {
                var45 = -0.045383036;
            }
        } else {
            if (inputs[21] < 2.1417506) {
                var45 = -0.025192259;
            } else {
                var45 = 0.009594261;
            }
        }
    }
    double var46;
    if (inputs[14] < 1.4389093) {
        if (inputs[14] < 1.1932963) {
            if (inputs[7] < 2.945) {
                var46 = -0.04208774;
            } else {
                var46 = 0.015845777;
            }
        } else {
            if (inputs[11] < 0.35787877) {
                var46 = -0.041335963;
            } else {
                var46 = 0.012478236;
            }
        }
    } else {
        if (inputs[22] < 7.0) {
            if (inputs[16] < 0.45965445) {
                var46 = -0.029924592;
            } else {
                var46 = 0.0356704;
            }
        } else {
            if (inputs[14] < 2.5544794) {
                var46 = 0.009921293;
            } else {
                var46 = 0.06481468;
            }
        }
    }
    double var47;
    if (inputs[17] < -2.7224422) {
        if (inputs[17] < -3.5866337) {
            if (inputs[6] < 2314.2) {
                var47 = 0.038922597;
            } else {
                var47 = -0.0047072633;
            }
        } else {
            if (inputs[17] < -3.193307) {
                var47 = -0.023470333;
            } else {
                var47 = -0.06776106;
            }
        }
    } else {
        if (inputs[17] < -2.5035655) {
            if (inputs[11] < -0.4849091) {
                var47 = 0.059297454;
            } else {
                var47 = 0.01615546;
            }
        } else {
            if (inputs[19] < 37.96602) {
                var47 = 0.027298352;
            } else {
                var47 = -0.008659056;
            }
        }
    }
    double var48;
    if (inputs[17] < -2.7223856) {
        if (inputs[7] < 5.2625) {
            if (inputs[11] < -0.41751516) {
                var48 = -0.042476937;
            } else {
                var48 = -0.06562489;
            }
        } else {
            if (inputs[3] < 2280.625) {
                var48 = 0.045000833;
            } else {
                var48 = -0.028378816;
            }
        }
    } else {
        if (inputs[7] < 11.9575) {
            if (inputs[16] < -2.0704062) {
                var48 = -0.031493533;
            } else {
                var48 = 0.010315978;
            }
        } else {
            var48 = -0.041140486;
        }
    }
    double var49;
    if (inputs[16] < -0.30762097) {
        if (inputs[1] < 73.47327) {
            if (inputs[22] < 7.0) {
                var49 = -0.008937089;
            } else {
                var49 = 0.031661622;
            }
        } else {
            var49 = -0.035000335;
        }
    } else {
        if (inputs[19] < 67.16126) {
            if (inputs[2] < 1.3521428) {
                var49 = -0.013689785;
            } else {
                var49 = -0.060946975;
            }
        } else {
            if (inputs[22] < 4.0) {
                var49 = 0.04230916;
            } else {
                var49 = -0.009842552;
            }
        }
    }
    double var50;
    if (inputs[12] < -0.31518796) {
        var50 = -0.03776673;
    } else {
        if (inputs[16] < 0.9440991) {
            if (inputs[16] < -0.5226052) {
                var50 = 0.015436821;
            } else {
                var50 = -0.019250473;
            }
        } else {
            if (inputs[6] < 2335.47) {
                var50 = 0.004397675;
            } else {
                var50 = 0.04794114;
            }
        }
    }
    double var51;
    if (inputs[13] < 1.0959854) {
        if (inputs[13] < 0.8593393) {
            if (inputs[8] < 1.125) {
                var51 = 0.054974686;
            } else {
                var51 = -0.022448892;
            }
        } else {
            if (inputs[8] < 0.435) {
                var51 = -0.0023731983;
            } else {
                var51 = -0.050725434;
            }
        }
    } else {
        if (inputs[14] < 1.2039788) {
            if (inputs[12] < 0.087902255) {
                var51 = 0.052488063;
            } else {
                var51 = -0.0008771296;
            }
        } else {
            if (inputs[12] < 0.2044361) {
                var51 = -0.0033247033;
            } else {
                var51 = 0.029449392;
            }
        }
    }
    double var52;
    if (inputs[11] < -0.5559394) {
        if (inputs[14] < 2.5639517) {
            var52 = -0.060130198;
        } else {
            var52 = 0.007487142;
        }
    } else {
        if (inputs[7] < 9.1125) {
            if (inputs[20] < 26.298834) {
                var52 = 0.008903066;
            } else {
                var52 = 0.048709113;
            }
        } else {
            if (inputs[20] < 16.67249) {
                var52 = -0.05507715;
            } else {
                var52 = 0.00009817989;
            }
        }
    }
    double var53;
    if (inputs[16] < 1.6773072) {
        if (inputs[16] < -2.1543221) {
            var53 = -0.05171812;
        } else {
            if (inputs[22] < 2.0) {
                var53 = 0.05113004;
            } else {
                var53 = 0.0024956532;
            }
        }
    } else {
        var53 = -0.045501914;
    }
    double var54;
    if (inputs[17] < -2.613515) {
        if (inputs[8] < 4.0375) {
            if (inputs[17] < -3.17036) {
                var54 = -0.007903904;
            } else {
                var54 = -0.06420991;
            }
        } else {
            var54 = 0.032837752;
        }
    } else {
        if (inputs[20] >= -23.788687) {
            if (inputs[1] < 61.819904) {
                var54 = 0.026974201;
            } else {
                var54 = 0.0002736479;
            }
        } else {
            var54 = -0.036749437;
        }
    }
    double var55;
    if (inputs[19] < 34.078182) {
        if (inputs[19] < 19.475138) {
            var55 = -0.0016547289;
        } else {
            if (inputs[19] < 26.22814) {
                var55 = 0.071220495;
            } else {
                var55 = 0.03390039;
            }
        }
    } else {
        if (inputs[2] < 1.8671429) {
            if (inputs[2] < 1.3107142) {
                var55 = -0.006203494;
            } else {
                var55 = 0.016108224;
            }
        } else {
            if (inputs[15] < 2.3301358) {
                var55 = -0.048432585;
            } else {
                var55 = -0.004191739;
            }
        }
    }
    double var56;
    if (inputs[8] < 1.115) {
        if (inputs[7] < 3.91) {
            if (inputs[22] < 14.0) {
                var56 = 0.015011152;
            } else {
                var56 = -0.04018284;
            }
        } else {
            if (inputs[11] < -0.40060607) {
                var56 = 0.0073816353;
            } else {
                var56 = 0.0590882;
            }
        }
    } else {
        if (inputs[16] < 1.6542283) {
            if (inputs[16] < 1.027653) {
                var56 = -0.008284791;
            } else {
                var56 = 0.036034293;
            }
        } else {
            var56 = -0.062444244;
        }
    }
    double var57;
    if (inputs[21] < 4.763538) {
        if (inputs[16] < 1.6542283) {
            if (inputs[16] < 0.9628601) {
                var57 = -0.0057552233;
            } else {
                var57 = 0.028006775;
            }
        } else {
            var57 = -0.040763497;
        }
    } else {
        var57 = 0.04499493;
    }
    double var58;
    if (inputs[22] < 2.0) {
        var58 = 0.04355911;
    } else {
        if (inputs[19] < 36.376976) {
            if (inputs[12] < -0.018511279) {
                var58 = 0.0026349628;
            } else {
                var58 = 0.04439814;
            }
        } else {
            if (inputs[17] < -2.0117571) {
                var58 = 0.009932635;
            } else {
                var58 = -0.013721717;
            }
        }
    }
    double var59;
    if (inputs[12] < -0.19112782) {
        if (inputs[22] < 14.0) {
            if (inputs[17] < -3.421866) {
                var59 = -0.044976156;
            } else {
                var59 = 0.009819816;
            }
        } else {
            var59 = -0.064384066;
        }
    } else {
        if (inputs[13] < 1.064436) {
            if (inputs[16] < 0.75273186) {
                var59 = -0.027285453;
            } else {
                var59 = 0.024342792;
            }
        } else {
            if (inputs[10] < 0.713) {
                var59 = 0.03304307;
            } else {
                var59 = 0.0047906213;
            }
        }
    }
    double var60;
    if (inputs[21] < 4.9405646) {
        if (inputs[19] >= 106.67325) {
            var60 = -0.049078394;
        } else {
            if (inputs[13] < 1.0821571) {
                var60 = -0.016049094;
            } else {
                var60 = 0.0066178935;
            }
        }
    } else {
        var60 = 0.05200287;
    }
    double var61;
    if (inputs[8] < 0.6875) {
        if (inputs[2] < 1.2814286) {
            if (inputs[14] < 1.2989519) {
                var61 = -0.04583607;
            } else {
                var61 = 0.021167997;
            }
        } else {
            if (inputs[14] < 1.806317) {
                var61 = 0.046325695;
            } else {
                var61 = 0.0048541543;
            }
        }
    } else {
        if (inputs[3] < 2030.455) {
            if (inputs[16] < -0.786996) {
                var61 = 0.057171933;
            } else {
                var61 = -0.00096933753;
            }
        } else {
            if (inputs[2] < 1.3107142) {
                var61 = -0.03128623;
            } else {
                var61 = -0.0030340499;
            }
        }
    }
    double var62;
    if (inputs[1] < 77.32544) {
        if (inputs[20] >= 26.298834) {
            var62 = 0.0482935;
        } else {
            if (inputs[20] < 22.066917) {
                var62 = 0.007931353;
            } else {
                var62 = -0.035339218;
            }
        }
    } else {
        var62 = -0.04021369;
    }
    double var63;
    if (inputs[19] >= 116.94437) {
        var63 = 0.050396603;
    } else {
        if (inputs[10] < 1.338) {
            if (inputs[17] < 3.302892) {
                var63 = -0.004890036;
            } else {
                var63 = -0.029899532;
            }
        } else {
            var63 = 0.039041307;
        }
    }
    double var64;
    if (inputs[4] < 2318.31) {
        if (inputs[16] < 1.2673966) {
            if (inputs[16] < 0.8653556) {
                var64 = 0.016482802;
            } else {
                var64 = 0.05769807;
            }
        } else {
            var64 = -0.032288544;
        }
    } else {
        if (inputs[7] < 4.32) {
            if (inputs[16] < -0.30762097) {
                var64 = 0.034631636;
            } else {
                var64 = -0.016814407;
            }
        } else {
            if (inputs[9] < 0.13) {
                var64 = -0.0010109579;
            } else {
                var64 = -0.038363077;
            }
        }
    }
    double var65;
    if (inputs[11] < 0.5518182) {
        if (inputs[11] < 0.49042425) {
            if (inputs[3] < 2362.31) {
                var65 = 0.009467134;
            } else {
                var65 = -0.015089435;
            }
        } else {
            var65 = -0.0571931;
        }
    } else {
        if (inputs[16] < 0.15536931) {
            var65 = 0.0018324502;
        } else {
            var65 = 0.06314539;
        }
    }
    double var66;
    if (inputs[13] < 0.99774545) {
        if (inputs[11] < 0.3658788) {
            if (inputs[17] < -2.5381129) {
                var66 = -0.037532732;
            } else {
                var66 = -0.0631798;
            }
        } else {
            var66 = -0.0020046;
        }
    } else {
        if (inputs[1] < 77.52381) {
            if (inputs[5] < 2314.525) {
                var66 = 0.023646543;
            } else {
                var66 = -0.0010979781;
            }
        } else {
            var66 = -0.04771865;
        }
    }
    double var67;
    if (inputs[16] < 1.6773072) {
        if (inputs[16] < 0.9440991) {
            if (inputs[8] < 0.56) {
                var67 = 0.013252536;
            } else {
                var67 = -0.010929401;
            }
        } else {
            if (inputs[13] < 1.5704852) {
                var67 = 0.04286747;
            } else {
                var67 = -0.016808184;
            }
        }
    } else {
        var67 = -0.03920102;
    }
    double var68;
    if (inputs[20] < -27.440163) {
        var68 = -0.050947037;
    } else {
        if (inputs[22] < 2.0) {
            var68 = 0.04239216;
        } else {
            if (inputs[2] < 0.93857145) {
                var68 = -0.037015993;
            } else {
                var68 = 0.0031781467;
            }
        }
    }
    double var69;
    if (inputs[19] < 36.927753) {
        if (inputs[17] < -1.7128205) {
            var69 = -0.009001045;
        } else {
            if (inputs[17] < 2.2605724) {
                var69 = 0.06801345;
            } else {
                var69 = 0.020799791;
            }
        }
    } else {
        if (inputs[19] < 84.80466) {
            if (inputs[9] < 0.14) {
                var69 = -0.04671743;
            } else {
                var69 = -0.009443092;
            }
        } else {
            if (inputs[3] < 2047.77) {
                var69 = -0.02188974;
            } else {
                var69 = 0.0105671;
            }
        }
    }
    double var70;
    if (inputs[14] < 1.1932963) {
        if (inputs[2] < 1.3078572) {
            var70 = -0.01642536;
        } else {
            if (inputs[1] < 65.43181) {
                var70 = 0.020380076;
            } else {
                var70 = 0.0695214;
            }
        }
    } else {
        if (inputs[14] < 1.2749118) {
            if (inputs[21] < 2.6501436) {
                var70 = -0.010607979;
            } else {
                var70 = -0.06528361;
            }
        } else {
            if (inputs[2] < 1.1542857) {
                var70 = 0.027553681;
            } else {
                var70 = -0.0037802104;
            }
        }
    }
    double var71;
    if (inputs[19] >= 116.94437) {
        var71 = 0.0435561;
    } else {
        if (inputs[9] < 0.15) {
            if (inputs[15] < 1.3331364) {
                var71 = 0.033856586;
            } else {
                var71 = -0.0025076366;
            }
        } else {
            if (inputs[7] < 2.9475) {
                var71 = 0.01102848;
            } else {
                var71 = -0.03402801;
            }
        }
    }
    double var72;
    if (inputs[1] < 61.77322) {
        if (inputs[1] < 37.105743) {
            if (inputs[19] < 60.818947) {
                var72 = -0.03170962;
            } else {
                var72 = 0.011777463;
            }
        } else {
            var72 = 0.05965209;
        }
    } else {
        if (inputs[11] < 0.36436364) {
            if (inputs[14] < 1.0505661) {
                var72 = 0.008274814;
            } else {
                var72 = -0.04610319;
            }
        } else {
            if (inputs[14] < 1.5983067) {
                var72 = 0.029155856;
            } else {
                var72 = -0.01937763;
            }
        }
    }
    double var73;
    if (inputs[21] < 4.642234) {
        if (inputs[16] < 1.6773072) {
            if (inputs[16] < 0.9628601) {
                var73 = -0.0017707977;
            } else {
                var73 = 0.026650723;
            }
        } else {
            var73 = -0.03694428;
        }
    } else {
        var73 = 0.052676648;
    }
    double var74;
    if (inputs[4] < 2179.32) {
        if (inputs[8] < 1.0975) {
            if (inputs[6] < 2033.765) {
                var74 = -0.035866436;
            } else {
                var74 = 0.02469489;
            }
        } else {
            if (inputs[21] < 3.237808) {
                var74 = 0.014698938;
            } else {
                var74 = 0.063060686;
            }
        }
    } else {
        if (inputs[2] < 1.2814286) {
            if (inputs[12] < -0.14805263) {
                var74 = -0.009214721;
            } else {
                var74 = -0.05932403;
            }
        } else {
            if (inputs[1] < 29.063995) {
                var74 = -0.036897015;
            } else {
                var74 = 0.0013600616;
            }
        }
    }
    double var75;
    if (inputs[12] < -0.31518796) {
        var75 = -0.03620304;
    } else {
        if (inputs[19] >= 116.94437) {
            var75 = 0.045107856;
        } else {
            if (inputs[7] < 3.935) {
                var75 = -0.011761532;
            } else {
                var75 = 0.006892038;
            }
        }
    }
    double var76;
    if (inputs[7] < 1.325) {
        var76 = -0.050049383;
    } else {
        if (inputs[19] < 36.927753) {
            if (inputs[20] < 11.269673) {
                var76 = 0.005315943;
            } else {
                var76 = 0.047816657;
            }
        } else {
            if (inputs[22] < 2.0) {
                var76 = 0.04898324;
            } else {
                var76 = -0.0029959232;
            }
        }
    }
    double var77;
    if (inputs[12] < 0.33003008) {
        if (inputs[20] >= 25.342886) {
            var77 = 0.041865915;
        } else {
            if (inputs[20] < 20.27173) {
                var77 = 0.005035377;
            } else {
                var77 = -0.030617546;
            }
        }
    } else {
        var77 = -0.035324477;
    }
    double var78;
    if (inputs[19] < 37.96602) {
        if (inputs[17] < -1.401626) {
            var78 = -0.005465122;
        } else {
            if (inputs[22] < 9.0) {
                var78 = 0.014244487;
            } else {
                var78 = 0.062308874;
            }
        }
    } else {
        if (inputs[17] < -1.8178506) {
            if (inputs[11] < -0.286) {
                var78 = 0.0032502604;
            } else {
                var78 = 0.041492596;
            }
        } else {
            if (inputs[19] >= 94.674675) {
                var78 = 0.02204264;
            } else {
                var78 = -0.02011258;
            }
        }
    }
    double var79;
    if (inputs[3] < 2396.725) {
        if (inputs[10] < 1.193) {
            if (inputs[7] < 3.93) {
                var79 = -0.010722361;
            } else {
                var79 = 0.014151929;
            }
        } else {
            var79 = -0.029614577;
        }
    } else {
        if (inputs[15] < 2.1361842) {
            if (inputs[14] < 1.5677593) {
                var79 = -0.056175377;
            } else {
                var79 = -0.0038531935;
            }
        } else {
            var79 = 0.022561178;
        }
    }
    double var80;
    if (inputs[9] < 0.15) {
        if (inputs[16] < 0.9628601) {
            if (inputs[16] < 0.6556163) {
                var80 = 0.002728447;
            } else {
                var80 = -0.0400655;
            }
        } else {
            if (inputs[3] < 2331.415) {
                var80 = -0.0016967275;
            } else {
                var80 = 0.05692065;
            }
        }
    } else {
        if (inputs[8] < 0.825) {
            if (inputs[1] < 37.105743) {
                var80 = -0.03475717;
            } else {
                var80 = 0.028178442;
            }
        } else {
            if (inputs[21] < 2.0857291) {
                var80 = -0.00259818;
            } else {
                var80 = -0.04811166;
            }
        }
    }
    double var81;
    if (inputs[13] < 1.6292526) {
        if (inputs[12] < 0.03204511) {
            if (inputs[13] < 0.8977884) {
                var81 = -0.04317995;
            } else {
                var81 = 0.0012954385;
            }
        } else {
            if (inputs[13] < 1.4669751) {
                var81 = 0.01226231;
            } else {
                var81 = 0.054396126;
            }
        }
    } else {
        if (inputs[22] < 5.0) {
            if (inputs[16] < 0.14312659) {
                var81 = -0.017413562;
            } else {
                var81 = 0.048852954;
            }
        } else {
            if (inputs[22] < 15.0) {
                var81 = -0.042765785;
            } else {
                var81 = 0.0038462454;
            }
        }
    }
    double var82;
    if (inputs[5] < 2029.49) {
        var82 = -0.033588044;
    } else {
        if (inputs[7] < 6.225) {
            if (inputs[21] < 2.8599465) {
                var82 = 0.000634801;
            } else {
                var82 = -0.03212501;
            }
        } else {
            if (inputs[17] < -3.2048192) {
                var82 = 0.046787426;
            } else {
                var82 = 0.0024713639;
            }
        }
    }
    double var83;
    if (inputs[12] < -0.31518796) {
        var83 = -0.04503096;
    } else {
        if (inputs[8] < 1.1875) {
            if (inputs[3] < 2033.77) {
                var83 = -0.036283057;
            } else {
                var83 = 0.021390522;
            }
        } else {
            if (inputs[22] < 15.0) {
                var83 = -0.011472493;
            } else {
                var83 = 0.03504783;
            }
        }
    }
    double var84;
    if (inputs[21] < 4.763538) {
        if (inputs[20] < 15.935555) {
            if (inputs[16] < 1.6542283) {
                var84 = 0.0082900105;
            } else {
                var84 = -0.041672193;
            }
        } else {
            if (inputs[20] >= 19.55967) {
                var84 = 0.00043394332;
            } else {
                var84 = -0.051623598;
            }
        }
    } else {
        var84 = 0.04447196;
    }
    double var85;
    if (inputs[19] >= 116.94437) {
        var85 = 0.04434931;
    } else {
        if (inputs[15] < 1.2532656) {
            if (inputs[14] < 1.1932963) {
                var85 = 0.01642003;
            } else {
                var85 = -0.04187403;
            }
        } else {
            if (inputs[12] < 0.13796993) {
                var85 = 0.013473287;
            } else {
                var85 = -0.010919384;
            }
        }
    }
    double var86;
    if (inputs[12] < -0.3044812) {
        var86 = -0.033354577;
    } else {
        if (inputs[8] < 0.085) {
            var86 = 0.039749023;
        } else {
            if (inputs[3] < 2366.4) {
                var86 = 0.0072269016;
            } else {
                var86 = -0.015733656;
            }
        }
    }
    double var87;
    if (inputs[14] < 1.1680844) {
        if (inputs[8] < 2.34) {
            if (inputs[8] < 1.115) {
                var87 = 0.028643657;
            } else {
                var87 = -0.032428008;
            }
        } else {
            var87 = 0.053057604;
        }
    } else {
        if (inputs[15] < 1.1533152) {
            var87 = -0.033150006;
        } else {
            if (inputs[7] < 2.78) {
                var87 = 0.020379713;
            } else {
                var87 = -0.00427249;
            }
        }
    }
    double var88;
    if (inputs[8] < 6.825) {
        if (inputs[14] < 2.6581752) {
            if (inputs[14] < 2.340248) {
                var88 = 0.006989461;
            } else {
                var88 = -0.045013312;
            }
        } else {
            var88 = 0.04247127;
        }
    } else {
        var88 = -0.03833807;
    }
    double var89;
    if (inputs[7] < 9.9775) {
        if (inputs[21] < 1.8904921) {
            if (inputs[2] < 2.0385714) {
                var89 = 0.048226926;
            } else {
                var89 = 0.013507818;
            }
        } else {
            if (inputs[3] < 2396.725) {
                var89 = 0.0021783381;
            } else {
                var89 = -0.020362359;
            }
        }
    } else {
        if (inputs[5] < 2335.03) {
            var89 = -0.015492163;
        } else {
            var89 = -0.05147528;
        }
    }
    double var90;
    if (inputs[11] < -0.5559394) {
        if (inputs[7] < 7.865) {
            var90 = -0.05682652;
        } else {
            var90 = 0.02043292;
        }
    } else {
        if (inputs[11] < -0.49187878) {
            var90 = 0.04678375;
        } else {
            if (inputs[21] < 2.2880886) {
                var90 = -0.018873768;
            } else {
                var90 = 0.0052650375;
            }
        }
    }
    double var91;
    if (inputs[7] < 6.095) {
        if (inputs[12] < 0.24064662) {
            if (inputs[21] < 2.6079836) {
                var91 = -0.005081712;
            } else {
                var91 = -0.027625782;
            }
        } else {
            var91 = 0.033489726;
        }
    } else {
        if (inputs[5] < 2335.03) {
            if (inputs[21] < 2.5515587) {
                var91 = -0.0019224865;
            } else {
                var91 = 0.037982967;
            }
        } else {
            if (inputs[5] < 2444.9226) {
                var91 = -0.03679547;
            } else {
                var91 = 0.052753385;
            }
        }
    }
    double var92;
    if (inputs[12] < -0.29344362) {
        var92 = -0.04266662;
    } else {
        if (inputs[20] >= -27.440163) {
            if (inputs[10] < 0.827) {
                var92 = 0.019714873;
            } else {
                var92 = -0.003259819;
            }
        } else {
            var92 = -0.024202676;
        }
    }
    double var93;
    if (inputs[13] < 2.9314337) {
        if (inputs[12] < 0.24064662) {
            if (inputs[22] < 15.0) {
                var93 = 0.0061560585;
            } else {
                var93 = -0.03617092;
            }
        } else {
            if (inputs[3] < 2324.02) {
                var93 = 0.052030966;
            } else {
                var93 = 0.007889626;
            }
        }
    } else {
        var93 = -0.040380042;
    }
    double var94;
    if (inputs[16] < -2.0704062) {
        var94 = -0.05203599;
    } else {
        if (inputs[14] < 0.96820503) {
            var94 = 0.04663424;
        } else {
            if (inputs[9] < 0.13) {
                var94 = 0.013476078;
            } else {
                var94 = -0.0069577754;
            }
        }
    }
    double var95;
    if (inputs[15] < 1.1299136) {
        if (inputs[2] < 1.3314285) {
            var95 = -0.063757874;
        } else {
            var95 = -0.0020027994;
        }
    } else {
        if (inputs[17] < -3.0335448) {
            if (inputs[20] >= -30.445547) {
                var95 = 0.011500645;
            } else {
                var95 = 0.056156546;
            }
        } else {
            if (inputs[20] >= -21.114672) {
                var95 = 0.0020850294;
            } else {
                var95 = -0.038495757;
            }
        }
    }
    double var96;
    if (inputs[13] < 1.0680898) {
        if (inputs[20] >= 8.483254) {
            if (inputs[19] < 68.55972) {
                var96 = 0.021341106;
            } else {
                var96 = -0.015718771;
            }
        } else {
            if (inputs[4] < 2330.6) {
                var96 = -0.06039587;
            } else {
                var96 = -0.0025095972;
            }
        }
    } else {
        if (inputs[22] < 12.0) {
            if (inputs[15] < 2.325328) {
                var96 = 0.019959101;
            } else {
                var96 = -0.018221932;
            }
        } else {
            if (inputs[8] < 3.11) {
                var96 = -0.028437039;
            } else {
                var96 = 0.031492997;
            }
        }
    }
    double var97;
    if (inputs[17] < 3.829468) {
        if (inputs[20] < -27.440163) {
            var97 = -0.041268565;
        } else {
            if (inputs[8] < 0.475) {
                var97 = -0.011007667;
            } else {
                var97 = 0.0121614775;
            }
        }
    } else {
        if (inputs[2] < 1.0378572) {
            var97 = -0.009019869;
        } else {
            var97 = -0.053603847;
        }
    }
    double var98;
    if (inputs[18] < 1.0) {
        if (inputs[10] < 1.124) {
            if (inputs[2] < 1.3835714) {
                var98 = 0.001514995;
            } else {
                var98 = 0.027368927;
            }
        } else {
            var98 = -0.038119305;
        }
    } else {
        if (inputs[10] < 0.616) {
            if (inputs[11] < -0.51878786) {
                var98 = -0.005575989;
            } else {
                var98 = -0.055125613;
            }
        } else {
            if (inputs[12] < 0.13078947) {
                var98 = 0.04092114;
            } else {
                var98 = -0.009496033;
            }
        }
    }
    double var99;
    if (inputs[11] < 0.59842426) {
        if (inputs[1] < 77.52381) {
            if (inputs[5] < 2389.195) {
                var99 = 0.0062505486;
            } else {
                var99 = -0.018590495;
            }
        } else {
            var99 = -0.05296763;
        }
    } else {
        var99 = 0.035495654;
    }
    double var100;
    if (inputs[5] < 2313.88) {
        if (inputs[4] < 2048.15) {
            if (inputs[12] < -0.086052634) {
                var100 = -0.036326054;
            } else {
                var100 = 0.0079526;
            }
        } else {
            if (inputs[11] < 0.38745454) {
                var100 = 0.050044823;
            } else {
                var100 = 0.015122867;
            }
        }
    } else {
        if (inputs[8] < 1.0975) {
            if (inputs[4] < 2330.6) {
                var100 = -0.023794552;
            } else {
                var100 = 0.020403214;
            }
        } else {
            if (inputs[20] < 8.136603) {
                var100 = -0.0032509442;
            } else {
                var100 = -0.043175;
            }
        }
    }
    double var101;
    if (inputs[17] < 2.420463) {
        if (inputs[8] < 5.5825) {
            if (inputs[15] < 2.2791872) {
                var101 = -0.00973171;
            } else {
                var101 = 0.032357927;
            }
        } else {
            var101 = -0.060498748;
        }
    } else {
        if (inputs[2] < 1.2328571) {
            if (inputs[3] < 2153.81) {
                var101 = 0.017968083;
            } else {
                var101 = -0.044144046;
            }
        } else {
            if (inputs[17] < 3.5055645) {
                var101 = 0.0391183;
            } else {
                var101 = -0.0051931413;
            }
        }
    }
    double var102;
    if (inputs[16] < -0.5226052) {
        if (inputs[1] < 29.308704) {
            var102 = -0.043065924;
        } else {
            if (inputs[13] < 1.4886316) {
                var102 = 0.017485727;
            } else {
                var102 = 0.042975843;
            }
        }
    } else {
        if (inputs[17] < -3.5866337) {
            var102 = 0.035931855;
        } else {
            if (inputs[13] < 1.154771) {
                var102 = -0.029124023;
            } else {
                var102 = 0.0010601253;
            }
        }
    }
    double var103;
    if (inputs[14] < 2.340248) {
        if (inputs[5] < 2399.305) {
            if (inputs[19] >= 61.31856) {
                var103 = 0.040628113;
            } else {
                var103 = 0.003124691;
            }
        } else {
            if (inputs[8] < 0.7125) {
                var103 = 0.008999848;
            } else {
                var103 = -0.030077595;
            }
        }
    } else {
        if (inputs[14] < 2.9024198) {
            var103 = -0.062461402;
        } else {
            if (inputs[22] < 11.0) {
                var103 = -0.020363295;
            } else {
                var103 = 0.023626486;
            }
        }
    }
    double var104;
    if (inputs[17] < -3.2048192) {
        if (inputs[7] < 6.1375) {
            var104 = 0.0027139534;
        } else {
            var104 = 0.04805911;
        }
    } else {
        if (inputs[10] < -0.522) {
            if (inputs[19] < 84.80466) {
                var104 = -0.05199705;
            } else {
                var104 = -0.004321637;
            }
        } else {
            if (inputs[8] < 1.1875) {
                var104 = 0.018701088;
            } else {
                var104 = -0.0086940415;
            }
        }
    }
    double var105;
    if (inputs[1] < 77.52381) {
        if (inputs[20] >= -23.788687) {
            if (inputs[21] < 2.4659648) {
                var105 = -0.0006723687;
            } else {
                var105 = 0.017581552;
            }
        } else {
            if (inputs[20] < -30.445547) {
                var105 = 0.027489165;
            } else {
                var105 = -0.033363663;
            }
        }
    } else {
        var105 = -0.025876995;
    }
    double var106;
    if (inputs[2] < 1.2814286) {
        if (inputs[2] < 1.1407143) {
            if (inputs[14] < 1.2545952) {
                var106 = -0.022072997;
            } else {
                var106 = 0.012598738;
            }
        } else {
            var106 = -0.053557172;
        }
    } else {
        if (inputs[13] < 2.1668594) {
            if (inputs[14] < 1.1932963) {
                var106 = 0.024964822;
            } else {
                var106 = -0.0063340627;
            }
        } else {
            if (inputs[19] >= 12.015833) {
                var106 = 0.059193444;
            } else {
                var106 = -0.0054036113;
            }
        }
    }
    double var107;
    if (inputs[7] < 6.015) {
        if (inputs[22] < 15.0) {
            if (inputs[8] < 1.165) {
                var107 = 0.011071832;
            } else {
                var107 = -0.013740864;
            }
        } else {
            var107 = -0.046164352;
        }
    } else {
        if (inputs[5] < 2322.61) {
            if (inputs[5] < 2176.82) {
                var107 = 0.01416469;
            } else {
                var107 = 0.050115224;
            }
        } else {
            if (inputs[17] < 2.1003547) {
                var107 = -0.028697485;
            } else {
                var107 = 0.02388472;
            }
        }
    }
    double var108;
    if (inputs[20] >= 27.415207) {
        var108 = 0.026906675;
    } else {
        if (inputs[1] < 71.80405) {
            if (inputs[3] < 2039.28) {
                var108 = -0.022394845;
            } else {
                var108 = 0.0024502238;
            }
        } else {
            if (inputs[9] < 0.13) {
                var108 = -0.0031231267;
            } else {
                var108 = -0.06373189;
            }
        }
    }
    double var109;
    if (inputs[6] < 2031.235) {
        var109 = -0.031981867;
    } else {
        if (inputs[7] < 9.9775) {
            if (inputs[19] >= 116.94437) {
                var109 = 0.04047631;
            } else {
                var109 = 0.0033111046;
            }
        } else {
            if (inputs[14] < 4.129814) {
                var109 = -0.0453916;
            } else {
                var109 = 0.0101169385;
            }
        }
    }
    double var110;
    if (inputs[13] < 1.0959854) {
        if (inputs[9] < 0.13) {
            if (inputs[2] < 1.335) {
                var110 = 0.045802165;
            } else {
                var110 = -0.018742992;
            }
        } else {
            if (inputs[19] >= 67.16126) {
                var110 = 0.019624254;
            } else {
                var110 = -0.04470535;
            }
        }
    } else {
        if (inputs[7] < 4.98) {
            if (inputs[22] < 15.0) {
                var110 = 0.023054356;
            } else {
                var110 = -0.02310069;
            }
        } else {
            if (inputs[22] < 15.0) {
                var110 = -0.013317024;
            } else {
                var110 = 0.023337763;
            }
        }
    }
    double var111;
    if (inputs[20] >= 24.575096) {
        if (inputs[2] < 1.2421429) {
            var111 = 0.005357743;
        } else {
            var111 = 0.048876993;
        }
    } else {
        if (inputs[17] < 2.8983364) {
            if (inputs[6] < 2033.765) {
                var111 = -0.034444522;
            } else {
                var111 = 0.0044985088;
            }
        } else {
            if (inputs[15] < 1.6565313) {
                var111 = -0.04107493;
            } else {
                var111 = 0.0013812914;
            }
        }
    }
    double var112;
    if (inputs[21] < 2.7912087) {
        if (inputs[21] < 2.5565808) {
            if (inputs[16] < -0.55340564) {
                var112 = 0.018895583;
            } else {
                var112 = -0.015637642;
            }
        } else {
            if (inputs[21] < 2.6501436) {
                var112 = 0.04923591;
            } else {
                var112 = 0.019137083;
            }
        }
    } else {
        if (inputs[4] < 2401.94) {
            if (inputs[8] < 0.42) {
                var112 = -0.04354045;
            } else {
                var112 = 0.0014828477;
            }
        } else {
            if (inputs[13] < 1.2965554) {
                var112 = -0.04560083;
            } else {
                var112 = -0.02774456;
            }
        }
    }
    double var113;
    if (inputs[5] < 2372.37) {
        if (inputs[16] < -1.5798271) {
            var113 = 0.043171406;
        } else {
            if (inputs[5] < 2026.31) {
                var113 = -0.019203566;
            } else {
                var113 = 0.014383191;
            }
        }
    } else {
        if (inputs[1] < 37.105743) {
            if (inputs[16] < -0.17223029) {
                var113 = -0.0054584513;
            } else {
                var113 = -0.057035208;
            }
        } else {
            if (inputs[15] < 1.6384401) {
                var113 = -0.012432922;
            } else {
                var113 = 0.034198247;
            }
        }
    }
    double var114;
    if (inputs[19] < 26.237036) {
        if (inputs[19] < 19.475138) {
            var114 = -0.0010096681;
        } else {
            var114 = 0.0563864;
        }
    } else {
        if (inputs[15] < 2.9728973) {
            if (inputs[10] < -1.344) {
                var114 = 0.03368033;
            } else {
                var114 = -0.0005627658;
            }
        } else {
            var114 = -0.04058414;
        }
    }
    double var115;
    if (inputs[11] < -0.5714545) {
        var115 = -0.030140271;
    } else {
        if (inputs[1] < 31.524231) {
            if (inputs[22] < 5.0) {
                var115 = 0.05143711;
            } else {
                var115 = 0.0043022763;
            }
        } else {
            if (inputs[20] < -14.992386) {
                var115 = -0.040739786;
            } else {
                var115 = 0.00036837446;
            }
        }
    }
    double var116;
    if (inputs[15] < 1.0648047) {
        var116 = 0.038119584;
    } else {
        if (inputs[1] < 62.63316) {
            if (inputs[11] < 0.3838788) {
                var116 = 0.0012708111;
            } else {
                var116 = 0.046399787;
            }
        } else {
            if (inputs[21] < 2.420463) {
                var116 = -0.044059496;
            } else {
                var116 = -0.0051035346;
            }
        }
    }
    double var117;
    if (inputs[11] < -0.5559394) {
        if (inputs[8] < 3.98) {
            var117 = -0.056411017;
        } else {
            var117 = 0.006238507;
        }
    } else {
        if (inputs[7] < 1.89) {
            var117 = -0.029900517;
        } else {
            if (inputs[14] < 1.1680844) {
                var117 = 0.021345416;
            } else {
                var117 = -0.0016177966;
            }
        }
    }
    double var118;
    if (inputs[15] < 1.096939) {
        if (inputs[20] < 14.976197) {
            var118 = 0.011727737;
        } else {
            var118 = 0.066430256;
        }
    } else {
        if (inputs[22] < 4.0) {
            if (inputs[20] >= -15.606703) {
                var118 = -0.010588044;
            } else {
                var118 = 0.04122043;
            }
        } else {
            if (inputs[20] >= 19.55967) {
                var118 = 0.012277986;
            } else {
                var118 = -0.016294817;
            }
        }
    }
    double var119;
    if (inputs[1] < 77.52381) {
        if (inputs[20] >= 25.04715) {
            var119 = 0.048042215;
        } else {
            if (inputs[22] < 3.0) {
                var119 = 0.027476972;
            } else {
                var119 = -0.0041969125;
            }
        }
    } else {
        var119 = -0.03810734;
    }
    double var120;
    if (inputs[22] < 4.0) {
        if (inputs[16] < -1.3803929) {
            var120 = -0.021804634;
        } else {
            if (inputs[9] < 0.15) {
                var120 = 0.04327514;
            } else {
                var120 = 0.0074890675;
            }
        }
    } else {
        if (inputs[19] < 37.96602) {
            if (inputs[12] < 0.006473684) {
                var120 = -0.015477459;
            } else {
                var120 = 0.038992055;
            }
        } else {
            if (inputs[15] < 2.9728973) {
                var120 = -0.008222486;
            } else {
                var120 = -0.04628003;
            }
        }
    }
    double var121;
    if (inputs[8] < 2.8875) {
        if (inputs[8] < 1.855) {
            if (inputs[13] < 1.5458409) {
                var121 = -0.0053281384;
            } else {
                var121 = 0.020797253;
            }
        } else {
            if (inputs[14] < 1.5120978) {
                var121 = -0.062741265;
            } else {
                var121 = -0.008443575;
            }
        }
    } else {
        if (inputs[2] < 1.6928571) {
            if (inputs[12] < 0.087902255) {
                var121 = 0.06528379;
            } else {
                var121 = 0.017827388;
            }
        } else {
            if (inputs[22] < 6.0) {
                var121 = -0.04039979;
            } else {
                var121 = 0.025681062;
            }
        }
    }
    double var122;
    if (inputs[8] < 2.8875) {
        if (inputs[8] < 1.33) {
            if (inputs[16] < -0.30762097) {
                var122 = 0.018168574;
            } else {
                var122 = -0.010544144;
            }
        } else {
            if (inputs[16] < -0.97878236) {
                var122 = 0.0077602128;
            } else {
                var122 = -0.041671116;
            }
        }
    } else {
        if (inputs[8] < 3.6275) {
            var122 = 0.055823565;
        } else {
            if (inputs[14] < 1.2792639) {
                var122 = 0.035546254;
            } else {
                var122 = -0.015920697;
            }
        }
    }
    double var123;
    if (inputs[21] < 2.3590386) {
        if (inputs[1] < 35.615753) {
            var123 = -0.037161328;
        } else {
            if (inputs[17] < 1.7295251) {
                var123 = 0.032696605;
            } else {
                var123 = -0.02018597;
            }
        }
    } else {
        if (inputs[1] < 77.52381) {
            if (inputs[16] < -1.3049146) {
                var123 = 0.03791455;
            } else {
                var123 = 0.007053604;
            }
        } else {
            var123 = -0.019884981;
        }
    }
    double var124;
    if (inputs[6] < 2033.765) {
        if (inputs[7] < 5.285) {
            var124 = -0.049518585;
        } else {
            var124 = -0.020626295;
        }
    } else {
        if (inputs[2] < 1.935) {
            if (inputs[4] < 2154.07) {
                var124 = 0.0350617;
            } else {
                var124 = 0.002167648;
            }
        } else {
            if (inputs[5] < 2319.19) {
                var124 = 0.011644584;
            } else {
                var124 = -0.044387825;
            }
        }
    }
    double var125;
    if (inputs[21] < 4.642234) {
        if (inputs[17] < 3.829468) {
            if (inputs[20] >= 25.04715) {
                var125 = 0.037244666;
            } else {
                var125 = -0.0035378733;
            }
        } else {
            var125 = -0.059361175;
        }
    } else {
        var125 = 0.0330008;
    }
    double var126;
    if (inputs[7] < 8.515) {
        if (inputs[2] < 1.8671429) {
            if (inputs[2] < 1.7114285) {
                var126 = -0.0027487641;
            } else {
                var126 = 0.043984316;
            }
        } else {
            if (inputs[15] < 1.7318975) {
                var126 = -0.066039674;
            } else {
                var126 = 0.0009050997;
            }
        }
    } else {
        if (inputs[16] < 0.568304) {
            if (inputs[5] < 2313.88) {
                var126 = 0.060095247;
            } else {
                var126 = 0.029228447;
            }
        } else {
            var126 = -0.0015129726;
        }
    }
    double var127;
    if (inputs[17] < -3.2048192) {
        if (inputs[16] < -0.052418817) {
            var127 = -0.01786519;
        } else {
            if (inputs[2] < 1.0621428) {
                var127 = 0.0033068764;
            } else {
                var127 = 0.05824386;
            }
        }
    } else {
        if (inputs[20] >= 25.506517) {
            if (inputs[3] < 2316.315) {
                var127 = 0.04473202;
            } else {
                var127 = -0.0074934983;
            }
        } else {
            if (inputs[2] < 1.3192858) {
                var127 = -0.035767656;
            } else {
                var127 = -0.007220646;
            }
        }
    }
    double var128;
    if (inputs[5] < 2447.0125) {
        if (inputs[3] < 2428.235) {
            if (inputs[12] < -0.2844812) {
                var128 = -0.029864516;
            } else {
                var128 = 0.0069566965;
            }
        } else {
            var128 = 0.045006733;
        }
    } else {
        if (inputs[2] < 1.4092857) {
            if (inputs[13] < 1.171744) {
                var128 = -0.01425581;
            } else {
                var128 = -0.061173394;
            }
        } else {
            var128 = -0.009921672;
        }
    }
    double var129;
    if (inputs[11] < 0.3712727) {
        if (inputs[13] < 1.154771) {
            if (inputs[8] < 1.7975) {
                var129 = -0.053243026;
            } else {
                var129 = -0.011242655;
            }
        } else {
            if (inputs[12] < 0.14757143) {
                var129 = 0.009025788;
            } else {
                var129 = -0.031246452;
            }
        }
    } else {
        if (inputs[16] < -1.3756171) {
            var129 = -0.027877806;
        } else {
            if (inputs[19] >= 12.015833) {
                var129 = 0.037929576;
            } else {
                var129 = 0.004171326;
            }
        }
    }
    double var130;
    if (inputs[19] >= 120.15335) {
        var130 = 0.0404491;
    } else {
        if (inputs[8] < 0.385) {
            if (inputs[19] < 74.909386) {
                var130 = 0.009210282;
            } else {
                var130 = -0.04222614;
            }
        } else {
            if (inputs[8] < 1.165) {
                var130 = 0.016528428;
            } else {
                var130 = -0.0041106194;
            }
        }
    }
    double var131;
    if (inputs[14] < 1.1680844) {
        if (inputs[1] < 70.43855) {
            if (inputs[1] < 65.55236) {
                var131 = 0.017492088;
            } else {
                var131 = 0.056337625;
            }
        } else {
            var131 = -0.0057692514;
        }
    } else {
        if (inputs[3] < 2504.67) {
            if (inputs[3] < 2311.935) {
                var131 = 0.005502881;
            } else {
                var131 = -0.013837681;
            }
        } else {
            if (inputs[18] < 1.0) {
                var131 = -0.0018499529;
            } else {
                var131 = 0.049206913;
            }
        }
    }
    double var132;
    if (inputs[20] >= 25.04715) {
        if (inputs[7] < 4.0375) {
            var132 = 0.044627458;
        } else {
            var132 = 0.012215703;
        }
    } else {
        if (inputs[8] < 0.365) {
            if (inputs[8] < 0.15) {
                var132 = -0.0034559304;
            } else {
                var132 = -0.055106264;
            }
        } else {
            if (inputs[14] < 1.2039788) {
                var132 = 0.018453231;
            } else {
                var132 = -0.0056886896;
            }
        }
    }
    double var133;
    if (inputs[1] < 20.42151) {
        var133 = 0.04567668;
    } else {
        if (inputs[6] < 2024.9) {
            var133 = 0.037171457;
        } else {
            if (inputs[2] < 1.3192858) {
                var133 = -0.020818023;
            } else {
                var133 = 0.0036925764;
            }
        }
    }
    double var134;
    if (inputs[12] < -0.2844812) {
        if (inputs[12] < -0.37124062) {
            var134 = 0.0015627057;
        } else {
            var134 = -0.047828846;
        }
    } else {
        if (inputs[16] < 0.9628601) {
            if (inputs[16] < -0.6742266) {
                var134 = 0.013969609;
            } else {
                var134 = -0.015642172;
            }
        } else {
            if (inputs[15] < 1.6446325) {
                var134 = 0.007292032;
            } else {
                var134 = 0.050591767;
            }
        }
    }
    double var135;
    if (inputs[19] < 26.237036) {
        if (inputs[3] < 2381.505) {
            var135 = -0.00049544615;
        } else {
            var135 = 0.054770324;
        }
    } else {
        if (inputs[2] < 2.0735714) {
            if (inputs[19] < 91.372154) {
                var135 = -0.0077761225;
            } else {
                var135 = 0.012772262;
            }
        } else {
            if (inputs[3] < 2151.605) {
                var135 = -0.007723884;
            } else {
                var135 = -0.050366096;
            }
        }
    }
    double var136;
    if (inputs[16] < 0.9440991) {
        if (inputs[22] < 16.0) {
            if (inputs[7] < 9.6825) {
                var136 = -0.00213306;
            } else {
                var136 = -0.040723547;
            }
        } else {
            var136 = 0.031147832;
        }
    } else {
        if (inputs[16] < 1.6773072) {
            if (inputs[7] < 4.7425) {
                var136 = 0.005128742;
            } else {
                var136 = 0.045671243;
            }
        } else {
            var136 = -0.022489404;
        }
    }
    double var137;
    if (inputs[2] < 1.365) {
        if (inputs[21] < 4.4938273) {
            if (inputs[19] < 48.817905) {
                var137 = 0.019210096;
            } else {
                var137 = -0.028758105;
            }
        } else {
            var137 = 0.03750454;
        }
    } else {
        if (inputs[2] < 1.5807143) {
            if (inputs[11] < 0.41284847) {
                var137 = 0.039033335;
            } else {
                var137 = -0.0027402649;
            }
        } else {
            if (inputs[7] < 12.14) {
                var137 = 0.0019752758;
            } else {
                var137 = -0.04326337;
            }
        }
    }
    double var138;
    if (inputs[16] < -1.92497) {
        var138 = -0.041163728;
    } else {
        if (inputs[2] < 2.0735714) {
            if (inputs[17] < -2.7223856) {
                var138 = -0.010491051;
            } else {
                var138 = 0.010320768;
            }
        } else {
            if (inputs[12] < 0.037661653) {
                var138 = -0.039597895;
            } else {
                var138 = 0.0076759034;
            }
        }
    }
    double var139;
    if (inputs[2] < 2.337143) {
        if (inputs[22] < 15.0) {
            if (inputs[1] < 70.441826) {
                var139 = 0.010402739;
            } else {
                var139 = -0.013037426;
            }
        } else {
            var139 = -0.03945093;
        }
    } else {
        if (inputs[1] < 35.615753) {
            var139 = -0.0029809913;
        } else {
            var139 = 0.053122308;
        }
    }
    double var140;
    if (inputs[11] < 0.59024245) {
        if (inputs[16] < -0.54781944) {
            if (inputs[19] < 61.224472) {
                var140 = 0.030237427;
            } else {
                var140 = 0.001750988;
            }
        } else {
            if (inputs[2] < 1.48) {
                var140 = 0.0036430862;
            } else {
                var140 = -0.03366379;
            }
        }
    } else {
        var140 = 0.034586415;
    }
    double var141;
    if (inputs[8] < 0.22) {
        var141 = 0.035274666;
    } else {
        if (inputs[12] < 0.12500753) {
            if (inputs[19] < 29.304281) {
                var141 = -0.026194572;
            } else {
                var141 = 0.008040868;
            }
        } else {
            if (inputs[16] < 0.98226386) {
                var141 = -0.02335965;
            } else {
                var141 = 0.02806534;
            }
        }
    }
    double var142;
    if (inputs[22] < 7.0) {
        if (inputs[3] < 2154.53) {
            var142 = 0.030608902;
        } else {
            if (inputs[1] < 67.64163) {
                var142 = -0.0077282838;
            } else {
                var142 = -0.041173704;
            }
        }
    } else {
        if (inputs[14] < 1.0917399) {
            var142 = -0.026771784;
        } else {
            if (inputs[14] < 1.1808475) {
                var142 = 0.050465446;
            } else {
                var142 = 0.006311046;
            }
        }
    }
    double var143;
    if (inputs[1] < 21.61079) {
        var143 = 0.043689847;
    } else {
        if (inputs[13] < 0.8233444) {
            var143 = 0.035388757;
        } else {
            if (inputs[11] < 0.36872727) {
                var143 = -0.009561482;
            } else {
                var143 = 0.008691268;
            }
        }
    }
    double var144;
    if (inputs[11] < 0.35454544) {
        if (inputs[7] < 3.8075) {
            if (inputs[7] < 2.025) {
                var144 = 0.0017534405;
            } else {
                var144 = -0.045539018;
            }
        } else {
            if (inputs[19] < 80.8242) {
                var144 = -0.021667238;
            } else {
                var144 = 0.012234887;
            }
        }
    } else {
        if (inputs[8] < 2.0675) {
            if (inputs[19] < 74.909386) {
                var144 = 0.039973617;
            } else {
                var144 = 0.010200612;
            }
        } else {
            if (inputs[22] < 9.0) {
                var144 = -0.03242829;
            } else {
                var144 = 0.0011042836;
            }
        }
    }
    double var145;
    if (inputs[1] < 61.77322) {
        if (inputs[1] < 41.037537) {
            if (inputs[22] < 10.0) {
                var145 = 0.018195296;
            } else {
                var145 = -0.012642346;
            }
        } else {
            var145 = 0.059493914;
        }
    } else {
        if (inputs[17] < 2.420463) {
            if (inputs[16] < -1.5237066) {
                var145 = 0.00017014428;
            } else {
                var145 = -0.05215131;
            }
        } else {
            if (inputs[8] < 1.49) {
                var145 = 0.021272685;
            } else {
                var145 = -0.015716579;
            }
        }
    }
    double var146;
    if (inputs[7] < 1.32) {
        var146 = -0.033771876;
    } else {
        if (inputs[2] < 0.9614286) {
            var146 = -0.024623886;
        } else {
            if (inputs[3] < 2178.96) {
                var146 = 0.023116222;
            } else {
                var146 = 0.0010256417;
            }
        }
    }
    double var147;
    if (inputs[20] >= 28.236462) {
        var147 = 0.045000006;
    } else {
        if (inputs[14] < 2.7742078) {
            if (inputs[14] < 2.0039923) {
                var147 = -0.0016828502;
            } else {
                var147 = -0.037402906;
            }
        } else {
            var147 = 0.027613273;
        }
    }
    double var148;
    if (inputs[15] < 1.3338271) {
        if (inputs[9] < 0.13) {
            var148 = 0.05713433;
        } else {
            if (inputs[22] < 10.0) {
                var148 = 0.017017897;
            } else {
                var148 = -0.03296417;
            }
        }
    } else {
        if (inputs[19] < 36.927753) {
            if (inputs[19] < 23.203505) {
                var148 = -0.00068134436;
            } else {
                var148 = 0.034678;
            }
        } else {
            if (inputs[10] < -1.835) {
                var148 = 0.03589474;
            } else {
                var148 = -0.015254381;
            }
        }
    }
    double var149;
    if (inputs[12] < -0.18696992) {
        if (inputs[2] < 1.3635714) {
            var149 = -0.056554224;
        } else {
            if (inputs[2] < 1.5314286) {
                var149 = 0.023596115;
            } else {
                var149 = -0.026327243;
            }
        }
    } else {
        if (inputs[15] < 1.7318975) {
            if (inputs[11] < -0.37854546) {
                var149 = 0.02712264;
            } else {
                var149 = -0.009068832;
            }
        } else {
            if (inputs[16] < 0.41131964) {
                var149 = 0.0077691767;
            } else {
                var149 = 0.04117493;
            }
        }
    }
    double var150;
    if (inputs[13] < 2.1668594) {
        if (inputs[13] < 1.8464171) {
            if (inputs[12] < 0.24495488) {
                var150 = -0.005205923;
            } else {
                var150 = 0.021004848;
            }
        } else {
            var150 = -0.045061644;
        }
    } else {
        if (inputs[19] >= 18.776571) {
            if (inputs[22] < 8.0) {
                var150 = 0.053295955;
            } else {
                var150 = 0.021795211;
            }
        } else {
            if (inputs[13] < 2.947179) {
                var150 = 0.010446931;
            } else {
                var150 = -0.024798099;
            }
        }
    }
    double var151;
    if (inputs[3] < 2030.455) {
        if (inputs[8] < 1.285) {
            var151 = -0.0010804713;
        } else {
            var151 = 0.0357305;
        }
    } else {
        if (inputs[20] < -23.788687) {
            var151 = -0.03683158;
        } else {
            if (inputs[1] < 63.48422) {
                var151 = 0.006175449;
            } else {
                var151 = -0.0121335685;
            }
        }
    }
    double var152;
    if (inputs[11] < 0.49042425) {
        if (inputs[21] < 1.9629512) {
            if (inputs[22] < 9.0) {
                var152 = 0.05298103;
            } else {
                var152 = 0.0046288082;
            }
        } else {
            if (inputs[19] < 81.99093) {
                var152 = -0.016460137;
            } else {
                var152 = 0.005229917;
            }
        }
    } else {
        if (inputs[8] < 1.255) {
            var152 = 0.011961033;
        } else {
            if (inputs[4] < 2343.07) {
                var152 = -0.055074148;
            } else {
                var152 = -0.02523343;
            }
        }
    }
    double var153;
    if (inputs[14] < 2.7742078) {
        if (inputs[14] < 2.3193114) {
            if (inputs[14] < 1.1932963) {
                var153 = 0.014130019;
            } else {
                var153 = -0.007102338;
            }
        } else {
            var153 = -0.05272372;
        }
    } else {
        var153 = 0.029452901;
    }
    double var154;
    if (inputs[8] < 1.1875) {
        if (inputs[17] < -2.5802789) {
            var154 = -0.024796912;
        } else {
            if (inputs[15] < 1.267243) {
                var154 = -0.004455914;
            } else {
                var154 = 0.02253524;
            }
        }
    } else {
        if (inputs[1] < 31.541307) {
            if (inputs[9] < 0.15) {
                var154 = 0.01552146;
            } else {
                var154 = -0.028188245;
            }
        } else {
            if (inputs[15] < 1.6697524) {
                var154 = -0.041832313;
            } else {
                var154 = -0.001181605;
            }
        }
    }
    double var155;
    if (inputs[1] < 76.30992) {
        if (inputs[20] >= 25.04715) {
            var155 = 0.04967355;
        } else {
            if (inputs[1] < 72.07385) {
                var155 = 0.008768359;
            } else {
                var155 = -0.024806162;
            }
        }
    } else {
        var155 = -0.035433047;
    }
    double var156;
    if (inputs[17] < -3.0335448) {
        if (inputs[7] < 6.015) {
            var156 = -0.0001844878;
        } else {
            var156 = 0.0589306;
        }
    } else {
        if (inputs[17] < -2.7223856) {
            var156 = -0.0571098;
        } else {
            if (inputs[2] < 1.3192858) {
                var156 = -0.015648205;
            } else {
                var156 = 0.0042199697;
            }
        }
    }
    double var157;
    if (inputs[1] < 61.77322) {
        if (inputs[10] < -0.522) {
            if (inputs[9] < 0.17) {
                var157 = 0.008589716;
            } else {
                var157 = -0.045497473;
            }
        } else {
            if (inputs[13] < 1.0959854) {
                var157 = 0.009341824;
            } else {
                var157 = 0.058256276;
            }
        }
    } else {
        if (inputs[17] < 2.7782705) {
            if (inputs[20] >= 12.438579) {
                var157 = -0.019432608;
            } else {
                var157 = -0.06357432;
            }
        } else {
            if (inputs[20] >= 25.342886) {
                var157 = 0.025738196;
            } else {
                var157 = -0.012669512;
            }
        }
    }
    double var158;
    if (inputs[13] < 0.8233444) {
        var158 = 0.038703408;
    } else {
        if (inputs[13] < 1.0749065) {
            if (inputs[14] < 1.3842489) {
                var158 = -0.033675127;
            } else {
                var158 = 0.008456966;
            }
        } else {
            if (inputs[8] < 6.825) {
                var158 = 0.009341506;
            } else {
                var158 = -0.036986448;
            }
        }
    }
    double var159;
    if (inputs[17] < -2.7224422) {
        if (inputs[20] >= -30.445547) {
            if (inputs[15] < 1.6890607) {
                var159 = -0.050844878;
            } else {
                var159 = -0.02635149;
            }
        } else {
            var159 = 0.020273102;
        }
    } else {
        if (inputs[20] < -0.3533065) {
            if (inputs[10] < -1.022) {
                var159 = 0.0027084094;
            } else {
                var159 = 0.03712249;
            }
        } else {
            if (inputs[4] < 2339.975) {
                var159 = 0.016896846;
            } else {
                var159 = -0.013347522;
            }
        }
    }
    double var160;
    if (inputs[21] < 3.829468) {
        if (inputs[20] >= -21.114672) {
            if (inputs[14] < 1.0505661) {
                var160 = 0.045124535;
            } else {
                var160 = 0.008825548;
            }
        } else {
            if (inputs[17] < -3.0335448) {
                var160 = 0.021026509;
            } else {
                var160 = -0.045230523;
            }
        }
    } else {
        if (inputs[17] < 4.026913) {
            var160 = -0.04041773;
        } else {
            var160 = -0.0059314272;
        }
    }
    double var161;
    if (inputs[17] < -3.5866337) {
        var161 = 0.032340743;
    } else {
        if (inputs[17] < -2.7223856) {
            if (inputs[13] < 1.3234802) {
                var161 = -0.0449986;
            } else {
                var161 = -0.012469445;
            }
        } else {
            if (inputs[17] < -2.5596485) {
                var161 = 0.039860398;
            } else {
                var161 = 0.00024801618;
            }
        }
    }
    double var162;
    if (inputs[11] < -0.5714545) {
        if (inputs[13] < 2.9314337) {
            var162 = -0.03803602;
        } else {
            var162 = -0.00061055075;
        }
    } else {
        if (inputs[16] < -1.1376609) {
            if (inputs[11] < 0.244) {
                var162 = 0.045305047;
            } else {
                var162 = 0.008319712;
            }
        } else {
            if (inputs[21] < 2.5515587) {
                var162 = -0.014346189;
            } else {
                var162 = 0.011159525;
            }
        }
    }
    double var163;
    if (inputs[19] < 84.608734) {
        if (inputs[10] < -0.522) {
            if (inputs[16] < 0.58357435) {
                var163 = -0.056542423;
            } else {
                var163 = -0.0159543;
            }
        } else {
            if (inputs[12] < -0.030917292) {
                var163 = 0.043316804;
            } else {
                var163 = -0.0059303306;
            }
        }
    } else {
        if (inputs[1] < 61.49535) {
            if (inputs[2] < 1.2814286) {
                var163 = 0.002131797;
            } else {
                var163 = 0.035550725;
            }
        } else {
            if (inputs[22] < 12.0) {
                var163 = 0.012265558;
            } else {
                var163 = -0.031169243;
            }
        }
    }
    double var164;
    if (inputs[10] < 1.336) {
        if (inputs[10] < 0.811) {
            if (inputs[19] >= 65.74466) {
                var164 = 0.02989514;
            } else {
                var164 = 0.0015902299;
            }
        } else {
            if (inputs[4] < 2337.96) {
                var164 = 0.0040298784;
            } else {
                var164 = -0.031781007;
            }
        }
    } else {
        var164 = 0.031404328;
    }
    double var165;
    if (inputs[2] < 1.3192858) {
        if (inputs[22] < 5.0) {
            if (inputs[13] < 1.2237875) {
                var165 = 0.016612906;
            } else {
                var165 = -0.03190783;
            }
        } else {
            if (inputs[2] < 1.0807143) {
                var165 = -0.053207304;
            } else {
                var165 = -0.017251141;
            }
        }
    } else {
        if (inputs[17] < 2.587775) {
            if (inputs[8] < 1.0275) {
                var165 = 0.007756072;
            } else {
                var165 = -0.015682992;
            }
        } else {
            if (inputs[13] < 1.0516958) {
                var165 = -0.006059344;
            } else {
                var165 = 0.0390671;
            }
        }
    }
    double var166;
    if (inputs[7] < 3.935) {
        if (inputs[6] < 2502.875) {
            if (inputs[6] < 2409.075) {
                var166 = -0.007628551;
            } else {
                var166 = 0.050288167;
            }
        } else {
            var166 = -0.046342175;
        }
    } else {
        if (inputs[19] >= 22.861687) {
            if (inputs[11] < 0.35454544) {
                var166 = -0.0142074935;
            } else {
                var166 = 0.02810056;
            }
        } else {
            if (inputs[11] < 0.49042425) {
                var166 = 0.026150066;
            } else {
                var166 = -0.0097812405;
            }
        }
    }
    double var167;
    if (inputs[10] < -0.91) {
        if (inputs[11] < -0.5229091) {
            if (inputs[12] < -0.16518797) {
                var167 = -0.015856944;
            } else {
                var167 = 0.019695224;
            }
        } else {
            var167 = -0.04070519;
        }
    } else {
        if (inputs[13] < 1.1499044) {
            if (inputs[22] < 9.0) {
                var167 = -0.026005428;
            } else {
                var167 = 0.0015972232;
            }
        } else {
            if (inputs[20] >= 7.958226) {
                var167 = -0.0021407958;
            } else {
                var167 = 0.037159845;
            }
        }
    }
    double var168;
    if (inputs[14] < 1.1449803) {
        if (inputs[1] < 65.66103) {
            var168 = -0.036242805;
        } else {
            var168 = 0.005197863;
        }
    } else {
        if (inputs[14] < 1.1932963) {
            var168 = 0.053104136;
        } else {
            if (inputs[2] < 1.1542857) {
                var168 = 0.021545153;
            } else {
                var168 = 0.000036869635;
            }
        }
    }
    double var169;
    if (inputs[14] < 1.5120978) {
        if (inputs[1] < 67.04698) {
            if (inputs[11] < 0.31484848) {
                var169 = -0.026119225;
            } else {
                var169 = 0.024254108;
            }
        } else {
            if (inputs[19] >= 42.78193) {
                var169 = -0.019811803;
            } else {
                var169 = 0.02851049;
            }
        }
    } else {
        if (inputs[12] < 0.0029172932) {
            if (inputs[12] < -0.1592406) {
                var169 = 0.0016540204;
            } else {
                var169 = 0.040576328;
            }
        } else {
            if (inputs[19] < 103.797745) {
                var169 = 0.027910411;
            } else {
                var169 = -0.026781306;
            }
        }
    }
    double var170;
    if (inputs[2] < 1.8535714) {
        if (inputs[11] < -0.3950303) {
            if (inputs[1] < 26.486374) {
                var170 = -0.010625662;
            } else {
                var170 = 0.04612931;
            }
        } else {
            if (inputs[3] < 2151.605) {
                var170 = 0.02165739;
            } else {
                var170 = -0.0015435651;
            }
        }
    } else {
        if (inputs[2] < 2.037857) {
            var170 = -0.0598498;
        } else {
            if (inputs[1] < 30.870756) {
                var170 = 0.03510774;
            } else {
                var170 = -0.0044621374;
            }
        }
    }
    double var171;
    if (inputs[16] < -1.4030799) {
        if (inputs[3] < 2337.05) {
            if (inputs[22] < 8.0) {
                var171 = -0.017691718;
            } else {
                var171 = 0.03639472;
            }
        } else {
            var171 = -0.046970643;
        }
    } else {
        if (inputs[14] < 1.1449803) {
            if (inputs[14] < 0.99904406) {
                var171 = 0.016569465;
            } else {
                var171 = -0.056113858;
            }
        } else {
            if (inputs[15] < 1.3338271) {
                var171 = 0.03136478;
            } else {
                var171 = 0.0028567277;
            }
        }
    }
    double var172;
    if (inputs[12] < 0.07669173) {
        if (inputs[15] < 1.1855398) {
            var172 = -0.043708604;
        } else {
            if (inputs[22] < 14.0) {
                var172 = 0.014426635;
            } else {
                var172 = -0.028848456;
            }
        }
    } else {
        if (inputs[1] < 77.52381) {
            if (inputs[7] < 2.2475) {
                var172 = -0.019420542;
            } else {
                var172 = 0.02787712;
            }
        } else {
            var172 = -0.010863945;
        }
    }
    double var173;
    if (inputs[1] < 77.32544) {
        if (inputs[17] < 2.5428717) {
            if (inputs[17] < 2.2130792) {
                var173 = 0.0045031556;
            } else {
                var173 = -0.039990578;
            }
        } else {
            if (inputs[2] < 1.3178571) {
                var173 = 0.0001204881;
            } else {
                var173 = 0.03767667;
            }
        }
    } else {
        var173 = -0.042487912;
    }
    double var174;
    if (inputs[20] < 15.935555) {
        if (inputs[17] < -2.7224422) {
            if (inputs[17] < -3.17036) {
                var174 = 0.003998715;
            } else {
                var174 = -0.053490605;
            }
        } else {
            if (inputs[17] < -2.5035655) {
                var174 = 0.044412896;
            } else {
                var174 = 0.0050115427;
            }
        }
    } else {
        if (inputs[20] >= 26.298834) {
            var174 = 0.009286819;
        } else {
            if (inputs[17] < 2.6501436) {
                var174 = -0.005632084;
            } else {
                var174 = -0.04410725;
            }
        }
    }
    double var175;
    if (inputs[11] < 0.3578182) {
        if (inputs[11] < 0.17060606) {
            if (inputs[22] < 14.0) {
                var175 = 0.01648752;
            } else {
                var175 = -0.029842002;
            }
        } else {
            if (inputs[20] >= 12.438579) {
                var175 = -0.012693854;
            } else {
                var175 = -0.050361425;
            }
        }
    } else {
        if (inputs[22] < 7.0) {
            if (inputs[3] < 2337.18) {
                var175 = 0.03211183;
            } else {
                var175 = -0.031597495;
            }
        } else {
            if (inputs[17] < 3.2131147) {
                var175 = 0.050860193;
            } else {
                var175 = 0.0010235017;
            }
        }
    }
    double var176;
    if (inputs[12] < -0.056473684) {
        if (inputs[1] < 29.227674) {
            if (inputs[21] < 3.2230215) {
                var176 = -0.0232459;
            } else {
                var176 = 0.023615627;
            }
        } else {
            if (inputs[2] < 2.05) {
                var176 = 0.034539383;
            } else {
                var176 = -0.010301483;
            }
        }
    } else {
        if (inputs[16] < -0.54781944) {
            if (inputs[13] < 1.0219471) {
                var176 = 0.040831562;
            } else {
                var176 = -0.003630491;
            }
        } else {
            if (inputs[15] < 1.6250459) {
                var176 = -0.035581;
            } else {
                var176 = 0.0053083748;
            }
        }
    }
    double var177;
    if (inputs[16] < -1.8129214) {
        var177 = -0.026812904;
    } else {
        if (inputs[16] < -1.1376609) {
            if (inputs[21] < 2.5416667) {
                var177 = 0.06166817;
            } else {
                var177 = 0.015411256;
            }
        } else {
            if (inputs[21] < 2.5515587) {
                var177 = -0.01113225;
            } else {
                var177 = 0.010193405;
            }
        }
    }
    double var178;
    if (inputs[16] < -2.0018845) {
        var178 = -0.037645947;
    } else {
        if (inputs[20] < 16.29137) {
            if (inputs[20] < 12.143454) {
                var178 = 0.0019166775;
            } else {
                var178 = 0.03635206;
            }
        } else {
            if (inputs[19] < 46.6221) {
                var178 = 0.027086467;
            } else {
                var178 = -0.01831997;
            }
        }
    }
    double var179;
    if (inputs[21] < 4.5588236) {
        if (inputs[2] < 1.2578571) {
            if (inputs[16] < -1.4247838) {
                var179 = 0.008906897;
            } else {
                var179 = -0.0338747;
            }
        } else {
            if (inputs[3] < 2030.265) {
                var179 = 0.035024535;
            } else {
                var179 = 0.0028352877;
            }
        }
    } else {
        var179 = 0.037968136;
    }
    double var180;
    if (inputs[14] < 1.1680844) {
        if (inputs[20] < 17.76858) {
            if (inputs[2] < 1.3192858) {
                var180 = -0.0061277063;
            } else {
                var180 = 0.03714262;
            }
        } else {
            var180 = 0.047965527;
        }
    } else {
        if (inputs[10] < -0.91) {
            if (inputs[11] < -0.52648485) {
                var180 = 0.006321765;
            } else {
                var180 = -0.053241555;
            }
        } else {
            if (inputs[20] < 7.387738) {
                var180 = 0.016830461;
            } else {
                var180 = -0.009026603;
            }
        }
    }
    double var181;
    if (inputs[2] < 1.2814286) {
        if (inputs[3] < 2295.135) {
            if (inputs[6] < 2043.895) {
                var181 = -0.01620567;
            } else {
                var181 = 0.03891988;
            }
        } else {
            if (inputs[8] < 0.6375) {
                var181 = -0.012610427;
            } else {
                var181 = -0.04831204;
            }
        }
    } else {
        if (inputs[8] < 5.335) {
            if (inputs[8] < 2.865) {
                var181 = 0.0023569232;
            } else {
                var181 = 0.03227033;
            }
        } else {
            var181 = -0.020660523;
        }
    }
    double var182;
    if (inputs[13] < 1.1480767) {
        if (inputs[13] < 1.0384488) {
            if (inputs[19] < 97.25508) {
                var182 = 0.020546587;
            } else {
                var182 = -0.011064951;
            }
        } else {
            var182 = -0.046363056;
        }
    } else {
        if (inputs[16] < 1.4930457) {
            if (inputs[10] < 0.827) {
                var182 = 0.019737829;
            } else {
                var182 = -0.0007735651;
            }
        } else {
            var182 = -0.028032824;
        }
    }
    double var183;
    if (inputs[15] < 1.096939) {
        if (inputs[20] < 14.976197) {
            var183 = 0.003203699;
        } else {
            var183 = 0.05692278;
        }
    } else {
        if (inputs[7] < 2.775) {
            if (inputs[16] < -0.17793311) {
                var183 = 0.037684277;
            } else {
                var183 = -0.0018878387;
            }
        } else {
            if (inputs[13] < 2.1668594) {
                var183 = -0.01034275;
            } else {
                var183 = 0.014662285;
            }
        }
    }
    double var184;
    if (inputs[17] < -3.6882546) {
        var184 = 0.02481316;
    } else {
        if (inputs[8] < 1.0275) {
            if (inputs[8] < 0.825) {
                var184 = -0.0007247271;
            } else {
                var184 = 0.044232015;
            }
        } else {
            if (inputs[6] < 2042.15) {
                var184 = 0.023401283;
            } else {
                var184 = -0.016162094;
            }
        }
    }
    double var185;
    if (inputs[20] >= -28.129015) {
        if (inputs[10] < 0.811) {
            if (inputs[7] < 4.03) {
                var185 = -0.0033769272;
            } else {
                var185 = 0.022080762;
            }
        } else {
            if (inputs[10] < 0.916) {
                var185 = -0.051612437;
            } else {
                var185 = 0.009177134;
            }
        }
    } else {
        var185 = -0.01969086;
    }
    double var186;
    if (inputs[7] < 1.325) {
        var186 = -0.03537013;
    } else {
        if (inputs[1] < 77.52381) {
            if (inputs[1] < 74.97299) {
                var186 = 0.0010788122;
            } else {
                var186 = 0.03835846;
            }
        } else {
            var186 = -0.03353619;
        }
    }
    double var187;
    if (inputs[4] < 2023.44) {
        var187 = 0.026593303;
    } else {
        if (inputs[8] < 1.165) {
            if (inputs[8] < 0.55) {
                var187 = -0.0032776992;
            } else {
                var187 = 0.02441048;
            }
        } else {
            if (inputs[2] < 2.745) {
                var187 = -0.013797218;
            } else {
                var187 = 0.032996252;
            }
        }
    }
    double var188;
    if (inputs[16] < -1.1683838) {
        if (inputs[22] < 9.0) {
            if (inputs[15] < 1.570412) {
                var188 = -0.026774442;
            } else {
                var188 = 0.013238548;
            }
        } else {
            if (inputs[2] < 1.6992857) {
                var188 = 0.01870913;
            } else {
                var188 = 0.054348603;
            }
        }
    } else {
        if (inputs[16] < 0.98226386) {
            if (inputs[2] < 1.035) {
                var188 = 0.019986218;
            } else {
                var188 = -0.017143056;
            }
        } else {
            if (inputs[21] < 3.0029585) {
                var188 = -0.0013240738;
            } else {
                var188 = 0.041780304;
            }
        }
    }
    double var189;
    if (inputs[13] < 1.0066301) {
        if (inputs[13] < 0.8593393) {
            var189 = 0.0015157986;
        } else {
            var189 = -0.042495348;
        }
    } else {
        if (inputs[13] < 1.0516958) {
            var189 = 0.04528468;
        } else {
            if (inputs[5] < 2026.31) {
                var189 = -0.036250222;
            } else {
                var189 = 0.006601383;
            }
        }
    }
    double var190;
    if (inputs[2] < 1.6721429) {
        if (inputs[7] < 7.48) {
            if (inputs[17] < -2.6242263) {
                var190 = -0.022168593;
            } else {
                var190 = 0.009365518;
            }
        } else {
            var190 = 0.03878756;
        }
    } else {
        if (inputs[15] < 1.7318975) {
            if (inputs[16] < -0.55340564) {
                var190 = -0.01124144;
            } else {
                var190 = -0.06394055;
            }
        } else {
            if (inputs[15] < 1.968915) {
                var190 = 0.036335398;
            } else {
                var190 = -0.014403773;
            }
        }
    }
    double var191;
    if (inputs[1] < 77.52381) {
        if (inputs[11] < -0.5714545) {
            var191 = -0.01890394;
        } else {
            if (inputs[14] < 1.5120978) {
                var191 = 0.0036086466;
            } else {
                var191 = 0.02301687;
            }
        }
    } else {
        var191 = -0.032927576;
    }
    double var192;
    if (inputs[1] < 37.105743) {
        if (inputs[19] >= 85.43868) {
            var192 = 0.036299106;
        } else {
            if (inputs[8] < 3.415) {
                var192 = -0.03294361;
            } else {
                var192 = -0.00015725003;
            }
        }
    } else {
        if (inputs[17] < 1.7151163) {
            var192 = 0.041516766;
        } else {
            if (inputs[14] < 1.5208948) {
                var192 = 0.016159087;
            } else {
                var192 = -0.01849835;
            }
        }
    }
    double var193;
    if (inputs[20] >= 12.3672905) {
        if (inputs[1] < 73.47327) {
            if (inputs[19] >= 75.43498) {
                var193 = -0.008805604;
            } else {
                var193 = 0.031333506;
            }
        } else {
            if (inputs[12] < 0.21203007) {
                var193 = -0.032532007;
            } else {
                var193 = 0.00022121811;
            }
        }
    } else {
        if (inputs[1] < 61.49535) {
            if (inputs[19] >= 86.87821) {
                var193 = 0.0449109;
            } else {
                var193 = -0.0023469694;
            }
        } else {
            if (inputs[17] < 2.5416667) {
                var193 = -0.063926265;
            } else {
                var193 = -0.0067728185;
            }
        }
    }
    double var194;
    if (inputs[9] < 0.13) {
        if (inputs[22] < 9.0) {
            if (inputs[22] < 5.0) {
                var194 = 0.008750559;
            } else {
                var194 = -0.0419758;
            }
        } else {
            if (inputs[11] < -0.59654546) {
                var194 = -0.0038404933;
            } else {
                var194 = 0.03033886;
            }
        }
    } else {
        if (inputs[10] < 0.876) {
            if (inputs[15] < 1.804105) {
                var194 = -0.011219796;
            } else {
                var194 = -0.050395157;
            }
        } else {
            if (inputs[12] < 0.08369925) {
                var194 = -0.011579326;
            } else {
                var194 = 0.03143965;
            }
        }
    }
    double var195;
    if (inputs[15] < 1.970306) {
        if (inputs[22] < 12.0) {
            if (inputs[1] < 33.0472) {
                var195 = 0.031057231;
            } else {
                var195 = 0.0039602756;
            }
        } else {
            if (inputs[14] < 1.6795464) {
                var195 = -0.02774264;
            } else {
                var195 = 0.009693988;
            }
        }
    } else {
        if (inputs[6] < 2439.56) {
            if (inputs[22] < 15.0) {
                var195 = -0.03920545;
            } else {
                var195 = 0.001185484;
            }
        } else {
            var195 = 0.013246043;
        }
    }
    double var196;
    if (inputs[12] < -0.3044812) {
        var196 = -0.03325013;
    } else {
        if (inputs[1] < 30.750015) {
            if (inputs[12] < -0.19283459) {
                var196 = 0.0022677104;
            } else {
                var196 = 0.039690908;
            }
        } else {
            if (inputs[1] < 35.884254) {
                var196 = -0.02998664;
            } else {
                var196 = 0.004665494;
            }
        }
    }
    double var197;
    if (inputs[11] < -0.5714545) {
        if (inputs[14] < 2.7742078) {
            var197 = -0.037309524;
        } else {
            var197 = 0.0013992867;
        }
    } else {
        if (inputs[13] < 1.0959854) {
            if (inputs[7] < 3.8075) {
                var197 = -0.030117922;
            } else {
                var197 = 0.01741666;
            }
        } else {
            if (inputs[3] < 2372.41) {
                var197 = 0.019877156;
            } else {
                var197 = -0.0014834764;
            }
        }
    }
    double var198;
    if (inputs[11] < -0.5714545) {
        var198 = -0.025956009;
    } else {
        if (inputs[11] < -0.52648485) {
            var198 = 0.056336764;
        } else {
            if (inputs[14] < 2.6581752) {
                var198 = 0.0042916765;
            } else {
                var198 = 0.040229812;
            }
        }
    }
    double var199;
    if (inputs[5] < 2358.0376) {
        if (inputs[8] < 5.5825) {
            if (inputs[3] < 2332.835) {
                var199 = -0.00020706587;
            } else {
                var199 = 0.03764201;
            }
        } else {
            var199 = -0.03625766;
        }
    } else {
        if (inputs[9] < 0.13) {
            if (inputs[7] < 6.795) {
                var199 = 0.01960715;
            } else {
                var199 = -0.022978358;
            }
        } else {
            if (inputs[21] < 2.618196) {
                var199 = -0.0151620405;
            } else {
                var199 = -0.056529325;
            }
        }
    }
    double var200;
    if (inputs[17] < -3.5866337) {
        var200 = 0.03324291;
    } else {
        if (inputs[21] < 3.5055645) {
            if (inputs[17] < 2.5826688) {
                var200 = -0.009161885;
            } else {
                var200 = 0.018483883;
            }
        } else {
            if (inputs[20] < 23.85628) {
                var200 = -0.05337568;
            } else {
                var200 = -0.0070321467;
            }
        }
    }
    double var201;
    if (inputs[13] < 2.947179) {
        if (inputs[1] < 67.04698) {
            if (inputs[1] < 63.48422) {
                var201 = 0.00038258964;
            } else {
                var201 = -0.03959926;
            }
        } else {
            if (inputs[8] < 1.49) {
                var201 = 0.025100516;
            } else {
                var201 = -0.002815126;
            }
        }
    } else {
        var201 = -0.049297713;
    }
    double var202;
    if (inputs[10] < 1.193) {
        if (inputs[9] < 0.13) {
            if (inputs[5] < 2319.53) {
                var202 = 0.028965976;
            } else {
                var202 = -0.003079623;
            }
        } else {
            if (inputs[15] < 1.2747034) {
                var202 = -0.020061687;
            } else {
                var202 = 0.0023564885;
            }
        }
    } else {
        var202 = -0.029758595;
    }
    double var203;
    if (inputs[7] < 5.31) {
        if (inputs[22] < 15.0) {
            if (inputs[7] < 4.195) {
                var203 = 0.0077756187;
            } else {
                var203 = -0.02748086;
            }
        } else {
            var203 = -0.042863224;
        }
    } else {
        if (inputs[15] < 2.9394548) {
            if (inputs[10] < 0.768) {
                var203 = 0.028235596;
            } else {
                var203 = -0.0015457267;
            }
        } else {
            var203 = -0.014590704;
        }
    }
    double var204;
    if (inputs[22] < 4.0) {
        if (inputs[21] < 3.1745868) {
            if (inputs[1] < 62.403748) {
                var204 = 0.020231;
            } else {
                var204 = -0.021857347;
            }
        } else {
            var204 = 0.03750024;
        }
    } else {
        if (inputs[22] < 6.0) {
            if (inputs[19] < 62.183773) {
                var204 = -0.010196177;
            } else {
                var204 = -0.051345777;
            }
        } else {
            if (inputs[21] < 3.9284732) {
                var204 = 0.009406035;
            } else {
                var204 = -0.031228848;
            }
        }
    }
    double var205;
    if (inputs[21] < 3.8914027) {
        if (inputs[10] < 1.193) {
            if (inputs[11] < -0.27024242) {
                var205 = -0.0037455996;
            } else {
                var205 = 0.015430491;
            }
        } else {
            var205 = -0.027611125;
        }
    } else {
        if (inputs[3] < 2159.185) {
            var205 = 0.0027073014;
        } else {
            var205 = -0.048277862;
        }
    }
    double var206;
    if (inputs[7] < 1.325) {
        var206 = -0.040428225;
    } else {
        if (inputs[21] < 4.4938273) {
            if (inputs[2] < 1.2442857) {
                var206 = -0.027233334;
            } else {
                var206 = 0.0028667797;
            }
        } else {
            var206 = 0.03191579;
        }
    }
    double var207;
    if (inputs[14] < 1.1817969) {
        if (inputs[2] < 1.3192858) {
            var207 = -0.0049007917;
        } else {
            if (inputs[2] < 1.5571429) {
                var207 = 0.053448465;
            } else {
                var207 = 0.02392086;
            }
        }
    } else {
        if (inputs[13] < 1.2000567) {
            if (inputs[15] < 1.558762) {
                var207 = -0.010775566;
            } else {
                var207 = -0.05318582;
            }
        } else {
            if (inputs[2] < 1.365) {
                var207 = -0.020226408;
            } else {
                var207 = 0.008746391;
            }
        }
    }
    double var208;
    if (inputs[7] < 7.015) {
        if (inputs[10] < -1.009) {
            if (inputs[11] < -0.5239394) {
                var208 = 0.01254896;
            } else {
                var208 = -0.045301802;
            }
        } else {
            if (inputs[7] < 6.47) {
                var208 = 0.00919753;
            } else {
                var208 = 0.046831887;
            }
        }
    } else {
        if (inputs[21] < 2.562963) {
            if (inputs[2] < 2.2871428) {
                var208 = -0.054893516;
            } else {
                var208 = -0.0021540285;
            }
        } else {
            if (inputs[21] < 3.789809) {
                var208 = 0.01818103;
            } else {
                var208 = -0.030600633;
            }
        }
    }
    double var209;
    if (inputs[22] < 15.0) {
        if (inputs[13] < 1.1480767) {
            if (inputs[8] < 0.73) {
                var209 = 0.014951226;
            } else {
                var209 = -0.021305775;
            }
        } else {
            if (inputs[6] < 2378.885) {
                var209 = 0.023511011;
            } else {
                var209 = -0.001189103;
            }
        }
    } else {
        if (inputs[9] < 0.11) {
            var209 = 0.011819071;
        } else {
            var209 = -0.053549986;
        }
    }
    double var210;
    if (inputs[3] < 2154.53) {
        if (inputs[21] < 2.5515587) {
            var210 = -0.009787623;
        } else {
            if (inputs[2] < 1.2935715) {
                var210 = 0.013531152;
            } else {
                var210 = 0.05196086;
            }
        }
    } else {
        if (inputs[3] < 2347.71) {
            if (inputs[15] < 1.146706) {
                var210 = 0.023263305;
            } else {
                var210 = -0.02140506;
            }
        } else {
            if (inputs[19] < 86.309265) {
                var210 = -0.003262474;
            } else {
                var210 = 0.021581693;
            }
        }
    }
    double var211;
    if (inputs[16] < 0.9440991) {
        if (inputs[21] < 2.5381129) {
            if (inputs[19] >= 29.846333) {
                var211 = 0.0035431022;
            } else {
                var211 = -0.045682408;
            }
        } else {
            if (inputs[21] < 2.6501436) {
                var211 = 0.0408419;
            } else {
                var211 = -0.0037215895;
            }
        }
    } else {
        if (inputs[16] < 1.6773072) {
            if (inputs[15] < 1.3014003) {
                var211 = 0.0040630037;
            } else {
                var211 = 0.045713264;
            }
        } else {
            var211 = -0.012511353;
        }
    }
    double var212;
    if (inputs[20] >= -14.443964) {
        if (inputs[19] < 36.376976) {
            var212 = 0.039350536;
        } else {
            if (inputs[11] < -0.25030303) {
                var212 = 0.040891156;
            } else {
                var212 = -0.001148638;
            }
        }
    } else {
        if (inputs[19] < 65.74466) {
            var212 = -0.039133903;
        } else {
            if (inputs[22] < 4.0) {
                var212 = 0.032735676;
            } else {
                var212 = -0.007883379;
            }
        }
    }
    double var213;
    if (inputs[20] < 15.935555) {
        if (inputs[11] < 0.302) {
            if (inputs[20] < 5.815266) {
                var213 = 0.004969973;
            } else {
                var213 = -0.0382261;
            }
        } else {
            if (inputs[22] < 5.0) {
                var213 = -0.015144916;
            } else {
                var213 = 0.034335792;
            }
        }
    } else {
        if (inputs[20] >= 25.342886) {
            if (inputs[8] < 1.49) {
                var213 = 0.033338353;
            } else {
                var213 = 0.0017356458;
            }
        } else {
            if (inputs[11] < 0.27078786) {
                var213 = 0.008091809;
            } else {
                var213 = -0.03953789;
            }
        }
    }
    double var214;
    if (inputs[13] < 1.1480767) {
        if (inputs[7] < 5.0325) {
            if (inputs[13] < 0.9096505) {
                var214 = 0.0023623442;
            } else {
                var214 = -0.05274879;
            }
        } else {
            if (inputs[15] < 1.4316252) {
                var214 = 0.03245665;
            } else {
                var214 = -0.01952138;
            }
        }
    } else {
        if (inputs[13] < 1.2237875) {
            var214 = 0.04229525;
        } else {
            if (inputs[19] >= 88.63259) {
                var214 = 0.020637445;
            } else {
                var214 = -0.0019247835;
            }
        }
    }
    double var215;
    if (inputs[10] < 1.017) {
        if (inputs[10] < 0.827) {
            if (inputs[20] >= -23.788687) {
                var215 = 0.006137949;
            } else {
                var215 = -0.023755692;
            }
        } else {
            if (inputs[3] < 2359.235) {
                var215 = -0.008257463;
            } else {
                var215 = -0.05786002;
            }
        }
    } else {
        if (inputs[21] < 2.388913) {
            var215 = -0.013870196;
        } else {
            if (inputs[16] < 0.09629683) {
                var215 = 0.014169477;
            } else {
                var215 = 0.04844455;
            }
        }
    }
    double var216;
    if (inputs[20] < 20.27173) {
        if (inputs[20] < 17.646784) {
            if (inputs[20] < 15.935555) {
                var216 = 0.0015386844;
            } else {
                var216 = -0.039271798;
            }
        } else {
            var216 = 0.031825777;
        }
    } else {
        if (inputs[20] >= 25.342886) {
            var216 = -0.0007574882;
        } else {
            var216 = -0.034913484;
        }
    }
    double var217;
    if (inputs[14] < 1.1932963) {
        if (inputs[15] < 1.0395503) {
            var217 = 0.058251847;
        } else {
            if (inputs[21] < 2.5752509) {
                var217 = 0.03895954;
            } else {
                var217 = -0.0074294438;
            }
        }
    } else {
        if (inputs[13] < 1.8073008) {
            if (inputs[7] < 7.59) {
                var217 = -0.008520989;
            } else {
                var217 = -0.062267907;
            }
        } else {
            if (inputs[21] < 2.388913) {
                var217 = -0.015158737;
            } else {
                var217 = 0.021494512;
            }
        }
    }
    double var218;
    if (inputs[19] < 37.96602) {
        if (inputs[10] < -0.523) {
            var218 = 0.0017420689;
        } else {
            var218 = 0.041265994;
        }
    } else {
        if (inputs[2] < 1.3821429) {
            if (inputs[2] < 1.1164286) {
                var218 = -0.000083840634;
            } else {
                var218 = -0.031148363;
            }
        } else {
            if (inputs[11] < 0.36872727) {
                var218 = -0.0071914615;
            } else {
                var218 = 0.025158457;
            }
        }
    }
    double var219;
    if (inputs[10] < 0.717) {
        if (inputs[16] < -0.6648726) {
            if (inputs[19] >= 28.583006) {
                var219 = 0.038850773;
            } else {
                var219 = -0.002341589;
            }
        } else {
            if (inputs[16] < 0.38465208) {
                var219 = -0.027556106;
            } else {
                var219 = 0.0012266375;
            }
        }
    } else {
        if (inputs[19] < 46.6221) {
            var219 = 0.019365031;
        } else {
            if (inputs[17] < 2.7782705) {
                var219 = -0.04501176;
            } else {
                var219 = -0.01015569;
            }
        }
    }
    double var220;
    if (inputs[22] < 14.0) {
        if (inputs[19] < 65.74466) {
            if (inputs[10] < 0.577) {
                var220 = -0.037339177;
            } else {
                var220 = 0.023526974;
            }
        } else {
            if (inputs[8] < 0.42) {
                var220 = -0.02435263;
            } else {
                var220 = 0.02060293;
            }
        }
    } else {
        if (inputs[1] < 35.615753) {
            var220 = -0.04033788;
        } else {
            if (inputs[10] < 0.717) {
                var220 = 0.030502582;
            } else {
                var220 = -0.019062422;
            }
        }
    }
    double var221;
    if (inputs[12] < -0.3044812) {
        var221 = -0.028769115;
    } else {
        if (inputs[21] < 4.5588236) {
            if (inputs[13] < 1.21019) {
                var221 = -0.012048386;
            } else {
                var221 = 0.005679979;
            }
        } else {
            var221 = 0.034842312;
        }
    }
    double var222;
    if (inputs[3] < 2173.425) {
        if (inputs[3] < 2047.77) {
            if (inputs[14] < 1.2839626) {
                var222 = -0.03186356;
            } else {
                var222 = 0.019690596;
            }
        } else {
            if (inputs[7] < 4.595) {
                var222 = 0.017609224;
            } else {
                var222 = 0.046891797;
            }
        }
    } else {
        if (inputs[5] < 2277.2625) {
            var222 = -0.049491778;
        } else {
            if (inputs[5] < 2313.88) {
                var222 = 0.03094301;
            } else {
                var222 = -0.0059041507;
            }
        }
    }
    double var223;
    if (inputs[12] < 0.24064662) {
        if (inputs[12] < 0.18951128) {
            if (inputs[16] < 0.12138084) {
                var223 = 0.00849392;
            } else {
                var223 = -0.011978209;
            }
        } else {
            var223 = -0.037752625;
        }
    } else {
        if (inputs[8] < 2.2775) {
            var223 = 0.042917475;
        } else {
            var223 = -0.0012590296;
        }
    }
    double var224;
    if (inputs[16] < -1.8126473) {
        if (inputs[19] < 99.23713) {
            var224 = 0.0024959035;
        } else {
            var224 = -0.04759994;
        }
    } else {
        if (inputs[14] < 1.1449803) {
            if (inputs[14] < 0.99904406) {
                var224 = 0.008284627;
            } else {
                var224 = -0.040930606;
            }
        } else {
            if (inputs[15] < 1.3528392) {
                var224 = 0.020655885;
            } else {
                var224 = 0.0026841748;
            }
        }
    }
    double var225;
    if (inputs[20] < 8.594394) {
        if (inputs[13] < 1.1499044) {
            if (inputs[5] < 2317.5076) {
                var225 = -0.031484455;
            } else {
                var225 = 0.0078234915;
            }
        } else {
            if (inputs[10] < -0.91) {
                var225 = 0.008305404;
            } else {
                var225 = 0.03388631;
            }
        }
    } else {
        if (inputs[19] >= 51.052536) {
            if (inputs[2] < 1.335) {
                var225 = 0.00216639;
            } else {
                var225 = -0.04865068;
            }
        } else {
            if (inputs[17] < 3.0930233) {
                var225 = 0.012197178;
            } else {
                var225 = -0.016536545;
            }
        }
    }
    double var226;
    if (inputs[2] < 2.0821428) {
        if (inputs[19] < 33.075962) {
            var226 = -0.023149172;
        } else {
            if (inputs[13] < 2.1668594) {
                var226 = 0.0019733154;
            } else {
                var226 = 0.0338172;
            }
        }
    } else {
        if (inputs[10] < -0.634) {
            var226 = -0.04693839;
        } else {
            var226 = -0.011073783;
        }
    }
    double var227;
    if (inputs[2] < 2.0821428) {
        if (inputs[2] < 1.9885714) {
            if (inputs[2] < 1.8092858) {
                var227 = 0.0030770106;
            } else {
                var227 = -0.024685657;
            }
        } else {
            var227 = 0.03366395;
        }
    } else {
        if (inputs[2] < 2.745) {
            var227 = -0.04234715;
        } else {
            var227 = 0.012194833;
        }
    }
    double var228;
    if (inputs[17] < 2.7782705) {
        if (inputs[15] < 1.1796672) {
            if (inputs[2] < 1.325) {
                var228 = -0.0024583547;
            } else {
                var228 = -0.041420303;
            }
        } else {
            if (inputs[14] < 1.2120401) {
                var228 = 0.03071861;
            } else {
                var228 = -0.001458254;
            }
        }
    } else {
        if (inputs[17] < 2.8983364) {
            var228 = 0.046814904;
        } else {
            if (inputs[14] < 1.9722921) {
                var228 = -0.0010943563;
            } else {
                var228 = 0.038795363;
            }
        }
    }
    double var229;
    if (inputs[21] < 1.9629512) {
        if (inputs[2] < 2.0392857) {
            var229 = 0.046298143;
        } else {
            var229 = -0.008157343;
        }
    } else {
        if (inputs[14] < 1.2039788) {
            if (inputs[3] < 2037.91) {
                var229 = -0.019073304;
            } else {
                var229 = 0.022331126;
            }
        } else {
            if (inputs[20] >= 25.04715) {
                var229 = 0.01982715;
            } else {
                var229 = -0.015514209;
            }
        }
    }
    double var230;
    if (inputs[19] >= 120.15335) {
        var230 = 0.037462164;
    } else {
        if (inputs[13] < 0.83271605) {
            var230 = 0.03237552;
        } else {
            if (inputs[15] < 2.182948) {
                var230 = -0.009577019;
            } else {
                var230 = 0.013381432;
            }
        }
    }
    double var231;
    if (inputs[14] < 1.5768373) {
        if (inputs[5] < 2372.37) {
            if (inputs[14] < 1.1932963) {
                var231 = 0.016874798;
            } else {
                var231 = -0.010425525;
            }
        } else {
            if (inputs[19] >= 91.372154) {
                var231 = 0.0036932537;
            } else {
                var231 = -0.04562635;
            }
        }
    } else {
        if (inputs[16] < 0.12327514) {
            if (inputs[1] < 72.07385) {
                var231 = 0.006717585;
            } else {
                var231 = -0.03866887;
            }
        } else {
            if (inputs[21] < 2.417728) {
                var231 = -0.001737828;
            } else {
                var231 = 0.040728252;
            }
        }
    }
    double var232;
    if (inputs[10] < -1.344) {
        var232 = 0.03174997;
    } else {
        if (inputs[22] < 10.0) {
            if (inputs[15] < 2.325328) {
                var232 = 0.011810097;
            } else {
                var232 = -0.021734817;
            }
        } else {
            if (inputs[15] < 1.7318975) {
                var232 = -0.026173519;
            } else {
                var232 = 0.009870099;
            }
        }
    }
    double var233;
    if (inputs[6] < 2025.315) {
        var233 = 0.027583767;
    } else {
        if (inputs[5] < 2034.82) {
            var233 = -0.04041574;
        } else {
            if (inputs[5] < 2167.455) {
                var233 = 0.017362429;
            } else {
                var233 = -0.0061917533;
            }
        }
    }
    double var234;
    if (inputs[19] < 37.96602) {
        if (inputs[12] < 0.006473684) {
            var234 = 0.01132498;
        } else {
            var234 = 0.03961453;
        }
    } else {
        if (inputs[19] < 84.80466) {
            if (inputs[14] < 1.5120978) {
                var234 = -0.024731878;
            } else {
                var234 = 0.00713433;
            }
        } else {
            if (inputs[14] < 1.6571327) {
                var234 = 0.014646992;
            } else {
                var234 = -0.004697711;
            }
        }
    }
    double var235;
    if (inputs[13] < 1.1499044) {
        if (inputs[7] < 6.225) {
            if (inputs[9] < 0.13) {
                var235 = 0.013075994;
            } else {
                var235 = -0.035386242;
            }
        } else {
            var235 = 0.022361156;
        }
    } else {
        if (inputs[7] < 7.675) {
            if (inputs[2] < 1.3192858) {
                var235 = -0.0034105694;
            } else {
                var235 = 0.019638851;
            }
        } else {
            if (inputs[3] < 2280.625) {
                var235 = 0.010809581;
            } else {
                var235 = -0.03973068;
            }
        }
    }
    double var236;
    if (inputs[14] < 1.1680844) {
        if (inputs[7] < 6.225) {
            if (inputs[8] < 1.1525) {
                var236 = 0.026032474;
            } else {
                var236 = -0.036646806;
            }
        } else {
            var236 = 0.031653777;
        }
    } else {
        if (inputs[12] < 0.23165414) {
            if (inputs[22] < 14.0) {
                var236 = -0.0042011836;
            } else {
                var236 = -0.0307583;
            }
        } else {
            if (inputs[12] < 0.28377444) {
                var236 = 0.039642204;
            } else {
                var236 = -0.010889518;
            }
        }
    }
    double var237;
    if (inputs[5] < 2337.815) {
        if (inputs[13] < 0.99774545) {
            var237 = -0.024183452;
        } else {
            if (inputs[3] < 2281.23) {
                var237 = 0.000391363;
            } else {
                var237 = 0.021460714;
            }
        }
    } else {
        if (inputs[15] < 1.2323599) {
            var237 = -0.045502968;
        } else {
            if (inputs[5] < 2425.425) {
                var237 = -0.020261377;
            } else {
                var237 = 0.0073107122;
            }
        }
    }
    double var238;
    if (inputs[20] < -23.788687) {
        if (inputs[16] < 0.8653556) {
            var238 = -0.046007477;
        } else {
            var238 = 0.004917766;
        }
    } else {
        if (inputs[20] >= -22.79833) {
            if (inputs[17] < -2.6242263) {
                var238 = -0.024815992;
            } else {
                var238 = 0.003664297;
            }
        } else {
            var238 = 0.027002847;
        }
    }
    double var239;
    if (inputs[10] < -0.883) {
        if (inputs[7] < 5.0575) {
            var239 = -0.043960616;
        } else {
            if (inputs[22] < 11.0) {
                var239 = -0.028514387;
            } else {
                var239 = 0.02332171;
            }
        }
    } else {
        if (inputs[10] < 0.66) {
            if (inputs[16] < -0.97878236) {
                var239 = 0.033858523;
            } else {
                var239 = 0.006457138;
            }
        } else {
            if (inputs[15] < 2.0398257) {
                var239 = -0.010778704;
            } else {
                var239 = 0.023763414;
            }
        }
    }
    double var240;
    if (inputs[14] < 0.99904406) {
        var240 = 0.02721843;
    } else {
        if (inputs[12] < 0.2484436) {
            if (inputs[12] < 0.17178947) {
                var240 = -0.0033918254;
            } else {
                var240 = -0.027210355;
            }
        } else {
            if (inputs[22] < 11.0) {
                var240 = -0.002210211;
            } else {
                var240 = 0.039038308;
            }
        }
    }
    double var241;
    if (inputs[12] < 0.21203007) {
        if (inputs[13] < 1.1146228) {
            if (inputs[16] < 0.84004223) {
                var241 = -0.030835567;
            } else {
                var241 = 0.019200532;
            }
        } else {
            if (inputs[14] < 1.1680844) {
                var241 = 0.035525836;
            } else {
                var241 = 0.0014121602;
            }
        }
    } else {
        if (inputs[3] < 2324.8) {
            var241 = 0.03979326;
        } else {
            var241 = 0.0065120463;
        }
    }
    double var242;
    if (inputs[11] < -0.44260606) {
        if (inputs[11] < -0.5714545) {
            if (inputs[19] < 106.67325) {
                var242 = -0.028107116;
            } else {
                var242 = 0.016153732;
            }
        } else {
            if (inputs[20] < -22.658298) {
                var242 = 0.052503493;
            } else {
                var242 = 0.010876963;
            }
        }
    } else {
        if (inputs[20] >= -21.807373) {
            if (inputs[16] < -1.8129214) {
                var242 = -0.02833204;
            } else {
                var242 = 0.0022716192;
            }
        } else {
            var242 = -0.040993042;
        }
    }
    double var243;
    if (inputs[16] < 0.9628601) {
        if (inputs[13] < 1.0125611) {
            if (inputs[21] < 2.5416667) {
                var243 = 0.0026332226;
            } else {
                var243 = -0.040848244;
            }
        } else {
            if (inputs[7] < 3.7) {
                var243 = 0.018483741;
            } else {
                var243 = -0.0016176716;
            }
        }
    } else {
        if (inputs[6] < 2335.47) {
            if (inputs[16] < 1.3456331) {
                var243 = 0.02122886;
            } else {
                var243 = -0.019249965;
            }
        } else {
            if (inputs[7] < 4.165) {
                var243 = 0.03891139;
            } else {
                var243 = 0.020584526;
            }
        }
    }
    double var244;
    if (inputs[1] < 77.52381) {
        if (inputs[1] < 67.27849) {
            if (inputs[10] < -1.22) {
                var244 = 0.020478463;
            } else {
                var244 = -0.012056625;
            }
        } else {
            if (inputs[22] < 7.0) {
                var244 = -0.009286798;
            } else {
                var244 = 0.029546212;
            }
        }
    } else {
        var244 = -0.03591473;
    }
    double var245;
    if (inputs[21] < 2.0272868) {
        if (inputs[21] < 1.8488603) {
            if (inputs[2] < 2.2871428) {
                var245 = -0.013780392;
            } else {
                var245 = 0.011949103;
            }
        } else {
            var245 = 0.03901043;
        }
    } else {
        if (inputs[13] < 0.8593393) {
            var245 = 0.017112106;
        } else {
            if (inputs[20] >= -15.703836) {
                var245 = -0.015809942;
            } else {
                var245 = 0.0028742482;
            }
        }
    }
    double var246;
    if (inputs[2] < 1.5314286) {
        if (inputs[10] < 1.038) {
            if (inputs[10] < 0.897) {
                var246 = 0.008935926;
            } else {
                var246 = -0.030246539;
            }
        } else {
            var246 = 0.030013936;
        }
    } else {
        if (inputs[10] < 0.635) {
            if (inputs[13] < 1.3489907) {
                var246 = -0.047286987;
            } else {
                var246 = -0.0106175635;
            }
        } else {
            if (inputs[22] < 15.0) {
                var246 = -0.015392317;
            } else {
                var246 = 0.03733839;
            }
        }
    }
    double var247;
    if (inputs[2] < 1.1542857) {
        if (inputs[14] < 1.2708536) {
            var247 = -0.01177938;
        } else {
            if (inputs[2] < 1.0621428) {
                var247 = 0.015700357;
            } else {
                var247 = 0.046623096;
            }
        }
    } else {
        if (inputs[2] < 1.3178571) {
            if (inputs[19] >= 36.69818) {
                var247 = -0.008683015;
            } else {
                var247 = -0.05564344;
            }
        } else {
            if (inputs[17] < 2.5826688) {
                var247 = -0.010338396;
            } else {
                var247 = 0.018724762;
            }
        }
    }
    double var248;
    if (inputs[19] < 65.74466) {
        if (inputs[17] < -1.401626) {
            if (inputs[9] < 0.15) {
                var248 = -0.016425576;
            } else {
                var248 = -0.05306431;
            }
        } else {
            if (inputs[7] < 4.175) {
                var248 = 0.02386616;
            } else {
                var248 = -0.013925503;
            }
        }
    } else {
        if (inputs[20] < -20.9877) {
            if (inputs[20] < -25.507826) {
                var248 = 0.013727977;
            } else {
                var248 = 0.043052528;
            }
        } else {
            if (inputs[4] < 2039.15) {
                var248 = -0.01909852;
            } else {
                var248 = 0.0072120866;
            }
        }
    }
    double var249;
    if (inputs[8] < 0.385) {
        if (inputs[16] < -0.33813643) {
            var249 = -0.005489262;
        } else {
            var249 = -0.035402134;
        }
    } else {
        if (inputs[17] < -3.5866337) {
            var249 = 0.032934874;
        } else {
            if (inputs[21] < 2.869159) {
                var249 = 0.009323571;
            } else {
                var249 = -0.010439769;
            }
        }
    }
    double var250;
    if (inputs[16] < -1.5798271) {
        if (inputs[16] < -1.8126473) {
            var250 = 0.0032563563;
        } else {
            var250 = 0.0444252;
        }
    } else {
        if (inputs[15] < 1.6751665) {
            if (inputs[2] < 1.8357143) {
                var250 = -0.00050136476;
            } else {
                var250 = -0.04649631;
            }
        } else {
            if (inputs[6] < 2430.255) {
                var250 = 0.003554026;
            } else {
                var250 = 0.030592091;
            }
        }
    }
    double var251;
    if (inputs[6] < 2032.93) {
        if (inputs[11] < 0.3332121) {
            var251 = -0.04460121;
        } else {
            var251 = 0.017848717;
        }
    } else {
        if (inputs[16] < 0.9628601) {
            if (inputs[11] < 0.46412122) {
                var251 = 0.0026452115;
            } else {
                var251 = -0.019183842;
            }
        } else {
            if (inputs[19] < 65.74466) {
                var251 = -0.009737483;
            } else {
                var251 = 0.028289203;
            }
        }
    }
    double var252;
    if (inputs[20] >= 28.236462) {
        var252 = 0.027947567;
    } else {
        if (inputs[13] < 3.6682508) {
            if (inputs[13] < 2.499499) {
                var252 = -0.006367635;
            } else {
                var252 = -0.0532242;
            }
        } else {
            var252 = 0.024925107;
        }
    }
    double var253;
    if (inputs[22] < 2.0) {
        var253 = 0.03378888;
    } else {
        if (inputs[7] < 2.125) {
            if (inputs[14] < 1.5131543) {
                var253 = -0.03809236;
            } else {
                var253 = 0.0016636993;
            }
        } else {
            if (inputs[19] < 37.96602) {
                var253 = 0.020727638;
            } else {
                var253 = -0.0047067394;
            }
        }
    }
    double var254;
    if (inputs[13] < 0.8233444) {
        var254 = 0.03930646;
    } else {
        if (inputs[16] < -0.30762097) {
            if (inputs[7] < 2.725) {
                var254 = 0.04787981;
            } else {
                var254 = -0.0007515829;
            }
        } else {
            if (inputs[16] < 0.38465208) {
                var254 = -0.03046638;
            } else {
                var254 = 0.0018177636;
            }
        }
    }
    double var255;
    if (inputs[20] < 16.29137) {
        if (inputs[7] < 9.785) {
            if (inputs[4] < 2375.81) {
                var255 = 0.017738316;
            } else {
                var255 = 0.00005848301;
            }
        } else {
            var255 = -0.031660896;
        }
    } else {
        if (inputs[10] < 1.435) {
            if (inputs[14] < 1.3980948) {
                var255 = -0.0009379009;
            } else {
                var255 = -0.035624348;
            }
        } else {
            var255 = 0.032522205;
        }
    }
    double var256;
    if (inputs[17] < -3.6193895) {
        var256 = 0.028014256;
    } else {
        if (inputs[14] < 2.340248) {
            if (inputs[2] < 1.3821429) {
                var256 = -0.014304991;
            } else {
                var256 = 0.0067913304;
            }
        } else {
            var256 = -0.030656017;
        }
    }
    double var257;
    if (inputs[19] < 26.237036) {
        var257 = 0.028148398;
    } else {
        if (inputs[22] < 10.0) {
            if (inputs[19] >= 92.78799) {
                var257 = -0.027672376;
            } else {
                var257 = 0.0069384533;
            }
        } else {
            if (inputs[15] < 2.182948) {
                var257 = -0.027453775;
            } else {
                var257 = 0.008829976;
            }
        }
    }
    double var258;
    if (inputs[14] < 2.7742078) {
        if (inputs[22] < 12.0) {
            if (inputs[8] < 4.41) {
                var258 = 0.014628389;
            } else {
                var258 = -0.027591344;
            }
        } else {
            if (inputs[12] < 0.17763157) {
                var258 = -0.023882017;
            } else {
                var258 = 0.021417458;
            }
        }
    } else {
        var258 = 0.03706623;
    }
    double var259;
    if (inputs[17] < 3.2565002) {
        if (inputs[17] < 2.587775) {
            if (inputs[17] < 2.0185497) {
                var259 = 0.009579151;
            } else {
                var259 = -0.021211276;
            }
        } else {
            if (inputs[16] < -0.30762097) {
                var259 = 0.046648476;
            } else {
                var259 = 0.0028703343;
            }
        }
    } else {
        if (inputs[13] < 1.2357508) {
            var259 = 0.0014659466;
        } else {
            var259 = -0.03572059;
        }
    }
    double var260;
    if (inputs[13] < 2.1668594) {
        if (inputs[14] < 1.806317) {
            if (inputs[11] < -0.37854546) {
                var260 = 0.02210171;
            } else {
                var260 = 0.0008212242;
            }
        } else {
            if (inputs[11] < 0.5476364) {
                var260 = -0.042124644;
            } else {
                var260 = 0.010418428;
            }
        }
    } else {
        if (inputs[13] < 2.9797692) {
            var260 = 0.046986066;
        } else {
            var260 = -0.0041819587;
        }
    }
    double var261;
    if (inputs[14] < 1.9839809) {
        if (inputs[8] < 1.165) {
            if (inputs[14] < 1.6144724) {
                var261 = 0.0066776057;
            } else {
                var261 = 0.035782024;
            }
        } else {
            if (inputs[16] < -1.1683838) {
                var261 = 0.01631542;
            } else {
                var261 = -0.008786381;
            }
        }
    } else {
        if (inputs[15] < 2.712575) {
            if (inputs[21] < 2.5035655) {
                var261 = -0.051054716;
            } else {
                var261 = -0.030960314;
            }
        } else {
            if (inputs[16] < 0.09629683) {
                var261 = -0.013476267;
            } else {
                var261 = 0.03021506;
            }
        }
    }
    double var262;
    if (inputs[21] < 4.5588236) {
        if (inputs[2] < 1.2814286) {
            if (inputs[21] < 3.3090909) {
                var262 = -0.005098306;
            } else {
                var262 = -0.03161116;
            }
        } else {
            if (inputs[21] < 2.562963) {
                var262 = -0.008719382;
            } else {
                var262 = 0.010284756;
            }
        }
    } else {
        var262 = 0.02808548;
    }
    double var263;
    if (inputs[10] < -0.522) {
        if (inputs[19] < 84.80466) {
            if (inputs[4] < 2396.065) {
                var263 = -0.04592237;
            } else {
                var263 = 0.0030642024;
            }
        } else {
            if (inputs[4] < 2312.885) {
                var263 = -0.009433377;
            } else {
                var263 = 0.0365577;
            }
        }
    } else {
        if (inputs[8] < 1.1875) {
            if (inputs[7] < 2.585) {
                var263 = 0.0008794245;
            } else {
                var263 = 0.031445164;
            }
        } else {
            if (inputs[8] < 3.9775) {
                var263 = -0.007720814;
            } else {
                var263 = 0.02589352;
            }
        }
    }
    double var264;
    if (inputs[2] < 2.0821428) {
        if (inputs[10] < 0.811) {
            if (inputs[19] >= 82.71136) {
                var264 = 0.03350952;
            } else {
                var264 = 0.0039365357;
            }
        } else {
            if (inputs[10] < 1.013) {
                var264 = -0.027025148;
            } else {
                var264 = 0.009563996;
            }
        }
    } else {
        if (inputs[1] < 35.615753) {
            var264 = -0.05325523;
        } else {
            if (inputs[20] < 3.160715) {
                var264 = 0.02923115;
            } else {
                var264 = -0.033095814;
            }
        }
    }
    double var265;
    if (inputs[7] < 1.44) {
        var265 = -0.031605553;
    } else {
        if (inputs[15] < 1.4852071) {
            if (inputs[17] < -3.5260804) {
                var265 = 0.04602996;
            } else {
                var265 = 0.0076178773;
            }
        } else {
            if (inputs[15] < 1.7318975) {
                var265 = -0.031438075;
            } else {
                var265 = 0.0052550635;
            }
        }
    }
    double var266;
    if (inputs[1] < 77.52381) {
        if (inputs[1] < 74.97299) {
            if (inputs[8] < 0.475) {
                var266 = -0.020188643;
            } else {
                var266 = 0.0030211904;
            }
        } else {
            var266 = 0.035789587;
        }
    } else {
        var266 = -0.033010576;
    }
    double var267;
    if (inputs[22] < 4.0) {
        if (inputs[17] < 2.729656) {
            if (inputs[10] < -0.81) {
                var267 = 0.03568854;
            } else {
                var267 = -0.0152171375;
            }
        } else {
            var267 = 0.038556736;
        }
    } else {
        if (inputs[11] < -0.40060607) {
            if (inputs[2] < 2.337143) {
                var267 = -0.03898569;
            } else {
                var267 = 0.012797414;
            }
        } else {
            if (inputs[3] < 2039.28) {
                var267 = -0.020644903;
            } else {
                var267 = 0.006214613;
            }
        }
    }
    double var268;
    if (inputs[11] < -0.5714545) {
        var268 = -0.032271463;
    } else {
        if (inputs[8] < 0.8) {
            if (inputs[7] < 3.675) {
                var268 = 0.006277212;
            } else {
                var268 = 0.04656591;
            }
        } else {
            if (inputs[7] < 2.78) {
                var268 = 0.025260853;
            } else {
                var268 = -0.0036319345;
            }
        }
    }
    double var269;
    if (inputs[1] < 61.819904) {
        if (inputs[2] < 1.3821429) {
            if (inputs[17] < -3.0335448) {
                var269 = 0.0066002905;
            } else {
                var269 = -0.044494744;
            }
        } else {
            if (inputs[11] < -0.5559394) {
                var269 = -0.0089221075;
            } else {
                var269 = 0.029233566;
            }
        }
    } else {
        if (inputs[12] < 0.04374436) {
            var269 = -0.03793354;
        } else {
            if (inputs[7] < 6.985) {
                var269 = 0.0039067063;
            } else {
                var269 = -0.033573303;
            }
        }
    }
    double var270;
    if (inputs[2] < 2.337143) {
        if (inputs[2] < 2.07) {
            if (inputs[5] < 2409.485) {
                var270 = 0.0051501114;
            } else {
                var270 = -0.017213462;
            }
        } else {
            var270 = -0.044596657;
        }
    } else {
        if (inputs[8] < 4.61) {
            var270 = 0.04997116;
        } else {
            var270 = 0.007967561;
        }
    }
    double var271;
    var271 = sigmoid_XGBoost(var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29 + var30 + var31 + var32 + var33 + var34 + var35 + var36 + var37 + var38 + var39 + var40 + var41 + var42 + var43 + var44 + var45 + var46 + var47 + var48 + var49 + var50 + var51 + var52 + var53 + var54 + var55 + var56 + var57 + var58 + var59 + var60 + var61 + var62 + var63 + var64 + var65 + var66 + var67 + var68 + var69 + var70 + var71 + var72 + var73 + var74 + var75 + var76 + var77 + var78 + var79 + var80 + var81 + var82 + var83 + var84 + var85 + var86 + var87 + var88 + var89 + var90 + var91 + var92 + var93 + var94 + var95 + var96 + var97 + var98 + var99 + var100 + var101 + var102 + var103 + var104 + var105 + var106 + var107 + var108 + var109 + var110 + var111 + var112 + var113 + var114 + var115 + var116 + var117 + var118 + var119 + var120 + var121 + var122 + var123 + var124 + var125 + var126 + var127 + var128 + var129 + var130 + var131 + var132 + var133 + var134 + var135 + var136 + var137 + var138 + var139 + var140 + var141 + var142 + var143 + var144 + var145 + var146 + var147 + var148 + var149 + var150 + var151 + var152 + var153 + var154 + var155 + var156 + var157 + var158 + var159 + var160 + var161 + var162 + var163 + var164 + var165 + var166 + var167 + var168 + var169 + var170 + var171 + var172 + var173 + var174 + var175 + var176 + var177 + var178 + var179 + var180 + var181 + var182 + var183 + var184 + var185 + var186 + var187 + var188 + var189 + var190 + var191 + var192 + var193 + var194 + var195 + var196 + var197 + var198 + var199 + var200 + var201 + var202 + var203 + var204 + var205 + var206 + var207 + var208 + var209 + var210 + var211 + var212 + var213 + var214 + var215 + var216 + var217 + var218 + var219 + var220 + var221 + var222 + var223 + var224 + var225 + var226 + var227 + var228 + var229 + var230 + var231 + var232 + var233 + var234 + var235 + var236 + var237 + var238 + var239 + var240 + var241 + var242 + var243 + var244 + var245 + var246 + var247 + var248 + var249 + var250 + var251 + var252 + var253 + var254 + var255 + var256 + var257 + var258 + var259 + var260 + var261 + var262 + var263 + var264 + var265 + var266 + var267 + var268 + var269 + var270);
    output[0] = 1.0 - var271; // Probabilité de la classe 0
    output[1] = var271;       // Probabilité de la classe 1
}


// --- Fonction Wrapper pour une utilisation simple dans MQL5 ---
// Retourne la probabilité de la classe 'Gagnant' (classe 1)
double XGBoost_Predict(const double &features[])
{
   double prediction[2]; // Sortie pour la classe 0 et la classe 1
   xgboost_score(features, prediction);
   return prediction[1]; // Retourne la probabilité de la classe 1 (Gagnant)
}
