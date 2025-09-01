//+------------------------------------------------------------------+
//|   XGBoost Predictor for MQL5
//|   Généré par un script Python en utilisant m2cgen
//+------------------------------------------------------------------+
#property strict

// --- Seuil optimal trouvé pendant l'entraînement (basé sur des contraintes de performance: fréquence et précision)
const double BEST_THRESHOLD = 0.510000;

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
    if (inputs[9] < 2.41) {
        if (inputs[10] < 0.455) {
            var0 = -0.009194021;
        } else {
            if (inputs[9] < 1.345) {
                var0 = 0.0065357857;
            } else {
                var0 = 0.065606974;
            }
        }
    } else {
        if (inputs[25] < 2.5714285) {
            if (inputs[5] < 1743.4775) {
                var0 = -0.034770265;
            } else {
                if (inputs[15] < -0.65672725) {
                    var0 = 0.0527896;
                } else {
                    if (inputs[2] < 1.7892857) {
                        if (inputs[26] < 30.682907) {
                            if (inputs[26] < 28.03674) {
                                if (inputs[29] < 1.71) {
                                    var0 = 0.03693448;
                                } else {
                                    var0 = -0.014147854;
                                }
                            } else {
                                var0 = 0.07468661;
                            }
                        } else {
                            if (inputs[19] < 1.3612994) {
                                var0 = -0.05926335;
                            } else {
                                if (inputs[17] < 1.2256917) {
                                    var0 = 0.060864586;
                                } else {
                                    var0 = -0.032453146;
                                }
                            }
                        }
                    } else {
                        if (inputs[18] < 1.6465126) {
                            var0 = -0.061691407;
                        } else {
                            if (inputs[17] < 1.6942372) {
                                var0 = 0.033869658;
                            } else {
                                var0 = -0.018898966;
                            }
                        }
                    }
                }
            }
        } else {
            if (inputs[13] < 1813.96) {
                var0 = 0.0000447856;
            } else {
                if (inputs[9] < 4.4775) {
                    var0 = -0.017922193;
                } else {
                    var0 = -0.09074982;
                }
            }
        }
    }
    double var1;
    if (inputs[2] < 1.7892857) {
        if (inputs[28] < 35.46188) {
            if (inputs[28] < 8.38395) {
                if (inputs[20] < -0.4338425) {
                    var1 = 0.030931873;
                } else {
                    var1 = -0.076157846;
                }
            } else {
                if (inputs[18] < 1.3965604) {
                    if (inputs[15] < -0.26) {
                        var1 = 0.04700377;
                    } else {
                        if (inputs[35] < 2.7870371) {
                            var1 = -0.043896925;
                        } else {
                            if (inputs[25] < 2.501661) {
                                var1 = 0.0;
                            } else {
                                var1 = 0.03634886;
                            }
                        }
                    }
                } else {
                    if (inputs[13] < 1790.73) {
                        var1 = 0.008504664;
                    } else {
                        if (inputs[33] < 0.8127964) {
                            var1 = 0.045504477;
                        } else {
                            var1 = 0.08256466;
                        }
                    }
                }
            }
        } else {
            if (inputs[32] < -3.68) {
                var1 = 0.009193189;
            } else {
                var1 = -0.058159042;
            }
        }
    } else {
        if (inputs[1] < 64.07634) {
            if (inputs[18] < 2.7831962) {
                if (inputs[35] < -3.6360986) {
                    var1 = -0.061976157;
                } else {
                    if (inputs[33] < 1.2886482) {
                        if (inputs[16] < -0.04826316) {
                            var1 = 0.044227626;
                        } else {
                            var1 = -0.006113448;
                        }
                    } else {
                        if (inputs[32] < 0.245) {
                            var1 = 0.0;
                        } else {
                            var1 = -0.07008951;
                        }
                    }
                }
            } else {
                var1 = 0.03564165;
            }
        } else {
            if (inputs[16] < 0.32516542) {
                var1 = -0.1075725;
            } else {
                var1 = -0.01982567;
            }
        }
    }
    double var2;
    if (inputs[28] < 35.46188) {
        if (inputs[20] < 0.08772628) {
            if (inputs[25] < 2.5521367) {
                if (inputs[25] < 2.502924) {
                    if (inputs[25] < 2.4555256) {
                        if (inputs[11] < 0.33) {
                            var2 = 0.069232464;
                        } else {
                            var2 = 0.0;
                        }
                    } else {
                        if (inputs[20] < -0.467186) {
                            var2 = -0.032369718;
                        } else {
                            var2 = 0.02273507;
                        }
                    }
                } else {
                    if (inputs[21] < 2.4983552) {
                        var2 = 0.01560621;
                    } else {
                        var2 = 0.09461322;
                    }
                }
            } else {
                if (inputs[9] < 3.2025) {
                    var2 = 0.035309933;
                } else {
                    var2 = -0.058752865;
                }
            }
        } else {
            if (inputs[16] < 0.14369173) {
                if (inputs[9] < 5.58) {
                    if (inputs[31] < 0.75) {
                        if (inputs[36] < -3.7361963) {
                            var2 = 0.038661536;
                        } else {
                            var2 = -0.02262939;
                        }
                    } else {
                        var2 = 0.05223237;
                    }
                } else {
                    if (inputs[24] < -15.665431) {
                        var2 = 0.0076728617;
                    } else {
                        var2 = -0.06209579;
                    }
                }
            } else {
                if (inputs[33] < 1.2019886) {
                    var2 = -0.081462234;
                } else {
                    var2 = 0.012203698;
                }
            }
        }
    } else {
        if (inputs[32] < -8.575) {
            var2 = 0.0;
        } else {
            if (inputs[18] < 1.4247512) {
                var2 = -0.029790504;
            } else {
                var2 = -0.08615241;
            }
        }
    }
    double var3;
    if (inputs[11] < 0.41) {
        if (inputs[18] < 1.5769857) {
            if (inputs[31] < 10.48) {
                if (inputs[33] < 0.6929307) {
                    if (inputs[31] < -0.725) {
                        var3 = 0.030136328;
                    } else {
                        var3 = -0.04529534;
                    }
                } else {
                    if (inputs[31] < -0.52) {
                        if (inputs[3] < 1830.78) {
                            var3 = -0.04050019;
                        } else {
                            var3 = -0.09794818;
                        }
                    } else {
                        var3 = -0.016650744;
                    }
                }
            } else {
                var3 = 0.021596706;
            }
        } else {
            if (inputs[3] < 1747.695) {
                var3 = -0.05132003;
            } else {
                if (inputs[19] < 2.0873559) {
                    if (inputs[32] < -0.245) {
                        if (inputs[19] < 1.7002832) {
                            var3 = 0.016959323;
                        } else {
                            var3 = 0.08970064;
                        }
                    } else {
                        if (inputs[17] < 1.4588708) {
                            var3 = 0.021183968;
                        } else {
                            var3 = -0.00061036483;
                        }
                    }
                } else {
                    if (inputs[1] < 29.151648) {
                        var3 = -0.047875956;
                    } else {
                        if (inputs[14] < -1.047) {
                            var3 = 0.053176854;
                        } else {
                            if (inputs[16] < 0.34789473) {
                                var3 = -0.04301042;
                            } else {
                                var3 = 0.02394667;
                            }
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[33] < 0.95654136) {
            if (inputs[13] < 1823.34) {
                var3 = 0.07310153;
            } else {
                if (inputs[19] < 1.2584518) {
                    var3 = -0.005189287;
                } else {
                    var3 = 0.046722937;
                }
            }
        } else {
            var3 = -0.031783413;
        }
    }
    double var4;
    if (inputs[1] < 31.394823) {
        if (inputs[23] < -14.959898) {
            if (inputs[26] < 32.414757) {
                var4 = 0.0;
            } else {
                var4 = -0.069334894;
            }
        } else {
            if (inputs[1] < 26.410332) {
                var4 = 0.039442454;
            } else {
                var4 = -0.030014949;
            }
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[37] < -4.755) {
                if (inputs[28] < 29.487696) {
                    var4 = -0.02479119;
                } else {
                    var4 = 0.039873935;
                }
            } else {
                if (inputs[2] < 2.0564287) {
                    if (inputs[15] < -0.3949697) {
                        var4 = 0.042573683;
                    } else {
                        var4 = 0.09001858;
                    }
                } else {
                    var4 = 0.015532956;
                }
            }
        } else {
            if (inputs[32] < -15.815) {
                var4 = 0.04519686;
            } else {
                if (inputs[20] < 0.07766806) {
                    if (inputs[2] < 1.6992857) {
                        if (inputs[37] < 2.525) {
                            var4 = -0.0014355644;
                        } else {
                            if (inputs[9] < 5.2675) {
                                var4 = 0.0073750205;
                            } else {
                                var4 = 0.07367335;
                            }
                        }
                    } else {
                        if (inputs[20] < -0.8543823) {
                            var4 = -0.06778188;
                        } else {
                            var4 = 0.000638432;
                        }
                    }
                } else {
                    if (inputs[16] < 0.14027068) {
                        var4 = 0.0;
                    } else {
                        if (inputs[9] < 3.8825) {
                            var4 = -0.08762504;
                        } else {
                            var4 = -0.017984562;
                        }
                    }
                }
            }
        }
    }
    double var5;
    if (inputs[11] < 0.4) {
        if (inputs[18] < 1.3142484) {
            if (inputs[33] < 0.69918364) {
                var5 = 0.0;
            } else {
                if (inputs[9] < 5.0125) {
                    var5 = -0.094138555;
                } else {
                    var5 = -0.04111072;
                }
            }
        } else {
            if (inputs[28] < 35.46188) {
                if (inputs[25] < 2.4570503) {
                    if (inputs[18] < 2.065385) {
                        if (inputs[31] < 4.97) {
                            var5 = 0.031070288;
                        } else {
                            var5 = 0.07668462;
                        }
                    } else {
                        var5 = 0.0;
                    }
                } else {
                    if (inputs[5] < 1813.395) {
                        if (inputs[29] < 1.78) {
                            var5 = -0.054945517;
                        } else {
                            var5 = -0.0031343305;
                        }
                    } else {
                        if (inputs[10] < 1.31) {
                            if (inputs[25] < 2.5106888) {
                                var5 = 0.06491244;
                            } else {
                                var5 = 0.0069762175;
                            }
                        } else {
                            if (inputs[10] < 5.32) {
                                if (inputs[19] < 1.9347545) {
                                    var5 = 0.0;
                                } else {
                                    var5 = -0.05601083;
                                }
                            } else {
                                var5 = 0.032020986;
                            }
                        }
                    }
                }
            } else {
                if (inputs[36] < -4.8136387) {
                    var5 = 0.003176341;
                } else {
                    var5 = -0.05791951;
                }
            }
        }
    } else {
        if (inputs[2] < 1.7321428) {
            if (inputs[33] < 0.6810088) {
                if (inputs[10] < 1.355) {
                    var5 = -0.030275859;
                } else {
                    var5 = 0.04663141;
                }
            } else {
                if (inputs[27] < 16.48461) {
                    var5 = 0.00544283;
                } else {
                    if (inputs[26] < 24.675793) {
                        var5 = 0.094760716;
                    } else {
                        var5 = 0.047523603;
                    }
                }
            }
        } else {
            var5 = -0.021947678;
        }
    }
    double var6;
    if (inputs[2] < 1.7742857) {
        if (inputs[29] < 3.46) {
            if (inputs[9] < 6.19) {
                if (inputs[37] < 14.24) {
                    if (inputs[34] < -2.4153645) {
                        if (inputs[23] < -14.781945) {
                            var6 = -0.04644712;
                        } else {
                            var6 = 0.025894037;
                        }
                    } else {
                        if (inputs[38] < 14.0) {
                            if (inputs[38] < 9.0) {
                                var6 = 0.013000653;
                            } else {
                                if (inputs[26] < 29.135965) {
                                    var6 = 0.10294889;
                                } else {
                                    var6 = 0.029427312;
                                }
                            }
                        } else {
                            if (inputs[36] < 1.7770793) {
                                var6 = -0.04386146;
                            } else {
                                var6 = 0.017128652;
                            }
                        }
                    }
                } else {
                    var6 = -0.031766094;
                }
            } else {
                if (inputs[20] < -0.31441432) {
                    var6 = 0.012461541;
                } else {
                    var6 = -0.05734933;
                }
            }
        } else {
            var6 = 0.047349464;
        }
    } else {
        if (inputs[18] < 1.4627376) {
            var6 = -0.06439306;
        } else {
            if (inputs[1] < 36.823784) {
                if (inputs[1] < 30.98911) {
                    var6 = -0.021528013;
                } else {
                    var6 = 0.05409286;
                }
            } else {
                if (inputs[10] < 5.32) {
                    if (inputs[32] < -3.42) {
                        var6 = -0.06880671;
                    } else {
                        if (inputs[31] < 10.48) {
                            var6 = 0.009250731;
                        } else {
                            var6 = -0.051294852;
                        }
                    }
                } else {
                    var6 = 0.015643565;
                }
            }
        }
    }
    double var7;
    if (inputs[32] < -16.28) {
        if (inputs[11] < 0.35) {
            var7 = 0.0;
        } else {
            if (inputs[21] < -2.3432963) {
                var7 = 0.03148625;
            } else {
                var7 = 0.08024859;
            }
        }
    } else {
        if (inputs[32] < -14.035) {
            var7 = -0.05812569;
        } else {
            if (inputs[2] < 1.7892857) {
                if (inputs[26] < 29.357567) {
                    if (inputs[38] < 12.0) {
                        if (inputs[38] < 9.0) {
                            var7 = 0.014193151;
                        } else {
                            var7 = 0.08341155;
                        }
                    } else {
                        if (inputs[27] < 28.661074) {
                            var7 = -0.020485625;
                        } else {
                            var7 = 0.034145933;
                        }
                    }
                } else {
                    if (inputs[13] < 1854.9) {
                        if (inputs[13] < 1809.92) {
                            if (inputs[13] < 1779.82) {
                                var7 = -0.033933084;
                            } else {
                                var7 = 0.032389343;
                            }
                        } else {
                            var7 = -0.065514565;
                        }
                    } else {
                        if (inputs[20] < -0.5909319) {
                            var7 = 0.061989646;
                        } else {
                            var7 = 0.0;
                        }
                    }
                }
            } else {
                if (inputs[33] < 1.0376403) {
                    var7 = -0.06588202;
                } else {
                    if (inputs[23] < -14.959898) {
                        if (inputs[16] < -0.1188797) {
                            var7 = -0.07743113;
                        } else {
                            var7 = 0.0;
                        }
                    } else {
                        if (inputs[33] < 1.2360153) {
                            var7 = -0.03132098;
                        } else {
                            if (inputs[21] < -1.82769) {
                                var7 = 0.07791141;
                            } else {
                                if (inputs[31] < 11.81) {
                                    var7 = -0.02473932;
                                } else {
                                    var7 = 0.038844597;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var8;
    if (inputs[32] < -16.28) {
        if (inputs[37] < -16.39) {
            if (inputs[26] < 31.036274) {
                var8 = 0.031328455;
            } else {
                var8 = -0.015948974;
            }
        } else {
            var8 = 0.063398145;
        }
    } else {
        if (inputs[21] < -3.8397932) {
            var8 = 0.03919662;
        } else {
            if (inputs[8] < 1857.38) {
                if (inputs[29] < 2.8375) {
                    if (inputs[34] < 3.028165) {
                        if (inputs[18] < 1.1529632) {
                            var8 = -0.00019109482;
                        } else {
                            if (inputs[16] < 0.14027068) {
                                if (inputs[17] < 1.5857617) {
                                    if (inputs[17] < 1.1247827) {
                                        var8 = -0.012830511;
                                    } else {
                                        var8 = -0.08006128;
                                    }
                                } else {
                                    var8 = -0.0003828755;
                                }
                            } else {
                                var8 = -0.08360167;
                            }
                        }
                    } else {
                        var8 = 0.012292064;
                    }
                } else {
                    var8 = 0.022506993;
                }
            } else {
                if (inputs[5] < 1912.735) {
                    if (inputs[31] < 11.485) {
                        var8 = 0.0;
                    } else {
                        var8 = 0.06924576;
                    }
                } else {
                    if (inputs[14] < -0.761) {
                        if (inputs[17] < 1.493846) {
                            var8 = 0.04652074;
                        } else {
                            var8 = 0.0;
                        }
                    } else {
                        if (inputs[21] < 1.4763844) {
                            var8 = -0.07229067;
                        } else {
                            if (inputs[36] < 2.6466432) {
                                var8 = 0.026949802;
                            } else {
                                var8 = -0.027019585;
                            }
                        }
                    }
                }
            }
        }
    }
    double var9;
    if (inputs[15] < 0.34339395) {
        if (inputs[24] < -21.930618) {
            if (inputs[25] < 2.4325154) {
                var9 = 0.06257866;
            } else {
                if (inputs[24] < -26.250332) {
                    var9 = -0.027417367;
                } else {
                    var9 = 0.007827488;
                }
            }
        } else {
            if (inputs[32] < -23.685) {
                var9 = 0.041440107;
            } else {
                if (inputs[13] < 1771.25) {
                    if (inputs[37] < -4.26) {
                        var9 = -0.0884165;
                    } else {
                        var9 = -0.024204098;
                    }
                } else {
                    if (inputs[9] < 6.355) {
                        if (inputs[10] < 0.835) {
                            if (inputs[19] < 1.3612994) {
                                var9 = 0.0;
                            } else {
                                var9 = -0.051532965;
                            }
                        } else {
                            if (inputs[38] < 10.0) {
                                var9 = -0.015697965;
                            } else {
                                if (inputs[2] < 1.6878572) {
                                    var9 = 0.048610058;
                                } else {
                                    var9 = 0.0;
                                }
                            }
                        }
                    } else {
                        if (inputs[32] < -6.975) {
                            var9 = 0.0;
                        } else {
                            var9 = -0.072763324;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 69.51098) {
            if (inputs[20] < -0.96003604) {
                var9 = -0.03407976;
            } else {
                if (inputs[36] < 2.084809) {
                    var9 = 0.02065995;
                } else {
                    var9 = 0.078449465;
                }
            }
        } else {
            if (inputs[20] < 0.27996138) {
                if (inputs[31] < 6.635) {
                    var9 = 0.034333583;
                } else {
                    var9 = -0.01217032;
                }
            } else {
                var9 = -0.049026;
            }
        }
    }
    double var10;
    if (inputs[25] < 2.4555256) {
        if (inputs[9] < 6.8425) {
            if (inputs[20] < 0.7295222) {
                if (inputs[34] < 2.2002673) {
                    if (inputs[15] < -0.2869091) {
                        var10 = 0.024970276;
                    } else {
                        var10 = -0.047365125;
                    }
                } else {
                    var10 = 0.054022845;
                }
            } else {
                var10 = 0.05465449;
            }
        } else {
            if (inputs[20] < 0.1593122) {
                var10 = 0.037155706;
            } else {
                var10 = -0.04410354;
            }
        }
    } else {
        if (inputs[25] < 2.4968016) {
            if (inputs[29] < 1.395) {
                var10 = 0.0;
            } else {
                if (inputs[23] < -23.777779) {
                    var10 = -0.027082775;
                } else {
                    var10 = -0.06612323;
                }
            }
        } else {
            if (inputs[16] < -0.11348872) {
                if (inputs[23] < -19.934069) {
                    var10 = -0.047667712;
                } else {
                    if (inputs[15] < -0.4269697) {
                        var10 = 0.022774832;
                    } else {
                        var10 = -0.030582909;
                    }
                }
            } else {
                if (inputs[25] < 2.5004191) {
                    var10 = 0.053164516;
                } else {
                    if (inputs[25] < 2.502538) {
                        var10 = -0.06336799;
                    } else {
                        if (inputs[25] < 2.5543478) {
                            if (inputs[20] < 0.11991072) {
                                if (inputs[24] < 15.588893) {
                                    var10 = 0.040099964;
                                } else {
                                    var10 = 0.08401844;
                                }
                            } else {
                                var10 = 0.0;
                            }
                        } else {
                            if (inputs[23] < -31.29938) {
                                var10 = 0.042557556;
                            } else {
                                if (inputs[20] < -0.31441432) {
                                    var10 = -0.069261916;
                                } else {
                                    var10 = 0.004052777;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var11;
    if (inputs[32] < -16.28) {
        if (inputs[11] < 0.35) {
            var11 = 0.0;
        } else {
            var11 = 0.04974043;
        }
    } else {
        if (inputs[6] < 1784.81) {
            if (inputs[19] < 1.4278175) {
                if (inputs[38] < 12.0) {
                    var11 = 0.038943503;
                } else {
                    var11 = -0.011104005;
                }
            } else {
                if (inputs[11] < 0.29) {
                    var11 = -0.027750136;
                } else {
                    var11 = -0.07208519;
                }
            }
        } else {
            if (inputs[18] < 1.3292946) {
                if (inputs[10] < 0.5475) {
                    var11 = 0.0113963075;
                } else {
                    if (inputs[27] < 25.749826) {
                        var11 = -0.0064450493;
                    } else {
                        var11 = -0.0683619;
                    }
                }
            } else {
                if (inputs[25] < 2.5543478) {
                    if (inputs[23] < -14.959898) {
                        if (inputs[35] < -2.5245535) {
                            var11 = -0.05246138;
                        } else {
                            var11 = 0.024386808;
                        }
                    } else {
                        if (inputs[27] < 32.50104) {
                            if (inputs[10] < 2.1525) {
                                if (inputs[27] < 9.5789385) {
                                    var11 = 0.0815964;
                                } else {
                                    if (inputs[1] < 60.31835) {
                                        var11 = 0.0;
                                    } else {
                                        var11 = 0.05656634;
                                    }
                                }
                            } else {
                                if (inputs[10] < 4.695) {
                                    var11 = -0.01093351;
                                } else {
                                    var11 = 0.038159683;
                                }
                            }
                        } else {
                            var11 = -0.021849941;
                        }
                    }
                } else {
                    if (inputs[38] < 12.0) {
                        var11 = 0.015771866;
                    } else {
                        var11 = -0.0447229;
                    }
                }
            }
        }
    }
    double var12;
    if (inputs[8] < 1714.61) {
        var12 = -0.048704043;
    } else {
        if (inputs[32] < -16.28) {
            if (inputs[3] < 1856.815) {
                var12 = 0.056571756;
            } else {
                var12 = -0.00031553692;
            }
        } else {
            if (inputs[10] < 0.09) {
                var12 = 0.041750573;
            } else {
                if (inputs[13] < 1989.05) {
                    if (inputs[15] < 0.4948485) {
                        if (inputs[33] < 1.6324534) {
                            if (inputs[33] < 1.2964483) {
                                if (inputs[27] < 33.96854) {
                                    if (inputs[9] < 5.075) {
                                        var12 = 0.014676711;
                                    } else {
                                        var12 = -0.0154986745;
                                    }
                                } else {
                                    var12 = -0.038183205;
                                }
                            } else {
                                var12 = -0.07039798;
                            }
                        } else {
                            var12 = 0.041506603;
                        }
                    } else {
                        if (inputs[15] < 0.5978182) {
                            var12 = 0.06203628;
                        } else {
                            var12 = -0.0054198387;
                        }
                    }
                } else {
                    var12 = -0.04831116;
                }
            }
        }
    }
    double var13;
    if (inputs[16] < -0.30565414) {
        if (inputs[18] < 2.3902125) {
            var13 = -0.066611946;
        } else {
            var13 = -0.0044618202;
        }
    } else {
        if (inputs[13] < 1989.05) {
            if (inputs[6] < 1934.02) {
                if (inputs[13] < 1908.69) {
                    if (inputs[29] < 3.0) {
                        if (inputs[29] < 1.205) {
                            if (inputs[29] < 0.7525) {
                                if (inputs[20] < 0.41807792) {
                                    if (inputs[14] < 0.614) {
                                        var13 = -0.058994308;
                                    } else {
                                        var13 = 0.002748354;
                                    }
                                } else {
                                    var13 = 0.026587266;
                                }
                            } else {
                                if (inputs[9] < 3.6875) {
                                    var13 = 0.0121221505;
                                } else {
                                    var13 = 0.058194246;
                                }
                            }
                        } else {
                            if (inputs[17] < 1.1424255) {
                                if (inputs[36] < 2.1608894) {
                                    var13 = -0.010182089;
                                } else {
                                    var13 = 0.057202116;
                                }
                            } else {
                                if (inputs[27] < 11.6581) {
                                    var13 = 0.0023415652;
                                } else {
                                    if (inputs[31] < 6.695) {
                                        var13 = -0.0382469;
                                    } else {
                                        var13 = -0.08422518;
                                    }
                                }
                            }
                        }
                    } else {
                        if (inputs[9] < 4.5) {
                            var13 = 0.06149264;
                        } else {
                            var13 = 0.0;
                        }
                    }
                } else {
                    if (inputs[20] < 0.06041935) {
                        var13 = 0.002490783;
                    } else {
                        var13 = -0.070757195;
                    }
                }
            } else {
                if (inputs[18] < 1.4673799) {
                    var13 = 0.002610633;
                } else {
                    var13 = 0.05160559;
                }
            }
        } else {
            var13 = -0.05255059;
        }
    }
    double var14;
    if (inputs[25] < 2.4176931) {
        if (inputs[24] < -21.323767) {
            var14 = 0.061667886;
        } else {
            if (inputs[9] < 6.8425) {
                if (inputs[32] < -2.76) {
                    var14 = 0.04019005;
                } else {
                    var14 = -0.0041196686;
                }
            } else {
                var14 = -0.029904;
            }
        }
    } else {
        if (inputs[1] < 60.559483) {
            if (inputs[24] < -5.0908914) {
                if (inputs[1] < 30.784996) {
                    if (inputs[35] < -4.2995014) {
                        if (inputs[25] < 2.4992867) {
                            var14 = -0.025938684;
                        } else {
                            var14 = 0.017340811;
                        }
                    } else {
                        var14 = -0.08902347;
                    }
                } else {
                    if (inputs[28] < 29.487696) {
                        var14 = -0.019557493;
                    } else {
                        if (inputs[28] < 32.990337) {
                            var14 = 0.057895433;
                        } else {
                            var14 = -0.005512731;
                        }
                    }
                }
            } else {
                var14 = -0.061311595;
            }
        } else {
            if (inputs[20] < 0.89768696) {
                if (inputs[27] < 24.78059) {
                    var14 = 0.06356086;
                } else {
                    if (inputs[16] < 0.124849625) {
                        if (inputs[28] < 11.860701) {
                            var14 = 0.0079200845;
                        } else {
                            var14 = 0.059557583;
                        }
                    } else {
                        if (inputs[21] < 2.5932102) {
                            var14 = -0.054866992;
                        } else {
                            if (inputs[20] < -0.7257052) {
                                var14 = 0.02798484;
                            } else {
                                var14 = -0.015924312;
                            }
                        }
                    }
                }
            } else {
                var14 = -0.03807614;
            }
        }
    }
    double var15;
    if (inputs[32] < -16.28) {
        if (inputs[16] < -0.16199248) {
            var15 = -0.0005771079;
        } else {
            var15 = 0.05153882;
        }
    } else {
        if (inputs[32] < -12.12) {
            var15 = -0.04151394;
        } else {
            if (inputs[14] < 0.64) {
                if (inputs[25] < 2.460972) {
                    if (inputs[15] < -0.29551515) {
                        if (inputs[23] < -16.203466) {
                            var15 = 0.0;
                        } else {
                            var15 = 0.046584453;
                        }
                    } else {
                        var15 = -0.01732557;
                    }
                } else {
                    if (inputs[33] < 0.6929307) {
                        if (inputs[19] < 1.4164727) {
                            var15 = -0.03730855;
                        } else {
                            var15 = 0.048188724;
                        }
                    } else {
                        if (inputs[36] < -1.239904) {
                            if (inputs[38] < 16.0) {
                                var15 = -0.07021915;
                            } else {
                                var15 = -0.027022462;
                            }
                        } else {
                            if (inputs[24] < 7.9506755) {
                                var15 = 0.01979574;
                            } else {
                                var15 = -0.046784814;
                            }
                        }
                    }
                }
            } else {
                if (inputs[14] < 0.684) {
                    var15 = 0.053134717;
                } else {
                    if (inputs[17] < 1.3077706) {
                        var15 = -0.02846684;
                    } else {
                        if (inputs[18] < 1.8948869) {
                            if (inputs[35] < 4.1213017) {
                                var15 = 0.009572669;
                            } else {
                                var15 = 0.0643785;
                            }
                        } else {
                            if (inputs[10] < 1.43) {
                                var15 = 0.010262507;
                            } else {
                                var15 = -0.03971547;
                            }
                        }
                    }
                }
            }
        }
    }
    double var16;
    if (inputs[30] < 0.0) {
        if (inputs[26] < 27.55119) {
            if (inputs[11] < 0.34) {
                var16 = -0.06865686;
            } else {
                if (inputs[18] < 1.2115697) {
                    var16 = 0.014831436;
                } else {
                    var16 = -0.032698806;
                }
            }
        } else {
            if (inputs[26] < 31.036274) {
                var16 = 0.045464333;
            } else {
                if (inputs[23] < -27.1777) {
                    var16 = -0.047787935;
                } else {
                    if (inputs[34] < -2.7808218) {
                        if (inputs[28] < 35.46188) {
                            var16 = 0.05492461;
                        } else {
                            var16 = 0.0;
                        }
                    } else {
                        var16 = -0.021657493;
                    }
                }
            }
        }
    } else {
        if (inputs[32] < -16.28) {
            var16 = 0.07122626;
        } else {
            if (inputs[32] < -9.72) {
                var16 = -0.03608256;
            } else {
                if (inputs[25] < 2.5543478) {
                    if (inputs[20] < 0.07766806) {
                        if (inputs[20] < -1.6472214) {
                            var16 = 0.0;
                        } else {
                            if (inputs[37] < 1.285) {
                                var16 = 0.009519223;
                            } else {
                                if (inputs[11] < 0.33) {
                                    var16 = 0.03735013;
                                } else {
                                    var16 = 0.074735545;
                                }
                            }
                        }
                    } else {
                        if (inputs[36] < 1.5455877) {
                            var16 = 0.039040275;
                        } else {
                            var16 = -0.036625247;
                        }
                    }
                } else {
                    if (inputs[3] < 1844.265) {
                        var16 = -0.045493178;
                    } else {
                        var16 = 0.007595446;
                    }
                }
            }
        }
    }
    double var17;
    if (inputs[6] < 1784.81) {
        if (inputs[29] < 2.655) {
            if (inputs[2] < 1.1414286) {
                var17 = 0.010668698;
            } else {
                if (inputs[14] < 0.733) {
                    var17 = -0.074273445;
                } else {
                    var17 = -0.011372428;
                }
            }
        } else {
            var17 = 0.025281215;
        }
    } else {
        if (inputs[23] < 10.870579) {
            if (inputs[8] < 1945.77) {
                if (inputs[6] < 1913.16) {
                    if (inputs[38] < 6.0) {
                        var17 = -0.02007506;
                    } else {
                        if (inputs[32] < 11.825) {
                            if (inputs[20] < 1.5915768) {
                                if (inputs[18] < 1.8324206) {
                                    if (inputs[20] < -0.11844581) {
                                        var17 = 0.013886419;
                                    } else {
                                        var17 = -0.036045525;
                                    }
                                } else {
                                    if (inputs[10] < 2.195) {
                                        var17 = -0.004709304;
                                    } else {
                                        var17 = 0.054393392;
                                    }
                                }
                            } else {
                                var17 = 0.049441528;
                            }
                        } else {
                            if (inputs[10] < 1.6325) {
                                var17 = 0.067309566;
                            } else {
                                var17 = 0.008816192;
                            }
                        }
                    }
                } else {
                    if (inputs[25] < 2.5014005) {
                        var17 = 0.002010545;
                    } else {
                        var17 = -0.05340352;
                    }
                }
            } else {
                var17 = 0.04387434;
            }
        } else {
            if (inputs[38] < 14.0) {
                var17 = 0.0034005034;
            } else {
                var17 = -0.052176084;
            }
        }
    }
    double var18;
    if (inputs[38] < 17.0) {
        if (inputs[13] < 1844.67) {
            if (inputs[28] < 8.292205) {
                var18 = -0.07124166;
            } else {
                if (inputs[33] < 1.2964483) {
                    if (inputs[34] < -2.4380953) {
                        if (inputs[1] < 26.023777) {
                            var18 = 0.0;
                        } else {
                            var18 = -0.06523362;
                        }
                    } else {
                        if (inputs[5] < 1818.8475) {
                            if (inputs[2] < 1.3678571) {
                                var18 = 0.061097056;
                            } else {
                                var18 = 0.0059103793;
                            }
                        } else {
                            var18 = -0.023125267;
                        }
                    }
                } else {
                    var18 = -0.059732392;
                }
            }
        } else {
            if (inputs[18] < 1.3539162) {
                if (inputs[9] < 4.44) {
                    var18 = 0.011936411;
                } else {
                    var18 = -0.058491744;
                }
            } else {
                if (inputs[17] < 1.1301504) {
                    var18 = 0.070235305;
                } else {
                    if (inputs[13] < 1901.42) {
                        var18 = 0.030423945;
                    } else {
                        if (inputs[26] < 28.585054) {
                            var18 = -0.03597978;
                        } else {
                            if (inputs[5] < 1942.2975) {
                                var18 = -0.013123441;
                            } else {
                                var18 = 0.03002276;
                            }
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[26] < 27.024124) {
            if (inputs[17] < 1.3249604) {
                var18 = 0.013066715;
            } else {
                var18 = -0.032029502;
            }
        } else {
            if (inputs[19] < 1.8262407) {
                var18 = -0.0005204647;
            } else {
                if (inputs[38] < 18.0) {
                    var18 = 0.077744596;
                } else {
                    var18 = 0.017631931;
                }
            }
        }
    }
    double var19;
    if (inputs[31] < 19.76) {
        if (inputs[18] < 0.9764405) {
            var19 = -0.0315764;
        } else {
            if (inputs[29] < 0.4625) {
                if (inputs[25] < 2.463576) {
                    var19 = 0.0664639;
                } else {
                    if (inputs[34] < -1.4662639) {
                        var19 = -0.013919492;
                    } else {
                        var19 = 0.03134686;
                    }
                }
            } else {
                if (inputs[17] < 1.1301504) {
                    if (inputs[25] < 2.5014005) {
                        if (inputs[27] < 12.687689) {
                            var19 = 0.0153221395;
                        } else {
                            var19 = 0.05790413;
                        }
                    } else {
                        if (inputs[16] < 0.073037595) {
                            var19 = -0.0061277957;
                        } else {
                            var19 = 0.010228598;
                        }
                    }
                } else {
                    if (inputs[12] < 1936.37) {
                        if (inputs[29] < 3.165) {
                            if (inputs[38] < 14.0) {
                                if (inputs[26] < 29.282501) {
                                    var19 = 0.030150283;
                                } else {
                                    if (inputs[14] < -0.799) {
                                        var19 = 0.014191218;
                                    } else {
                                        var19 = -0.04478324;
                                    }
                                }
                            } else {
                                if (inputs[14] < -1.047) {
                                    var19 = 0.0;
                                } else {
                                    if (inputs[28] < 11.860701) {
                                        var19 = -0.014573117;
                                    } else {
                                        var19 = -0.08035798;
                                    }
                                }
                            }
                        } else {
                            var19 = 0.020985415;
                        }
                    } else {
                        if (inputs[23] < 10.870579) {
                            var19 = 0.06301385;
                        } else {
                            var19 = 0.0;
                        }
                    }
                }
            }
        }
    } else {
        var19 = -0.030885823;
    }
    double var20;
    if (inputs[25] < 2.1728046) {
        var20 = 0.03964898;
    } else {
        if (inputs[35] < -3.0698454) {
            if (inputs[23] < -20.700186) {
                if (inputs[32] < -7.38) {
                    var20 = -0.011863915;
                } else {
                    var20 = -0.071017236;
                }
            } else {
                if (inputs[36] < -5.478996) {
                    var20 = 0.038239922;
                } else {
                    if (inputs[10] < 2.06) {
                        var20 = 0.003383322;
                    } else {
                        var20 = -0.056671657;
                    }
                }
            }
        } else {
            if (inputs[36] < -3.415755) {
                var20 = 0.056886524;
            } else {
                if (inputs[17] < 0.86311066) {
                    var20 = -0.037437454;
                } else {
                    if (inputs[17] < 0.9943239) {
                        var20 = 0.038406372;
                    } else {
                        if (inputs[1] < 69.51098) {
                            if (inputs[26] < 21.48114) {
                                var20 = -0.024573693;
                            } else {
                                if (inputs[18] < 1.2799844) {
                                    var20 = -0.017882174;
                                } else {
                                    if (inputs[1] < 65.77108) {
                                        var20 = 0.00662794;
                                    } else {
                                        var20 = 0.059703633;
                                    }
                                }
                            }
                        } else {
                            if (inputs[38] < 15.0) {
                                if (inputs[25] < 2.50028) {
                                    var20 = 0.026358718;
                                } else {
                                    var20 = -0.020797128;
                                }
                            } else {
                                var20 = -0.072844796;
                            }
                        }
                    }
                }
            }
        }
    }
    double var21;
    if (inputs[28] < 35.46188) {
        if (inputs[28] < 30.224705) {
            if (inputs[37] < -5.165) {
                if (inputs[18] < 1.7735301) {
                    if (inputs[24] < -13.781551) {
                        var21 = -0.01718147;
                    } else {
                        var21 = -0.07141361;
                    }
                } else {
                    var21 = 0.011748527;
                }
            } else {
                if (inputs[16] < 0.124849625) {
                    if (inputs[18] < 1.3070976) {
                        var21 = -0.012687498;
                    } else {
                        if (inputs[2] < 1.4514285) {
                            var21 = 0.07334955;
                        } else {
                            if (inputs[10] < 1.185) {
                                if (inputs[8] < 1845.57) {
                                    var21 = 0.0050504007;
                                } else {
                                    var21 = 0.06498518;
                                }
                            } else {
                                var21 = -0.009267804;
                            }
                        }
                    }
                } else {
                    if (inputs[20] < -1.1541334) {
                        var21 = 0.029807452;
                    } else {
                        if (inputs[33] < 1.3372283) {
                            if (inputs[20] < 0.07766806) {
                                var21 = 0.0;
                            } else {
                                if (inputs[17] < 1.3014545) {
                                    var21 = -0.02958746;
                                } else {
                                    var21 = -0.088522024;
                                }
                            }
                        } else {
                            var21 = 0.02175494;
                        }
                    }
                }
            }
        } else {
            if (inputs[9] < 5.2975) {
                if (inputs[29] < 1.9625) {
                    var21 = 0.023523543;
                } else {
                    var21 = 0.0732329;
                }
            } else {
                var21 = 0.0;
            }
        }
    } else {
        if (inputs[16] < -0.1690376) {
            var21 = -0.052099973;
        } else {
            var21 = 0.0030216603;
        }
    }
    double var22;
    if (inputs[3] < 1753.98) {
        if (inputs[33] < 0.7286503) {
            var22 = 0.012189964;
        } else {
            var22 = -0.056951758;
        }
    } else {
        if (inputs[28] < 35.717934) {
            if (inputs[15] < -0.2869091) {
                if (inputs[9] < 6.77) {
                    if (inputs[15] < -0.39769697) {
                        if (inputs[19] < 1.6786789) {
                            var22 = -0.018344542;
                        } else {
                            var22 = 0.048582256;
                        }
                    } else {
                        var22 = 0.0595243;
                    }
                } else {
                    var22 = 0.0;
                }
            } else {
                if (inputs[28] < 16.36298) {
                    if (inputs[27] < 23.893877) {
                        var22 = 0.042695403;
                    } else {
                        if (inputs[28] < 10.820906) {
                            if (inputs[25] < 2.5036497) {
                                if (inputs[15] < 0.47533333) {
                                    var22 = -0.06196132;
                                } else {
                                    var22 = -0.0072668046;
                                }
                            } else {
                                if (inputs[25] < 2.5714285) {
                                    var22 = 0.031519648;
                                } else {
                                    var22 = -0.007953205;
                                }
                            }
                        } else {
                            if (inputs[20] < -0.92573076) {
                                var22 = -0.011944845;
                            } else {
                                if (inputs[16] < 0.095037594) {
                                    var22 = 0.058890644;
                                } else {
                                    var22 = 0.005624919;
                                }
                            }
                        }
                    }
                } else {
                    if (inputs[9] < 4.03) {
                        var22 = -0.0061507034;
                    } else {
                        var22 = -0.08088414;
                    }
                }
            }
        } else {
            if (inputs[20] < 0.4309123) {
                var22 = -0.06366586;
            } else {
                var22 = 0.0067230775;
            }
        }
    }
    double var23;
    if (inputs[31] < 19.76) {
        if (inputs[32] < 16.61) {
            if (inputs[25] < 2.1811023) {
                var23 = 0.044161033;
            } else {
                if (inputs[1] < 31.394823) {
                    if (inputs[9] < 4.5375) {
                        var23 = -0.06734088;
                    } else {
                        if (inputs[14] < -1.066) {
                            var23 = -0.049457263;
                        } else {
                            if (inputs[32] < -6.595) {
                                var23 = 0.04807682;
                            } else {
                                var23 = -0.013805591;
                            }
                        }
                    }
                } else {
                    if (inputs[11] < 0.35) {
                        if (inputs[14] < -0.923) {
                            var23 = 0.035740647;
                        } else {
                            if (inputs[14] < 0.498) {
                                var23 = -0.057701528;
                            } else {
                                if (inputs[3] < 1795.895) {
                                    var23 = -0.030707741;
                                } else {
                                    if (inputs[15] < 0.3500606) {
                                        var23 = -0.020025661;
                                    } else {
                                        var23 = 0.025451744;
                                    }
                                }
                            }
                        }
                    } else {
                        if (inputs[32] < -16.28) {
                            var23 = 0.049256403;
                        } else {
                            if (inputs[32] < -6.335) {
                                var23 = -0.032753225;
                            } else {
                                if (inputs[8] < 1846.64) {
                                    if (inputs[34] < 1.5955242) {
                                        var23 = -0.029848522;
                                    } else {
                                        var23 = 0.008718198;
                                    }
                                } else {
                                    if (inputs[36] < 2.5476544) {
                                        var23 = 0.06116563;
                                    } else {
                                        var23 = -0.002275437;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            var23 = 0.04274062;
        }
    } else {
        var23 = -0.033209637;
    }
    double var24;
    if (inputs[38] < 17.0) {
        if (inputs[18] < 3.397783) {
            if (inputs[18] < 1.3142484) {
                if (inputs[19] < 1.1199208) {
                    var24 = 0.0;
                } else {
                    if (inputs[33] < 0.7116867) {
                        var24 = -0.0062715746;
                    } else {
                        var24 = -0.052593015;
                    }
                }
            } else {
                if (inputs[26] < 52.06376) {
                    if (inputs[33] < 0.58868134) {
                        var24 = 0.04083319;
                    } else {
                        if (inputs[10] < 1.185) {
                            if (inputs[32] < -4.1) {
                                var24 = -0.012953409;
                            } else {
                                if (inputs[2] < 1.5785714) {
                                    var24 = 0.003992773;
                                } else {
                                    var24 = 0.055110913;
                                }
                            }
                        } else {
                            if (inputs[34] < -1.5090294) {
                                if (inputs[32] < -5.945) {
                                    var24 = 0.038151767;
                                } else {
                                    var24 = -0.023456851;
                                }
                            } else {
                                if (inputs[14] < 0.93) {
                                    var24 = -0.06402418;
                                } else {
                                    var24 = 0.0;
                                }
                            }
                        }
                    }
                } else {
                    var24 = 0.04720242;
                }
            }
        } else {
            var24 = -0.052732553;
        }
    } else {
        if (inputs[33] < 1.6065279) {
            if (inputs[31] < 11.64) {
                if (inputs[19] < 1.9707569) {
                    if (inputs[16] < -0.11659399) {
                        var24 = 0.044738125;
                    } else {
                        var24 = -0.011138322;
                    }
                } else {
                    var24 = -0.041406382;
                }
            } else {
                var24 = 0.051742572;
            }
        } else {
            var24 = 0.05099991;
        }
    }
    double var25;
    if (inputs[4] < 1975.405) {
        if (inputs[38] < 17.0) {
            if (inputs[11] < 0.37) {
                if (inputs[18] < 1.3839599) {
                    var25 = -0.061527096;
                } else {
                    if (inputs[20] < -0.8368286) {
                        var25 = 0.032670204;
                    } else {
                        if (inputs[17] < 1.755738) {
                            if (inputs[8] < 1829.47) {
                                var25 = -0.029500904;
                            } else {
                                var25 = 0.029979018;
                            }
                        } else {
                            var25 = -0.037423633;
                        }
                    }
                }
            } else {
                if (inputs[16] < -0.041323308) {
                    if (inputs[27] < 9.730752) {
                        var25 = -0.0061112517;
                    } else {
                        if (inputs[20] < 0.45606503) {
                            var25 = 0.01402787;
                        } else {
                            var25 = 0.071992286;
                        }
                    }
                } else {
                    if (inputs[35] < 1.2208858) {
                        var25 = -0.051286887;
                    } else {
                        if (inputs[27] < 34.107994) {
                            if (inputs[17] < 1.1826242) {
                                var25 = 0.055366196;
                            } else {
                                var25 = 0.0011700504;
                            }
                        } else {
                            var25 = -0.02335453;
                        }
                    }
                }
            }
        } else {
            if (inputs[18] < 2.4693813) {
                if (inputs[37] < 11.54) {
                    if (inputs[36] < -3.0641265) {
                        var25 = 0.026228914;
                    } else {
                        if (inputs[28] < 9.1953945) {
                            var25 = 0.003451469;
                        } else {
                            var25 = -0.047939707;
                        }
                    }
                } else {
                    var25 = 0.052229915;
                }
            } else {
                var25 = 0.06081617;
            }
        }
    } else {
        var25 = -0.037632897;
    }
    double var26;
    if (inputs[38] < 17.0) {
        if (inputs[16] < -0.22307518) {
            if (inputs[33] < 0.89737064) {
                var26 = 0.0;
            } else {
                var26 = -0.04436261;
            }
        } else {
            if (inputs[16] < 0.056233082) {
                if (inputs[20] < 1.4213508) {
                    if (inputs[21] < -2.8580956) {
                        var26 = -0.025275735;
                    } else {
                        if (inputs[20] < -1.1127212) {
                            var26 = 0.045876868;
                        } else {
                            if (inputs[17] < 1.493846) {
                                var26 = 0.022166919;
                            } else {
                                var26 = -0.03228971;
                            }
                        }
                    }
                } else {
                    var26 = 0.03739091;
                }
            } else {
                if (inputs[15] < 0.38787878) {
                    if (inputs[17] < 1.2055439) {
                        var26 = -0.01406417;
                    } else {
                        var26 = -0.06600999;
                    }
                } else {
                    if (inputs[23] < -22.852455) {
                        var26 = 0.038019933;
                    } else {
                        if (inputs[21] < 2.851763) {
                            var26 = 0.011012681;
                        } else {
                            var26 = -0.050456688;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[6] < 1913.16) {
            if (inputs[18] < 2.4168909) {
                if (inputs[18] < 1.3767517) {
                    var26 = 0.042920955;
                } else {
                    if (inputs[20] < 0.28234375) {
                        var26 = -0.045171984;
                    } else {
                        var26 = 0.02180701;
                    }
                }
            } else {
                var26 = 0.06713373;
            }
        } else {
            if (inputs[29] < 2.3425) {
                var26 = -0.03622482;
            } else {
                var26 = 0.0;
            }
        }
    }
    double var27;
    if (inputs[33] < 0.6929307) {
        if (inputs[13] < 1798.08) {
            if (inputs[24] < -13.781551) {
                var27 = 0.061961845;
            } else {
                var27 = 0.021155687;
            }
        } else {
            if (inputs[35] < -2.9531798) {
                var27 = -0.04253695;
            } else {
                if (inputs[19] < 1.3118387) {
                    var27 = -0.011482643;
                } else {
                    var27 = 0.044984356;
                }
            }
        }
    } else {
        if (inputs[5] < 1761.88) {
            var27 = -0.036011003;
        } else {
            if (inputs[13] < 1908.69) {
                if (inputs[16] < 0.2641203) {
                    if (inputs[9] < 6.5925) {
                        if (inputs[13] < 1864.78) {
                            if (inputs[10] < 0.835) {
                                if (inputs[17] < 1.4250249) {
                                    var27 = -0.037337307;
                                } else {
                                    var27 = 0.0;
                                }
                            } else {
                                if (inputs[1] < 35.155132) {
                                    var27 = 0.040088583;
                                } else {
                                    var27 = 0.0;
                                }
                            }
                        } else {
                            var27 = 0.043326188;
                        }
                    } else {
                        if (inputs[28] < 32.29316) {
                            var27 = -0.04462943;
                        } else {
                            var27 = 0.0132149225;
                        }
                    }
                } else {
                    var27 = 0.04447686;
                }
            } else {
                if (inputs[6] < 1932.025) {
                    var27 = -0.044674523;
                } else {
                    if (inputs[23] < 10.870579) {
                        var27 = 0.016239675;
                    } else {
                        var27 = -0.023436736;
                    }
                }
            }
        }
    }
    double var28;
    if (inputs[37] < -7.975) {
        if (inputs[25] < 2.4252136) {
            var28 = 0.013026356;
        } else {
            if (inputs[1] < 26.693901) {
                var28 = 0.0025906852;
            } else {
                if (inputs[33] < 1.0516493) {
                    var28 = -0.05533385;
                } else {
                    var28 = -0.0039056747;
                }
            }
        }
    } else {
        if (inputs[20] < 0.111824706) {
            if (inputs[17] < 0.8618677) {
                var28 = -0.018032493;
            } else {
                if (inputs[1] < 71.33636) {
                    if (inputs[14] < -0.818) {
                        var28 = -0.0008425534;
                    } else {
                        if (inputs[20] < -0.26992851) {
                            if (inputs[23] < -20.966377) {
                                var28 = 0.062360168;
                            } else {
                                if (inputs[24] < 12.635745) {
                                    var28 = -0.015332083;
                                } else {
                                    var28 = 0.028060608;
                                }
                            }
                        } else {
                            var28 = 0.076532125;
                        }
                    }
                } else {
                    if (inputs[3] < 1830.305) {
                        var28 = -0.035595015;
                    } else {
                        var28 = 0.029009659;
                    }
                }
            }
        } else {
            if (inputs[11] < 0.23) {
                var28 = 0.034506924;
            } else {
                if (inputs[16] < 0.14369173) {
                    if (inputs[10] < 0.62) {
                        var28 = 0.029739186;
                    } else {
                        if (inputs[20] < 0.796546) {
                            var28 = -0.050076906;
                        } else {
                            var28 = 0.0;
                        }
                    }
                } else {
                    var28 = -0.05115826;
                }
            }
        }
    }
    double var29;
    if (inputs[28] < 35.86049) {
        if (inputs[15] < -0.2869091) {
            if (inputs[24] < -20.538118) {
                if (inputs[37] < -8.09) {
                    var29 = 0.0016992096;
                } else {
                    var29 = 0.054030176;
                }
            } else {
                if (inputs[26] < 36.85896) {
                    if (inputs[13] < 1835.06) {
                        var29 = 0.042914756;
                    } else {
                        var29 = -0.009838468;
                    }
                } else {
                    var29 = -0.028331028;
                }
            }
        } else {
            if (inputs[28] < 16.36298) {
                if (inputs[18] < 1.2545856) {
                    if (inputs[18] < 1.1529632) {
                        var29 = 0.0;
                    } else {
                        var29 = -0.04632508;
                    }
                } else {
                    if (inputs[1] < 69.59125) {
                        if (inputs[20] < -0.92573076) {
                            var29 = -0.00882706;
                        } else {
                            if (inputs[36] < 2.318771) {
                                var29 = 0.016127387;
                            } else {
                                var29 = 0.054870613;
                            }
                        }
                    } else {
                        if (inputs[38] < 15.0) {
                            if (inputs[20] < -0.24893561) {
                                var29 = 0.03395293;
                            } else {
                                var29 = -0.013972909;
                            }
                        } else {
                            var29 = -0.04350387;
                        }
                    }
                }
            } else {
                if (inputs[3] < 1852.185) {
                    var29 = -0.0643922;
                } else {
                    var29 = 0.0;
                }
            }
        }
    } else {
        if (inputs[20] < 0.4309123) {
            var29 = -0.05931851;
        } else {
            var29 = 0.001927574;
        }
    }
    double var30;
    if (inputs[10] < 4.93) {
        if (inputs[9] < 7.02) {
            if (inputs[36] < -5.478996) {
                var30 = 0.036830496;
            } else {
                if (inputs[31] < 0.75) {
                    if (inputs[26] < 21.681885) {
                        var30 = -0.051270884;
                    } else {
                        if (inputs[32] < -16.28) {
                            var30 = 0.025095183;
                        } else {
                            if (inputs[32] < -4.015) {
                                if (inputs[25] < 2.4555256) {
                                    var30 = 0.0008630462;
                                } else {
                                    if (inputs[38] < 12.0) {
                                        var30 = -0.015440013;
                                    } else {
                                        var30 = -0.074745364;
                                    }
                                }
                            } else {
                                if (inputs[8] < 1846.76) {
                                    var30 = -0.011092835;
                                } else {
                                    var30 = 0.039289825;
                                }
                            }
                        }
                    }
                } else {
                    if (inputs[32] < 1.735) {
                        var30 = 0.055197984;
                    } else {
                        if (inputs[23] < 0.3177864) {
                            if (inputs[17] < 1.5926405) {
                                if (inputs[20] < -0.011650652) {
                                    if (inputs[14] < 0.561) {
                                        var30 = -0.015913136;
                                    } else {
                                        var30 = 0.043008808;
                                    }
                                } else {
                                    var30 = -0.02808194;
                                }
                            } else {
                                var30 = 0.03621455;
                            }
                        } else {
                            var30 = -0.027802102;
                        }
                    }
                }
            }
        } else {
            if (inputs[32] < -6.02) {
                var30 = 0.0023423189;
            } else {
                var30 = -0.047831647;
            }
        }
    } else {
        if (inputs[9] < 13.0225) {
            var30 = 0.04380136;
        } else {
            var30 = 0.0014397644;
        }
    }
    double var31;
    if (inputs[23] < 12.870723) {
        if (inputs[29] < 2.865) {
            if (inputs[10] < 0.6275) {
                if (inputs[31] < -2.245) {
                    var31 = -0.036170643;
                } else {
                    if (inputs[33] < 0.777166) {
                        var31 = -0.020621508;
                    } else {
                        var31 = 0.013295864;
                    }
                }
            } else {
                if (inputs[23] < 0.3177864) {
                    if (inputs[34] < -3.1621702) {
                        var31 = 0.039708328;
                    } else {
                        if (inputs[16] < -0.11659399) {
                            if (inputs[9] < 6.0525) {
                                var31 = -0.008658752;
                            } else {
                                var31 = -0.05436301;
                            }
                        } else {
                            if (inputs[32] < -5.945) {
                                if (inputs[23] < -19.825073) {
                                    var31 = 0.054102316;
                                } else {
                                    var31 = 0.007143585;
                                }
                            } else {
                                if (inputs[28] < 15.15587) {
                                    if (inputs[15] < 0.30563638) {
                                        var31 = 0.035600226;
                                    } else {
                                        var31 = -0.012976894;
                                    }
                                } else {
                                    var31 = -0.038160957;
                                }
                            }
                        }
                    }
                } else {
                    var31 = 0.044843458;
                }
            }
        } else {
            if (inputs[16] < -0.18129323) {
                var31 = -0.011720177;
            } else {
                if (inputs[18] < 2.062775) {
                    var31 = 0.013307092;
                } else {
                    var31 = 0.06483455;
                }
            }
        }
    } else {
        if (inputs[2] < 1.7892857) {
            var31 = 0.0;
        } else {
            var31 = -0.061718933;
        }
    }
    double var32;
    if (inputs[23] < -10.580304) {
        if (inputs[27] < 10.052218) {
            if (inputs[27] < 8.056942) {
                var32 = -0.017943777;
            } else {
                var32 = -0.06854242;
            }
        } else {
            if (inputs[34] < -1.8848149) {
                var32 = 0.03439685;
            } else {
                if (inputs[21] < 2.7553785) {
                    if (inputs[25] < 2.5521367) {
                        var32 = -0.056600645;
                    } else {
                        var32 = 0.000029331135;
                    }
                } else {
                    if (inputs[16] < 0.19218796) {
                        var32 = 0.04341871;
                    } else {
                        var32 = -0.0030664129;
                    }
                }
            }
        }
    } else {
        if (inputs[34] < 2.6520824) {
            if (inputs[26] < 37.809982) {
                if (inputs[25] < 2.5570033) {
                    if (inputs[23] < 10.870579) {
                        if (inputs[15] < -0.4269697) {
                            var32 = 0.047493648;
                        } else {
                            if (inputs[10] < 2.1525) {
                                if (inputs[26] < 20.800097) {
                                    var32 = 0.0;
                                } else {
                                    if (inputs[10] < 0.89) {
                                        var32 = 0.014184174;
                                    } else {
                                        var32 = 0.06411499;
                                    }
                                }
                            } else {
                                var32 = -0.024680717;
                            }
                        }
                    } else {
                        var32 = -0.016779857;
                    }
                } else {
                    var32 = -0.018872028;
                }
            } else {
                if (inputs[10] < 1.95) {
                    var32 = 0.07469241;
                } else {
                    var32 = 0.016525414;
                }
            }
        } else {
            if (inputs[24] < 20.101599) {
                var32 = -0.049292758;
            } else {
                var32 = 0.0045875646;
            }
        }
    }
    double var33;
    if (inputs[9] < 5.32) {
        if (inputs[24] < -21.750437) {
            var33 = 0.042784493;
        } else {
            if (inputs[37] < -5.74) {
                if (inputs[29] < 2.2625) {
                    var33 = -0.042137943;
                } else {
                    var33 = 0.0118142245;
                }
            } else {
                if (inputs[16] < 0.124849625) {
                    if (inputs[8] < 1846.64) {
                        if (inputs[1] < 64.39694) {
                            var33 = -0.017123455;
                        } else {
                            var33 = 0.0292844;
                        }
                    } else {
                        if (inputs[29] < 1.71) {
                            if (inputs[24] < 8.308654) {
                                var33 = 0.03680785;
                            } else {
                                var33 = 0.07207883;
                            }
                        } else {
                            var33 = 0.0;
                        }
                    }
                } else {
                    if (inputs[24] < 13.137483) {
                        var33 = 0.025350455;
                    } else {
                        if (inputs[2] < 1.56) {
                            var33 = 0.0;
                        } else {
                            var33 = -0.057813056;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[18] < 1.2115697) {
            var33 = -0.054450933;
        } else {
            if (inputs[32] < -7.955) {
                if (inputs[29] < 1.5175) {
                    var33 = 0.039954018;
                } else {
                    var33 = 0.0;
                }
            } else {
                if (inputs[37] < 9.375) {
                    if (inputs[23] < -15.129381) {
                        var33 = -0.058950953;
                    } else {
                        if (inputs[35] < -3.9407666) {
                            var33 = 0.010230478;
                        } else {
                            var33 = -0.039783657;
                        }
                    }
                } else {
                    var33 = 0.019745912;
                }
            }
        }
    }
    double var34;
    if (inputs[18] < 0.9764405) {
        var34 = -0.032757826;
    } else {
        if (inputs[24] < 25.472149) {
            if (inputs[24] < 23.25806) {
                if (inputs[29] < 3.2575) {
                    if (inputs[25] < 2.4555256) {
                        if (inputs[26] < 34.388138) {
                            if (inputs[26] < 26.546764) {
                                var34 = 0.0;
                            } else {
                                var34 = 0.047764108;
                            }
                        } else {
                            var34 = -0.017446054;
                        }
                    } else {
                        if (inputs[29] < 1.705) {
                            if (inputs[1] < 63.736034) {
                                if (inputs[35] < -1.3586833) {
                                    if (inputs[20] < 0.84939736) {
                                        var34 = -0.030733675;
                                    } else {
                                        var34 = 0.030725216;
                                    }
                                } else {
                                    var34 = 0.05122669;
                                }
                            } else {
                                var34 = -0.025448933;
                            }
                        } else {
                            if (inputs[25] < 2.4968016) {
                                var34 = -0.0692127;
                            } else {
                                if (inputs[26] < 26.644619) {
                                    var34 = -0.03901771;
                                } else {
                                    var34 = 0.009218914;
                                }
                            }
                        }
                    }
                } else {
                    if (inputs[10] < 0.9575) {
                        var34 = 0.048868414;
                    } else {
                        if (inputs[3] < 1864.615) {
                            var34 = 0.031505957;
                        } else {
                            var34 = -0.005795995;
                        }
                    }
                }
            } else {
                var34 = 0.036752094;
            }
        } else {
            var34 = -0.022338213;
        }
    }
    double var35;
    if (inputs[16] < -0.3255639) {
        var35 = -0.022516282;
    } else {
        if (inputs[24] < -20.04338) {
            if (inputs[23] < -13.143379) {
                var35 = 0.0;
            } else {
                var35 = 0.04304445;
            }
        } else {
            if (inputs[1] < 31.22064) {
                var35 = -0.032224342;
            } else {
                if (inputs[16] < -0.041323308) {
                    if (inputs[37] < -4.64) {
                        if (inputs[28] < 29.487696) {
                            var35 = -0.02505573;
                        } else {
                            var35 = 0.02068014;
                        }
                    } else {
                        if (inputs[19] < 1.5688448) {
                            var35 = 0.020455949;
                        } else {
                            var35 = 0.057594657;
                        }
                    }
                } else {
                    if (inputs[37] < 0.705) {
                        if (inputs[27] < 29.506002) {
                            if (inputs[10] < 1.21) {
                                var35 = -0.028733164;
                            } else {
                                var35 = 0.015020243;
                            }
                        } else {
                            var35 = -0.0537732;
                        }
                    } else {
                        if (inputs[20] < 0.111824706) {
                            if (inputs[28] < 9.55622) {
                                if (inputs[10] < 1.2975) {
                                    var35 = 0.06856112;
                                } else {
                                    var35 = 0.011896428;
                                }
                            } else {
                                if (inputs[20] < -0.8277281) {
                                    var35 = -0.026641589;
                                } else {
                                    var35 = 0.029548239;
                                }
                            }
                        } else {
                            if (inputs[16] < 0.14027068) {
                                var35 = 0.018679526;
                            } else {
                                if (inputs[6] < 1836.41) {
                                    var35 = 0.0;
                                } else {
                                    var35 = -0.07325724;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var36;
    if (inputs[29] < 2.2675) {
        if (inputs[29] < 1.8225) {
            if (inputs[36] < -5.478996) {
                var36 = 0.030705316;
            } else {
                if (inputs[14] < 0.547) {
                    if (inputs[16] < -0.08713534) {
                        if (inputs[1] < 30.98911) {
                            if (inputs[17] < 1.3311198) {
                                var36 = 0.0026584703;
                            } else {
                                var36 = -0.049159944;
                            }
                        } else {
                            if (inputs[14] < -0.787) {
                                var36 = 0.042944185;
                            } else {
                                var36 = -0.012804053;
                            }
                        }
                    } else {
                        if (inputs[29] < 0.755) {
                            var36 = -0.060855117;
                        } else {
                            var36 = -0.02170325;
                        }
                    }
                } else {
                    if (inputs[28] < 10.929129) {
                        if (inputs[38] < 12.0) {
                            var36 = -0.045056425;
                        } else {
                            if (inputs[21] < 2.9989474) {
                                var36 = -0.014629301;
                            } else {
                                var36 = 0.029896095;
                            }
                        }
                    } else {
                        if (inputs[16] < 0.10561654) {
                            var36 = 0.052060742;
                        } else {
                            var36 = 0.00092127535;
                        }
                    }
                }
            }
        } else {
            var36 = -0.043145966;
        }
    } else {
        if (inputs[36] < 1.7406528) {
            if (inputs[35] < -3.5775623) {
                var36 = -0.0068134423;
            } else {
                if (inputs[1] < 35.807934) {
                    var36 = 0.066017754;
                } else {
                    var36 = 0.022561716;
                }
            }
        } else {
            if (inputs[36] < 5.083295) {
                var36 = -0.029215856;
            } else {
                var36 = 0.023051126;
            }
        }
    }
    double var37;
    if (inputs[28] < 35.86049) {
        if (inputs[1] < 35.807934) {
            if (inputs[1] < 30.784996) {
                if (inputs[24] < -20.716888) {
                    var37 = 0.014735231;
                } else {
                    var37 = -0.025830092;
                }
            } else {
                if (inputs[26] < 27.5169) {
                    var37 = 0.0024907053;
                } else {
                    var37 = 0.058769386;
                }
            }
        } else {
            if (inputs[1] < 60.559483) {
                if (inputs[9] < 2.41) {
                    var37 = 0.0;
                } else {
                    var37 = -0.044001523;
                }
            } else {
                if (inputs[1] < 63.736034) {
                    if (inputs[1] < 62.726566) {
                        var37 = 0.005615407;
                    } else {
                        var37 = 0.047494117;
                    }
                } else {
                    if (inputs[21] < 2.7553785) {
                        if (inputs[16] < 0.10561654) {
                            var37 = 0.002939228;
                        } else {
                            var37 = -0.035369135;
                        }
                    } else {
                        if (inputs[34] < 2.6520824) {
                            var37 = 0.031014638;
                        } else {
                            if (inputs[24] < 20.276047) {
                                var37 = -0.023997482;
                            } else {
                                if (inputs[27] < 34.74283) {
                                    var37 = -0.00824714;
                                } else {
                                    var37 = 0.036704984;
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[17] < 1.3955787) {
            var37 = 0.0;
        } else {
            var37 = -0.047125246;
        }
    }
    double var38;
    if (inputs[28] < 35.46188) {
        if (inputs[18] < 1.5769857) {
            if (inputs[11] < 0.4) {
                if (inputs[32] < 5.09) {
                    if (inputs[33] < 0.6794056) {
                        var38 = 0.0033477172;
                    } else {
                        if (inputs[6] < 1841.18) {
                            var38 = -0.027952917;
                        } else {
                            var38 = -0.085425;
                        }
                    }
                } else {
                    if (inputs[18] < 1.3113737) {
                        var38 = -0.013778016;
                    } else {
                        var38 = 0.045420315;
                    }
                }
            } else {
                if (inputs[19] < 1.1896616) {
                    if (inputs[33] < 0.6921947) {
                        var38 = 0.007103718;
                    } else {
                        var38 = 0.05313309;
                    }
                } else {
                    if (inputs[26] < 26.074417) {
                        var38 = -0.03917532;
                    } else {
                        var38 = 0.022931186;
                    }
                }
            }
        } else {
            if (inputs[32] < 7.735) {
                if (inputs[6] < 1772.48) {
                    var38 = -0.0022796588;
                } else {
                    if (inputs[38] < 11.0) {
                        var38 = 0.0023934362;
                    } else {
                        if (inputs[9] < 3.8825) {
                            var38 = 0.012528957;
                        } else {
                            if (inputs[19] < 2.456523) {
                                var38 = 0.070089415;
                            } else {
                                var38 = 0.01520769;
                            }
                        }
                    }
                }
            } else {
                if (inputs[2] < 1.7892857) {
                    var38 = 0.024072835;
                } else {
                    var38 = -0.020872898;
                }
            }
        }
    } else {
        if (inputs[20] < 0.84939736) {
            if (inputs[18] < 1.5279794) {
                var38 = -0.008847773;
            } else {
                var38 = -0.058796126;
            }
        } else {
            var38 = 0.0067888307;
        }
    }
    double var39;
    if (inputs[29] < 2.2675) {
        if (inputs[29] < 1.705) {
            if (inputs[26] < 29.357567) {
                if (inputs[11] < 0.36) {
                    if (inputs[20] < -0.0031762682) {
                        var39 = 0.009436154;
                    } else {
                        var39 = -0.03885458;
                    }
                } else {
                    if (inputs[21] < 1.9090909) {
                        if (inputs[14] < -0.701) {
                            var39 = 0.03174547;
                        } else {
                            var39 = -0.01821594;
                        }
                    } else {
                        var39 = 0.046713505;
                    }
                }
            } else {
                if (inputs[19] < 1.4164727) {
                    var39 = -0.04095676;
                } else {
                    if (inputs[33] < 0.6835874) {
                        var39 = 0.0497983;
                    } else {
                        if (inputs[33] < 1.260437) {
                            var39 = -0.033825263;
                        } else {
                            var39 = 0.012480813;
                        }
                    }
                }
            }
        } else {
            if (inputs[26] < 33.319305) {
                var39 = -0.055920504;
            } else {
                var39 = 0.0;
            }
        }
    } else {
        if (inputs[16] < -0.3034361) {
            var39 = -0.02475853;
        } else {
            if (inputs[36] < 1.7406528) {
                if (inputs[20] < 0.6848595) {
                    var39 = 0.057480387;
                } else {
                    var39 = 0.016964642;
                }
            } else {
                if (inputs[36] < 4.820513) {
                    var39 = -0.028813638;
                } else {
                    var39 = 0.024666116;
                }
            }
        }
    }
    double var40;
    if (inputs[24] < -25.921698) {
        var40 = -0.02654231;
    } else {
        if (inputs[24] < -20.538118) {
            if (inputs[23] < -14.959898) {
                var40 = 0.0;
            } else {
                var40 = 0.04559786;
            }
        } else {
            if (inputs[1] < 29.47345) {
                var40 = -0.04229202;
            } else {
                if (inputs[32] < -16.28) {
                    if (inputs[13] < 1835.61) {
                        var40 = 0.038288936;
                    } else {
                        var40 = 0.003382759;
                    }
                } else {
                    if (inputs[25] < 2.4900498) {
                        if (inputs[25] < 2.460972) {
                            if (inputs[25] < 2.4304206) {
                                if (inputs[25] < 2.363372) {
                                    if (inputs[2] < 1.8392857) {
                                        var40 = 0.029289316;
                                    } else {
                                        var40 = -0.016695736;
                                    }
                                } else {
                                    var40 = -0.049515378;
                                }
                            } else {
                                var40 = 0.026640857;
                            }
                        } else {
                            var40 = -0.058790807;
                        }
                    } else {
                        if (inputs[13] < 1853.82) {
                            if (inputs[38] < 17.0) {
                                if (inputs[28] < 10.820906) {
                                    var40 = -0.04723292;
                                } else {
                                    var40 = 0.0;
                                }
                            } else {
                                var40 = 0.016825031;
                            }
                        } else {
                            if (inputs[5] < 1923.3774) {
                                if (inputs[26] < 31.987648) {
                                    var40 = 0.019261453;
                                } else {
                                    var40 = 0.055682033;
                                }
                            } else {
                                if (inputs[12] < 1942.09) {
                                    var40 = -0.022873968;
                                } else {
                                    var40 = 0.014110399;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var41;
    if (inputs[15] < -0.5877576) {
        if (inputs[23] < -2.2112257) {
            var41 = 0.0;
        } else {
            var41 = 0.04227585;
        }
    } else {
        if (inputs[6] < 1900.295) {
            if (inputs[13] < 1850.26) {
                if (inputs[25] < 2.2739584) {
                    var41 = 0.032089766;
                } else {
                    if (inputs[17] < 1.1372142) {
                        if (inputs[24] < -15.301786) {
                            var41 = 0.045650728;
                        } else {
                            if (inputs[26] < 28.991964) {
                                var41 = 0.014959532;
                            } else {
                                var41 = -0.034297407;
                            }
                        }
                    } else {
                        if (inputs[16] < -0.1188797) {
                            if (inputs[15] < -0.3879394) {
                                var41 = -0.062385716;
                            } else {
                                var41 = -0.018884778;
                            }
                        } else {
                            if (inputs[1] < 69.59125) {
                                if (inputs[9] < 2.64) {
                                    var41 = -0.005947192;
                                } else {
                                    var41 = 0.027258482;
                                }
                            } else {
                                var41 = -0.03950927;
                            }
                        }
                    }
                }
            } else {
                if (inputs[27] < 28.343739) {
                    var41 = 0.0;
                } else {
                    var41 = 0.043218996;
                }
            }
        } else {
            if (inputs[37] < -7.975) {
                var41 = -0.05825989;
            } else {
                if (inputs[38] < 15.0) {
                    if (inputs[38] < 10.0) {
                        var41 = -0.0115878;
                    } else {
                        var41 = 0.030263236;
                    }
                } else {
                    var41 = -0.030163238;
                }
            }
        }
    }
    double var42;
    if (inputs[18] < 3.5007954) {
        if (inputs[18] < 2.7206736) {
            if (inputs[32] < -16.28) {
                if (inputs[38] < 13.0) {
                    var42 = 0.0;
                } else {
                    var42 = 0.042199902;
                }
            } else {
                if (inputs[32] < -11.89) {
                    var42 = -0.04172816;
                } else {
                    if (inputs[2] < 1.7892857) {
                        if (inputs[2] < 1.2657143) {
                            if (inputs[25] < 2.527745) {
                                if (inputs[9] < 3.62) {
                                    var42 = -0.02338877;
                                } else {
                                    if (inputs[9] < 5.2025) {
                                        var42 = 0.03900441;
                                    } else {
                                        var42 = -0.0021212422;
                                    }
                                }
                            } else {
                                var42 = -0.033936694;
                            }
                        } else {
                            if (inputs[13] < 1796.75) {
                                var42 = -0.008573506;
                            } else {
                                if (inputs[19] < 1.2641958) {
                                    var42 = -0.0039027678;
                                } else {
                                    if (inputs[2] < 1.4514285) {
                                        var42 = 0.060936473;
                                    } else {
                                        var42 = 0.023273604;
                                    }
                                }
                            }
                        }
                    } else {
                        if (inputs[37] < 9.375) {
                            if (inputs[3] < 1862.305) {
                                if (inputs[11] < 0.31) {
                                    var42 = 0.013758018;
                                } else {
                                    var42 = -0.027117644;
                                }
                            } else {
                                var42 = -0.0531746;
                            }
                        } else {
                            var42 = 0.015861817;
                        }
                    }
                }
            }
        } else {
            var42 = 0.044559646;
        }
    } else {
        var42 = -0.032698445;
    }
    double var43;
    if (inputs[9] < 2.41) {
        if (inputs[15] < -0.39024243) {
            var43 = -0.011528775;
        } else {
            if (inputs[27] < 23.893877) {
                var43 = 0.049133282;
            } else {
                var43 = 0.0;
            }
        }
    } else {
        if (inputs[10] < 0.2) {
            var43 = 0.021615736;
        } else {
            if (inputs[25] < 2.5714285) {
                if (inputs[24] < -22.644678) {
                    if (inputs[24] < -25.921698) {
                        var43 = 0.0;
                    } else {
                        var43 = 0.046202485;
                    }
                } else {
                    if (inputs[25] < 2.4304206) {
                        if (inputs[32] < -5.845) {
                            var43 = 0.0;
                        } else {
                            var43 = -0.045508713;
                        }
                    } else {
                        if (inputs[14] < 1.185) {
                            if (inputs[17] < 1.0917326) {
                                if (inputs[14] < 0.517) {
                                    var43 = -0.0009646621;
                                } else {
                                    var43 = 0.037146077;
                                }
                            } else {
                                if (inputs[18] < 2.0697653) {
                                    if (inputs[26] < 24.451986) {
                                        var43 = 0.0;
                                    } else {
                                        var43 = -0.037710298;
                                    }
                                } else {
                                    var43 = 0.01242217;
                                }
                            }
                        } else {
                            var43 = 0.04100612;
                        }
                    }
                }
            } else {
                if (inputs[13] < 1812.72) {
                    var43 = 0.0;
                } else {
                    var43 = -0.043109503;
                }
            }
        }
    }
    double var44;
    if (inputs[38] < 17.0) {
        if (inputs[33] < 1.3552501) {
            if (inputs[33] < 1.2019886) {
                if (inputs[28] < 8.680083) {
                    var44 = -0.028072324;
                } else {
                    if (inputs[9] < 6.52) {
                        if (inputs[10] < 0.2275) {
                            var44 = -0.015745446;
                        } else {
                            if (inputs[29] < 0.7425) {
                                if (inputs[3] < 1840.14) {
                                    var44 = -0.023077343;
                                } else {
                                    var44 = 0.014187153;
                                }
                            } else {
                                if (inputs[38] < 14.0) {
                                    if (inputs[28] < 28.624237) {
                                        var44 = 0.05700034;
                                    } else {
                                        var44 = 0.011111028;
                                    }
                                } else {
                                    var44 = -0.0018447862;
                                }
                            }
                        }
                    } else {
                        var44 = -0.029800998;
                    }
                }
            } else {
                var44 = 0.03597516;
            }
        } else {
            var44 = -0.033404067;
        }
    } else {
        if (inputs[37] < 11.54) {
            if (inputs[35] < 3.1632493) {
                if (inputs[9] < 3.61) {
                    var44 = -0.0082947295;
                } else {
                    if (inputs[19] < 2.0873559) {
                        var44 = 0.04953737;
                    } else {
                        var44 = -0.0014855661;
                    }
                }
            } else {
                var44 = -0.037608713;
            }
        } else {
            var44 = 0.05386534;
        }
    }
    double var45;
    if (inputs[29] < 3.2575) {
        if (inputs[29] < 0.425) {
            if (inputs[17] < 1.1182593) {
                var45 = -0.022997282;
            } else {
                if (inputs[3] < 1844.265) {
                    var45 = 0.012949333;
                } else {
                    var45 = 0.044213403;
                }
            }
        } else {
            if (inputs[17] < 1.1301504) {
                if (inputs[2] < 1.2528571) {
                    if (inputs[13] < 1816.35) {
                        var45 = 0.00008849158;
                    } else {
                        var45 = -0.03876121;
                    }
                } else {
                    if (inputs[17] < 0.9421762) {
                        var45 = 0.0;
                    } else {
                        var45 = 0.061731774;
                    }
                }
            } else {
                if (inputs[38] < 14.0) {
                    if (inputs[1] < 34.41875) {
                        var45 = -0.0274282;
                    } else {
                        if (inputs[15] < 0.41484848) {
                            var45 = 0.03603037;
                        } else {
                            var45 = -0.022848617;
                        }
                    }
                } else {
                    if (inputs[33] < 1.6734459) {
                        if (inputs[26] < 24.880806) {
                            var45 = -0.06614945;
                        } else {
                            if (inputs[14] < -0.923) {
                                var45 = 0.00032344615;
                            } else {
                                var45 = -0.03822674;
                            }
                        }
                    } else {
                        var45 = 0.0047358726;
                    }
                }
            }
        }
    } else {
        if (inputs[38] < 17.0) {
            if (inputs[27] < 21.159891) {
                var45 = 0.018403929;
            } else {
                var45 = -0.016170815;
            }
        } else {
            var45 = 0.043967143;
        }
    }
    double var46;
    if (inputs[17] < 2.9854085) {
        if (inputs[13] < 1720.11) {
            var46 = -0.030807633;
        } else {
            if (inputs[29] < 2.865) {
                if (inputs[26] < 55.74809) {
                    if (inputs[19] < 2.173166) {
                        if (inputs[19] < 1.8045044) {
                            if (inputs[16] < 0.19218796) {
                                if (inputs[27] < 16.48461) {
                                    if (inputs[15] < -0.29551515) {
                                        var46 = -0.0010319776;
                                    } else {
                                        var46 = -0.05442771;
                                    }
                                } else {
                                    if (inputs[14] < 0.863) {
                                        var46 = 0.026344022;
                                    } else {
                                        var46 = -0.0076068817;
                                    }
                                }
                            } else {
                                var46 = -0.04130988;
                            }
                        } else {
                            var46 = 0.026071131;
                        }
                    } else {
                        if (inputs[17] < 1.4763739) {
                            var46 = -0.048039287;
                        } else {
                            var46 = 0.0;
                        }
                    }
                } else {
                    var46 = 0.034989696;
                }
            } else {
                if (inputs[6] < 1924.63) {
                    if (inputs[17] < 1.4250249) {
                        var46 = 0.012600906;
                    } else {
                        var46 = 0.058783595;
                    }
                } else {
                    var46 = -0.00046520395;
                }
            }
        }
    } else {
        var46 = -0.034507923;
    }
    double var47;
    if (inputs[38] < 4.0) {
        var47 = -0.02208611;
    } else {
        if (inputs[6] < 1784.81) {
            if (inputs[2] < 1.1414286) {
                var47 = 0.028687477;
            } else {
                if (inputs[29] < 1.0325) {
                    var47 = -0.047498446;
                } else {
                    if (inputs[31] < -1.285) {
                        var47 = -0.02747562;
                    } else {
                        var47 = 0.010956668;
                    }
                }
            }
        } else {
            if (inputs[37] < 19.76) {
                if (inputs[16] < -0.3255639) {
                    var47 = -0.014234618;
                } else {
                    if (inputs[13] < 1805.64) {
                        var47 = 0.0397521;
                    } else {
                        if (inputs[1] < 32.682835) {
                            if (inputs[9] < 4.4) {
                                var47 = -0.049350005;
                            } else {
                                var47 = 0.012256007;
                            }
                        } else {
                            if (inputs[16] < -0.036165413) {
                                if (inputs[25] < 2.4939435) {
                                    var47 = 0.054367278;
                                } else {
                                    var47 = 0.020563465;
                                }
                            } else {
                                if (inputs[37] < 0.945) {
                                    if (inputs[31] < 0.125) {
                                        var47 = -0.0393625;
                                    } else {
                                        var47 = 0.0;
                                    }
                                } else {
                                    if (inputs[25] < 2.5031645) {
                                        var47 = 0.0030602417;
                                    } else {
                                        var47 = 0.037795648;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                var47 = -0.02160593;
            }
        }
    }
    double var48;
    if (inputs[15] < 0.47533333) {
        if (inputs[26] < 26.005053) {
            if (inputs[33] < 1.2696608) {
                if (inputs[32] < 6.675) {
                    if (inputs[34] < 1.4579124) {
                        if (inputs[15] < -0.2960606) {
                            var48 = -0.034809668;
                        } else {
                            var48 = 0.026729098;
                        }
                    } else {
                        var48 = -0.040178724;
                    }
                } else {
                    var48 = 0.018868381;
                }
            } else {
                var48 = -0.051469646;
            }
        } else {
            if (inputs[23] < -2.2112257) {
                if (inputs[26] < 32.414757) {
                    if (inputs[32] < -7.38) {
                        var48 = 0.047581173;
                    } else {
                        var48 = -0.002291942;
                    }
                } else {
                    if (inputs[10] < 2.6525) {
                        if (inputs[14] < -0.622) {
                            var48 = -0.06826058;
                        } else {
                            var48 = -0.015272283;
                        }
                    } else {
                        var48 = 0.005033623;
                    }
                }
            } else {
                if (inputs[27] < 11.147679) {
                    if (inputs[24] < -18.128464) {
                        var48 = 0.04250692;
                    } else {
                        var48 = 0.0071465205;
                    }
                } else {
                    if (inputs[33] < 0.9738356) {
                        var48 = -0.018581487;
                    } else {
                        var48 = 0.02740064;
                    }
                }
            }
        }
    } else {
        if (inputs[32] < 7.735) {
            if (inputs[9] < 3.7925) {
                var48 = 0.002952964;
            } else {
                var48 = 0.045253158;
            }
        } else {
            var48 = -0.0065422566;
        }
    }
    double var49;
    if (inputs[36] < -5.478996) {
        if (inputs[29] < 1.645) {
            var49 = 0.041779067;
        } else {
            var49 = 0.0;
        }
    } else {
        if (inputs[31] < 0.75) {
            if (inputs[18] < 1.7482666) {
                if (inputs[19] < 1.1579607) {
                    var49 = 0.009624668;
                } else {
                    if (inputs[29] < 1.125) {
                        var49 = -0.06482364;
                    } else {
                        if (inputs[2] < 1.5914285) {
                            var49 = 0.0130432295;
                        } else {
                            var49 = -0.050604936;
                        }
                    }
                }
            } else {
                if (inputs[19] < 2.0873559) {
                    var49 = 0.028394345;
                } else {
                    var49 = -0.008220672;
                }
            }
        } else {
            if (inputs[25] < 2.6716418) {
                if (inputs[18] < 2.0568275) {
                    if (inputs[28] < 31.591608) {
                        if (inputs[18] < 1.3450353) {
                            if (inputs[18] < 1.1194593) {
                                var49 = 0.02650687;
                            } else {
                                var49 = -0.019556388;
                            }
                        } else {
                            if (inputs[14] < 0.599) {
                                var49 = 0.06887707;
                            } else {
                                if (inputs[19] < 1.45634) {
                                    var49 = 0.0010800173;
                                } else {
                                    var49 = 0.033041615;
                                }
                            }
                        }
                    } else {
                        var49 = -0.015169705;
                    }
                } else {
                    if (inputs[2] < 2.7) {
                        var49 = -0.022865603;
                    } else {
                        var49 = 0.0;
                    }
                }
            } else {
                var49 = -0.030254442;
            }
        }
    }
    double var50;
    if (inputs[2] < 1.7892857) {
        if (inputs[2] < 1.5521429) {
            if (inputs[6] < 1730.735) {
                var50 = 0.041698914;
            } else {
                if (inputs[1] < 26.023777) {
                    var50 = 0.028811533;
                } else {
                    if (inputs[29] < 1.0725) {
                        if (inputs[25] < 2.4931035) {
                            var50 = 0.0;
                        } else {
                            if (inputs[13] < 1849.95) {
                                var50 = -0.06200545;
                            } else {
                                var50 = -0.022003898;
                            }
                        }
                    } else {
                        if (inputs[24] < 18.97551) {
                            if (inputs[29] < 1.705) {
                                var50 = 0.0211437;
                            } else {
                                var50 = -0.017264988;
                            }
                        } else {
                            var50 = 0.03449182;
                        }
                    }
                }
            }
        } else {
            if (inputs[17] < 1.5340065) {
                var50 = 0.041204594;
            } else {
                var50 = 0.0;
            }
        }
    } else {
        if (inputs[18] < 1.5238507) {
            var50 = -0.031351067;
        } else {
            if (inputs[16] < 0.21756391) {
                if (inputs[15] < -0.71115154) {
                    var50 = 0.018563904;
                } else {
                    if (inputs[19] < 2.0873559) {
                        var50 = 0.0020639068;
                    } else {
                        var50 = -0.04111292;
                    }
                }
            } else {
                var50 = 0.02320088;
            }
        }
    }
    double var51;
    if (inputs[16] < -0.3255639) {
        var51 = -0.023196308;
    } else {
        if (inputs[31] < -21.39) {
            var51 = 0.03276766;
        } else {
            if (inputs[37] < 17.68) {
                if (inputs[37] < 11.665) {
                    if (inputs[6] < 1932.025) {
                        if (inputs[32] < -5.38) {
                            if (inputs[9] < 4.4) {
                                if (inputs[15] < -0.25381818) {
                                    var51 = -0.036701627;
                                } else {
                                    var51 = 0.007798546;
                                }
                            } else {
                                if (inputs[26] < 32.414757) {
                                    var51 = 0.051189203;
                                } else {
                                    var51 = 0.0;
                                }
                            }
                        } else {
                            if (inputs[9] < 4.8925) {
                                if (inputs[25] < 2.490458) {
                                    var51 = -0.026558572;
                                } else {
                                    if (inputs[20] < -0.011650652) {
                                        var51 = 0.028989552;
                                    } else {
                                        var51 = -0.007864672;
                                    }
                                }
                            } else {
                                if (inputs[22] < 1.0) {
                                    if (inputs[20] < -0.039020076) {
                                        var51 = 0.0;
                                    } else {
                                        var51 = -0.043817062;
                                    }
                                } else {
                                    var51 = -0.059315246;
                                }
                            }
                        }
                    } else {
                        if (inputs[23] < 25.207453) {
                            var51 = 0.04052881;
                        } else {
                            var51 = 0.0;
                        }
                    }
                } else {
                    var51 = 0.029531222;
                }
            } else {
                var51 = -0.023674889;
            }
        }
    }
    double var52;
    if (inputs[31] < 19.76) {
        if (inputs[2] < 2.6685715) {
            if (inputs[2] < 1.7371428) {
                if (inputs[26] < 31.036274) {
                    if (inputs[26] < 28.393423) {
                        if (inputs[15] < -0.18587878) {
                            var52 = -0.024926798;
                        } else {
                            if (inputs[11] < 0.38) {
                                var52 = 0.0;
                            } else {
                                var52 = 0.042226765;
                            }
                        }
                    } else {
                        var52 = 0.046114057;
                    }
                } else {
                    if (inputs[5] < 1811.08) {
                        if (inputs[2] < 1.1171429) {
                            var52 = 0.0;
                        } else {
                            var52 = -0.057226438;
                        }
                    } else {
                        if (inputs[14] < -0.489) {
                            var52 = -0.018754933;
                        } else {
                            var52 = 0.023441417;
                        }
                    }
                }
            } else {
                if (inputs[19] < 1.5947944) {
                    var52 = -0.056379657;
                } else {
                    if (inputs[33] < 1.1971525) {
                        var52 = -0.028884005;
                    } else {
                        if (inputs[18] < 2.062775) {
                            var52 = 0.024941307;
                        } else {
                            var52 = -0.008340452;
                        }
                    }
                }
            }
        } else {
            if (inputs[38] < 17.0) {
                if (inputs[32] < -4.675) {
                    var52 = -0.018847158;
                } else {
                    var52 = 0.023733968;
                }
            } else {
                var52 = 0.031485196;
            }
        }
    } else {
        var52 = -0.037900437;
    }
    double var53;
    if (inputs[10] < 4.93) {
        if (inputs[2] < 1.78) {
            if (inputs[2] < 1.6342857) {
                if (inputs[28] < 7.917422) {
                    var53 = -0.030135829;
                } else {
                    if (inputs[14] < 0.561) {
                        if (inputs[36] < -2.9255424) {
                            if (inputs[25] < 2.4325154) {
                                var53 = 0.042696517;
                            } else {
                                if (inputs[17] < 1.2573719) {
                                    var53 = 0.0132270185;
                                } else {
                                    var53 = -0.025089888;
                                }
                            }
                        } else {
                            var53 = -0.043461263;
                        }
                    } else {
                        if (inputs[38] < 14.0) {
                            if (inputs[9] < 3.8775) {
                                var53 = 0.017826008;
                            } else {
                                var53 = 0.05697768;
                            }
                        } else {
                            var53 = -0.00772449;
                        }
                    }
                }
            } else {
                var53 = 0.028947495;
            }
        } else {
            if (inputs[1] < 66.95448) {
                if (inputs[36] < -1.239904) {
                    if (inputs[29] < 2.52) {
                        var53 = -0.03808968;
                    } else {
                        var53 = 0.0038027316;
                    }
                } else {
                    if (inputs[11] < 0.31) {
                        var53 = 0.024452483;
                    } else {
                        var53 = -0.013512097;
                    }
                }
            } else {
                var53 = -0.045294337;
            }
        }
    } else {
        if (inputs[19] < 2.760537) {
            var53 = 0.04068524;
        } else {
            var53 = 0.0;
        }
    }
    double var54;
    if (inputs[36] < 6.9904957) {
        if (inputs[37] < 15.19) {
            if (inputs[6] < 1785.62) {
                if (inputs[33] < 0.7233032) {
                    var54 = 0.0055876365;
                } else {
                    if (inputs[38] < 17.0) {
                        var54 = -0.046645068;
                    } else {
                        var54 = 0.0005121109;
                    }
                }
            } else {
                if (inputs[25] < 2.623053) {
                    if (inputs[25] < 2.4968016) {
                        if (inputs[20] < -0.75934255) {
                            var54 = 0.025117505;
                        } else {
                            if (inputs[20] < 0.40182632) {
                                if (inputs[20] < -0.1291062) {
                                    var54 = -0.0010174136;
                                } else {
                                    var54 = -0.055242818;
                                }
                            } else {
                                if (inputs[9] < 6.5925) {
                                    var54 = 0.02520845;
                                } else {
                                    var54 = -0.0269946;
                                }
                            }
                        }
                    } else {
                        if (inputs[36] < -1.239904) {
                            if (inputs[33] < 0.6585674) {
                                var54 = 0.032762945;
                            } else {
                                if (inputs[5] < 1874.5024) {
                                    var54 = 0.011633441;
                                } else {
                                    var54 = -0.038420852;
                                }
                            }
                        } else {
                            if (inputs[27] < 25.749826) {
                                var54 = 0.07020838;
                            } else {
                                if (inputs[18] < 1.6014818) {
                                    var54 = 0.0;
                                } else {
                                    var54 = 0.053374175;
                                }
                            }
                        }
                    }
                } else {
                    var54 = -0.017863477;
                }
            }
        } else {
            var54 = -0.028291553;
        }
    } else {
        var54 = 0.031781405;
    }
    double var55;
    if (inputs[15] < -0.71115154) {
        var55 = 0.026572946;
    } else {
        if (inputs[16] < -0.30565414) {
            var55 = -0.040132668;
        } else {
            if (inputs[32] < -16.28) {
                if (inputs[18] < 1.5013207) {
                    var55 = -0.0033375728;
                } else {
                    var55 = 0.041398898;
                }
            } else {
                if (inputs[32] < -11.725) {
                    var55 = -0.04586978;
                } else {
                    if (inputs[5] < 1732.4825) {
                        var55 = 0.026048208;
                    } else {
                        if (inputs[8] < 1769.53) {
                            var55 = -0.042643312;
                        } else {
                            if (inputs[27] < 29.597797) {
                                if (inputs[19] < 1.7369338) {
                                    if (inputs[38] < 13.0) {
                                        var55 = 0.010688037;
                                    } else {
                                        var55 = -0.021288853;
                                    }
                                } else {
                                    if (inputs[26] < 38.89805) {
                                        var55 = 0.005784376;
                                    } else {
                                        var55 = 0.056558736;
                                    }
                                }
                            } else {
                                if (inputs[18] < 1.338262) {
                                    var55 = -0.051762886;
                                } else {
                                    if (inputs[19] < 1.6007417) {
                                        var55 = 0.023011083;
                                    } else {
                                        var55 = -0.023754824;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var56;
    if (inputs[33] < 0.6929307) {
        if (inputs[33] < 0.5508783) {
            var56 = -0.0056746765;
        } else {
            if (inputs[16] < 0.097789474) {
                if (inputs[3] < 1823.03) {
                    var56 = 0.057908267;
                } else {
                    var56 = 0.008633067;
                }
            } else {
                var56 = 0.0;
            }
        }
    } else {
        if (inputs[18] < 1.7844554) {
            if (inputs[31] < 0.75) {
                if (inputs[11] < 0.4) {
                    if (inputs[2] < 1.5657142) {
                        var56 = -0.025167556;
                    } else {
                        var56 = -0.06612394;
                    }
                } else {
                    var56 = 0.0;
                }
            } else {
                if (inputs[27] < 24.410223) {
                    var56 = 0.026079813;
                } else {
                    var56 = -0.013995617;
                }
            }
        } else {
            if (inputs[19] < 2.0873559) {
                if (inputs[31] < 1.92) {
                    var56 = 0.0387765;
                } else {
                    var56 = 0.0;
                }
            } else {
                if (inputs[19] < 3.0669494) {
                    var56 = -0.02586399;
                } else {
                    if (inputs[18] < 3.5007954) {
                        var56 = 0.04276348;
                    } else {
                        var56 = -0.006597632;
                    }
                }
            }
        }
    }
    double var57;
    if (inputs[18] < 3.5007954) {
        if (inputs[18] < 2.7831962) {
            if (inputs[19] < 2.1216297) {
                if (inputs[19] < 1.8400551) {
                    if (inputs[13] < 1807.71) {
                        if (inputs[33] < 0.7233032) {
                            if (inputs[2] < 1.0864285) {
                                var57 = 0.012973753;
                            } else {
                                var57 = 0.0542669;
                            }
                        } else {
                            if (inputs[5] < 1779.2275) {
                                var57 = -0.030040411;
                            } else {
                                var57 = 0.0033253331;
                            }
                        }
                    } else {
                        if (inputs[1] < 32.682835) {
                            var57 = -0.039504193;
                        } else {
                            if (inputs[5] < 1840.645) {
                                var57 = -0.027020667;
                            } else {
                                if (inputs[16] < 0.052481204) {
                                    if (inputs[3] < 1868.71) {
                                        var57 = 0.05399973;
                                    } else {
                                        var57 = 0.008481261;
                                    }
                                } else {
                                    if (inputs[21] < 2.9065473) {
                                        var57 = -0.028813487;
                                    } else {
                                        var57 = 0.013018622;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if (inputs[19] < 1.9707569) {
                        var57 = 0.044155966;
                    } else {
                        var57 = 0.005885893;
                    }
                }
            } else {
                if (inputs[27] < 27.007233) {
                    if (inputs[4] < 1852.03) {
                        var57 = -0.01769718;
                    } else {
                        var57 = -0.051531605;
                    }
                } else {
                    var57 = 0.0057022013;
                }
            }
        } else {
            var57 = 0.039017048;
        }
    } else {
        var57 = -0.028497647;
    }
    double var58;
    if (inputs[28] < 35.46188) {
        if (inputs[24] < -20.716888) {
            if (inputs[32] < 6.14) {
                var58 = 0.0040915376;
            } else {
                var58 = 0.04139863;
            }
        } else {
            if (inputs[21] < -2.8872595) {
                var58 = -0.033845507;
            } else {
                if (inputs[10] < 1.015) {
                    if (inputs[18] < 1.2441547) {
                        var58 = -0.012144413;
                    } else {
                        if (inputs[20] < -0.31803) {
                            var58 = 0.0;
                        } else {
                            if (inputs[32] < 0.665) {
                                var58 = 0.015832007;
                            } else {
                                var58 = 0.055821504;
                            }
                        }
                    }
                } else {
                    if (inputs[23] < 12.870723) {
                        if (inputs[33] < 0.8042578) {
                            if (inputs[21] < 3.0327923) {
                                var58 = 0.050672323;
                            } else {
                                var58 = -0.0016461523;
                            }
                        } else {
                            if (inputs[26] < 38.89805) {
                                if (inputs[31] < 2.43) {
                                    if (inputs[1] < 39.179962) {
                                        var58 = 0.015631145;
                                    } else {
                                        var58 = -0.011120067;
                                    }
                                } else {
                                    var58 = -0.048858076;
                                }
                            } else {
                                var58 = 0.018711917;
                            }
                        }
                    } else {
                        var58 = -0.04190625;
                    }
                }
            }
        }
    } else {
        if (inputs[20] < 0.84939736) {
            var58 = -0.041553974;
        } else {
            var58 = 0.009807497;
        }
    }
    double var59;
    if (inputs[29] < 3.2575) {
        if (inputs[26] < 55.74809) {
            if (inputs[26] < 36.587326) {
                if (inputs[29] < 1.8175) {
                    if (inputs[28] < 10.929129) {
                        var59 = -0.02672315;
                    } else {
                        if (inputs[14] < 0.636) {
                            if (inputs[20] < 0.84939736) {
                                if (inputs[29] < 1.3025) {
                                    if (inputs[36] < -1.949157) {
                                        var59 = -0.03755936;
                                    } else {
                                        var59 = 0.0;
                                    }
                                } else {
                                    var59 = 0.026275415;
                                }
                            } else {
                                var59 = 0.027900867;
                            }
                        } else {
                            if (inputs[19] < 1.3936301) {
                                var59 = 0.052304458;
                            } else {
                                var59 = 0.0118729565;
                            }
                        }
                    }
                } else {
                    if (inputs[26] < 27.647339) {
                        var59 = -0.03878642;
                    } else {
                        var59 = 0.013166477;
                    }
                }
            } else {
                if (inputs[25] < 2.4893618) {
                    var59 = -0.044914752;
                } else {
                    if (inputs[35] < -3.1001759) {
                        var59 = -0.025381597;
                    } else {
                        var59 = 0.0049870405;
                    }
                }
            }
        } else {
            var59 = 0.025139447;
        }
    } else {
        if (inputs[10] < 1.015) {
            var59 = 0.034486964;
        } else {
            if (inputs[10] < 2.63) {
                var59 = -0.015841587;
            } else {
                var59 = 0.0241159;
            }
        }
    }
    double var60;
    if (inputs[38] < 4.0) {
        var60 = -0.02427949;
    } else {
        if (inputs[13] < 1983.67) {
            if (inputs[16] < -0.3255639) {
                var60 = -0.022796776;
            } else {
                if (inputs[19] < 2.8632855) {
                    if (inputs[18] < 2.149493) {
                        if (inputs[8] < 1944.57) {
                            if (inputs[36] < -2.9744408) {
                                if (inputs[25] < 2.4144928) {
                                    var60 = 0.04587147;
                                } else {
                                    if (inputs[33] < 0.75628126) {
                                        var60 = 0.02128283;
                                    } else {
                                        var60 = -0.013520766;
                                    }
                                }
                            } else {
                                if (inputs[37] < -4.85) {
                                    var60 = -0.043321725;
                                } else {
                                    if (inputs[20] < -0.034633074) {
                                        var60 = 0.014417137;
                                    } else {
                                        var60 = -0.016382856;
                                    }
                                }
                            }
                        } else {
                            var60 = 0.040060334;
                        }
                    } else {
                        var60 = -0.022002375;
                    }
                } else {
                    var60 = 0.044374596;
                }
            }
        } else {
            var60 = -0.02375821;
        }
    }
    double var61;
    if (inputs[15] < -0.71115154) {
        var61 = 0.030433057;
    } else {
        if (inputs[2] < 1.7892857) {
            if (inputs[2] < 1.2621429) {
                if (inputs[28] < 8.292205) {
                    var61 = -0.041901436;
                } else {
                    if (inputs[32] < 9.415) {
                        if (inputs[13] < 1787.47) {
                            var61 = 0.01542575;
                        } else {
                            if (inputs[18] < 1.3539162) {
                                var61 = -0.036603354;
                            } else {
                                var61 = 0.0;
                            }
                        }
                    } else {
                        var61 = 0.03448918;
                    }
                }
            } else {
                if (inputs[33] < 0.6794056) {
                    var61 = 0.05265317;
                } else {
                    if (inputs[18] < 1.7844554) {
                        if (inputs[18] < 1.5062274) {
                            if (inputs[34] < -1.9706329) {
                                var61 = 0.03433486;
                            } else {
                                if (inputs[15] < 0.25624242) {
                                    var61 = -0.018061966;
                                } else {
                                    var61 = 0.016188119;
                                }
                            }
                        } else {
                            var61 = -0.024750987;
                        }
                    } else {
                        var61 = 0.029831728;
                    }
                }
            }
        } else {
            if (inputs[33] < 1.0215595) {
                var61 = -0.047264904;
            } else {
                if (inputs[18] < 1.4627376) {
                    var61 = -0.025521493;
                } else {
                    if (inputs[18] < 2.1886241) {
                        if (inputs[31] < 0.75) {
                            var61 = 0.0;
                        } else {
                            var61 = 0.032782108;
                        }
                    } else {
                        if (inputs[38] < 17.0) {
                            var61 = -0.036175314;
                        } else {
                            var61 = 0.006803987;
                        }
                    }
                }
            }
        }
    }
    double var62;
    if (inputs[26] < 18.520395) {
        var62 = 0.02770479;
    } else {
        if (inputs[26] < 21.48114) {
            var62 = -0.022700535;
        } else {
            if (inputs[35] < -2.4203024) {
                if (inputs[28] < 34.50623) {
                    if (inputs[23] < -14.327773) {
                        if (inputs[31] < -9.26) {
                            var62 = 0.0;
                        } else {
                            var62 = -0.028441442;
                        }
                    } else {
                        if (inputs[9] < 5.58) {
                            var62 = 0.05368511;
                        } else {
                            var62 = -0.0058795856;
                        }
                    }
                } else {
                    if (inputs[20] < 0.83210975) {
                        var62 = -0.04596261;
                    } else {
                        var62 = 0.0046307007;
                    }
                }
            } else {
                if (inputs[34] < -1.5807453) {
                    if (inputs[27] < 10.455132) {
                        var62 = 0.015236826;
                    } else {
                        var62 = 0.04020436;
                    }
                } else {
                    if (inputs[14] < 0.561) {
                        var62 = -0.022184296;
                    } else {
                        if (inputs[17] < 1.0431107) {
                            var62 = 0.050627418;
                        } else {
                            if (inputs[14] < 0.764) {
                                var62 = -0.023912251;
                            } else {
                                if (inputs[2] < 1.7371428) {
                                    if (inputs[1] < 69.59125) {
                                        var62 = 0.051890608;
                                    } else {
                                        var62 = 0.0032335038;
                                    }
                                } else {
                                    if (inputs[35] < 2.884201) {
                                        var62 = 0.0125874495;
                                    } else {
                                        var62 = -0.034440994;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var63;
    if (inputs[18] < 1.6014818) {
        if (inputs[9] < 5.71) {
            if (inputs[38] < 9.0) {
                if (inputs[17] < 1.1634259) {
                    var63 = -0.039834347;
                } else {
                    var63 = 0.0;
                }
            } else {
                if (inputs[36] < -2.9744408) {
                    var63 = 0.03393938;
                } else {
                    if (inputs[29] < 1.805) {
                        if (inputs[26] < 27.82051) {
                            if (inputs[32] < 6.675) {
                                var63 = 0.0031305426;
                            } else {
                                var63 = 0.045626566;
                            }
                        } else {
                            var63 = -0.011365525;
                        }
                    } else {
                        var63 = -0.030388193;
                    }
                }
            }
        } else {
            if (inputs[37] < 2.525) {
                var63 = -0.05298918;
            } else {
                var63 = 0.0010616273;
            }
        }
    } else {
        if (inputs[19] < 2.0873559) {
            if (inputs[38] < 12.0) {
                var63 = -0.0028835705;
            } else {
                if (inputs[31] < -0.565) {
                    var63 = 0.05255575;
                } else {
                    var63 = 0.0067188926;
                }
            }
        } else {
            if (inputs[10] < 0.73) {
                var63 = 0.024120789;
            } else {
                if (inputs[19] < 3.0669494) {
                    var63 = -0.037813358;
                } else {
                    if (inputs[18] < 3.1303427) {
                        var63 = 0.025188038;
                    } else {
                        var63 = -0.008955657;
                    }
                }
            }
        }
    }
    double var64;
    if (inputs[35] < 6.134671) {
        if (inputs[26] < 48.985077) {
            if (inputs[33] < 1.6324534) {
                if (inputs[37] < -4.64) {
                    if (inputs[36] < -2.7388046) {
                        if (inputs[10] < 2.06) {
                            if (inputs[1] < 30.595419) {
                                var64 = 0.025419105;
                            } else {
                                var64 = 0.0;
                            }
                        } else {
                            var64 = -0.019682722;
                        }
                    } else {
                        var64 = -0.056189504;
                    }
                } else {
                    if (inputs[27] < 33.96854) {
                        if (inputs[32] < 5.055) {
                            if (inputs[15] < -0.3949697) {
                                var64 = -0.024697704;
                            } else {
                                if (inputs[16] < 0.06660151) {
                                    var64 = 0.03067162;
                                } else {
                                    if (inputs[31] < -2.07) {
                                        var64 = -0.03587149;
                                    } else {
                                        var64 = 0.0053414186;
                                    }
                                }
                            }
                        } else {
                            if (inputs[25] < 2.5106888) {
                                if (inputs[8] < 1843.76) {
                                    var64 = 0.055928335;
                                } else {
                                    var64 = 0.011652898;
                                }
                            } else {
                                var64 = 0.0;
                            }
                        }
                    } else {
                        if (inputs[10] < 0.62) {
                            var64 = 0.002623176;
                        } else {
                            var64 = -0.043501124;
                        }
                    }
                }
            } else {
                var64 = 0.024484621;
            }
        } else {
            var64 = 0.023102224;
        }
    } else {
        var64 = -0.033565387;
    }
    double var65;
    if (inputs[28] < 35.46188) {
        if (inputs[28] < 30.224705) {
            if (inputs[37] < -5.165) {
                if (inputs[36] < -3.7361963) {
                    var65 = 0.0;
                } else {
                    var65 = -0.041426163;
                }
            } else {
                if (inputs[1] < 36.768345) {
                    var65 = 0.03756662;
                } else {
                    if (inputs[15] < 0.34339395) {
                        if (inputs[25] < 2.5036497) {
                            var65 = -0.03472421;
                        } else {
                            var65 = 0.0;
                        }
                    } else {
                        if (inputs[37] < 0.945) {
                            var65 = -0.017018568;
                        } else {
                            if (inputs[17] < 1.0431107) {
                                var65 = 0.04458228;
                            } else {
                                if (inputs[37] < 15.19) {
                                    if (inputs[38] < 14.0) {
                                        var65 = 0.047748946;
                                    } else {
                                        var65 = -0.004921567;
                                    }
                                } else {
                                    var65 = -0.017925939;
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if (inputs[37] < -4.97) {
                var65 = 0.035184767;
            } else {
                var65 = 0.0008300552;
            }
        }
    } else {
        if (inputs[18] < 1.5279794) {
            var65 = 0.0040891757;
        } else {
            var65 = -0.04649789;
        }
    }
    double var66;
    if (inputs[2] < 0.94785714) {
        var66 = 0.02475114;
    } else {
        if (inputs[38] < 10.0) {
            if (inputs[24] < 15.307019) {
                if (inputs[14] < -0.726) {
                    var66 = -0.010094365;
                } else {
                    var66 = -0.053647842;
                }
            } else {
                var66 = 0.009036089;
            }
        } else {
            if (inputs[17] < 1.1634259) {
                if (inputs[33] < 0.6848537) {
                    var66 = 0.04912875;
                } else {
                    if (inputs[9] < 4.7025) {
                        var66 = -0.012293984;
                    } else {
                        var66 = 0.023867851;
                    }
                }
            } else {
                if (inputs[29] < 0.4625) {
                    var66 = 0.018973578;
                } else {
                    if (inputs[29] < 2.2675) {
                        if (inputs[20] < -0.0031762682) {
                            if (inputs[29] < 1.165) {
                                var66 = 0.024175808;
                            } else {
                                var66 = -0.023250261;
                            }
                        } else {
                            if (inputs[32] < -7.145) {
                                var66 = -0.017423347;
                            } else {
                                var66 = -0.05346407;
                            }
                        }
                    } else {
                        if (inputs[1] < 35.807934) {
                            var66 = 0.035380643;
                        } else {
                            if (inputs[14] < 0.904) {
                                var66 = -0.040350027;
                            } else {
                                var66 = 0.0;
                            }
                        }
                    }
                }
            }
        }
    }
    double var67;
    if (inputs[16] < -0.3255639) {
        var67 = -0.022810722;
    } else {
        if (inputs[32] < -16.28) {
            if (inputs[38] < 12.0) {
                var67 = -0.008003853;
            } else {
                var67 = 0.04010765;
            }
        } else {
            if (inputs[24] < -22.644678) {
                var67 = 0.01982001;
            } else {
                if (inputs[14] < 0.614) {
                    if (inputs[32] < 2.355) {
                        if (inputs[32] < -0.895) {
                            if (inputs[14] < -0.688) {
                                if (inputs[15] < -0.42242426) {
                                    var67 = -0.0261202;
                                } else {
                                    var67 = 0.03364756;
                                }
                            } else {
                                var67 = -0.046215277;
                            }
                        } else {
                            var67 = 0.028917892;
                        }
                    } else {
                        if (inputs[18] < 1.4883347) {
                            var67 = -0.045069233;
                        } else {
                            var67 = -0.006965786;
                        }
                    }
                } else {
                    if (inputs[17] < 1.1634259) {
                        var67 = 0.036053944;
                    } else {
                        if (inputs[15] < 0.36539394) {
                            var67 = -0.028090274;
                        } else {
                            if (inputs[24] < 13.523889) {
                                var67 = 0.034541577;
                            } else {
                                if (inputs[2] < 1.5485715) {
                                    var67 = 0.019755818;
                                } else {
                                    var67 = -0.023365792;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var68;
    if (inputs[9] < 2.41) {
        if (inputs[2] < 1.5342857) {
            if (inputs[19] < 1.3032684) {
                var68 = -0.022265457;
            } else {
                var68 = 0.010636632;
            }
        } else {
            if (inputs[30] < 1.0) {
                var68 = 0.050643913;
            } else {
                var68 = 0.0073386813;
            }
        }
    } else {
        if (inputs[21] < -3.3292682) {
            if (inputs[36] < -5.3815207) {
                var68 = 0.0;
            } else {
                var68 = -0.05073792;
            }
        } else {
            if (inputs[15] < -0.2869091) {
                if (inputs[26] < 34.417736) {
                    if (inputs[26] < 27.024124) {
                        var68 = 0.006802979;
                    } else {
                        var68 = 0.042493198;
                    }
                } else {
                    var68 = -0.003474641;
                }
            } else {
                if (inputs[37] < 0.945) {
                    if (inputs[38] < 11.0) {
                        var68 = 0.0;
                    } else {
                        var68 = -0.04511623;
                    }
                } else {
                    if (inputs[37] < 3.25) {
                        var68 = 0.036128823;
                    } else {
                        if (inputs[36] < 3.5044699) {
                            var68 = -0.025785329;
                        } else {
                            if (inputs[2] < 1.6992857) {
                                if (inputs[23] < 0.0) {
                                    var68 = 0.04206435;
                                } else {
                                    var68 = 0.0;
                                }
                            } else {
                                var68 = -0.007945947;
                            }
                        }
                    }
                }
            }
        }
    }
    double var69;
    if (inputs[8] < 1972.8) {
        if (inputs[4] < 1935.9) {
            if (inputs[5] < 1923.0) {
                if (inputs[14] < 0.939) {
                    if (inputs[38] < 7.0) {
                        var69 = -0.03083809;
                    } else {
                        if (inputs[6] < 1793.675) {
                            if (inputs[33] < 0.7199876) {
                                var69 = 0.013770605;
                            } else {
                                if (inputs[31] < 0.555) {
                                    var69 = -0.042512625;
                                } else {
                                    var69 = 0.0;
                                }
                            }
                        } else {
                            if (inputs[17] < 0.9314376) {
                                var69 = -0.017891463;
                            } else {
                                if (inputs[17] < 1.26158) {
                                    if (inputs[5] < 1841.9725) {
                                        var69 = 0.009646072;
                                    } else {
                                        var69 = 0.05488081;
                                    }
                                } else {
                                    if (inputs[18] < 1.8384844) {
                                        var69 = -0.02143017;
                                    } else {
                                        var69 = 0.023586633;
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if (inputs[38] < 14.0) {
                        var69 = 0.040502258;
                    } else {
                        var69 = 0.0;
                    }
                }
            } else {
                var69 = -0.028908176;
            }
        } else {
            if (inputs[10] < 1.7) {
                var69 = 0.03980945;
            } else {
                var69 = 0.010235455;
            }
        }
    } else {
        var69 = -0.015945062;
    }
    double var70;
    if (inputs[10] < 5.0575) {
        if (inputs[15] < -0.65672725) {
            var70 = 0.02861694;
        } else {
            if (inputs[2] < 1.7892857) {
                if (inputs[2] < 1.5521429) {
                    if (inputs[25] < 2.4325154) {
                        var70 = 0.026917567;
                    } else {
                        if (inputs[33] < 0.73342574) {
                            if (inputs[13] < 1808.84) {
                                if (inputs[11] < 0.4) {
                                    var70 = 0.0;
                                } else {
                                    var70 = 0.03143408;
                                }
                            } else {
                                if (inputs[11] < 0.37) {
                                    var70 = 0.014484499;
                                } else {
                                    if (inputs[25] < 2.5099075) {
                                        var70 = -0.043379672;
                                    } else {
                                        var70 = -0.005581262;
                                    }
                                }
                            }
                        } else {
                            var70 = -0.0313358;
                        }
                    }
                } else {
                    if (inputs[10] < 0.9425) {
                        var70 = 0.043546166;
                    } else {
                        var70 = 0.0;
                    }
                }
            } else {
                if (inputs[10] < 1.85) {
                    if (inputs[27] < 21.370478) {
                        var70 = 0.005779789;
                    } else {
                        var70 = -0.01718523;
                    }
                } else {
                    var70 = -0.03585728;
                }
            }
        }
    } else {
        if (inputs[13] < 1884.03) {
            var70 = 0.0;
        } else {
            var70 = 0.035320807;
        }
    }
    double var71;
    if (inputs[32] < -16.28) {
        if (inputs[38] < 13.0) {
            var71 = -0.0043641524;
        } else {
            var71 = 0.03380825;
        }
    } else {
        if (inputs[20] < 1.5681596) {
            if (inputs[29] < 2.2675) {
                if (inputs[29] < 1.6675) {
                    if (inputs[29] < 1.31) {
                        if (inputs[31] < 0.845) {
                            if (inputs[14] < -0.761) {
                                var71 = 0.009757262;
                            } else {
                                var71 = -0.040976312;
                            }
                        } else {
                            if (inputs[3] < 1787.64) {
                                var71 = 0.030313753;
                            } else {
                                if (inputs[10] < 1.9925) {
                                    if (inputs[18] < 1.4432467) {
                                        var71 = 0.025480727;
                                    } else {
                                        var71 = -0.0055757184;
                                    }
                                } else {
                                    var71 = -0.022556277;
                                }
                            }
                        }
                    } else {
                        var71 = 0.019474953;
                    }
                } else {
                    var71 = -0.033491325;
                }
            } else {
                if (inputs[33] < 1.3552501) {
                    if (inputs[18] < 1.4673799) {
                        var71 = 0.0;
                    } else {
                        if (inputs[25] < 2.50028) {
                            var71 = 0.059085097;
                        } else {
                            var71 = 0.0011161872;
                        }
                    }
                } else {
                    var71 = -0.016316159;
                }
            }
        } else {
            var71 = -0.04550716;
        }
    }
    double var72;
    if (inputs[32] < -16.28) {
        if (inputs[18] < 1.7880592) {
            var72 = 0.0026329055;
        } else {
            var72 = 0.04655436;
        }
    } else {
        if (inputs[23] < -3.7274184) {
            if (inputs[34] < 2.4260392) {
                if (inputs[26] < 27.82051) {
                    if (inputs[23] < -32.495174) {
                        var72 = 0.011218907;
                    } else {
                        var72 = -0.016536923;
                    }
                } else {
                    if (inputs[36] < -2.9744408) {
                        var72 = -0.007993103;
                    } else {
                        var72 = -0.05208352;
                    }
                }
            } else {
                if (inputs[20] < -0.14561546) {
                    var72 = 0.03385854;
                } else {
                    var72 = 0.0;
                }
            }
        } else {
            if (inputs[21] < 2.851763) {
                if (inputs[22] < 1.0) {
                    if (inputs[23] < 10.870579) {
                        if (inputs[32] < -0.575) {
                            var72 = 0.033162337;
                        } else {
                            if (inputs[17] < 1.2573719) {
                                var72 = 0.017213888;
                            } else {
                                var72 = -0.0150685;
                            }
                        }
                    } else {
                        var72 = -0.020093825;
                    }
                } else {
                    if (inputs[20] < 0.4309123) {
                        var72 = 0.012986486;
                    } else {
                        var72 = 0.047360003;
                    }
                }
            } else {
                if (inputs[33] < 0.7260882) {
                    var72 = 0.005631424;
                } else {
                    var72 = -0.04007545;
                }
            }
        }
    }
    double var73;
    if (inputs[10] < 2.1525) {
        if (inputs[28] < 8.680083) {
            var73 = -0.020324953;
        } else {
            if (inputs[9] < 4.2775) {
                if (inputs[12] < 1849.5) {
                    if (inputs[28] < 12.435264) {
                        var73 = 0.010123649;
                    } else {
                        if (inputs[32] < 0.665) {
                            var73 = -0.042543504;
                        } else {
                            var73 = 0.0;
                        }
                    }
                } else {
                    if (inputs[26] < 29.357567) {
                        if (inputs[3] < 1923.72) {
                            var73 = 0.049453415;
                        } else {
                            var73 = 0.0;
                        }
                    } else {
                        var73 = -0.013445043;
                    }
                }
            } else {
                if (inputs[38] < 10.0) {
                    var73 = 0.0;
                } else {
                    if (inputs[19] < 2.029605) {
                        var73 = 0.0462222;
                    } else {
                        var73 = 0.013400145;
                    }
                }
            }
        }
    } else {
        if (inputs[25] < 2.453271) {
            if (inputs[20] < 0.1593122) {
                var73 = 0.040173993;
            } else {
                var73 = -0.020674553;
            }
        } else {
            if (inputs[11] < 0.38) {
                if (inputs[26] < 29.810007) {
                    var73 = -0.06666674;
                } else {
                    if (inputs[33] < 1.1176146) {
                        var73 = -0.03232518;
                    } else {
                        var73 = 0.0071572475;
                    }
                }
            } else {
                var73 = 0.0052476265;
            }
        }
    }
    double var74;
    if (inputs[28] < 16.36298) {
        if (inputs[25] < 2.5521367) {
            if (inputs[25] < 2.502924) {
                if (inputs[28] < 8.592158) {
                    var74 = -0.015398536;
                } else {
                    if (inputs[16] < 0.19218796) {
                        if (inputs[31] < 8.92) {
                            var74 = 0.0010962847;
                        } else {
                            var74 = 0.048253402;
                        }
                    } else {
                        var74 = -0.0007628492;
                    }
                }
            } else {
                var74 = 0.035895273;
            }
        } else {
            if (inputs[20] < -0.31441432) {
                var74 = -0.03821248;
            } else {
                var74 = 0.010984391;
            }
        }
    } else {
        if (inputs[21] < -1.6590085) {
            if (inputs[20] < 0.84939736) {
                if (inputs[2] < 1.3114285) {
                    var74 = -0.031601828;
                } else {
                    if (inputs[9] < 5.58) {
                        if (inputs[21] < -2.3871498) {
                            var74 = 0.037927188;
                        } else {
                            var74 = -0.0046385005;
                        }
                    } else {
                        var74 = -0.022449663;
                    }
                }
            } else {
                if (inputs[29] < 1.205) {
                    var74 = 0.040310703;
                } else {
                    if (inputs[23] < -19.934069) {
                        var74 = -0.012006848;
                    } else {
                        var74 = 0.016133927;
                    }
                }
            }
        } else {
            var74 = -0.040057473;
        }
    }
    double var75;
    if (inputs[1] < 29.37446) {
        if (inputs[23] < -24.494602) {
            var75 = -0.033318795;
        } else {
            if (inputs[14] < -0.97) {
                var75 = -0.011679758;
            } else {
                var75 = 0.014720959;
            }
        }
    } else {
        if (inputs[27] < 30.085005) {
            if (inputs[19] < 1.7002832) {
                if (inputs[11] < 0.37) {
                    var75 = -0.024090251;
                } else {
                    if (inputs[18] < 1.1480371) {
                        var75 = 0.029901493;
                    } else {
                        if (inputs[20] < 0.34337434) {
                            var75 = 0.004719514;
                        } else {
                            var75 = -0.020831885;
                        }
                    }
                }
            } else {
                if (inputs[19] < 2.1216297) {
                    if (inputs[26] < 25.94796) {
                        var75 = 0.014748218;
                    } else {
                        var75 = 0.05437809;
                    }
                } else {
                    if (inputs[19] < 3.0669494) {
                        var75 = -0.016226213;
                    } else {
                        var75 = 0.021323403;
                    }
                }
            }
        } else {
            if (inputs[37] < 3.11) {
                var75 = -0.029011216;
            } else {
                if (inputs[18] < 1.2695625) {
                    var75 = -0.026093673;
                } else {
                    if (inputs[33] < 0.7572481) {
                        var75 = 0.03464787;
                    } else {
                        var75 = -0.0030534284;
                    }
                }
            }
        }
    }
    double var76;
    if (inputs[29] < 0.4625) {
        if (inputs[17] < 1.1182593) {
            var76 = -0.012067677;
        } else {
            if (inputs[19] < 1.3364837) {
                var76 = 0.0;
            } else {
                var76 = 0.04005024;
            }
        }
    } else {
        if (inputs[29] < 0.755) {
            var76 = -0.023086622;
        } else {
            if (inputs[29] < 1.205) {
                if (inputs[2] < 1.6121428) {
                    var76 = 0.0;
                } else {
                    var76 = 0.043100715;
                }
            } else {
                if (inputs[29] < 2.2675) {
                    if (inputs[20] < -0.11844581) {
                        if (inputs[25] < 2.5021186) {
                            var76 = -0.01484457;
                        } else {
                            var76 = 0.02554109;
                        }
                    } else {
                        if (inputs[36] < -3.7361963) {
                            var76 = -0.000077938836;
                        } else {
                            var76 = -0.049813874;
                        }
                    }
                } else {
                    if (inputs[36] < 1.7406528) {
                        if (inputs[35] < -3.7087946) {
                            var76 = -0.0064195963;
                        } else {
                            if (inputs[1] < 35.807934) {
                                var76 = 0.055764295;
                            } else {
                                var76 = 0.008958108;
                            }
                        }
                    } else {
                        if (inputs[35] < 3.830675) {
                            var76 = -0.0307237;
                        } else {
                            var76 = 0.013754424;
                        }
                    }
                }
            }
        }
    }
    double var77;
    if (inputs[9] < 2.41) {
        if (inputs[27] < 23.893877) {
            if (inputs[27] < 13.02307) {
                var77 = 0.0012921569;
            } else {
                var77 = 0.046458445;
            }
        } else {
            var77 = -0.0007334183;
        }
    } else {
        if (inputs[26] < 27.55119) {
            if (inputs[26] < 23.615837) {
                if (inputs[2] < 1.5721428) {
                    var77 = 0.02359707;
                } else {
                    if (inputs[11] < 0.32) {
                        var77 = 0.0091918195;
                    } else {
                        var77 = -0.03664695;
                    }
                }
            } else {
                if (inputs[11] < 0.38) {
                    var77 = -0.048776846;
                } else {
                    var77 = -0.0028571687;
                }
            }
        } else {
            if (inputs[26] < 31.036274) {
                if (inputs[13] < 1831.56) {
                    var77 = 0.04826592;
                } else {
                    var77 = 0.0;
                }
            } else {
                if (inputs[23] < -31.334112) {
                    if (inputs[27] < 9.872094) {
                        var77 = -0.04584183;
                    } else {
                        var77 = 0.0;
                    }
                } else {
                    if (inputs[21] < 3.3075356) {
                        if (inputs[5] < 1913.95) {
                            if (inputs[3] < 1844.265) {
                                var77 = 0.015152743;
                            } else {
                                var77 = 0.04842832;
                            }
                        } else {
                            var77 = -0.010422948;
                        }
                    } else {
                        var77 = -0.01903417;
                    }
                }
            }
        }
    }
    double var78;
    if (inputs[18] < 3.5007954) {
        if (inputs[11] < 0.21) {
            var78 = 0.028942525;
        } else {
            if (inputs[33] < 1.3552501) {
                if (inputs[28] < 8.38395) {
                    if (inputs[5] < 1838.9) {
                        var78 = -0.03816738;
                    } else {
                        var78 = 0.0018045518;
                    }
                } else {
                    if (inputs[9] < 6.5925) {
                        if (inputs[28] < 35.717934) {
                            if (inputs[23] < -54.19395) {
                                var78 = -0.00929394;
                            } else {
                                if (inputs[16] < 0.029842105) {
                                    if (inputs[31] < -3.475) {
                                        var78 = 0.011185201;
                                    } else {
                                        var78 = 0.047753647;
                                    }
                                } else {
                                    if (inputs[35] < 2.844461) {
                                        var78 = -0.009164634;
                                    } else {
                                        var78 = 0.027827391;
                                    }
                                }
                            }
                        } else {
                            var78 = -0.0124984095;
                        }
                    } else {
                        if (inputs[38] < 15.0) {
                            var78 = -0.03802188;
                        } else {
                            var78 = 0.0014365078;
                        }
                    }
                }
            } else {
                var78 = -0.023246847;
            }
        }
    } else {
        var78 = -0.032100815;
    }
    double var79;
    if (inputs[23] < -36.984165) {
        if (inputs[33] < 0.7459095) {
            if (inputs[3] < 1807.91) {
                var79 = 0.024207324;
            } else {
                var79 = -0.0078256;
            }
        } else {
            var79 = -0.04098989;
        }
    } else {
        if (inputs[1] < 68.104) {
            if (inputs[23] < 12.870723) {
                if (inputs[28] < 35.717934) {
                    if (inputs[33] < 0.69977564) {
                        var79 = 0.048170213;
                    } else {
                        if (inputs[18] < 1.3450353) {
                            var79 = -0.0064218207;
                        } else {
                            if (inputs[34] < 1.6851852) {
                                if (inputs[1] < 40.13896) {
                                    if (inputs[1] < 29.872828) {
                                        var79 = 0.0;
                                    } else {
                                        var79 = 0.02926993;
                                    }
                                } else {
                                    var79 = -0.008340598;
                                }
                            } else {
                                var79 = 0.04364453;
                            }
                        }
                    }
                } else {
                    var79 = -0.015880022;
                }
            } else {
                var79 = -0.012904514;
            }
        } else {
            if (inputs[38] < 14.0) {
                var79 = 0.0046835495;
            } else {
                var79 = -0.0251016;
            }
        }
    }
    double var80;
    if (inputs[15] < 0.36454546) {
        if (inputs[37] < 3.115) {
            if (inputs[23] < -2.2112257) {
                if (inputs[26] < 32.414757) {
                    if (inputs[26] < 26.074417) {
                        var80 = -0.0154658975;
                    } else {
                        var80 = 0.020807153;
                    }
                } else {
                    if (inputs[27] < 7.50849) {
                        var80 = -0.00067696645;
                    } else {
                        var80 = -0.03645777;
                    }
                }
            } else {
                if (inputs[20] < 0.83210975) {
                    if (inputs[15] < -0.3949697) {
                        var80 = -0.012964385;
                    } else {
                        var80 = 0.01914023;
                    }
                } else {
                    var80 = 0.03308198;
                }
            }
        } else {
            if (inputs[35] < 2.7870371) {
                var80 = -0.050005622;
            } else {
                var80 = 0.0;
            }
        }
    } else {
        if (inputs[37] < 0.945) {
            var80 = -0.008848617;
        } else {
            if (inputs[18] < 1.7636102) {
                if (inputs[1] < 69.51098) {
                    var80 = 0.051733647;
                } else {
                    var80 = 0.01072738;
                }
            } else {
                if (inputs[31] < 2.14) {
                    var80 = 0.018396309;
                } else {
                    var80 = -0.01676329;
                }
            }
        }
    }
    double var81;
    if (inputs[19] < 2.1216297) {
        if (inputs[19] < 1.8400551) {
            if (inputs[33] < 0.73342574) {
                if (inputs[13] < 1805.64) {
                    if (inputs[11] < 0.39) {
                        var81 = 0.0026089235;
                    } else {
                        var81 = 0.042587847;
                    }
                } else {
                    if (inputs[13] < 1882.85) {
                        var81 = -0.020161709;
                    } else {
                        if (inputs[17] < 1.1467938) {
                            var81 = -0.008668914;
                        } else {
                            var81 = 0.02840041;
                        }
                    }
                }
            } else {
                if (inputs[3] < 1840.14) {
                    if (inputs[1] < 65.37441) {
                        var81 = -0.046150766;
                    } else {
                        var81 = 0.0;
                    }
                } else {
                    if (inputs[3] < 1868.71) {
                        var81 = 0.030169412;
                    } else {
                        var81 = -0.0117861945;
                    }
                }
            }
        } else {
            if (inputs[38] < 16.0) {
                var81 = 0.0;
            } else {
                var81 = 0.04385122;
            }
        }
    } else {
        if (inputs[19] < 2.5699441) {
            var81 = -0.027570192;
        } else {
            if (inputs[36] < -2.796875) {
                var81 = -0.016459627;
            } else {
                if (inputs[25] < 2.50028) {
                    var81 = -0.0014713631;
                } else {
                    var81 = 0.03242423;
                }
            }
        }
    }
    double var82;
    if (inputs[29] < 0.7525) {
        if (inputs[24] < 11.328976) {
            if (inputs[16] < -0.15834586) {
                var82 = 0.0006315442;
            } else {
                var82 = -0.03785826;
            }
        } else {
            var82 = 0.0027282545;
        }
    } else {
        if (inputs[16] < -0.3634436) {
            var82 = -0.02847243;
        } else {
            if (inputs[10] < 0.175) {
                var82 = -0.018395592;
            } else {
                if (inputs[17] < 1.1301504) {
                    if (inputs[18] < 1.4822716) {
                        if (inputs[29] < 1.8225) {
                            var82 = 0.028074626;
                        } else {
                            var82 = -0.008624917;
                        }
                    } else {
                        var82 = 0.058089063;
                    }
                } else {
                    if (inputs[23] < -6.972576) {
                        if (inputs[29] < 1.8175) {
                            var82 = 0.004044467;
                        } else {
                            var82 = -0.026844857;
                        }
                    } else {
                        if (inputs[27] < 9.991337) {
                            var82 = 0.056615982;
                        } else {
                            if (inputs[29] < 2.025) {
                                var82 = -0.021426644;
                            } else {
                                if (inputs[28] < 12.739906) {
                                    var82 = 0.03313525;
                                } else {
                                    var82 = -0.00057398615;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var83;
    if (inputs[25] < 2.5008433) {
        if (inputs[21] < -3.384466) {
            var83 = -0.020225259;
        } else {
            if (inputs[25] < 2.498452) {
                if (inputs[15] < -0.5772121) {
                    var83 = 0.031854507;
                } else {
                    if (inputs[13] < 1803.36) {
                        if (inputs[29] < 1.05) {
                            var83 = 0.03315244;
                        } else {
                            var83 = 0.0;
                        }
                    } else {
                        if (inputs[29] < 2.865) {
                            if (inputs[3] < 1854.05) {
                                var83 = -0.038139407;
                            } else {
                                if (inputs[31] < 5.035) {
                                    var83 = -0.022429368;
                                } else {
                                    var83 = 0.009638113;
                                }
                            }
                        } else {
                            var83 = 0.010700585;
                        }
                    }
                }
            } else {
                var83 = 0.037691433;
            }
        }
    } else {
        if (inputs[8] < 1793.8) {
            var83 = -0.03316925;
        } else {
            if (inputs[26] < 34.246445) {
                if (inputs[21] < -2.0924575) {
                    var83 = -0.04424942;
                } else {
                    if (inputs[26] < 26.144474) {
                        var83 = 0.015398278;
                    } else {
                        var83 = -0.014483174;
                    }
                }
            } else {
                if (inputs[13] < 1909.43) {
                    var83 = 0.03035256;
                } else {
                    var83 = 0.0;
                }
            }
        }
    }
    double var84;
    if (inputs[18] < 1.5769857) {
        if (inputs[11] < 0.4) {
            if (inputs[32] < 13.07) {
                if (inputs[15] < -0.3449091) {
                    var84 = 0.0;
                } else {
                    if (inputs[29] < 1.0375) {
                        var84 = -0.06154692;
                    } else {
                        var84 = -0.015222803;
                    }
                }
            } else {
                var84 = 0.011525178;
            }
        } else {
            if (inputs[9] < 4.015) {
                if (inputs[8] < 1846.2) {
                    var84 = -0.027431611;
                } else {
                    var84 = 0.0072272895;
                }
            } else {
                var84 = 0.027791928;
            }
        }
    } else {
        if (inputs[28] < 35.46188) {
            if (inputs[2] < 1.78) {
                if (inputs[28] < 11.492314) {
                    var84 = 0.00089349435;
                } else {
                    var84 = 0.049012825;
                }
            } else {
                if (inputs[27] < 30.12914) {
                    if (inputs[17] < 1.3881873) {
                        var84 = -0.01961363;
                    } else {
                        if (inputs[22] < 1.0) {
                            var84 = 0.0;
                        } else {
                            if (inputs[36] < -1.4442883) {
                                var84 = 0.0056677232;
                            } else {
                                var84 = 0.045311455;
                            }
                        }
                    }
                } else {
                    var84 = -0.025171923;
                }
            }
        } else {
            var84 = -0.0136332335;
        }
    }
    double var85;
    if (inputs[10] < 2.1525) {
        if (inputs[36] < 1.5455877) {
            if (inputs[14] < -0.577) {
                if (inputs[23] < -4.4088664) {
                    if (inputs[18] < 1.3506817) {
                        var85 = 0.011115081;
                    } else {
                        var85 = -0.035977468;
                    }
                } else {
                    if (inputs[26] < 28.314356) {
                        var85 = 0.0;
                    } else {
                        var85 = 0.037652645;
                    }
                }
            } else {
                if (inputs[31] < 0.75) {
                    var85 = 0.012358359;
                } else {
                    var85 = 0.06251849;
                }
            }
        } else {
            if (inputs[14] < 0.561) {
                var85 = -0.03838662;
            } else {
                if (inputs[16] < 0.124849625) {
                    var85 = 0.019861894;
                } else {
                    if (inputs[16] < 0.23542857) {
                        var85 = -0.028074881;
                    } else {
                        var85 = 0.0049327076;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 30.784996) {
            if (inputs[29] < 1.205) {
                var85 = 0.0;
            } else {
                var85 = -0.05934718;
            }
        } else {
            if (inputs[2] < 1.6514286) {
                var85 = 0.017512364;
            } else {
                if (inputs[18] < 1.9671746) {
                    var85 = -0.04224789;
                } else {
                    var85 = 0.007414167;
                }
            }
        }
    }
    double var86;
    if (inputs[15] < -0.24606061) {
        if (inputs[25] < 2.5039165) {
            if (inputs[5] < 1782.8824) {
                var86 = -0.003845267;
            } else {
                if (inputs[34] < -2.9504325) {
                    var86 = 0.0;
                } else {
                    if (inputs[35] < -3.3051302) {
                        var86 = 0.044670135;
                    } else {
                        var86 = 0.014127631;
                    }
                }
            }
        } else {
            if (inputs[25] < 2.545069) {
                var86 = -0.041742902;
            } else {
                var86 = 0.012892759;
            }
        }
    } else {
        if (inputs[28] < 16.36298) {
            if (inputs[27] < 23.976524) {
                var86 = 0.024423791;
            } else {
                if (inputs[32] < -4.21) {
                    if (inputs[24] < 21.00339) {
                        var86 = 0.0;
                    } else {
                        var86 = 0.03144821;
                    }
                } else {
                    if (inputs[28] < 7.917422) {
                        var86 = -0.040073328;
                    } else {
                        if (inputs[24] < 9.748975) {
                            var86 = 0.024065759;
                        } else {
                            if (inputs[19] < 1.6007417) {
                                var86 = 0.0064946655;
                            } else {
                                var86 = -0.03905366;
                            }
                        }
                    }
                }
            }
        } else {
            var86 = -0.031529646;
        }
    }
    double var87;
    if (inputs[36] < 2.6598606) {
        if (inputs[36] < 2.318771) {
            if (inputs[27] < 23.976524) {
                if (inputs[36] < -1.239904) {
                    if (inputs[20] < 1.4213508) {
                        if (inputs[10] < 2.1525) {
                            if (inputs[25] < 2.5316575) {
                                if (inputs[27] < 11.147679) {
                                    if (inputs[21] < -2.8800974) {
                                        var87 = -0.019158477;
                                    } else {
                                        var87 = 0.035694055;
                                    }
                                } else {
                                    var87 = -0.030115725;
                                }
                            } else {
                                var87 = 0.02490503;
                            }
                        } else {
                            if (inputs[13] < 1824.75) {
                                var87 = 0.0;
                            } else {
                                var87 = -0.04132743;
                            }
                        }
                    } else {
                        var87 = 0.026143447;
                    }
                } else {
                    var87 = 0.036532078;
                }
            } else {
                var87 = -0.022650074;
            }
        } else {
            var87 = 0.029659823;
        }
    } else {
        if (inputs[36] < 3.5639067) {
            var87 = -0.03835882;
        } else {
            if (inputs[28] < 12.435264) {
                if (inputs[20] < -1.1541334) {
                    var87 = 0.03061549;
                } else {
                    if (inputs[10] < 2.49) {
                        var87 = -0.020306481;
                    } else {
                        var87 = 0.0066278055;
                    }
                }
            } else {
                var87 = -0.031072577;
            }
        }
    }
    double var88;
    if (inputs[3] < 1974.84) {
        if (inputs[4] < 1935.9) {
            if (inputs[3] < 1924.845) {
                if (inputs[28] < 13.650999) {
                    if (inputs[25] < 2.5316575) {
                        if (inputs[9] < 3.38) {
                            var88 = -0.0057968283;
                        } else {
                            if (inputs[20] < -0.7978583) {
                                var88 = 0.04768786;
                            } else {
                                var88 = 0.010218004;
                            }
                        }
                    } else {
                        var88 = -0.0063279807;
                    }
                } else {
                    if (inputs[15] < -0.2869091) {
                        if (inputs[20] < 1.4213508) {
                            if (inputs[15] < -0.39769697) {
                                if (inputs[36] < -3.7361963) {
                                    var88 = 0.0;
                                } else {
                                    var88 = -0.0339588;
                                }
                            } else {
                                var88 = 0.020927936;
                            }
                        } else {
                            var88 = 0.02761156;
                        }
                    } else {
                        if (inputs[9] < 4.665) {
                            var88 = 0.0;
                        } else {
                            var88 = -0.053456794;
                        }
                    }
                }
            } else {
                var88 = -0.029518383;
            }
        } else {
            if (inputs[33] < 0.82796216) {
                var88 = 0.035925362;
            } else {
                var88 = 0.0030108755;
            }
        }
    } else {
        var88 = -0.025848234;
    }
    double var89;
    if (inputs[17] < 2.5215201) {
        if (inputs[33] < 1.2019886) {
            if (inputs[19] < 1.9990045) {
                if (inputs[21] < -3.5300546) {
                    var89 = 0.028855031;
                } else {
                    if (inputs[20] < -0.039020076) {
                        if (inputs[21] < 2.5932102) {
                            if (inputs[20] < -0.5130412) {
                                if (inputs[2] < 1.4821428) {
                                    var89 = -0.037460025;
                                } else {
                                    var89 = 0.0;
                                }
                            } else {
                                var89 = 0.015914397;
                            }
                        } else {
                            if (inputs[24] < 18.7761) {
                                var89 = 0.0;
                            } else {
                                var89 = 0.04184521;
                            }
                        }
                    } else {
                        if (inputs[26] < 29.357567) {
                            if (inputs[32] < -5.38) {
                                var89 = 0.024105892;
                            } else {
                                var89 = -0.010536996;
                            }
                        } else {
                            if (inputs[15] < -0.24606061) {
                                var89 = -0.008957896;
                            } else {
                                var89 = -0.057077046;
                            }
                        }
                    }
                }
            } else {
                var89 = -0.024814524;
            }
        } else {
            if (inputs[21] < -1.8732743) {
                var89 = 0.03232156;
            } else {
                if (inputs[31] < 9.39) {
                    var89 = -0.013980358;
                } else {
                    var89 = 0.02622371;
                }
            }
        }
    } else {
        var89 = -0.020551858;
    }
    double var90;
    if (inputs[19] < 1.4164727) {
        if (inputs[38] < 12.0) {
            if (inputs[20] < -0.5130412) {
                var90 = -0.012215324;
            } else {
                if (inputs[38] < 9.0) {
                    var90 = -0.005544943;
                } else {
                    var90 = 0.029510383;
                }
            }
        } else {
            if (inputs[32] < 5.09) {
                var90 = -0.038941484;
            } else {
                var90 = 0.0;
            }
        }
    } else {
        if (inputs[9] < 2.49) {
            if (inputs[16] < 0.040030073) {
                var90 = 0.0436103;
            } else {
                var90 = 0.0028851242;
            }
        } else {
            if (inputs[5] < 1772.48) {
                var90 = -0.034434717;
            } else {
                if (inputs[15] < 0.47533333) {
                    if (inputs[14] < 0.682) {
                        if (inputs[19] < 1.9812647) {
                            if (inputs[33] < 0.8023278) {
                                var90 = 0.0;
                            } else {
                                var90 = 0.037982;
                            }
                        } else {
                            if (inputs[11] < 0.21) {
                                var90 = 0.012132801;
                            } else {
                                var90 = -0.03060377;
                            }
                        }
                    } else {
                        var90 = -0.031560995;
                    }
                } else {
                    if (inputs[15] < 0.6545454) {
                        var90 = 0.050811257;
                    } else {
                        var90 = 0.0;
                    }
                }
            }
        }
    }
    double var91;
    if (inputs[1] < 69.51098) {
        if (inputs[23] < -35.18622) {
            if (inputs[20] < 1.3530874) {
                if (inputs[3] < 1807.91) {
                    var91 = 0.0;
                } else {
                    var91 = -0.04393551;
                }
            } else {
                var91 = 0.013495638;
            }
        } else {
            if (inputs[18] < 2.7831962) {
                if (inputs[33] < 0.6874246) {
                    if (inputs[33] < 0.5987603) {
                        var91 = 0.0038225085;
                    } else {
                        var91 = 0.038582038;
                    }
                } else {
                    if (inputs[33] < 0.7915542) {
                        var91 = -0.033601444;
                    } else {
                        if (inputs[19] < 2.173166) {
                            if (inputs[19] < 1.7945263) {
                                if (inputs[3] < 1840.14) {
                                    var91 = -0.020388369;
                                } else {
                                    var91 = 0.026224267;
                                }
                            } else {
                                var91 = 0.041532848;
                            }
                        } else {
                            if (inputs[13] < 1880.57) {
                                var91 = 0.003730175;
                            } else {
                                var91 = -0.028529916;
                            }
                        }
                    }
                }
            } else {
                var91 = 0.03680834;
            }
        }
    } else {
        if (inputs[20] < -0.8732041) {
            var91 = 0.009768744;
        } else {
            if (inputs[10] < 1.2975) {
                var91 = -0.0026826216;
            } else {
                var91 = -0.03966144;
            }
        }
    }
    double var92;
    if (inputs[19] < 1.3839855) {
        if (inputs[11] < 0.4) {
            if (inputs[35] < 1.298409) {
                var92 = -0.0054250397;
            } else {
                var92 = -0.04208315;
            }
        } else {
            if (inputs[26] < 23.058739) {
                var92 = 0.021712115;
            } else {
                if (inputs[3] < 1825.04) {
                    var92 = 0.013100331;
                } else {
                    var92 = -0.032002296;
                }
            }
        }
    } else {
        if (inputs[33] < 0.6929307) {
            if (inputs[2] < 1.1721429) {
                var92 = 0.0;
            } else {
                var92 = 0.04082193;
            }
        } else {
            if (inputs[21] < -3.227704) {
                var92 = -0.03885786;
            } else {
                if (inputs[14] < -1.148) {
                    var92 = 0.030135015;
                } else {
                    if (inputs[14] < -0.588) {
                        var92 = -0.022526966;
                    } else {
                        if (inputs[20] < 0.4309123) {
                            if (inputs[10] < 3.685) {
                                if (inputs[29] < 1.705) {
                                    var92 = 0.00385819;
                                } else {
                                    var92 = -0.03118089;
                                }
                            } else {
                                var92 = 0.016774371;
                            }
                        } else {
                            if (inputs[37] < 4.115) {
                                var92 = 0.03686011;
                            } else {
                                var92 = 0.0;
                            }
                        }
                    }
                }
            }
        }
    }
    double var93;
    if (inputs[25] < 2.4968355) {
        if (inputs[11] < 0.32) {
            if (inputs[11] < 0.29) {
                if (inputs[5] < 1829.2675) {
                    var93 = 0.016411543;
                } else {
                    var93 = -0.025038535;
                }
            } else {
                var93 = 0.03234235;
            }
        } else {
            if (inputs[9] < 2.89) {
                var93 = -0.048852723;
            } else {
                if (inputs[9] < 5.2975) {
                    var93 = 0.00937845;
                } else {
                    var93 = -0.025250005;
                }
            }
        }
    } else {
        if (inputs[25] < 2.5008433) {
            if (inputs[16] < -0.10721804) {
                var93 = 0.0;
            } else {
                var93 = 0.043123506;
            }
        } else {
            if (inputs[10] < 1.015) {
                if (inputs[37] < 4.46) {
                    if (inputs[15] < -0.21527272) {
                        var93 = 0.0;
                    } else {
                        var93 = 0.03684703;
                    }
                } else {
                    var93 = -0.010749025;
                }
            } else {
                if (inputs[33] < 1.2360153) {
                    if (inputs[33] < 0.73148984) {
                        if (inputs[9] < 4.8075) {
                            var93 = 0.013603679;
                        } else {
                            var93 = -0.013240926;
                        }
                    } else {
                        var93 = -0.043988723;
                    }
                } else {
                    var93 = 0.010767406;
                }
            }
        }
    }
    double var94;
    if (inputs[35] < 6.134671) {
        if (inputs[36] < 4.820513) {
            if (inputs[21] < -3.6367188) {
                var94 = 0.024928622;
            } else {
                if (inputs[1] < 31.394823) {
                    if (inputs[23] < -14.959898) {
                        var94 = -0.029232472;
                    } else {
                        var94 = 0.0;
                    }
                } else {
                    if (inputs[32] < -0.97) {
                        if (inputs[8] < 1791.47) {
                            var94 = -0.006526957;
                        } else {
                            if (inputs[31] < -3.93) {
                                if (inputs[9] < 5.1775) {
                                    if (inputs[11] < 0.38) {
                                        var94 = -0.017226823;
                                    } else {
                                        var94 = 0.02292122;
                                    }
                                } else {
                                    var94 = 0.035564914;
                                }
                            } else {
                                var94 = 0.043206826;
                            }
                        }
                    } else {
                        if (inputs[20] < -0.31803) {
                            if (inputs[29] < 1.105) {
                                var94 = 0.0;
                            } else {
                                var94 = -0.04499342;
                            }
                        } else {
                            if (inputs[20] < 0.09811004) {
                                var94 = 0.034430526;
                            } else {
                                if (inputs[30] < 1.0) {
                                    var94 = 0.012595472;
                                } else {
                                    var94 = -0.025479786;
                                }
                            }
                        }
                    }
                }
            }
        } else {
            var94 = 0.02388236;
        }
    } else {
        var94 = -0.02000688;
    }
    double var95;
    if (inputs[26] < 27.024124) {
        if (inputs[12] < 1924.93) {
            if (inputs[16] < -0.11565413) {
                var95 = -0.019578137;
            } else {
                if (inputs[16] < 0.06866165) {
                    if (inputs[29] < 1.165) {
                        var95 = 0.03445136;
                    } else {
                        var95 = 0.0020476049;
                    }
                } else {
                    var95 = -0.0078679975;
                }
            }
        } else {
            var95 = -0.02677097;
        }
    } else {
        if (inputs[26] < 31.036274) {
            if (inputs[16] < -0.08784211) {
                var95 = 0.048111062;
            } else {
                var95 = 0.0005804021;
            }
        } else {
            if (inputs[23] < -30.880308) {
                if (inputs[27] < 11.037668) {
                    var95 = -0.05400368;
                } else {
                    var95 = 0.004546964;
                }
            } else {
                if (inputs[2] < 1.3592857) {
                    var95 = -0.012603114;
                } else {
                    if (inputs[6] < 1839.435) {
                        var95 = 0.032342378;
                    } else {
                        if (inputs[3] < 1929.455) {
                            var95 = -0.007930707;
                        } else {
                            var95 = 0.022468032;
                        }
                    }
                }
            }
        }
    }
    double var96;
    if (inputs[37] < 0.705) {
        if (inputs[16] < 0.03613534) {
            if (inputs[30] < 0.0) {
                if (inputs[9] < 5.0075) {
                    if (inputs[10] < 1.405) {
                        if (inputs[3] < 1901.94) {
                            var96 = -0.017455185;
                        } else {
                            var96 = 0.02118793;
                        }
                    } else {
                        var96 = 0.03560114;
                    }
                } else {
                    if (inputs[21] < -2.9993966) {
                        var96 = 0.0;
                    } else {
                        var96 = -0.0320145;
                    }
                }
            } else {
                var96 = 0.022468092;
            }
        } else {
            var96 = -0.0336578;
        }
    } else {
        if (inputs[35] < 1.2208858) {
            var96 = -0.020233816;
        } else {
            if (inputs[31] < 16.13) {
                if (inputs[20] < 0.111824706) {
                    if (inputs[20] < -0.4953674) {
                        if (inputs[27] < 31.352167) {
                            var96 = 0.023802187;
                        } else {
                            var96 = 0.0;
                        }
                    } else {
                        var96 = 0.051447216;
                    }
                } else {
                    var96 = 0.0;
                }
            } else {
                var96 = -0.013361642;
            }
        }
    }
    double var97;
    if (inputs[16] < -0.3255639) {
        var97 = -0.016313843;
    } else {
        if (inputs[29] < 3.165) {
            if (inputs[24] < -20.538118) {
                if (inputs[19] < 1.4164727) {
                    var97 = 0.0;
                } else {
                    var97 = 0.0301239;
                }
            } else {
                if (inputs[35] < -2.9364562) {
                    var97 = -0.030464876;
                } else {
                    if (inputs[32] < -16.28) {
                        var97 = 0.028773615;
                    } else {
                        if (inputs[16] < 0.052481204) {
                            if (inputs[15] < -0.25133333) {
                                var97 = -0.009982229;
                            } else {
                                var97 = 0.035370134;
                            }
                        } else {
                            if (inputs[37] < 1.665) {
                                var97 = -0.039980832;
                            } else {
                                if (inputs[37] < 13.56) {
                                    if (inputs[15] < 0.38787878) {
                                        var97 = -0.0044668103;
                                    } else {
                                        var97 = 0.029308587;
                                    }
                                } else {
                                    var97 = -0.023782665;
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if (inputs[1] < 40.13896) {
                var97 = 0.046568286;
            } else {
                var97 = 0.003085728;
            }
        }
    }
    double var98;
    if (inputs[1] < 34.41875) {
        if (inputs[26] < 28.314356) {
            var98 = -0.028638404;
        } else {
            if (inputs[37] < -3.895) {
                if (inputs[34] < -3.1793892) {
                    var98 = 0.031720396;
                } else {
                    if (inputs[26] < 36.31574) {
                        var98 = 0.015901247;
                    } else {
                        var98 = -0.015793977;
                    }
                }
            } else {
                var98 = -0.017701646;
            }
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[37] < -4.64) {
                var98 = 0.0;
            } else {
                var98 = 0.03967482;
            }
        } else {
            if (inputs[34] < 2.2002673) {
                if (inputs[17] < 1.26158) {
                    var98 = 0.0;
                } else {
                    if (inputs[33] < 1.1026729) {
                        var98 = -0.040692173;
                    } else {
                        var98 = -0.0069701783;
                    }
                }
            } else {
                if (inputs[20] < -0.7257052) {
                    if (inputs[36] < 5.380597) {
                        var98 = 0.0070298724;
                    } else {
                        var98 = 0.04097135;
                    }
                } else {
                    if (inputs[10] < 0.5475) {
                        var98 = 0.020886935;
                    } else {
                        if (inputs[5] < 1838.1825) {
                            var98 = 0.0;
                        } else {
                            var98 = -0.028328173;
                        }
                    }
                }
            }
        }
    }
    double var99;
    if (inputs[38] < 21.0) {
        if (inputs[9] < 2.49) {
            if (inputs[25] < 2.4900498) {
                var99 = -0.007261099;
            } else {
                if (inputs[26] < 31.68773) {
                    var99 = 0.010720355;
                } else {
                    var99 = 0.049790505;
                }
            }
        } else {
            if (inputs[9] < 4.2775) {
                if (inputs[37] < -1.875) {
                    var99 = -0.03521145;
                } else {
                    if (inputs[37] < 6.35) {
                        if (inputs[10] < 0.4875) {
                            var99 = 0.026536463;
                        } else {
                            var99 = -0.00068315817;
                        }
                    } else {
                        var99 = -0.030413374;
                    }
                }
            } else {
                if (inputs[25] < 2.5949721) {
                    if (inputs[17] < 2.3065593) {
                        if (inputs[19] < 1.3572291) {
                            if (inputs[11] < 0.4) {
                                var99 = -0.018599715;
                            } else {
                                var99 = 0.011832619;
                            }
                        } else {
                            if (inputs[16] < -0.29627067) {
                                var99 = -0.00006541221;
                            } else {
                                if (inputs[38] < 12.0) {
                                    var99 = 0.0019170824;
                                } else {
                                    if (inputs[8] < 1841.37) {
                                        var99 = 0.047999296;
                                    } else {
                                        var99 = 0.022117993;
                                    }
                                }
                            }
                        }
                    } else {
                        var99 = -0.009362336;
                    }
                } else {
                    var99 = -0.016605305;
                }
            }
        }
    } else {
        var99 = -0.020517476;
    }
    double var100;
    if (inputs[37] < -20.79) {
        var100 = -0.018550115;
    } else {
        if (inputs[32] < -16.28) {
            var100 = 0.024692975;
        } else {
            if (inputs[9] < 4.2175) {
                if (inputs[2] < 1.1107143) {
                    var100 = -0.0407673;
                } else {
                    if (inputs[31] < -6.415) {
                        var100 = -0.03275824;
                    } else {
                        if (inputs[32] < 1.36) {
                            if (inputs[10] < 0.47) {
                                var100 = 0.030768469;
                            } else {
                                var100 = 0.0;
                            }
                        } else {
                            if (inputs[32] < 8.835) {
                                var100 = -0.025910078;
                            } else {
                                var100 = 0.0021801624;
                            }
                        }
                    }
                }
            } else {
                if (inputs[25] < 2.5667245) {
                    if (inputs[9] < 5.2025) {
                        if (inputs[21] < -2.0924575) {
                            var100 = 0.04889117;
                        } else {
                            var100 = 0.016468449;
                        }
                    } else {
                        if (inputs[26] < 52.06376) {
                            if (inputs[3] < 1876.58) {
                                if (inputs[16] < -0.1188797) {
                                    var100 = -0.047998883;
                                } else {
                                    var100 = -0.00072198873;
                                }
                            } else {
                                var100 = 0.010719389;
                            }
                        } else {
                            var100 = 0.031093435;
                        }
                    }
                } else {
                    var100 = -0.02363487;
                }
            }
        }
    }
    double var101;
    if (inputs[32] < -16.28) {
        if (inputs[11] < 0.35) {
            var101 = -0.002076848;
        } else {
            var101 = 0.03511528;
        }
    } else {
        if (inputs[29] < 2.2675) {
            if (inputs[29] < 1.705) {
                if (inputs[9] < 5.6375) {
                    if (inputs[15] < 0.41733333) {
                        if (inputs[29] < 1.315) {
                            if (inputs[14] < 0.64) {
                                if (inputs[24] < -16.236933) {
                                    var101 = 0.007526437;
                                } else {
                                    var101 = -0.02257463;
                                }
                            } else {
                                var101 = 0.027538378;
                            }
                        } else {
                            var101 = 0.039260343;
                        }
                    } else {
                        var101 = -0.02598123;
                    }
                } else {
                    if (inputs[32] < -2.76) {
                        var101 = 0.0046712495;
                    } else {
                        var101 = -0.031841557;
                    }
                }
            } else {
                var101 = -0.03395046;
            }
        } else {
            if (inputs[1] < 35.807934) {
                var101 = 0.024098925;
            } else {
                if (inputs[16] < 0.1747594) {
                    var101 = -0.023448875;
                } else {
                    var101 = 0.01823104;
                }
            }
        }
    }
    double var102;
    if (inputs[28] < 35.46188) {
        if (inputs[2] < 1.7892857) {
            if (inputs[16] < -0.19931579) {
                var102 = 0.038237046;
            } else {
                if (inputs[2] < 1.5785714) {
                    if (inputs[29] < 0.755) {
                        if (inputs[25] < 2.5014837) {
                            var102 = 0.0;
                        } else {
                            var102 = -0.039494865;
                        }
                    } else {
                        if (inputs[32] < -4.98) {
                            var102 = 0.025879875;
                        } else {
                            if (inputs[8] < 1798.72) {
                                var102 = 0.021857273;
                            } else {
                                var102 = -0.013553746;
                            }
                        }
                    }
                } else {
                    var102 = 0.024630113;
                }
            }
        } else {
            if (inputs[19] < 1.6007417) {
                var102 = -0.0323453;
            } else {
                if (inputs[27] < 29.597797) {
                    if (inputs[15] < 0.32775757) {
                        if (inputs[21] < -1.6968143) {
                            if (inputs[36] < -3.5651634) {
                                var102 = -0.0068320306;
                            } else {
                                var102 = 0.024361232;
                            }
                        } else {
                            var102 = -0.025681201;
                        }
                    } else {
                        var102 = 0.02540909;
                    }
                } else {
                    var102 = -0.028927425;
                }
            }
        }
    } else {
        if (inputs[16] < -0.1690376) {
            var102 = -0.030149305;
        } else {
            var102 = 0.0027080195;
        }
    }
    double var103;
    if (inputs[18] < 3.397783) {
        if (inputs[10] < 5.7375) {
            if (inputs[23] < 10.870579) {
                if (inputs[6] < 1932.025) {
                    if (inputs[8] < 1916.08) {
                        if (inputs[32] < 9.765) {
                            if (inputs[15] < -0.2869091) {
                                if (inputs[20] < 1.3937585) {
                                    if (inputs[15] < -0.39769697) {
                                        var103 = -0.018285034;
                                    } else {
                                        var103 = 0.02127294;
                                    }
                                } else {
                                    var103 = 0.040409505;
                                }
                            } else {
                                if (inputs[28] < 15.573717) {
                                    if (inputs[16] < 0.14721052) {
                                        var103 = 0.0145976655;
                                    } else {
                                        var103 = -0.016497519;
                                    }
                                } else {
                                    var103 = -0.045144223;
                                }
                            }
                        } else {
                            if (inputs[29] < 1.3375) {
                                var103 = 0.033944022;
                            } else {
                                var103 = 0.0;
                            }
                        }
                    } else {
                        var103 = -0.027533604;
                    }
                } else {
                    var103 = 0.030877251;
                }
            } else {
                var103 = -0.018087285;
            }
        } else {
            var103 = 0.029370438;
        }
    } else {
        var103 = -0.017213533;
    }
    double var104;
    if (inputs[15] < -0.71115154) {
        var104 = 0.0230063;
    } else {
        if (inputs[8] < 1972.8) {
            if (inputs[12] < 1941.34) {
                if (inputs[5] < 1923.3774) {
                    if (inputs[13] < 1852.78) {
                        if (inputs[10] < 0.665) {
                            if (inputs[33] < 0.7935128) {
                                var104 = -0.035981443;
                            } else {
                                var104 = 0.0;
                            }
                        } else {
                            if (inputs[32] < -6.02) {
                                if (inputs[5] < 1800.515) {
                                    var104 = 0.0;
                                } else {
                                    var104 = 0.03337662;
                                }
                            } else {
                                if (inputs[32] < 0.715) {
                                    var104 = -0.03366166;
                                } else {
                                    if (inputs[13] < 1808.84) {
                                        var104 = 0.024409194;
                                    } else {
                                        var104 = -0.01804607;
                                    }
                                }
                            }
                        }
                    } else {
                        if (inputs[20] < -0.011650652) {
                            if (inputs[31] < 7.165) {
                                var104 = 0.009390865;
                            } else {
                                var104 = 0.042204753;
                            }
                        } else {
                            var104 = -0.0050888783;
                        }
                    }
                } else {
                    var104 = -0.020541042;
                }
            } else {
                var104 = 0.025648037;
            }
        } else {
            var104 = -0.024241343;
        }
    }
    double var105;
    if (inputs[1] < 31.394823) {
        if (inputs[1] < 26.693901) {
            if (inputs[29] < 1.6125) {
                var105 = 0.027427714;
            } else {
                var105 = -0.013555092;
            }
        } else {
            if (inputs[19] < 1.6557916) {
                var105 = -0.045204926;
            } else {
                var105 = 0.0;
            }
        }
    } else {
        if (inputs[27] < 9.991337) {
            var105 = 0.02190845;
        } else {
            if (inputs[37] < -5.475) {
                var105 = -0.012853368;
            } else {
                if (inputs[1] < 63.736034) {
                    if (inputs[37] < 4.115) {
                        if (inputs[11] < 0.39) {
                            var105 = 0.04352961;
                        } else {
                            var105 = 0.0;
                        }
                    } else {
                        var105 = 0.0;
                    }
                } else {
                    if (inputs[37] < 0.945) {
                        var105 = -0.026797751;
                    } else {
                        if (inputs[25] < 2.5031645) {
                            if (inputs[25] < 2.4580336) {
                                var105 = 0.014017087;
                            } else {
                                var105 = -0.028538546;
                            }
                        } else {
                            if (inputs[25] < 2.5521367) {
                                var105 = 0.040609114;
                            } else {
                                var105 = 0.0;
                            }
                        }
                    }
                }
            }
        }
    }
    double var106;
    if (inputs[13] < 1850.26) {
        if (inputs[13] < 1835.61) {
            if (inputs[31] < 6.695) {
                if (inputs[6] < 1782.675) {
                    if (inputs[26] < 36.704784) {
                        var106 = 0.005840956;
                    } else {
                        var106 = -0.030699046;
                    }
                } else {
                    if (inputs[19] < 1.4117559) {
                        var106 = -0.0129830595;
                    } else {
                        if (inputs[11] < 0.3) {
                            var106 = 0.014732316;
                        } else {
                            var106 = 0.048988145;
                        }
                    }
                }
            } else {
                var106 = -0.02017602;
            }
        } else {
            var106 = -0.029511029;
        }
    } else {
        if (inputs[10] < 0.56) {
            if (inputs[31] < 0.99) {
                var106 = 0.010538875;
            } else {
                var106 = 0.04532515;
            }
        } else {
            if (inputs[25] < 2.5543478) {
                if (inputs[5] < 1912.735) {
                    if (inputs[23] < -15.634409) {
                        var106 = 0.0;
                    } else {
                        var106 = 0.035572942;
                    }
                } else {
                    if (inputs[16] < -0.13738346) {
                        var106 = 0.018683525;
                    } else {
                        var106 = -0.013232854;
                    }
                }
            } else {
                var106 = -0.030492516;
            }
        }
    }
    double var107;
    if (inputs[28] < 30.224705) {
        if (inputs[16] < -0.21171428) {
            var107 = -0.030151889;
        } else {
            if (inputs[31] < 19.76) {
                if (inputs[32] < 12.035) {
                    if (inputs[28] < 7.917422) {
                        var107 = -0.019137312;
                    } else {
                        if (inputs[28] < 9.951503) {
                            var107 = 0.02634003;
                        } else {
                            if (inputs[1] < 40.656776) {
                                if (inputs[16] < -0.11742105) {
                                    var107 = 0.0;
                                } else {
                                    var107 = 0.026264044;
                                }
                            } else {
                                if (inputs[14] < 0.991) {
                                    if (inputs[25] < 2.502538) {
                                        var107 = -0.03973928;
                                    } else {
                                        var107 = -0.003731599;
                                    }
                                } else {
                                    var107 = 0.008835166;
                                }
                            }
                        }
                    }
                } else {
                    var107 = 0.033581402;
                }
            } else {
                var107 = -0.028911054;
            }
        }
    } else {
        if (inputs[1] < 33.537308) {
            if (inputs[23] < -27.518124) {
                var107 = -0.021959862;
            } else {
                if (inputs[6] < 1908.845) {
                    var107 = 0.023368632;
                } else {
                    var107 = -0.0012360807;
                }
            }
        } else {
            var107 = 0.035667483;
        }
    }
    double var108;
    if (inputs[27] < 6.884259) {
        var108 = -0.020472543;
    } else {
        if (inputs[31] < 4.64) {
            if (inputs[25] < 2.654348) {
                if (inputs[37] < 7.495) {
                    if (inputs[1] < 30.784996) {
                        var108 = -0.0048809024;
                    } else {
                        if (inputs[27] < 29.597797) {
                            if (inputs[20] < -0.75934255) {
                                var108 = 0.041415647;
                            } else {
                                if (inputs[18] < 1.8571904) {
                                    if (inputs[36] < -3.3152242) {
                                        var108 = 0.011181797;
                                    } else {
                                        var108 = -0.021250416;
                                    }
                                } else {
                                    var108 = 0.030482434;
                                }
                            }
                        } else {
                            var108 = -0.0035496058;
                        }
                    }
                } else {
                    var108 = -0.021720203;
                }
            } else {
                var108 = 0.03138829;
            }
        } else {
            if (inputs[31] < 8.92) {
                var108 = -0.02194299;
            } else {
                if (inputs[8] < 1857.38) {
                    var108 = -0.018305413;
                } else {
                    if (inputs[5] < 1913.95) {
                        var108 = 0.04194344;
                    } else {
                        var108 = 0.0;
                    }
                }
            }
        }
    }
    double var109;
    if (inputs[13] < 1978.47) {
        if (inputs[38] < 4.0) {
            var109 = -0.021364456;
        } else {
            if (inputs[19] < 1.1199208) {
                var109 = 0.02717846;
            } else {
                if (inputs[21] < -3.6367188) {
                    var109 = 0.030034048;
                } else {
                    if (inputs[21] < -3.227704) {
                        var109 = -0.034777682;
                    } else {
                        if (inputs[17] < 0.9943239) {
                            if (inputs[21] < 2.0155232) {
                                var109 = 0.002379021;
                            } else {
                                var109 = 0.03522932;
                            }
                        } else {
                            if (inputs[18] < 1.8948869) {
                                if (inputs[32] < 6.675) {
                                    if (inputs[15] < -0.39024243) {
                                        var109 = 0.0;
                                    } else {
                                        var109 = -0.033437554;
                                    }
                                } else {
                                    var109 = 0.0040647336;
                                }
                            } else {
                                if (inputs[26] < 28.773878) {
                                    var109 = -0.00049296324;
                                } else {
                                    if (inputs[13] < 1860.66) {
                                        var109 = 0.005797986;
                                    } else {
                                        var109 = 0.03401421;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        var109 = -0.021354012;
    }
    double var110;
    if (inputs[2] < 0.95857143) {
        var110 = 0.017461263;
    } else {
        if (inputs[1] < 29.151648) {
            if (inputs[29] < 1.6125) {
                var110 = 0.0;
            } else {
                var110 = -0.041124616;
            }
        } else {
            if (inputs[29] < 2.2675) {
                if (inputs[29] < 1.805) {
                    if (inputs[36] < -2.0237975) {
                        var110 = -0.024314769;
                    } else {
                        if (inputs[20] < -0.034633074) {
                            if (inputs[20] < -0.5564064) {
                                if (inputs[31] < 5.56) {
                                    var110 = 0.014193178;
                                } else {
                                    var110 = -0.013938069;
                                }
                            } else {
                                var110 = 0.044084135;
                            }
                        } else {
                            if (inputs[8] < 1846.64) {
                                var110 = -0.026012208;
                            } else {
                                var110 = 0.0;
                            }
                        }
                    }
                } else {
                    var110 = -0.03883601;
                }
            } else {
                if (inputs[28] < 29.950851) {
                    if (inputs[32] < -9.39) {
                        var110 = -0.02006138;
                    } else {
                        if (inputs[21] < 1.943829) {
                            var110 = -0.0032665017;
                        } else {
                            var110 = 0.021770412;
                        }
                    }
                } else {
                    var110 = 0.037267704;
                }
            }
        }
    }
    double var111;
    if (inputs[16] < -0.25378194) {
        if (inputs[26] < 39.061977) {
            var111 = -0.030207932;
        } else {
            var111 = 0.0;
        }
    } else {
        if (inputs[32] < -16.28) {
            var111 = 0.024294175;
        } else {
            if (inputs[24] < -23.013718) {
                var111 = 0.02573084;
            } else {
                if (inputs[27] < 16.48461) {
                    if (inputs[36] < -2.9744408) {
                        var111 = 0.0;
                    } else {
                        var111 = -0.031609353;
                    }
                } else {
                    if (inputs[27] < 24.906725) {
                        var111 = 0.027404234;
                    } else {
                        if (inputs[14] < 0.614) {
                            var111 = -0.029372847;
                        } else {
                            if (inputs[14] < 0.707) {
                                var111 = 0.032012437;
                            } else {
                                if (inputs[9] < 5.0075) {
                                    if (inputs[32] < 4.715) {
                                        var111 = -0.027225344;
                                    } else {
                                        var111 = 0.0;
                                    }
                                } else {
                                    var111 = 0.0070274817;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var112;
    if (inputs[35] < 6.134671) {
        if (inputs[26] < 21.48114) {
            if (inputs[26] < 19.248732) {
                var112 = 0.0013484368;
            } else {
                var112 = -0.031602588;
            }
        } else {
            if (inputs[26] < 23.131304) {
                var112 = 0.028852116;
            } else {
                if (inputs[26] < 26.892513) {
                    if (inputs[10] < 1.51) {
                        var112 = 0.0;
                    } else {
                        var112 = -0.029177804;
                    }
                } else {
                    if (inputs[20] < -1.4010153) {
                        var112 = 0.029148232;
                    } else {
                        if (inputs[15] < -0.32460606) {
                            if (inputs[28] < 35.46188) {
                                if (inputs[23] < -19.12085) {
                                    var112 = 0.0;
                                } else {
                                    var112 = 0.035618175;
                                }
                            } else {
                                var112 = -0.0073518185;
                            }
                        } else {
                            if (inputs[32] < -3.52) {
                                var112 = 0.009136195;
                            } else {
                                if (inputs[17] < 1.3034968) {
                                    var112 = -0.036779188;
                                } else {
                                    var112 = 0.0037038766;
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        var112 = -0.02183338;
    }
    double var113;
    if (inputs[33] < 0.6929307) {
        if (inputs[19] < 1.3697901) {
            if (inputs[13] < 1808.84) {
                var113 = 0.023492599;
            } else {
                var113 = -0.019042531;
            }
        } else {
            if (inputs[2] < 1.2007142) {
                var113 = 0.005100559;
            } else {
                var113 = 0.044611473;
            }
        }
    } else {
        if (inputs[11] < 0.38) {
            if (inputs[25] < 2.3917525) {
                if (inputs[25] < 2.3300972) {
                    var113 = 0.0;
                } else {
                    var113 = 0.035124257;
                }
            } else {
                if (inputs[20] < 0.48772484) {
                    if (inputs[23] < -13.345741) {
                        var113 = -0.00018635519;
                    } else {
                        if (inputs[24] < 2.8597767) {
                            var113 = -0.06329666;
                        } else {
                            var113 = -0.021669619;
                        }
                    }
                } else {
                    if (inputs[20] < 0.9452091) {
                        var113 = 0.019676475;
                    } else {
                        var113 = -0.015990824;
                    }
                }
            }
        } else {
            if (inputs[28] < 22.25458) {
                if (inputs[20] < -0.31441432) {
                    var113 = 0.0;
                } else {
                    var113 = 0.04122549;
                }
            } else {
                var113 = -0.002763894;
            }
        }
    }
    double var114;
    if (inputs[27] < 6.884259) {
        var114 = -0.018606944;
    } else {
        if (inputs[15] < -0.65672725) {
            var114 = 0.02671702;
        } else {
            if (inputs[18] < 1.1529632) {
                if (inputs[25] < 2.5036497) {
                    var114 = -0.00294707;
                } else {
                    var114 = 0.035491012;
                }
            } else {
                if (inputs[15] < 0.38787878) {
                    if (inputs[32] < -7.38) {
                        if (inputs[27] < 11.6581) {
                            var114 = 0.0214435;
                        } else {
                            var114 = -0.013697364;
                        }
                    } else {
                        if (inputs[4] < 1807.935) {
                            var114 = 0.0020082342;
                        } else {
                            if (inputs[25] < 2.5288463) {
                                var114 = -0.03945591;
                            } else {
                                var114 = -0.008838341;
                            }
                        }
                    }
                } else {
                    if (inputs[15] < 0.43527272) {
                        var114 = 0.028718345;
                    } else {
                        if (inputs[9] < 5.455) {
                            if (inputs[37] < 2.43) {
                                var114 = 0.0;
                            } else {
                                var114 = -0.034101877;
                            }
                        } else {
                            var114 = 0.015713608;
                        }
                    }
                }
            }
        }
    }
    double var115;
    if (inputs[10] < 3.645) {
        if (inputs[9] < 5.865) {
            if (inputs[26] < 42.89499) {
                if (inputs[2] < 2.0928571) {
                    if (inputs[14] < -0.569) {
                        if (inputs[16] < -0.17189474) {
                            var115 = -0.02215182;
                        } else {
                            if (inputs[8] < 1816.73) {
                                var115 = 0.028285388;
                            } else {
                                var115 = -0.0004210443;
                            }
                        }
                    } else {
                        if (inputs[16] < 0.029842105) {
                            var115 = 0.045364574;
                        } else {
                            if (inputs[34] < 2.1799212) {
                                var115 = -0.006957978;
                            } else {
                                if (inputs[37] < 6.875) {
                                    var115 = 0.028435975;
                                } else {
                                    var115 = 0.0;
                                }
                            }
                        }
                    }
                } else {
                    var115 = -0.017810626;
                }
            } else {
                var115 = -0.021028934;
            }
        } else {
            if (inputs[32] < -6.02) {
                var115 = 0.012213111;
            } else {
                var115 = -0.03279934;
            }
        }
    } else {
        if (inputs[27] < 10.368962) {
            var115 = -0.008226481;
        } else {
            if (inputs[1] < 63.53294) {
                var115 = 0.041142453;
            } else {
                var115 = 0.0008409402;
            }
        }
    }
    double var116;
    if (inputs[18] < 3.5007954) {
        if (inputs[18] < 2.4693813) {
            if (inputs[18] < 2.1886241) {
                if (inputs[15] < 0.5478182) {
                    if (inputs[27] < 24.78059) {
                        if (inputs[35] < -1.3153939) {
                            if (inputs[1] < 26.023777) {
                                var116 = 0.019647937;
                            } else {
                                if (inputs[26] < 31.110016) {
                                    if (inputs[17] < 1.2526516) {
                                        var116 = 0.01674397;
                                    } else {
                                        var116 = -0.0057850573;
                                    }
                                } else {
                                    var116 = -0.02503935;
                                }
                            }
                        } else {
                            if (inputs[26] < 27.5169) {
                                var116 = 0.0037642082;
                            } else {
                                var116 = 0.037289858;
                            }
                        }
                    } else {
                        if (inputs[34] < 2.1799212) {
                            var116 = -0.029880527;
                        } else {
                            if (inputs[37] < 11.665) {
                                if (inputs[32] < -1.16) {
                                    var116 = 0.0018684834;
                                } else {
                                    var116 = -0.025296468;
                                }
                            } else {
                                var116 = 0.017360331;
                            }
                        }
                    }
                } else {
                    var116 = 0.029987697;
                }
            } else {
                var116 = -0.023609143;
            }
        } else {
            var116 = 0.026179314;
        }
    } else {
        var116 = -0.02139973;
    }
    double var117;
    if (inputs[33] < 0.6794056) {
        if (inputs[2] < 1.0864285) {
            if (inputs[10] < 1.355) {
                var117 = -0.021525089;
            } else {
                var117 = 0.008130892;
            }
        } else {
            if (inputs[26] < 32.414757) {
                var117 = 0.0072118025;
            } else {
                var117 = 0.03935718;
            }
        }
    } else {
        if (inputs[13] < 1779.82) {
            if (inputs[28] < 23.200031) {
                var117 = 0.0;
            } else {
                var117 = -0.038095273;
            }
        } else {
            if (inputs[13] < 1835.06) {
                if (inputs[2] < 1.7892857) {
                    var117 = 0.030521443;
                } else {
                    var117 = 0.0;
                }
            } else {
                if (inputs[37] < -14.93) {
                    var117 = -0.033061102;
                } else {
                    if (inputs[18] < 1.3272034) {
                        var117 = -0.025084516;
                    } else {
                        if (inputs[4] < 1935.9) {
                            if (inputs[13] < 1910.94) {
                                if (inputs[8] < 1856.42) {
                                    var117 = -0.014374228;
                                } else {
                                    var117 = 0.022280918;
                                }
                            } else {
                                var117 = -0.02290557;
                            }
                        } else {
                            var117 = 0.023832934;
                        }
                    }
                }
            }
        }
    }
    double var118;
    if (inputs[18] < 3.5007954) {
        if (inputs[16] < 0.26821053) {
            if (inputs[25] < 2.50028) {
                if (inputs[10] < 0.825) {
                    if (inputs[31] < 3.895) {
                        var118 = -0.024324046;
                    } else {
                        var118 = 0.009888395;
                    }
                } else {
                    if (inputs[15] < -0.4210303) {
                        var118 = -0.0040446804;
                    } else {
                        if (inputs[9] < 4.44) {
                            var118 = 0.04966575;
                        } else {
                            if (inputs[15] < 0.24963637) {
                                var118 = 0.0;
                            } else {
                                var118 = 0.018403612;
                            }
                        }
                    }
                }
            } else {
                if (inputs[2] < 2.0564287) {
                    if (inputs[10] < 1.0075) {
                        if (inputs[33] < 0.7915542) {
                            var118 = -0.003432115;
                        } else {
                            var118 = 0.03901711;
                        }
                    } else {
                        if (inputs[2] < 1.1485714) {
                            var118 = 0.0;
                        } else {
                            var118 = -0.019804224;
                        }
                    }
                } else {
                    var118 = -0.03935084;
                }
            }
        } else {
            if (inputs[33] < 1.1176146) {
                var118 = 0.0;
            } else {
                var118 = 0.03886975;
            }
        }
    } else {
        var118 = -0.02028369;
    }
    double var119;
    if (inputs[33] < 0.73148984) {
        if (inputs[13] < 1787.47) {
            var119 = 0.02860022;
        } else {
            if (inputs[23] < -1.1417241) {
                var119 = -0.011294593;
            } else {
                if (inputs[11] < 0.38) {
                    var119 = 0.024345148;
                } else {
                    var119 = 0.0;
                }
            }
        }
    } else {
        if (inputs[19] < 1.4212687) {
            if (inputs[38] < 14.0) {
                var119 = 0.0;
            } else {
                var119 = -0.04114975;
            }
        } else {
            if (inputs[17] < 2.394056) {
                if (inputs[18] < 1.3965604) {
                    var119 = -0.008333515;
                } else {
                    if (inputs[28] < 30.991985) {
                        if (inputs[2] < 2.1207142) {
                            var119 = 0.034229986;
                        } else {
                            if (inputs[33] < 1.5118761) {
                                var119 = -0.0041854186;
                            } else {
                                var119 = 0.016962541;
                            }
                        }
                    } else {
                        var119 = -0.0053302418;
                    }
                }
            } else {
                var119 = -0.014674979;
            }
        }
    }
    double var120;
    if (inputs[3] < 1974.84) {
        if (inputs[36] < 4.820513) {
            if (inputs[20] < -1.1602125) {
                var120 = -0.022172151;
            } else {
                if (inputs[23] < -27.1777) {
                    if (inputs[18] < 1.4887515) {
                        if (inputs[3] < 1808.615) {
                            var120 = -0.006250872;
                        } else {
                            var120 = -0.040013406;
                        }
                    } else {
                        var120 = 0.009956372;
                    }
                } else {
                    if (inputs[36] < 2.6466432) {
                        if (inputs[26] < 33.36676) {
                            if (inputs[11] < 0.34) {
                                var120 = -0.0076961704;
                            } else {
                                if (inputs[35] < -1.7885545) {
                                    var120 = 0.0;
                                } else {
                                    var120 = 0.037641127;
                                }
                            }
                        } else {
                            if (inputs[33] < 0.8739007) {
                                var120 = 0.052012734;
                            } else {
                                var120 = 0.011183516;
                            }
                        }
                    } else {
                        var120 = -0.022102775;
                    }
                }
            }
        } else {
            if (inputs[18] < 1.568082) {
                var120 = 0.0;
            } else {
                var120 = 0.03757218;
            }
        }
    } else {
        var120 = -0.01998205;
    }
    double var121;
    if (inputs[18] < 3.5007954) {
        if (inputs[10] < 4.93) {
            if (inputs[32] < -16.28) {
                var121 = 0.016730746;
            } else {
                if (inputs[31] < 0.75) {
                    if (inputs[2] < 1.3721429) {
                        if (inputs[37] < -0.81) {
                            var121 = 0.017778512;
                        } else {
                            var121 = -0.0075151287;
                        }
                    } else {
                        if (inputs[16] < 0.06660151) {
                            if (inputs[16] < -0.1188797) {
                                var121 = -0.03800891;
                            } else {
                                var121 = 0.010291519;
                            }
                        } else {
                            var121 = -0.049318757;
                        }
                    }
                } else {
                    if (inputs[28] < 32.29316) {
                        if (inputs[27] < 23.976524) {
                            if (inputs[2] < 1.7892857) {
                                var121 = 0.04560298;
                            } else {
                                var121 = 0.0037462828;
                            }
                        } else {
                            if (inputs[25] < 2.527745) {
                                if (inputs[20] < 0.07766806) {
                                    var121 = 0.01952289;
                                } else {
                                    var121 = -0.0065346286;
                                }
                            } else {
                                var121 = -0.01968443;
                            }
                        }
                    } else {
                        var121 = -0.018578008;
                    }
                }
            }
        } else {
            var121 = 0.022811709;
        }
    } else {
        var121 = -0.016802186;
    }
    double var122;
    if (inputs[28] < 35.91772) {
        if (inputs[24] < -20.538118) {
            var122 = 0.02334998;
        } else {
            if (inputs[9] < 2.49) {
                if (inputs[2] < 1.5721428) {
                    var122 = -0.006701228;
                } else {
                    var122 = 0.019384073;
                }
            } else {
                if (inputs[25] < 2.5543478) {
                    if (inputs[25] < 2.502538) {
                        if (inputs[28] < 8.38395) {
                            var122 = -0.030472498;
                        } else {
                            if (inputs[28] < 13.650999) {
                                var122 = 0.013492385;
                            } else {
                                if (inputs[12] < 1913.76) {
                                    var122 = -0.02680557;
                                } else {
                                    var122 = 0.0050308853;
                                }
                            }
                        }
                    } else {
                        var122 = 0.019257108;
                    }
                } else {
                    if (inputs[31] < 0.845) {
                        var122 = -0.0031899866;
                    } else {
                        var122 = -0.036894787;
                    }
                }
            }
        }
    } else {
        var122 = -0.017661802;
    }
    double var123;
    if (inputs[18] < 1.8384844) {
        if (inputs[33] < 0.73148984) {
            if (inputs[13] < 1787.47) {
                var123 = 0.02696033;
            } else {
                if (inputs[20] < -0.8732041) {
                    var123 = 0.014539522;
                } else {
                    if (inputs[38] < 10.0) {
                        var123 = -0.029481936;
                    } else {
                        var123 = 0.0022152334;
                    }
                }
            }
        } else {
            if (inputs[31] < 0.75) {
                if (inputs[20] < 0.7295222) {
                    var123 = -0.047543027;
                } else {
                    var123 = -0.011014084;
                }
            } else {
                if (inputs[13] < 1841.1) {
                    var123 = -0.012752416;
                } else {
                    var123 = 0.017494852;
                }
            }
        }
    } else {
        if (inputs[32] < -7.955) {
            var123 = 0.024915718;
        } else {
            if (inputs[23] < -15.129381) {
                var123 = -0.022312392;
            } else {
                if (inputs[33] < 1.2019886) {
                    var123 = -0.005918851;
                } else {
                    var123 = 0.019252373;
                }
            }
        }
    }
    double var124;
    if (inputs[32] < -5.38) {
        if (inputs[4] < 1880.27) {
            if (inputs[10] < 0.7975) {
                var124 = -0.00018595198;
            } else {
                if (inputs[5] < 1800.515) {
                    var124 = 0.0058993287;
                } else {
                    var124 = 0.04122075;
                }
            }
        } else {
            if (inputs[5] < 1926.4675) {
                var124 = -0.022308856;
            } else {
                var124 = 0.010193938;
            }
        }
    } else {
        if (inputs[14] < 0.64) {
            if (inputs[27] < 8.503157) {
                var124 = 0.007990305;
            } else {
                if (inputs[34] < -2.4380953) {
                    var124 = -0.035904344;
                } else {
                    if (inputs[27] < 24.906725) {
                        if (inputs[14] < -0.656) {
                            var124 = -0.0017869315;
                        } else {
                            var124 = 0.017939517;
                        }
                    } else {
                        var124 = -0.028604476;
                    }
                }
            }
        } else {
            if (inputs[19] < 2.2734919) {
                if (inputs[24] < 16.323164) {
                    var124 = -0.011514496;
                } else {
                    if (inputs[20] < -0.26992851) {
                        var124 = 0.023437602;
                    } else {
                        var124 = 0.0;
                    }
                }
            } else {
                var124 = 0.027665457;
            }
        }
    }
    double var125;
    if (inputs[29] < 0.425) {
        if (inputs[17] < 1.1813145) {
            var125 = -0.009996829;
        } else {
            var125 = 0.027677476;
        }
    } else {
        if (inputs[29] < 0.7525) {
            var125 = -0.014852402;
        } else {
            if (inputs[19] < 1.1137096) {
                var125 = 0.028692527;
            } else {
                if (inputs[26] < 21.403812) {
                    var125 = -0.023965042;
                } else {
                    if (inputs[2] < 1.2621429) {
                        if (inputs[37] < -1.875) {
                            var125 = 0.0;
                        } else {
                            var125 = -0.029067136;
                        }
                    } else {
                        if (inputs[9] < 2.865) {
                            var125 = 0.026855925;
                        } else {
                            if (inputs[20] < -0.63547933) {
                                var125 = 0.02079232;
                            } else {
                                if (inputs[33] < 1.2019886) {
                                    if (inputs[2] < 1.5521429) {
                                        var125 = 0.0006529442;
                                    } else {
                                        var125 = -0.03722524;
                                    }
                                } else {
                                    var125 = 0.0011537225;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var126;
    if (inputs[16] < -0.1690376) {
        if (inputs[33] < 0.69918364) {
            var126 = 0.008819427;
        } else {
            if (inputs[10] < 2.6525) {
                var126 = -0.03120313;
            } else {
                var126 = 0.0;
            }
        }
    } else {
        if (inputs[24] < -19.664974) {
            var126 = 0.034281928;
        } else {
            if (inputs[35] < -2.9364562) {
                var126 = -0.018016739;
            } else {
                if (inputs[16] < -0.043240603) {
                    var126 = 0.022284657;
                } else {
                    if (inputs[37] < 0.705) {
                        if (inputs[3] < 1850.425) {
                            var126 = -0.031673264;
                        } else {
                            var126 = 0.0;
                        }
                    } else {
                        if (inputs[31] < 16.13) {
                            if (inputs[25] < 2.5032895) {
                                if (inputs[9] < 3.7925) {
                                    var126 = -0.018403564;
                                } else {
                                    if (inputs[11] < 0.3) {
                                        var126 = 0.0;
                                    } else {
                                        var126 = 0.02197001;
                                    }
                                }
                            } else {
                                if (inputs[3] < 1840.14) {
                                    var126 = 0.002705058;
                                } else {
                                    var126 = 0.03197852;
                                }
                            }
                        } else {
                            var126 = -0.014447069;
                        }
                    }
                }
            }
        }
    }
    double var127;
    if (inputs[18] < 3.5007954) {
        if (inputs[11] < 0.21) {
            var127 = 0.024030687;
        } else {
            if (inputs[33] < 1.3552501) {
                if (inputs[25] < 2.50028) {
                    if (inputs[9] < 6.8425) {
                        if (inputs[33] < 0.777166) {
                            if (inputs[9] < 4.7025) {
                                if (inputs[26] < 28.983067) {
                                    var127 = 0.0;
                                } else {
                                    var127 = -0.026136203;
                                }
                            } else {
                                var127 = 0.027143281;
                            }
                        } else {
                            if (inputs[32] < 0.36) {
                                var127 = 0.010643325;
                            } else {
                                var127 = 0.040962055;
                            }
                        }
                    } else {
                        var127 = -0.014525195;
                    }
                } else {
                    if (inputs[9] < 2.975) {
                        if (inputs[25] < 2.5640244) {
                            var127 = -0.0067207883;
                        } else {
                            var127 = 0.030102596;
                        }
                    } else {
                        if (inputs[17] < 1.1634259) {
                            var127 = 0.0;
                        } else {
                            if (inputs[12] < 1855.28) {
                                var127 = -0.03994843;
                            } else {
                                var127 = -0.0136883175;
                            }
                        }
                    }
                }
            } else {
                var127 = -0.032246824;
            }
        }
    } else {
        var127 = -0.019174347;
    }
    double var128;
    if (inputs[15] < -0.2869091) {
        if (inputs[29] < 3.2575) {
            if (inputs[24] < -20.538118) {
                if (inputs[24] < -24.642591) {
                    var128 = 0.00042906863;
                } else {
                    var128 = 0.03680372;
                }
            } else {
                if (inputs[28] < 32.709152) {
                    if (inputs[32] < -5.945) {
                        var128 = 0.019383565;
                    } else {
                        var128 = -0.0060163154;
                    }
                } else {
                    var128 = -0.02675028;
                }
            }
        } else {
            var128 = 0.033152886;
        }
    } else {
        if (inputs[28] < 16.36298) {
            if (inputs[28] < 7.917422) {
                if (inputs[16] < 0.2641203) {
                    var128 = -0.029250035;
                } else {
                    var128 = 0.0;
                }
            } else {
                if (inputs[29] < 1.8225) {
                    if (inputs[11] < 0.36) {
                        var128 = 0.001617031;
                    } else {
                        var128 = 0.026664136;
                    }
                } else {
                    if (inputs[38] < 16.0) {
                        var128 = -0.018072817;
                    } else {
                        var128 = 0.004293882;
                    }
                }
            }
        } else {
            if (inputs[9] < 3.735) {
                var128 = 0.0;
            } else {
                var128 = -0.03822693;
            }
        }
    }
    double var129;
    if (inputs[10] < 1.03) {
        if (inputs[10] < 0.855) {
            if (inputs[3] < 1932.68) {
                if (inputs[19] < 1.5688448) {
                    if (inputs[31] < -1.285) {
                        var129 = -0.03370048;
                    } else {
                        var129 = 0.0008953782;
                    }
                } else {
                    if (inputs[10] < 0.285) {
                        var129 = 0.024050357;
                    } else {
                        var129 = -0.0013106875;
                    }
                }
            } else {
                var129 = 0.026617656;
            }
        } else {
            var129 = 0.03265128;
        }
    } else {
        if (inputs[32] < -5.655) {
            if (inputs[3] < 1850.425) {
                if (inputs[5] < 1800.515) {
                    var129 = 0.00026121098;
                } else {
                    var129 = 0.04560881;
                }
            } else {
                var129 = -0.013246426;
            }
        } else {
            if (inputs[26] < 38.89805) {
                if (inputs[27] < 28.953217) {
                    if (inputs[9] < 4.8075) {
                        var129 = -0.004104943;
                    } else {
                        var129 = -0.044059195;
                    }
                } else {
                    var129 = 0.0;
                }
            } else {
                if (inputs[10] < 2.8975) {
                    var129 = -0.014795626;
                } else {
                    var129 = 0.017605498;
                }
            }
        }
    }
    double var130;
    if (inputs[38] < 21.0) {
        if (inputs[26] < 28.393423) {
            if (inputs[26] < 18.788773) {
                var130 = 0.019426608;
            } else {
                if (inputs[17] < 1.1372142) {
                    var130 = 0.0092232125;
                } else {
                    if (inputs[36] < -2.0237975) {
                        var130 = -0.04657937;
                    } else {
                        if (inputs[36] < 1.7406528) {
                            var130 = 0.013005371;
                        } else {
                            var130 = -0.020578858;
                        }
                    }
                }
            }
        } else {
            if (inputs[26] < 30.682907) {
                var130 = 0.025121791;
            } else {
                if (inputs[26] < 33.200928) {
                    var130 = -0.019316308;
                } else {
                    if (inputs[25] < 2.4900498) {
                        if (inputs[17] < 1.2402678) {
                            var130 = -0.0297203;
                        } else {
                            var130 = 0.0066793384;
                        }
                    } else {
                        if (inputs[29] < 0.755) {
                            var130 = 0.0;
                        } else {
                            if (inputs[28] < 12.808499) {
                                var130 = 0.03983947;
                            } else {
                                var130 = 0.0064001014;
                            }
                        }
                    }
                }
            }
        }
    } else {
        var130 = -0.020697784;
    }
    double var131;
    if (inputs[2] < 2.7335715) {
        if (inputs[1] < 31.394823) {
            if (inputs[1] < 26.023777) {
                var131 = 0.009841929;
            } else {
                var131 = -0.04020825;
            }
        } else {
            if (inputs[20] < -0.75934255) {
                if (inputs[29] < 1.725) {
                    if (inputs[15] < 0.30563638) {
                        var131 = 0.039585985;
                    } else {
                        var131 = 0.0022626934;
                    }
                } else {
                    var131 = 0.0;
                }
            } else {
                if (inputs[20] < -0.26992851) {
                    var131 = -0.028276198;
                } else {
                    if (inputs[35] < 3.561175) {
                        if (inputs[32] < 7.22) {
                            if (inputs[36] < -3.415755) {
                                var131 = 0.020072876;
                            } else {
                                var131 = -0.014878365;
                            }
                        } else {
                            var131 = 0.029931871;
                        }
                    } else {
                        var131 = -0.0164913;
                    }
                }
            }
        }
    } else {
        if (inputs[9] < 11.365) {
            var131 = 0.025168356;
        } else {
            var131 = 0.0;
        }
    }
    double var132;
    if (inputs[29] < 2.2675) {
        if (inputs[16] < -0.041323308) {
            if (inputs[20] < 0.83210975) {
                if (inputs[15] < -0.3949697) {
                    var132 = -0.020600494;
                } else {
                    var132 = 0.011281044;
                }
            } else {
                var132 = 0.021367522;
            }
        } else {
            if (inputs[14] < 0.503) {
                var132 = -0.035912126;
            } else {
                if (inputs[14] < 0.667) {
                    var132 = 0.01951486;
                } else {
                    if (inputs[28] < 11.021626) {
                        if (inputs[27] < 33.82206) {
                            var132 = -0.03420612;
                        } else {
                            var132 = -0.009908306;
                        }
                    } else {
                        var132 = 0.009398703;
                    }
                }
            }
        }
    } else {
        if (inputs[36] < 1.7406528) {
            if (inputs[20] < 0.87566596) {
                if (inputs[31] < -6.415) {
                    var132 = 0.012764508;
                } else {
                    var132 = 0.04279921;
                }
            } else {
                var132 = 0.0;
            }
        } else {
            if (inputs[16] < 0.1747594) {
                var132 = -0.018649153;
            } else {
                var132 = 0.005238111;
            }
        }
    }
    double var133;
    if (inputs[32] < -5.655) {
        if (inputs[10] < 0.45) {
            var133 = -0.015479657;
        } else {
            if (inputs[19] < 2.0402722) {
                if (inputs[14] < -0.764) {
                    var133 = 0.0021293222;
                } else {
                    var133 = 0.04095483;
                }
            } else {
                var133 = -0.00394346;
            }
        }
    } else {
        if (inputs[10] < 0.77) {
            if (inputs[26] < 23.44496) {
                var133 = 0.025653109;
            } else {
                if (inputs[13] < 1850.26) {
                    var133 = -0.005855332;
                } else {
                    var133 = 0.0123811215;
                }
            }
        } else {
            if (inputs[29] < 0.45) {
                var133 = 0.0008760588;
            } else {
                if (inputs[32] < 16.61) {
                    if (inputs[38] < 17.0) {
                        if (inputs[29] < 2.1875) {
                            var133 = -0.02459617;
                        } else {
                            var133 = 0.0;
                        }
                    } else {
                        var133 = -0.053644545;
                    }
                } else {
                    var133 = 0.0;
                }
            }
        }
    }
    double var134;
    if (inputs[23] < 19.42722) {
        if (inputs[33] < 0.6488969) {
            if (inputs[26] < 34.604843) {
                var134 = 0.0;
            } else {
                var134 = 0.024648577;
            }
        } else {
            if (inputs[27] < 8.615573) {
                var134 = -0.020746194;
            } else {
                if (inputs[37] < 15.755) {
                    if (inputs[12] < 1936.37) {
                        if (inputs[6] < 1913.16) {
                            if (inputs[9] < 3.735) {
                                if (inputs[19] < 1.4935608) {
                                    var134 = 0.005434373;
                                } else {
                                    var134 = -0.021950372;
                                }
                            } else {
                                if (inputs[1] < 66.425255) {
                                    if (inputs[38] < 16.0) {
                                        var134 = 0.0;
                                    } else {
                                        var134 = 0.03958779;
                                    }
                                } else {
                                    var134 = 0.0;
                                }
                            }
                        } else {
                            var134 = -0.022534877;
                        }
                    } else {
                        var134 = 0.029440792;
                    }
                } else {
                    var134 = -0.021391954;
                }
            }
        }
    } else {
        var134 = -0.021705298;
    }
    double var135;
    if (inputs[19] < 2.0873559) {
        if (inputs[19] < 1.8428277) {
            if (inputs[28] < 7.917422) {
                var135 = -0.02183618;
            } else {
                if (inputs[15] < 0.3809697) {
                    if (inputs[9] < 5.75) {
                        if (inputs[9] < 4.015) {
                            if (inputs[17] < 1.2841433) {
                                if (inputs[37] < -1.575) {
                                    var135 = -0.006109468;
                                } else {
                                    var135 = 0.015421745;
                                }
                            } else {
                                var135 = -0.02219858;
                            }
                        } else {
                            if (inputs[3] < 1818.885) {
                                var135 = 0.036314197;
                            } else {
                                var135 = 0.0;
                            }
                        }
                    } else {
                        var135 = -0.021063672;
                    }
                } else {
                    var135 = 0.019118503;
                }
            }
        } else {
            var135 = 0.029171742;
        }
    } else {
        if (inputs[36] < 2.3136842) {
            if (inputs[18] < 2.7831962) {
                var135 = -0.037496734;
            } else {
                var135 = 0.00022967611;
            }
        } else {
            var135 = 0.0044672093;
        }
    }
    double var136;
    if (inputs[25] < 2.4555256) {
        if (inputs[26] < 34.388138) {
            if (inputs[26] < 27.141663) {
                if (inputs[17] < 1.6818014) {
                    var136 = 0.013698793;
                } else {
                    var136 = -0.0074806986;
                }
            } else {
                var136 = 0.03108746;
            }
        } else {
            var136 = -0.0014388433;
        }
    } else {
        if (inputs[10] < 2.1525) {
            if (inputs[31] < -5.165) {
                if (inputs[25] < 2.5316575) {
                    var136 = -0.023083571;
                } else {
                    var136 = 0.004048708;
                }
            } else {
                if (inputs[37] < 3.25) {
                    if (inputs[19] < 1.2836818) {
                        var136 = 0.0;
                    } else {
                        if (inputs[2] < 1.78) {
                            var136 = 0.036892064;
                        } else {
                            var136 = 0.0036598044;
                        }
                    }
                } else {
                    var136 = -0.009073736;
                }
            }
        } else {
            if (inputs[26] < 30.415281) {
                var136 = -0.03780204;
            } else {
                if (inputs[37] < 3.11) {
                    var136 = -0.011927819;
                } else {
                    var136 = 0.016346054;
                }
            }
        }
    }
    double var137;
    if (inputs[18] < 3.5007954) {
        if (inputs[18] < 1.3292946) {
            if (inputs[34] < -2.1665845) {
                var137 = 0.004713999;
            } else {
                if (inputs[35] < 2.9001987) {
                    var137 = -0.042640686;
                } else {
                    var137 = 0.0;
                }
            }
        } else {
            if (inputs[31] < 0.75) {
                if (inputs[18] < 1.9151556) {
                    if (inputs[16] < -0.08713534) {
                        var137 = 0.0;
                    } else {
                        var137 = -0.028153518;
                    }
                } else {
                    if (inputs[32] < -12.91) {
                        var137 = 0.03405312;
                    } else {
                        var137 = 0.0006343324;
                    }
                }
            } else {
                if (inputs[18] < 2.0095332) {
                    if (inputs[31] < 12.75) {
                        if (inputs[2] < 1.495) {
                            var137 = 0.01819068;
                        } else {
                            var137 = 0.04707465;
                        }
                    } else {
                        var137 = 0.00025755537;
                    }
                } else {
                    var137 = -0.0030847513;
                }
            }
        }
    } else {
        var137 = -0.020775305;
    }
    double var138;
    if (inputs[29] < 3.2575) {
        if (inputs[6] < 1784.81) {
            if (inputs[23] < -22.778442) {
                var138 = 0.0;
            } else {
                var138 = -0.033451866;
            }
        } else {
            if (inputs[37] < 13.825) {
                if (inputs[4] < 1935.9) {
                    if (inputs[5] < 1924.395) {
                        if (inputs[28] < 15.15587) {
                            if (inputs[28] < 8.292205) {
                                var138 = 0.0;
                            } else {
                                var138 = 0.02477022;
                            }
                        } else {
                            if (inputs[8] < 1816.73) {
                                var138 = 0.020095196;
                            } else {
                                if (inputs[31] < 0.845) {
                                    var138 = -0.02096421;
                                } else {
                                    var138 = 0.0013097816;
                                }
                            }
                        }
                    } else {
                        var138 = -0.026208537;
                    }
                } else {
                    var138 = 0.025244595;
                }
            } else {
                var138 = -0.021688676;
            }
        }
    } else {
        if (inputs[1] < 40.13896) {
            var138 = 0.03063877;
        } else {
            var138 = 0.0;
        }
    }
    double var139;
    if (inputs[1] < 63.736034) {
        if (inputs[1] < 62.464783) {
            if (inputs[33] < 1.2964483) {
                if (inputs[2] < 1.5342857) {
                    if (inputs[36] < -2.9255424) {
                        if (inputs[26] < 30.75742) {
                            var139 = 0.021811835;
                        } else {
                            var139 = -0.0060188593;
                        }
                    } else {
                        var139 = -0.025673889;
                    }
                } else {
                    if (inputs[34] < -1.7209866) {
                        if (inputs[26] < 31.255936) {
                            var139 = -0.020578165;
                        } else {
                            var139 = 0.021177828;
                        }
                    } else {
                        var139 = 0.030555392;
                    }
                }
            } else {
                if (inputs[33] < 1.6734459) {
                    var139 = -0.036493946;
                } else {
                    var139 = 0.0;
                }
            }
        } else {
            var139 = 0.03239437;
        }
    } else {
        if (inputs[27] < 27.104618) {
            var139 = -0.033965714;
        } else {
            if (inputs[37] < 11.665) {
                if (inputs[15] < 0.5062424) {
                    var139 = -0.019577509;
                } else {
                    var139 = 0.0019035687;
                }
            } else {
                var139 = 0.015114876;
            }
        }
    }
    double var140;
    if (inputs[2] < 0.94785714) {
        var140 = 0.019946633;
    } else {
        if (inputs[32] < -16.28) {
            if (inputs[24] < -10.30966) {
                var140 = -0.0017906082;
            } else {
                var140 = 0.025318265;
            }
        } else {
            if (inputs[28] < 32.709152) {
                if (inputs[6] < 1954.515) {
                    if (inputs[32] < 12.035) {
                        if (inputs[25] < 2.5640244) {
                            if (inputs[14] < -0.688) {
                                var140 = 0.021104004;
                            } else {
                                if (inputs[37] < 0.565) {
                                    var140 = -0.027472321;
                                } else {
                                    if (inputs[1] < 68.104) {
                                        var140 = 0.024031423;
                                    } else {
                                        var140 = -0.005011776;
                                    }
                                }
                            }
                        } else {
                            var140 = -0.024450826;
                        }
                    } else {
                        var140 = 0.020090463;
                    }
                } else {
                    var140 = -0.025531998;
                }
            } else {
                if (inputs[5] < 1861.86) {
                    var140 = -0.02855663;
                } else {
                    var140 = -0.001261695;
                }
            }
        }
    }
    double var141;
    if (inputs[35] < -3.5775623) {
        if (inputs[27] < 9.923817) {
            if (inputs[29] < 1.6125) {
                var141 = -0.0072146184;
            } else {
                var141 = -0.032967202;
            }
        } else {
            var141 = 0.0033235764;
        }
    } else {
        if (inputs[27] < 10.101018) {
            var141 = 0.020540152;
        } else {
            if (inputs[14] < -0.884) {
                var141 = -0.017268723;
            } else {
                if (inputs[27] < 23.976524) {
                    if (inputs[37] < -3.625) {
                        var141 = -0.00019251402;
                    } else {
                        var141 = 0.021988502;
                    }
                } else {
                    if (inputs[28] < 13.650999) {
                        if (inputs[28] < 11.868851) {
                            if (inputs[34] < 2.2002673) {
                                var141 = -0.020231217;
                            } else {
                                if (inputs[1] < 74.26155) {
                                    if (inputs[27] < 32.28989) {
                                        var141 = 0.022542922;
                                    } else {
                                        var141 = 0.0;
                                    }
                                } else {
                                    var141 = -0.0074461084;
                                }
                            }
                        } else {
                            var141 = 0.025718683;
                        }
                    } else {
                        var141 = -0.026933925;
                    }
                }
            }
        }
    }
    double var142;
    if (inputs[5] < 1923.3774) {
        if (inputs[13] < 1850.26) {
            if (inputs[32] < -7.38) {
                if (inputs[9] < 4.515) {
                    var142 = -0.001366964;
                } else {
                    var142 = 0.023105985;
                }
            } else {
                if (inputs[18] < 1.9923292) {
                    if (inputs[8] < 1801.01) {
                        if (inputs[32] < 4.155) {
                            var142 = -0.0028145656;
                        } else {
                            var142 = 0.023412392;
                        }
                    } else {
                        if (inputs[33] < 0.84321815) {
                            var142 = -0.034469392;
                        } else {
                            var142 = 0.0004268107;
                        }
                    }
                } else {
                    var142 = -0.03411759;
                }
            }
        } else {
            if (inputs[17] < 1.3930111) {
                if (inputs[14] < 0.517) {
                    var142 = -0.013491065;
                } else {
                    var142 = 0.014759024;
                }
            } else {
                var142 = 0.024140183;
            }
        }
    } else {
        if (inputs[17] < 1.535552) {
            if (inputs[17] < 1.1851852) {
                var142 = -0.010764077;
            } else {
                var142 = 0.014716762;
            }
        } else {
            var142 = -0.024704793;
        }
    }
    double var143;
    if (inputs[8] < 1971.3) {
        if (inputs[6] < 1932.025) {
            if (inputs[5] < 1924.395) {
                if (inputs[23] < -31.650387) {
                    if (inputs[27] < 9.872094) {
                        var143 = -0.035685875;
                    } else {
                        if (inputs[10] < 1.89) {
                            if (inputs[4] < 1814.075) {
                                var143 = -0.023789246;
                            } else {
                                var143 = 0.0065479195;
                            }
                        } else {
                            var143 = 0.022418935;
                        }
                    }
                } else {
                    if (inputs[26] < 41.917362) {
                        if (inputs[35] < 3.3618221) {
                            if (inputs[14] < -0.547) {
                                if (inputs[14] < -0.98) {
                                    var143 = 0.0070038633;
                                } else {
                                    var143 = -0.015032334;
                                }
                            } else {
                                if (inputs[27] < 23.976524) {
                                    var143 = 0.04236812;
                                } else {
                                    var143 = 0.0;
                                }
                            }
                        } else {
                            var143 = -0.009157729;
                        }
                    } else {
                        var143 = 0.025426794;
                    }
                }
            } else {
                var143 = -0.024973022;
            }
        } else {
            var143 = 0.025583815;
        }
    } else {
        var143 = -0.013043267;
    }
    double var144;
    if (inputs[28] < 35.46188) {
        if (inputs[24] < -23.013718) {
            var144 = 0.025012404;
        } else {
            if (inputs[38] < 14.0) {
                if (inputs[38] < 11.0) {
                    if (inputs[32] < -6.595) {
                        var144 = -0.02306026;
                    } else {
                        if (inputs[28] < 11.492314) {
                            var144 = -0.0063547813;
                        } else {
                            var144 = 0.029956028;
                        }
                    }
                } else {
                    var144 = 0.026422605;
                }
            } else {
                if (inputs[19] < 1.4212687) {
                    var144 = -0.02499797;
                } else {
                    if (inputs[36] < 3.5044699) {
                        if (inputs[17] < 1.3881873) {
                            var144 = -0.017496157;
                        } else {
                            if (inputs[13] < 1829.68) {
                                var144 = 0.023471944;
                            } else {
                                var144 = -0.004676749;
                            }
                        }
                    } else {
                        var144 = 0.022442525;
                    }
                }
            }
        }
    } else {
        if (inputs[17] < 1.3955787) {
            var144 = 0.0;
        } else {
            var144 = -0.028375924;
        }
    }
    double var145;
    if (inputs[23] < 12.870723) {
        if (inputs[32] < -5.655) {
            if (inputs[37] < 8.24) {
                if (inputs[37] < -13.68) {
                    var145 = 0.0;
                } else {
                    if (inputs[36] < -3.079028) {
                        var145 = 0.037357464;
                    } else {
                        var145 = 0.011276072;
                    }
                }
            } else {
                var145 = -0.0066413735;
            }
        } else {
            if (inputs[29] < 3.1975) {
                if (inputs[32] < 11.825) {
                    if (inputs[29] < 1.705) {
                        if (inputs[9] < 5.58) {
                            if (inputs[9] < 3.64) {
                                var145 = -0.01676648;
                            } else {
                                var145 = 0.024069939;
                            }
                        } else {
                            var145 = -0.02722106;
                        }
                    } else {
                        var145 = -0.03477997;
                    }
                } else {
                    var145 = 0.0035609943;
                }
            } else {
                var145 = 0.018716475;
            }
        }
    } else {
        var145 = -0.023607995;
    }
    double var146;
    if (inputs[29] < 0.4025) {
        if (inputs[9] < 5.2025) {
            var146 = 0.03623361;
        } else {
            var146 = -0.0050520864;
        }
    } else {
        if (inputs[17] < 1.1301504) {
            if (inputs[17] < 0.8397381) {
                var146 = -0.0119702015;
            } else {
                if (inputs[29] < 1.08) {
                    var146 = 0.0;
                } else {
                    if (inputs[26] < 30.89138) {
                        var146 = 0.036472216;
                    } else {
                        var146 = 0.009726632;
                    }
                }
            }
        } else {
            if (inputs[23] < -35.18622) {
                var146 = -0.025490945;
            } else {
                if (inputs[27] < 9.991337) {
                    var146 = 0.017841833;
                } else {
                    if (inputs[1] < 34.41875) {
                        var146 = -0.029708803;
                    } else {
                        if (inputs[1] < 69.24428) {
                            if (inputs[20] < -0.31803) {
                                var146 = -0.013429025;
                            } else {
                                if (inputs[20] < 0.5072141) {
                                    var146 = 0.029168865;
                                } else {
                                    var146 = 0.0015937627;
                                }
                            }
                        } else {
                            var146 = -0.018039588;
                        }
                    }
                }
            }
        }
    }
    double var147;
    if (inputs[18] < 3.397783) {
        if (inputs[11] < 0.21) {
            var147 = 0.024994848;
        } else {
            if (inputs[20] < 1.2769473) {
                if (inputs[28] < 35.86049) {
                    if (inputs[2] < 1.7892857) {
                        if (inputs[28] < 8.38395) {
                            var147 = -0.004702048;
                        } else {
                            if (inputs[20] < -0.47922477) {
                                if (inputs[10] < 1.685) {
                                    var147 = -0.0145437345;
                                } else {
                                    var147 = 0.02172872;
                                }
                            } else {
                                if (inputs[25] < 2.50028) {
                                    var147 = 0.044234008;
                                } else {
                                    var147 = 0.010611908;
                                }
                            }
                        }
                    } else {
                        if (inputs[33] < 1.1176146) {
                            var147 = -0.025854032;
                        } else {
                            var147 = 0.0044111903;
                        }
                    }
                } else {
                    var147 = -0.017128734;
                }
            } else {
                if (inputs[20] < 1.5981307) {
                    var147 = -0.029402422;
                } else {
                    var147 = 0.0;
                }
            }
        }
    } else {
        var147 = -0.020374978;
    }
    double var148;
    if (inputs[29] < 1.6675) {
        if (inputs[36] < -4.91453) {
            var148 = 0.024976946;
        } else {
            if (inputs[9] < 5.71) {
                if (inputs[18] < 1.8324206) {
                    if (inputs[26] < 28.991964) {
                        if (inputs[9] < 4.03) {
                            var148 = 0.0;
                        } else {
                            var148 = 0.028780298;
                        }
                    } else {
                        var148 = -0.014331963;
                    }
                } else {
                    var148 = 0.02641883;
                }
            } else {
                if (inputs[24] < 13.259416) {
                    var148 = -0.028399136;
                } else {
                    var148 = 0.0;
                }
            }
        }
    } else {
        if (inputs[29] < 2.2675) {
            if (inputs[3] < 1861.65) {
                var148 = -0.035942506;
            } else {
                var148 = -0.009248383;
            }
        } else {
            if (inputs[37] < -12.105) {
                var148 = -0.01438504;
            } else {
                if (inputs[1] < 35.807934) {
                    var148 = 0.030151324;
                } else {
                    if (inputs[16] < 0.15943609) {
                        var148 = -0.018763684;
                    } else {
                        var148 = 0.01394541;
                    }
                }
            }
        }
    }
    double var149;
    if (inputs[25] < 2.3917525) {
        if (inputs[26] < 30.89138) {
            var149 = 0.022630665;
        } else {
            var149 = -0.003709859;
        }
    } else {
        if (inputs[26] < 27.647339) {
            if (inputs[19] < 1.449396) {
                if (inputs[16] < -0.004045113) {
                    var149 = 0.016567318;
                } else {
                    var149 = -0.009349339;
                }
            } else {
                if (inputs[24] < -0.6199378) {
                    var149 = -0.034683533;
                } else {
                    var149 = -0.00826488;
                }
            }
        } else {
            if (inputs[3] < 1929.455) {
                if (inputs[6] < 1900.295) {
                    if (inputs[25] < 2.4968355) {
                        var149 = -0.015362557;
                    } else {
                        if (inputs[6] < 1793.675) {
                            var149 = -0.0030258722;
                        } else {
                            if (inputs[28] < 10.571816) {
                                var149 = 0.037703294;
                            } else {
                                var149 = 0.0061703403;
                            }
                        }
                    }
                } else {
                    var149 = -0.026077343;
                }
            } else {
                var149 = 0.021942033;
            }
        }
    }
    double var150;
    if (inputs[10] < 0.1375) {
        var150 = 0.025217269;
    } else {
        if (inputs[4] < 1897.925) {
            if (inputs[15] < 0.47533333) {
                if (inputs[15] < -0.25133333) {
                    if (inputs[14] < -0.77) {
                        if (inputs[36] < -4.238598) {
                            var150 = 0.009679431;
                        } else {
                            var150 = -0.017134668;
                        }
                    } else {
                        var150 = 0.026918232;
                    }
                } else {
                    if (inputs[28] < 15.021765) {
                        if (inputs[16] < 0.121451125) {
                            var150 = 0.011609752;
                        } else {
                            var150 = -0.0075673778;
                        }
                    } else {
                        var150 = -0.039100636;
                    }
                }
            } else {
                var150 = 0.020277422;
            }
        } else {
            if (inputs[33] < 0.6775247) {
                var150 = 0.009197655;
            } else {
                if (inputs[29] < 1.8875) {
                    var150 = -0.03437391;
                } else {
                    if (inputs[29] < 3.3625) {
                        var150 = 0.0003932275;
                    } else {
                        var150 = -0.022516318;
                    }
                }
            }
        }
    }
    double var151;
    if (inputs[37] < -20.11) {
        var151 = -0.020281095;
    } else {
        if (inputs[32] < -16.28) {
            var151 = 0.025903674;
        } else {
            if (inputs[14] < -1.273) {
                var151 = 0.022289941;
            } else {
                if (inputs[38] < 13.0) {
                    if (inputs[2] < 1.2621429) {
                        if (inputs[2] < 1.0235714) {
                            var151 = 0.0015751284;
                        } else {
                            var151 = -0.015462272;
                        }
                    } else {
                        if (inputs[2] < 1.4771428) {
                            var151 = 0.030134667;
                        } else {
                            var151 = 0.0;
                        }
                    }
                } else {
                    if (inputs[23] < -31.650387) {
                        var151 = -0.037542183;
                    } else {
                        if (inputs[16] < 0.18560903) {
                            if (inputs[20] < -0.95399433) {
                                var151 = -0.03591076;
                            } else {
                                if (inputs[32] < 5.09) {
                                    var151 = -0.016869817;
                                } else {
                                    var151 = 0.013683068;
                                }
                            }
                        } else {
                            if (inputs[2] < 1.8878572) {
                                var151 = 0.031642444;
                            } else {
                                var151 = -0.012342038;
                            }
                        }
                    }
                }
            }
        }
    }
    double var152;
    if (inputs[9] < 2.41) {
        if (inputs[26] < 24.19844) {
            var152 = 0.0;
        } else {
            if (inputs[18] < 1.626) {
                var152 = 0.03676071;
            } else {
                var152 = 0.00063241116;
            }
        }
    } else {
        if (inputs[25] < 2.5667245) {
            if (inputs[9] < 6.8425) {
                if (inputs[9] < 3.735) {
                    var152 = -0.011567462;
                } else {
                    if (inputs[26] < 39.93322) {
                        if (inputs[20] < 0.7862127) {
                            if (inputs[14] < 0.561) {
                                var152 = -0.0071815317;
                            } else {
                                var152 = 0.029296057;
                            }
                        } else {
                            var152 = 0.03950856;
                        }
                    } else {
                        var152 = 0.0;
                    }
                }
            } else {
                if (inputs[20] < 0.86715806) {
                    if (inputs[2] < 2.7335715) {
                        var152 = -0.010618658;
                    } else {
                        var152 = 0.012756766;
                    }
                } else {
                    var152 = -0.023590593;
                }
            }
        } else {
            if (inputs[23] < -14.781945) {
                var152 = 0.0;
            } else {
                var152 = -0.024248738;
            }
        }
    }
    double var153;
    if (inputs[26] < 21.48114) {
        var153 = -0.016106417;
    } else {
        if (inputs[9] < 2.49) {
            if (inputs[10] < 0.5) {
                var153 = -0.004529515;
            } else {
                var153 = 0.024490736;
            }
        } else {
            if (inputs[25] < 2.4555256) {
                if (inputs[20] < -0.09276572) {
                    var153 = 0.02161791;
                } else {
                    var153 = -0.003850662;
                }
            } else {
                if (inputs[37] < 13.825) {
                    if (inputs[17] < 1.067277) {
                        var153 = -0.023070423;
                    } else {
                        if (inputs[13] < 1920.77) {
                            if (inputs[4] < 1852.03) {
                                if (inputs[16] < -0.1388797) {
                                    var153 = -0.012610646;
                                } else {
                                    var153 = 0.013986817;
                                }
                            } else {
                                var153 = -0.020661753;
                            }
                        } else {
                            var153 = 0.022704069;
                        }
                    }
                } else {
                    var153 = -0.03262793;
                }
            }
        }
    }
    double var154;
    if (inputs[23] < 21.159197) {
        if (inputs[18] < 3.397783) {
            if (inputs[11] < 0.21) {
                var154 = 0.02381319;
            } else {
                if (inputs[18] < 2.2590344) {
                    if (inputs[18] < 1.94329) {
                        if (inputs[20] < -1.3344076) {
                            var154 = 0.018227732;
                        } else {
                            if (inputs[9] < 5.6375) {
                                if (inputs[36] < -3.5651634) {
                                    var154 = 0.018432574;
                                } else {
                                    if (inputs[23] < -26.35313) {
                                        var154 = -0.015505667;
                                    } else {
                                        var154 = 0.003199141;
                                    }
                                }
                            } else {
                                var154 = -0.014167463;
                            }
                        }
                    } else {
                        var154 = 0.02574392;
                    }
                } else {
                    var154 = -0.01971787;
                }
            }
        } else {
            var154 = -0.014782965;
        }
    } else {
        var154 = -0.017446537;
    }
    double var155;
    if (inputs[27] < 6.884259) {
        var155 = -0.016213482;
    } else {
        if (inputs[32] < -16.28) {
            if (inputs[19] < 1.7106633) {
                var155 = 0.00259466;
            } else {
                var155 = 0.030840335;
            }
        } else {
            if (inputs[1] < 26.410332) {
                var155 = 0.021140512;
            } else {
                if (inputs[32] < -9.39) {
                    var155 = -0.018168962;
                } else {
                    if (inputs[10] < 0.1475) {
                        var155 = 0.022883711;
                    } else {
                        if (inputs[31] < 6.695) {
                            if (inputs[15] < 0.5062424) {
                                if (inputs[9] < 5.2975) {
                                    if (inputs[16] < -0.08040602) {
                                        var155 = 0.023395162;
                                    } else {
                                        var155 = -0.0040354603;
                                    }
                                } else {
                                    var155 = -0.017288776;
                                }
                            } else {
                                var155 = 0.027300423;
                            }
                        } else {
                            if (inputs[10] < 1.7775) {
                                var155 = -0.02492808;
                            } else {
                                if (inputs[5] < 1871.4225) {
                                    var155 = -0.014066546;
                                } else {
                                    var155 = 0.015050259;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var156;
    if (inputs[38] < 21.0) {
        if (inputs[28] < 13.650999) {
            if (inputs[29] < 0.76) {
                if (inputs[26] < 31.84846) {
                    var156 = 0.0053124214;
                } else {
                    var156 = -0.01615709;
                }
            } else {
                if (inputs[17] < 1.1301504) {
                    var156 = 0.032236516;
                } else {
                    if (inputs[14] < 0.932) {
                        var156 = -0.0034363896;
                    } else {
                        var156 = 0.017434137;
                    }
                }
            }
        } else {
            if (inputs[16] < 0.03613534) {
                if (inputs[33] < 1.2944082) {
                    if (inputs[34] < -1.7141557) {
                        if (inputs[33] < 0.69088274) {
                            if (inputs[19] < 1.3665477) {
                                var156 = 0.0;
                            } else {
                                var156 = 0.026159823;
                            }
                        } else {
                            if (inputs[33] < 0.8127964) {
                                var156 = -0.02528352;
                            } else {
                                var156 = 0.0;
                            }
                        }
                    } else {
                        var156 = 0.03402133;
                    }
                } else {
                    var156 = -0.016263824;
                }
            } else {
                var156 = -0.024237322;
            }
        }
    } else {
        var156 = -0.022725895;
    }
    double var157;
    if (inputs[19] < 1.65015) {
        if (inputs[11] < 0.41) {
            if (inputs[2] < 1.1414286) {
                var157 = 0.00028068118;
            } else {
                if (inputs[10] < 1.5275) {
                    var157 = -0.0000035744504;
                } else {
                    var157 = -0.047341265;
                }
            }
        } else {
            if (inputs[16] < -0.043240603) {
                var157 = 0.018695768;
            } else {
                var157 = -0.0069966386;
            }
        }
    } else {
        if (inputs[11] < 0.35) {
            if (inputs[25] < 2.3917525) {
                var157 = 0.02026271;
            } else {
                if (inputs[13] < 1809.15) {
                    var157 = -0.029057497;
                } else {
                    if (inputs[13] < 1869.53) {
                        var157 = 0.020186866;
                    } else {
                        if (inputs[3] < 1934.555) {
                            var157 = -0.020478195;
                        } else {
                            var157 = 0.008933086;
                        }
                    }
                }
            }
        } else {
            var157 = 0.02572859;
        }
    }
    double var158;
    if (inputs[10] < 4.93) {
        if (inputs[9] < 7.53) {
            if (inputs[28] < 35.91772) {
                if (inputs[15] < -0.2869091) {
                    if (inputs[19] < 1.65015) {
                        var158 = 0.0;
                    } else {
                        var158 = 0.024017327;
                    }
                } else {
                    if (inputs[15] < 0.34339395) {
                        if (inputs[11] < 0.36) {
                            var158 = -0.036248855;
                        } else {
                            if (inputs[3] < 1847.925) {
                                var158 = -0.011399007;
                            } else {
                                var158 = 0.008439937;
                            }
                        }
                    } else {
                        if (inputs[34] < 2.811828) {
                            if (inputs[10] < 1.365) {
                                if (inputs[27] < 28.452589) {
                                    var158 = 0.021152748;
                                } else {
                                    var158 = -0.0068429513;
                                }
                            } else {
                                var158 = -0.019530887;
                            }
                        } else {
                            var158 = 0.025479045;
                        }
                    }
                }
            } else {
                var158 = -0.015174893;
            }
        } else {
            var158 = -0.01964009;
        }
    } else {
        if (inputs[25] < 2.4973638) {
            var158 = 0.0;
        } else {
            var158 = 0.024019022;
        }
    }
    double var159;
    if (inputs[24] < -20.538118) {
        if (inputs[11] < 0.29) {
            var159 = 0.0;
        } else {
            var159 = 0.022087166;
        }
    } else {
        if (inputs[14] < 0.547) {
            if (inputs[21] < -1.6590085) {
                if (inputs[20] < 0.7862127) {
                    if (inputs[18] < 1.7844554) {
                        var159 = -0.025815258;
                    } else {
                        var159 = 0.0010752666;
                    }
                } else {
                    var159 = 0.011827596;
                }
            } else {
                var159 = -0.03324288;
            }
        } else {
            if (inputs[17] < 1.1634259) {
                if (inputs[29] < 1.21) {
                    var159 = 0.00045103038;
                } else {
                    var159 = 0.02885855;
                }
            } else {
                if (inputs[29] < 1.205) {
                    var159 = 0.008126275;
                } else {
                    if (inputs[3] < 1870.185) {
                        var159 = -0.04001619;
                    } else {
                        var159 = -0.0037795806;
                    }
                }
            }
        }
    }
    double var160;
    if (inputs[36] < 4.820513) {
        if (inputs[1] < 69.51098) {
            if (inputs[24] < 16.323164) {
                if (inputs[25] < 2.5039165) {
                    if (inputs[10] < 0.48) {
                        var160 = -0.016939733;
                    } else {
                        if (inputs[9] < 6.4825) {
                            if (inputs[20] < 0.40182632) {
                                var160 = 0.0053017978;
                            } else {
                                var160 = 0.028394634;
                            }
                        } else {
                            var160 = -0.005737489;
                        }
                    }
                } else {
                    if (inputs[10] < 1.065) {
                        var160 = 0.0033291325;
                    } else {
                        var160 = -0.028566359;
                    }
                }
            } else {
                var160 = 0.019926528;
            }
        } else {
            var160 = -0.02157944;
        }
    } else {
        if (inputs[20] < -0.81941295) {
            var160 = 0.028506959;
        } else {
            var160 = -0.0005170081;
        }
    }
    double var161;
    if (inputs[2] < 1.2621429) {
        if (inputs[25] < 2.4425163) {
            var161 = 0.010788797;
        } else {
            if (inputs[37] < -0.81) {
                var161 = 0.0;
            } else {
                var161 = -0.029699862;
            }
        }
    } else {
        if (inputs[33] < 0.69088274) {
            var161 = 0.02338003;
        } else {
            if (inputs[6] < 1921.895) {
                if (inputs[26] < 41.917362) {
                    if (inputs[10] < 1.1225) {
                        if (inputs[29] < 1.12) {
                            var161 = 0.026716743;
                        } else {
                            var161 = -0.0012696825;
                        }
                    } else {
                        if (inputs[10] < 2.3475) {
                            var161 = -0.021230754;
                        } else {
                            var161 = 0.0005645315;
                        }
                    }
                } else {
                    var161 = 0.026655702;
                }
            } else {
                if (inputs[13] < 1958.17) {
                    var161 = -0.024254596;
                } else {
                    var161 = 0.00068821985;
                }
            }
        }
    }
    double var162;
    if (inputs[23] < 12.870723) {
        if (inputs[14] < 1.153) {
            if (inputs[37] < 15.19) {
                if (inputs[4] < 1906.525) {
                    if (inputs[9] < 7.94) {
                        if (inputs[19] < 1.8428277) {
                            if (inputs[19] < 1.4952768) {
                                if (inputs[27] < 15.321561) {
                                    if (inputs[35] < -3.9645786) {
                                        var162 = 0.0013294189;
                                    } else {
                                        var162 = -0.025893634;
                                    }
                                } else {
                                    if (inputs[16] < 0.10561654) {
                                        var162 = 0.02131757;
                                    } else {
                                        var162 = 0.0;
                                    }
                                }
                            } else {
                                var162 = -0.025425091;
                            }
                        } else {
                            var162 = 0.017117111;
                        }
                    } else {
                        var162 = -0.023118116;
                    }
                } else {
                    if (inputs[19] < 2.0623732) {
                        var162 = 0.02692255;
                    } else {
                        var162 = 0.0;
                    }
                }
            } else {
                var162 = -0.019740997;
            }
        } else {
            var162 = 0.018220963;
        }
    } else {
        var162 = -0.014005504;
    }
    double var163;
    if (inputs[37] < -7.975) {
        if (inputs[27] < 11.382329) {
            if (inputs[23] < -0.511498) {
                var163 = -0.007481537;
            } else {
                var163 = 0.013035375;
            }
        } else {
            var163 = -0.028115254;
        }
    } else {
        if (inputs[37] < -1.875) {
            var163 = 0.018385345;
        } else {
            if (inputs[26] < 23.667171) {
                if (inputs[27] < 24.410223) {
                    var163 = 0.025885403;
                } else {
                    var163 = 0.0;
                }
            } else {
                if (inputs[20] < 0.10260766) {
                    if (inputs[23] < -21.811958) {
                        var163 = 0.02860145;
                    } else {
                        if (inputs[13] < 1926.92) {
                            var163 = -0.019311227;
                        } else {
                            var163 = 0.012589634;
                        }
                    }
                } else {
                    if (inputs[10] < 1.31) {
                        var163 = -0.0007324164;
                    } else {
                        var163 = -0.0368277;
                    }
                }
            }
        }
    }
    double var164;
    if (inputs[24] < 25.472149) {
        if (inputs[8] < 1972.8) {
            if (inputs[15] < 0.47787878) {
                if (inputs[19] < 2.007625) {
                    if (inputs[19] < 1.8262407) {
                        if (inputs[6] < 1848.94) {
                            if (inputs[5] < 1805.3225) {
                                if (inputs[2] < 1.2035714) {
                                    var164 = 0.025374027;
                                } else {
                                    var164 = -0.005952244;
                                }
                            } else {
                                var164 = -0.02661751;
                            }
                        } else {
                            if (inputs[37] < -5.39) {
                                var164 = 0.0;
                            } else {
                                if (inputs[9] < 4.185) {
                                    var164 = 0.029842675;
                                } else {
                                    var164 = 0.0053315754;
                                }
                            }
                        }
                    } else {
                        var164 = 0.030481419;
                    }
                } else {
                    if (inputs[23] < -11.111024) {
                        var164 = -0.033061225;
                    } else {
                        var164 = 0.0027306182;
                    }
                }
            } else {
                if (inputs[14] < 0.824) {
                    var164 = 0.0021198986;
                } else {
                    var164 = 0.027450543;
                }
            }
        } else {
            var164 = -0.010972119;
        }
    } else {
        var164 = -0.015344283;
    }
    double var165;
    if (inputs[23] < 12.870723) {
        if (inputs[1] < 68.104) {
            if (inputs[23] < -36.984165) {
                if (inputs[33] < 0.7415536) {
                    var165 = 0.0029047278;
                } else {
                    var165 = -0.02775172;
                }
            } else {
                if (inputs[16] < 0.24211279) {
                    if (inputs[29] < 0.4625) {
                        var165 = 0.026132612;
                    } else {
                        if (inputs[29] < 1.315) {
                            var165 = -0.017884783;
                        } else {
                            if (inputs[33] < 0.8739007) {
                                var165 = 0.029376656;
                            } else {
                                if (inputs[36] < -1.239904) {
                                    var165 = -0.007417059;
                                } else {
                                    var165 = 0.01273148;
                                }
                            }
                        }
                    }
                } else {
                    var165 = 0.03155128;
                }
            }
        } else {
            if (inputs[25] < 2.5036497) {
                var165 = -0.024993997;
            } else {
                var165 = 0.0050486657;
            }
        }
    } else {
        var165 = -0.015776815;
    }
    double var166;
    if (inputs[31] < 19.76) {
        if (inputs[31] < 11.64) {
            if (inputs[18] < 1.5769857) {
                if (inputs[31] < 1.23) {
                    if (inputs[19] < 1.1724637) {
                        var166 = 0.0074803485;
                    } else {
                        if (inputs[25] < 2.5099075) {
                            var166 = -0.03785854;
                        } else {
                            var166 = -0.0055383495;
                        }
                    }
                } else {
                    if (inputs[18] < 1.3006014) {
                        var166 = -0.009368611;
                    } else {
                        var166 = 0.021134105;
                    }
                }
            } else {
                if (inputs[31] < 1.92) {
                    if (inputs[28] < 30.991985) {
                        if (inputs[3] < 1825.315) {
                            var166 = 0.0;
                        } else {
                            var166 = 0.028370002;
                        }
                    } else {
                        var166 = 0.0;
                    }
                } else {
                    var166 = -0.007199451;
                }
            }
        } else {
            var166 = 0.017464848;
        }
    } else {
        var166 = -0.018840631;
    }
    double var167;
    if (inputs[26] < 18.907682) {
        var167 = 0.01681639;
    } else {
        if (inputs[2] < 1.7742857) {
            if (inputs[15] < 0.38787878) {
                if (inputs[36] < 2.6466432) {
                    if (inputs[17] < 1.3530794) {
                        if (inputs[17] < 1.06356) {
                            var167 = -0.000789053;
                        } else {
                            if (inputs[20] < 0.1593122) {
                                var167 = 0.03466286;
                            } else {
                                var167 = 0.0058441204;
                            }
                        }
                    } else {
                        var167 = -0.014563486;
                    }
                } else {
                    var167 = -0.018822417;
                }
            } else {
                if (inputs[28] < 8.38395) {
                    var167 = -0.00044123078;
                } else {
                    var167 = 0.031719998;
                }
            }
        } else {
            if (inputs[10] < 3.685) {
                if (inputs[21] < -1.6590085) {
                    var167 = 0.0;
                } else {
                    var167 = -0.027030988;
                }
            } else {
                if (inputs[11] < 0.19) {
                    var167 = -0.0034279383;
                } else {
                    var167 = 0.012434525;
                }
            }
        }
    }
    double var168;
    if (inputs[29] < 0.4625) {
        if (inputs[17] < 1.1813145) {
            var168 = -0.0016773439;
        } else {
            var168 = 0.023649659;
        }
    } else {
        if (inputs[16] < -0.16814286) {
            if (inputs[33] < 0.69918364) {
                var168 = 0.010843186;
            } else {
                if (inputs[8] < 1860.17) {
                    var168 = -0.03945426;
                } else {
                    var168 = -0.0037063956;
                }
            }
        } else {
            if (inputs[16] < -0.08040602) {
                var168 = 0.022105368;
            } else {
                if (inputs[9] < 5.0075) {
                    if (inputs[32] < -1.82) {
                        var168 = 0.0;
                    } else {
                        if (inputs[6] < 1830.985) {
                            var168 = 0.0;
                        } else {
                            var168 = -0.032680213;
                        }
                    }
                } else {
                    if (inputs[1] < 69.51098) {
                        var168 = 0.020272246;
                    } else {
                        var168 = -0.0048198565;
                    }
                }
            }
        }
    }
    double var169;
    if (inputs[18] < 1.5769857) {
        if (inputs[11] < 0.4) {
            if (inputs[26] < 37.393147) {
                if (inputs[6] < 1813.925) {
                    var169 = 0.0;
                } else {
                    var169 = -0.0312943;
                }
            } else {
                var169 = 0.0035151972;
            }
        } else {
            if (inputs[9] < 4.2125) {
                if (inputs[23] < -11.305539) {
                    var169 = -0.02377906;
                } else {
                    var169 = 0.012427188;
                }
            } else {
                var169 = 0.027374608;
            }
        }
    } else {
        if (inputs[19] < 2.0623732) {
            if (inputs[9] < 4.0925) {
                var169 = 0.0;
            } else {
                var169 = 0.026983153;
            }
        } else {
            if (inputs[19] < 2.918807) {
                var169 = -0.016788773;
            } else {
                if (inputs[5] < 1913.95) {
                    var169 = 0.024151405;
                } else {
                    var169 = -0.0052485727;
                }
            }
        }
    }
    double var170;
    if (inputs[37] < -20.79) {
        var170 = -0.0124526685;
    } else {
        if (inputs[14] < -1.273) {
            var170 = 0.02415982;
        } else {
            if (inputs[36] < 4.820513) {
                if (inputs[10] < 2.1525) {
                    if (inputs[36] < -3.7361963) {
                        var170 = 0.022952098;
                    } else {
                        if (inputs[14] < -0.653) {
                            var170 = -0.01220885;
                        } else {
                            if (inputs[24] < 7.5238104) {
                                var170 = 0.017109962;
                            } else {
                                if (inputs[25] < 2.5036497) {
                                    if (inputs[9] < 3.6) {
                                        var170 = -0.024905566;
                                    } else {
                                        var170 = 0.003157053;
                                    }
                                } else {
                                    var170 = 0.008077522;
                                }
                            }
                        }
                    }
                } else {
                    if (inputs[13] < 1824.75) {
                        var170 = 0.0008406519;
                    } else {
                        var170 = -0.028737096;
                    }
                }
            } else {
                if (inputs[18] < 1.568082) {
                    var170 = 0.0;
                } else {
                    var170 = 0.028291503;
                }
            }
        }
    }
    double var171;
    if (inputs[37] < -18.09) {
        var171 = -0.012277065;
    } else {
        if (inputs[32] < -16.28) {
            var171 = 0.027065974;
        } else {
            if (inputs[31] < 0.845) {
                if (inputs[24] < -13.781551) {
                    if (inputs[1] < 30.190578) {
                        var171 = -0.005143866;
                    } else {
                        var171 = 0.024668436;
                    }
                } else {
                    if (inputs[18] < 1.6465126) {
                        var171 = -0.027821051;
                    } else {
                        var171 = 0.0;
                    }
                }
            } else {
                if (inputs[1] < 69.51098) {
                    if (inputs[25] < 2.5640244) {
                        if (inputs[10] < 2.06) {
                            if (inputs[9] < 4.2175) {
                                var171 = 0.013991135;
                            } else {
                                var171 = 0.042177957;
                            }
                        } else {
                            var171 = -0.002018817;
                        }
                    } else {
                        var171 = -0.0025117327;
                    }
                } else {
                    var171 = -0.008494259;
                }
            }
        }
    }
    double var172;
    if (inputs[13] < 1779.82) {
        if (inputs[19] < 1.449396) {
            var172 = 0.0046127792;
        } else {
            var172 = -0.027339853;
        }
    } else {
        if (inputs[33] < 0.7950766) {
            if (inputs[10] < 0.41) {
                var172 = -0.02106221;
            } else {
                if (inputs[20] < -0.7257052) {
                    var172 = 0.015279856;
                } else {
                    if (inputs[26] < 30.565756) {
                        var172 = 0.00966353;
                    } else {
                        var172 = -0.025983637;
                    }
                }
            }
        } else {
            if (inputs[33] < 0.9337072) {
                var172 = 0.024369935;
            } else {
                if (inputs[6] < 1839.435) {
                    var172 = 0.014354695;
                } else {
                    if (inputs[11] < 0.29) {
                        if (inputs[29] < 2.7125) {
                            var172 = -0.034874488;
                        } else {
                            var172 = 0.0030860747;
                        }
                    } else {
                        var172 = 0.008073032;
                    }
                }
            }
        }
    }
    double var173;
    if (inputs[28] < 35.46188) {
        if (inputs[15] < -0.2869091) {
            if (inputs[25] < 2.433526) {
                var173 = 0.031019121;
            } else {
                if (inputs[28] < 28.82013) {
                    var173 = -0.00895917;
                } else {
                    var173 = 0.011432315;
                }
            }
        } else {
            if (inputs[1] < 60.559483) {
                var173 = -0.023225432;
            } else {
                if (inputs[1] < 63.736034) {
                    var173 = 0.016862083;
                } else {
                    if (inputs[27] < 27.41495) {
                        var173 = -0.029303959;
                    } else {
                        if (inputs[34] < 2.38685) {
                            var173 = -0.01243012;
                        } else {
                            if (inputs[14] < 0.727) {
                                var173 = 0.025548512;
                            } else {
                                if (inputs[17] < 1.470434) {
                                    var173 = -0.0067891423;
                                } else {
                                    var173 = 0.0057841092;
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        var173 = -0.015730139;
    }
    double var174;
    if (inputs[33] < 1.3552501) {
        if (inputs[19] < 1.3839855) {
            if (inputs[2] < 1.2035714) {
                if (inputs[14] < 0.316) {
                    var174 = -0.008994224;
                } else {
                    var174 = 0.019389143;
                }
            } else {
                if (inputs[10] < 0.9425) {
                    var174 = -0.00060269365;
                } else {
                    var174 = -0.03975054;
                }
            }
        } else {
            if (inputs[14] < 0.707) {
                if (inputs[16] < -0.23841353) {
                    var174 = 0.0;
                } else {
                    if (inputs[29] < 2.2625) {
                        if (inputs[28] < 30.701906) {
                            var174 = 0.021284081;
                        } else {
                            var174 = -0.0038137047;
                        }
                    } else {
                        var174 = 0.03723886;
                    }
                }
            } else {
                if (inputs[20] < 0.08772628) {
                    var174 = 0.00559171;
                } else {
                    var174 = -0.019281246;
                }
            }
        }
    } else {
        if (inputs[38] < 17.0) {
            var174 = -0.03397464;
        } else {
            var174 = 0.0024442382;
        }
    }
    double var175;
    if (inputs[26] < 18.907682) {
        var175 = 0.018142868;
    } else {
        if (inputs[26] < 21.864346) {
            var175 = -0.019633379;
        } else {
            if (inputs[17] < 0.86311066) {
                var175 = -0.018074071;
            } else {
                if (inputs[32] < -5.445) {
                    if (inputs[32] < -12.12) {
                        if (inputs[13] < 1835.61) {
                            var175 = 0.012418519;
                        } else {
                            var175 = -0.010071932;
                        }
                    } else {
                        if (inputs[2] < 1.4471428) {
                            var175 = 0.030162547;
                        } else {
                            var175 = 0.0058696847;
                        }
                    }
                } else {
                    if (inputs[35] < -2.460724) {
                        if (inputs[28] < 33.872673) {
                            var175 = 0.0;
                        } else {
                            var175 = -0.03274261;
                        }
                    } else {
                        if (inputs[15] < 0.43527272) {
                            if (inputs[32] < 9.6) {
                                var175 = 0.0002600928;
                            } else {
                                var175 = 0.029642502;
                            }
                        } else {
                            if (inputs[10] < 2.3575) {
                                var175 = -0.022903584;
                            } else {
                                var175 = 0.0020556732;
                            }
                        }
                    }
                }
            }
        }
    }
    double var176;
    if (inputs[26] < 27.55119) {
        if (inputs[32] < 10.7) {
            if (inputs[14] < 0.834) {
                if (inputs[16] < 0.03517293) {
                    if (inputs[37] < -3.625) {
                        var176 = -0.010795805;
                    } else {
                        var176 = 0.017576413;
                    }
                } else {
                    var176 = -0.02247955;
                }
            } else {
                var176 = 0.016375402;
            }
        } else {
            var176 = -0.026454177;
        }
    } else {
        if (inputs[26] < 31.036274) {
            if (inputs[2] < 1.435) {
                var176 = 0.032780282;
            } else {
                var176 = 0.0;
            }
        } else {
            if (inputs[10] < 2.6875) {
                if (inputs[25] < 2.4900498) {
                    var176 = -0.024374899;
                } else {
                    if (inputs[33] < 0.6835874) {
                        var176 = 0.019537883;
                    } else {
                        var176 = -0.010425639;
                    }
                }
            } else {
                if (inputs[27] < 10.883207) {
                    var176 = 0.0;
                } else {
                    var176 = 0.02210091;
                }
            }
        }
    }
    double var177;
    if (inputs[38] < 17.0) {
        if (inputs[11] < 0.29) {
            if (inputs[32] < 0.715) {
                var177 = -0.038624857;
            } else {
                var177 = 0.0;
            }
        } else {
            if (inputs[32] < 15.005) {
                if (inputs[13] < 1850.84) {
                    if (inputs[10] < 2.3475) {
                        if (inputs[25] < 2.5036497) {
                            var177 = -0.023997383;
                        } else {
                            var177 = 0.000995549;
                        }
                    } else {
                        var177 = 0.01366756;
                    }
                } else {
                    if (inputs[34] < -1.7209866) {
                        var177 = -0.0013112033;
                    } else {
                        if (inputs[27] < 29.043612) {
                            var177 = 0.03890796;
                        } else {
                            var177 = 0.013635906;
                        }
                    }
                }
            } else {
                var177 = -0.020171622;
            }
        }
    } else {
        if (inputs[19] < 1.8262407) {
            var177 = -0.0039547714;
        } else {
            if (inputs[6] < 1848.275) {
                var177 = 0.03311434;
            } else {
                var177 = 0.0011116989;
            }
        }
    }
    double var178;
    if (inputs[26] < 39.93322) {
        if (inputs[17] < 1.1424255) {
            if (inputs[13] < 1880.57) {
                if (inputs[10] < 0.89) {
                    var178 = 0.0015219584;
                } else {
                    var178 = 0.04098502;
                }
            } else {
                var178 = -0.0041783126;
            }
        } else {
            if (inputs[38] < 7.0) {
                var178 = 0.01800164;
            } else {
                if (inputs[14] < -1.273) {
                    var178 = 0.0154325785;
                } else {
                    if (inputs[14] < -0.594) {
                        if (inputs[9] < 4.2775) {
                            var178 = -0.03309007;
                        } else {
                            var178 = 0.0;
                        }
                    } else {
                        if (inputs[10] < 1.365) {
                            if (inputs[36] < 1.7406528) {
                                var178 = 0.023586348;
                            } else {
                                var178 = 0.0;
                            }
                        } else {
                            var178 = -0.017702144;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[5] < 1813.395) {
            var178 = -0.033299964;
        } else {
            if (inputs[25] < 2.502924) {
                var178 = -0.008659192;
            } else {
                var178 = 0.021701561;
            }
        }
    }
    double var179;
    if (inputs[2] < 1.7742857) {
        if (inputs[14] < 0.932) {
            if (inputs[19] < 1.7945263) {
                if (inputs[36] < -3.5651634) {
                    if (inputs[35] < -4.4423075) {
                        var179 = 0.0;
                    } else {
                        var179 = 0.019798841;
                    }
                } else {
                    if (inputs[18] < 1.4383407) {
                        if (inputs[14] < 0.636) {
                            var179 = -0.010875548;
                        } else {
                            var179 = 0.009261435;
                        }
                    } else {
                        var179 = -0.026238265;
                    }
                }
            } else {
                var179 = 0.01984783;
            }
        } else {
            var179 = 0.02148733;
        }
    } else {
        if (inputs[1] < 63.736034) {
            if (inputs[24] < -14.195496) {
                var179 = -0.016793767;
            } else {
                if (inputs[9] < 3.975) {
                    var179 = -0.004278441;
                } else {
                    var179 = 0.019139586;
                }
            }
        } else {
            var179 = -0.020204108;
        }
    }
    double var180;
    if (inputs[32] < 10.595) {
        if (inputs[31] < 6.695) {
            if (inputs[31] < 0.99) {
                if (inputs[28] < 32.29316) {
                    if (inputs[18] < 1.5900154) {
                        if (inputs[11] < 0.4) {
                            var180 = -0.03955359;
                        } else {
                            var180 = 0.004262446;
                        }
                    } else {
                        if (inputs[25] < 2.4968016) {
                            var180 = -0.011258188;
                        } else {
                            var180 = 0.016612075;
                        }
                    }
                } else {
                    if (inputs[14] < -0.871) {
                        var180 = -0.0015122424;
                    } else {
                        var180 = 0.019741056;
                    }
                }
            } else {
                if (inputs[38] < 15.0) {
                    var180 = 0.02581262;
                } else {
                    var180 = 0.0;
                }
            }
        } else {
            var180 = -0.020021534;
        }
    } else {
        if (inputs[26] < 28.393423) {
            var180 = -0.008917179;
        } else {
            var180 = 0.023573533;
        }
    }
    double var181;
    if (inputs[25] < 2.5384614) {
        if (inputs[9] < 3.17) {
            if (inputs[4] < 1848.53) {
                var181 = -0.021016492;
            } else {
                var181 = 0.006157623;
            }
        } else {
            if (inputs[10] < 0.4875) {
                var181 = 0.033657007;
            } else {
                if (inputs[25] < 2.502924) {
                    if (inputs[32] < -5.945) {
                        if (inputs[24] < -15.05701) {
                            var181 = 0.027341953;
                        } else {
                            var181 = 0.0;
                        }
                    } else {
                        if (inputs[32] < 5.685) {
                            var181 = -0.02580151;
                        } else {
                            if (inputs[20] < -0.2839866) {
                                var181 = 0.0039382908;
                            } else {
                                var181 = -0.007576723;
                            }
                        }
                    }
                } else {
                    var181 = 0.023387343;
                }
            }
        }
    } else {
        if (inputs[9] < 3.2025) {
            var181 = 0.008668782;
        } else {
            if (inputs[9] < 5.73) {
                var181 = -0.03162226;
            } else {
                var181 = 0.0;
            }
        }
    }
    double var182;
    if (inputs[28] < 37.805393) {
        if (inputs[32] < -16.28) {
            var182 = 0.013845204;
        } else {
            if (inputs[1] < 66.95448) {
                if (inputs[11] < 0.31) {
                    if (inputs[36] < -1.350756) {
                        var182 = 0.0;
                    } else {
                        var182 = 0.03002675;
                    }
                } else {
                    if (inputs[11] < 0.36) {
                        var182 = -0.025423897;
                    } else {
                        if (inputs[32] < -4.015) {
                            var182 = -0.013269898;
                        } else {
                            if (inputs[14] < -0.577) {
                                var182 = 0.0;
                            } else {
                                var182 = 0.020261038;
                            }
                        }
                    }
                }
            } else {
                if (inputs[38] < 14.0) {
                    var182 = 0.0017887859;
                } else {
                    var182 = -0.02335922;
                }
            }
        }
    } else {
        var182 = -0.014301098;
    }
    double var183;
    if (inputs[31] < 19.76) {
        if (inputs[38] < 12.0) {
            if (inputs[13] < 1849.95) {
                if (inputs[23] < -41.405205) {
                    var183 = 0.01708629;
                } else {
                    var183 = -0.026140591;
                }
            } else {
                if (inputs[38] < 9.0) {
                    var183 = 0.0022596607;
                } else {
                    var183 = 0.035680953;
                }
            }
        } else {
            if (inputs[19] < 1.3665477) {
                var183 = -0.01622401;
            } else {
                if (inputs[18] < 2.0095332) {
                    if (inputs[18] < 1.5656245) {
                        if (inputs[32] < 0.665) {
                            var183 = -0.010249127;
                        } else {
                            var183 = 0.008026753;
                        }
                    } else {
                        var183 = 0.020773748;
                    }
                } else {
                    if (inputs[11] < 0.19) {
                        var183 = 0.006451384;
                    } else {
                        var183 = -0.019023636;
                    }
                }
            }
        }
    } else {
        var183 = -0.021602;
    }
    double var184;
    if (inputs[18] < 3.397783) {
        if (inputs[10] < 4.93) {
            if (inputs[2] < 2.0564287) {
                if (inputs[28] < 8.38395) {
                    var184 = -0.01084281;
                } else {
                    if (inputs[9] < 6.355) {
                        if (inputs[34] < -2.714732) {
                            var184 = -0.0051340773;
                        } else {
                            if (inputs[38] < 14.0) {
                                if (inputs[38] < 9.0) {
                                    var184 = 0.0040994273;
                                } else {
                                    var184 = 0.034843184;
                                }
                            } else {
                                if (inputs[19] < 1.3697901) {
                                    var184 = -0.009940502;
                                } else {
                                    var184 = 0.012478916;
                                }
                            }
                        }
                    } else {
                        var184 = -0.009954235;
                    }
                }
            } else {
                if (inputs[1] < 58.76526) {
                    var184 = -0.029182022;
                } else {
                    var184 = 0.0037626552;
                }
            }
        } else {
            var184 = 0.019238502;
        }
    } else {
        var184 = -0.02085961;
    }
    double var185;
    if (inputs[15] < -0.71115154) {
        var185 = 0.0141999945;
    } else {
        if (inputs[16] < -0.27690977) {
            var185 = -0.01964614;
        } else {
            if (inputs[32] < -16.28) {
                var185 = 0.014832067;
            } else {
                if (inputs[9] < 1.825) {
                    var185 = -0.019513533;
                } else {
                    if (inputs[31] < 0.555) {
                        if (inputs[2] < 1.4685714) {
                            if (inputs[2] < 1.2278571) {
                                var185 = -0.011192059;
                            } else {
                                var185 = 0.018884413;
                            }
                        } else {
                            var185 = -0.01969135;
                        }
                    } else {
                        if (inputs[31] < 4.64) {
                            var185 = 0.028861016;
                        } else {
                            if (inputs[17] < 1.0431107) {
                                var185 = 0.013192928;
                            } else {
                                if (inputs[13] < 1805.64) {
                                    var185 = 0.005228356;
                                } else {
                                    if (inputs[38] < 14.0) {
                                        var185 = 0.0;
                                    } else {
                                        var185 = -0.026515147;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    double var186;
    if (inputs[20] < -1.5947609) {
        var186 = -0.02406073;
    } else {
        if (inputs[20] < -0.8732041) {
            if (inputs[18] < 1.4179735) {
                var186 = 0.023509867;
            } else {
                var186 = 0.0;
            }
        } else {
            if (inputs[10] < 0.45) {
                if (inputs[9] < 2.8275) {
                    var186 = -0.0067066886;
                } else {
                    var186 = 0.027296564;
                }
            } else {
                if (inputs[26] < 34.66834) {
                    if (inputs[32] < -7.38) {
                        var186 = 0.010019984;
                    } else {
                        if (inputs[9] < 4.44) {
                            var186 = 0.0;
                        } else {
                            var186 = -0.017779263;
                        }
                    }
                } else {
                    if (inputs[37] < -1.575) {
                        var186 = -0.002178416;
                    } else {
                        var186 = -0.031256083;
                    }
                }
            }
        }
    }
    double var187;
    if (inputs[37] < 15.19) {
        if (inputs[28] < 35.46188) {
            if (inputs[24] < -20.716888) {
                var187 = 0.022307873;
            } else {
                if (inputs[10] < 1.365) {
                    if (inputs[18] < 1.3113737) {
                        var187 = -0.0054493514;
                    } else {
                        if (inputs[20] < -0.2839866) {
                            var187 = 0.0;
                        } else {
                            if (inputs[29] < 2.2625) {
                                var187 = 0.0054463134;
                            } else {
                                var187 = 0.036519676;
                            }
                        }
                    }
                } else {
                    if (inputs[10] < 2.0175) {
                        var187 = -0.019975165;
                    } else {
                        if (inputs[23] < -22.778442) {
                            var187 = 0.017453913;
                        } else {
                            var187 = -0.008822469;
                        }
                    }
                }
            }
        } else {
            if (inputs[20] < 0.7735623) {
                var187 = -0.022066198;
            } else {
                var187 = 0.0;
            }
        }
    } else {
        var187 = -0.014267332;
    }
    double var188;
    if (inputs[31] < 6.695) {
        if (inputs[37] < -16.75) {
            var188 = -0.013865287;
        } else {
            if (inputs[29] < 1.315) {
                if (inputs[17] < 1.3608291) {
                    if (inputs[20] < -0.234652) {
                        var188 = 0.0;
                    } else {
                        var188 = -0.022028212;
                    }
                } else {
                    var188 = 0.0070541003;
                }
            } else {
                if (inputs[2] < 1.5914285) {
                    if (inputs[20] < -0.04309549) {
                        var188 = 0.03960589;
                    } else {
                        var188 = 0.007545509;
                    }
                } else {
                    if (inputs[18] < 1.8571904) {
                        var188 = -0.0153720975;
                    } else {
                        var188 = 0.0075611174;
                    }
                }
            }
        }
    } else {
        if (inputs[31] < 11.485) {
            var188 = -0.033428866;
        } else {
            if (inputs[5] < 1931.6725) {
                var188 = 0.011664771;
            } else {
                var188 = -0.013438655;
            }
        }
    }
    double var189;
    if (inputs[28] < 35.46188) {
        if (inputs[18] < 1.5769857) {
            if (inputs[31] < 0.99) {
                if (inputs[33] < 0.6929307) {
                    var189 = 0.00015789107;
                } else {
                    var189 = -0.031887922;
                }
            } else {
                if (inputs[27] < 24.410223) {
                    var189 = 0.024618058;
                } else {
                    var189 = -0.004153212;
                }
            }
        } else {
            if (inputs[37] < 13.825) {
                if (inputs[31] < 1.92) {
                    if (inputs[36] < -2.796875) {
                        var189 = 0.0059158537;
                    } else {
                        var189 = 0.02758965;
                    }
                } else {
                    var189 = 0.0;
                }
            } else {
                var189 = -0.015955681;
            }
        }
    } else {
        var189 = -0.012923526;
    }
    double var190;
    if (inputs[15] < -0.71115154) {
        var190 = 0.015556328;
    } else {
        if (inputs[29] < 1.725) {
            if (inputs[29] < 1.31) {
                if (inputs[17] < 1.1192747) {
                    var190 = -0.015400068;
                } else {
                    if (inputs[29] < 0.82) {
                        if (inputs[20] < 0.48772484) {
                            var190 = 0.0;
                        } else {
                            var190 = 0.026426855;
                        }
                    } else {
                        var190 = -0.007840208;
                    }
                }
            } else {
                var190 = 0.017433533;
            }
        } else {
            if (inputs[25] < 2.386179) {
                var190 = 0.00921895;
            } else {
                if (inputs[13] < 1929.54) {
                    if (inputs[19] < 1.4247417) {
                        var190 = -0.0035181295;
                    } else {
                        var190 = -0.03174297;
                    }
                } else {
                    var190 = 0.0024922523;
                }
            }
        }
    }
    double var191;
    if (inputs[23] < -54.19395) {
        var191 = -0.012196611;
    } else {
        if (inputs[2] < 1.7892857) {
            if (inputs[20] < 1.4255439) {
                if (inputs[2] < 1.3007143) {
                    if (inputs[25] < 2.519774) {
                        var191 = -0.011937013;
                    } else {
                        var191 = 0.02150651;
                    }
                } else {
                    if (inputs[9] < 3.55) {
                        var191 = 0.033724755;
                    } else {
                        var191 = 0.007834316;
                    }
                }
            } else {
                var191 = -0.008078087;
            }
        } else {
            if (inputs[4] < 1807.935) {
                var191 = 0.01366588;
            } else {
                if (inputs[14] < -0.951) {
                    var191 = 0.003693464;
                } else {
                    if (inputs[11] < 0.33) {
                        var191 = -0.02844634;
                    } else {
                        var191 = 0.0;
                    }
                }
            }
        }
    }
    double var192;
    if (inputs[15] < 0.4948485) {
        if (inputs[26] < 26.892513) {
            if (inputs[10] < 0.965) {
                if (inputs[3] < 1848.31) {
                    var192 = -0.00536513;
                } else {
                    var192 = 0.012020338;
                }
            } else {
                if (inputs[26] < 22.546814) {
                    var192 = -0.0039912458;
                } else {
                    var192 = -0.03627792;
                }
            }
        } else {
            if (inputs[26] < 31.036274) {
                if (inputs[2] < 1.4014286) {
                    var192 = 0.030586397;
                } else {
                    var192 = 0.00083646673;
                }
            } else {
                if (inputs[32] < 10.595) {
                    if (inputs[28] < 30.306915) {
                        var192 = -0.021953333;
                    } else {
                        if (inputs[23] < -2.2112257) {
                            var192 = -0.0060374895;
                        } else {
                            var192 = 0.012812811;
                        }
                    }
                } else {
                    var192 = 0.023668313;
                }
            }
        }
    } else {
        if (inputs[15] < 0.6293333) {
            var192 = 0.022056626;
        } else {
            var192 = 0.0;
        }
    }
    double var193;
    if (inputs[37] < -18.09) {
        var193 = -0.010512182;
    } else {
        if (inputs[10] < 4.93) {
            if (inputs[2] < 1.7892857) {
                if (inputs[20] < 0.0019530482) {
                    if (inputs[23] < -0.511498) {
                        var193 = 0.025877371;
                    } else {
                        var193 = 0.0;
                    }
                } else {
                    if (inputs[26] < 29.357567) {
                        var193 = 0.010175476;
                    } else {
                        if (inputs[6] < 1850.52) {
                            var193 = -0.03851824;
                        } else {
                            var193 = 0.0015757536;
                        }
                    }
                }
            } else {
                if (inputs[14] < -0.861) {
                    var193 = 0.00846732;
                } else {
                    if (inputs[28] < 13.275118) {
                        var193 = -0.00008870584;
                    } else {
                        var193 = -0.03828245;
                    }
                }
            }
        } else {
            var193 = 0.014625232;
        }
    }
    double var194;
    if (inputs[33] < 0.6929307) {
        if (inputs[19] < 1.3697901) {
            if (inputs[17] < 1.1727062) {
                var194 = -0.018384444;
            } else {
                var194 = 0.0066510136;
            }
        } else {
            var194 = 0.024162274;
        }
    } else {
        if (inputs[20] < -0.5130412) {
            if (inputs[36] < 3.6241984) {
                var194 = -0.023805285;
            } else {
                var194 = 0.0027049317;
            }
        } else {
            if (inputs[11] < 0.36) {
                if (inputs[33] < 1.2116929) {
                    var194 = -0.020061603;
                } else {
                    if (inputs[31] < -8.32) {
                        var194 = -0.009057691;
                    } else {
                        var194 = 0.024471488;
                    }
                }
            } else {
                if (inputs[28] < 22.25458) {
                    var194 = 0.036847096;
                } else {
                    var194 = 0.0;
                }
            }
        }
    }
    double var195;
    if (inputs[27] < 7.0958705) {
        var195 = -0.018163992;
    } else {
        if (inputs[19] < 2.918807) {
            if (inputs[19] < 2.0873559) {
                if (inputs[18] < 1.8571904) {
                    if (inputs[18] < 1.4347823) {
                        if (inputs[11] < 0.4) {
                            if (inputs[10] < 0.965) {
                                var195 = 0.0047517163;
                            } else {
                                var195 = -0.0237121;
                            }
                        } else {
                            if (inputs[20] < 0.48772484) {
                                var195 = 0.022870284;
                            } else {
                                var195 = 0.0;
                            }
                        }
                    } else {
                        if (inputs[10] < 1.835) {
                            var195 = -0.020997874;
                        } else {
                            var195 = 0.004820766;
                        }
                    }
                } else {
                    var195 = 0.012991294;
                }
            } else {
                var195 = -0.014597805;
            }
        } else {
            if (inputs[19] < 4.3681417) {
                var195 = 0.028760701;
            } else {
                var195 = 0.0;
            }
        }
    }
    double var196;
    if (inputs[5] < 1923.3774) {
        if (inputs[23] < -13.682985) {
            if (inputs[27] < 10.210523) {
                var196 = -0.023775356;
            } else {
                if (inputs[16] < 0.056233082) {
                    if (inputs[37] < -3.37) {
                        var196 = 0.0;
                    } else {
                        var196 = 0.03538845;
                    }
                } else {
                    if (inputs[21] < 2.9065473) {
                        var196 = -0.032951403;
                    } else {
                        var196 = 0.010100815;
                    }
                }
            }
        } else {
            if (inputs[17] < 1.5558097) {
                if (inputs[36] < 2.2244165) {
                    var196 = 0.013787539;
                } else {
                    var196 = -0.009726637;
                }
            } else {
                var196 = 0.030545883;
            }
        }
    } else {
        if (inputs[12] < 1936.37) {
            var196 = -0.025901893;
        } else {
            if (inputs[3] < 1974.84) {
                var196 = 0.007998197;
            } else {
                var196 = -0.009635864;
            }
        }
    }
    double var197;
    if (inputs[27] < 11.147679) {
        if (inputs[26] < 31.036274) {
            var197 = 0.020424545;
        } else {
            if (inputs[16] < -0.23669173) {
                var197 = 0.011497236;
            } else {
                var197 = -0.013655807;
            }
        }
    } else {
        if (inputs[16] < -0.1673609) {
            var197 = -0.022807451;
        } else {
            if (inputs[10] < 3.645) {
                if (inputs[10] < 1.74) {
                    if (inputs[19] < 1.7945263) {
                        if (inputs[25] < 2.5093834) {
                            if (inputs[29] < 1.165) {
                                var197 = 0.0;
                            } else {
                                var197 = -0.028660726;
                            }
                        } else {
                            var197 = 0.008967598;
                        }
                    } else {
                        var197 = 0.012679078;
                    }
                } else {
                    if (inputs[33] < 0.7373939) {
                        var197 = 0.0;
                    } else {
                        var197 = -0.034411144;
                    }
                }
            } else {
                var197 = 0.010536462;
            }
        }
    }
    double var198;
    if (inputs[9] < 4.03) {
        if (inputs[2] < 1.2621429) {
            var198 = -0.019329708;
        } else {
            if (inputs[25] < 2.4900498) {
                var198 = -0.008332156;
            } else {
                if (inputs[35] < 1.1729935) {
                    var198 = 0.0;
                } else {
                    var198 = 0.030013867;
                }
            }
        }
    } else {
        if (inputs[32] < -12.26) {
            var198 = -0.007371515;
        } else {
            if (inputs[32] < -5.945) {
                var198 = 0.038571265;
            } else {
                if (inputs[5] < 1871.4225) {
                    if (inputs[8] < 1789.07) {
                        var198 = 0.014380828;
                    } else {
                        var198 = -0.019111462;
                    }
                } else {
                    if (inputs[13] < 1926.92) {
                        var198 = 0.029337078;
                    } else {
                        var198 = 0.0;
                    }
                }
            }
        }
    }
    double var199;
    if (inputs[19] < 1.3839855) {
        if (inputs[18] < 1.1291595) {
            var199 = 0.004245219;
        } else {
            if (inputs[33] < 0.7459095) {
                var199 = 0.0;
            } else {
                var199 = -0.0308741;
            }
        }
    } else {
        if (inputs[33] < 0.6929307) {
            var199 = 0.0242585;
        } else {
            if (inputs[25] < 2.3917525) {
                var199 = 0.013589816;
            } else {
                if (inputs[11] < 0.21) {
                    var199 = 0.012901559;
                } else {
                    if (inputs[36] < 3.2202415) {
                        if (inputs[11] < 0.35) {
                            var199 = -0.032138124;
                        } else {
                            var199 = -0.0007481231;
                        }
                    } else {
                        var199 = 0.006416691;
                    }
                }
            }
        }
    }
    double var200;
    if (inputs[25] < 2.3515065) {
        var200 = -0.010720509;
    } else {
        if (inputs[1] < 31.394823) {
            if (inputs[23] < -15.129381) {
                var200 = -0.01509014;
            } else {
                var200 = 0.0026525033;
            }
        } else {
            if (inputs[5] < 1786.2426) {
                var200 = -0.0043508755;
            } else {
                if (inputs[37] < 13.825) {
                    if (inputs[18] < 1.8324206) {
                        if (inputs[9] < 3.345) {
                            var200 = 0.021804165;
                        } else {
                            if (inputs[8] < 1862.05) {
                                var200 = 0.0055966354;
                            } else {
                                var200 = -0.012830499;
                            }
                        }
                    } else {
                        var200 = 0.03008172;
                    }
                } else {
                    var200 = -0.0047766743;
                }
            }
        }
    }
    double var201;
    if (inputs[18] < 1.3142484) {
        if (inputs[11] < 0.4) {
            var201 = -0.022095708;
        } else {
            var201 = 0.00638413;
        }
    } else {
        if (inputs[33] < 0.6488969) {
            var201 = 0.01622849;
        } else {
            if (inputs[36] < 2.415825) {
                if (inputs[15] < 0.41733333) {
                    if (inputs[14] < -0.588) {
                        if (inputs[28] < 31.591608) {
                            var201 = 0.004852757;
                        } else {
                            var201 = -0.011317285;
                        }
                    } else {
                        var201 = 0.015374144;
                    }
                } else {
                    var201 = -0.019831793;
                }
            } else {
                if (inputs[16] < 0.21204512) {
                    var201 = 0.0;
                } else {
                    var201 = 0.015899329;
                }
            }
        }
    }
    double var202;
    if (inputs[2] < 1.7892857) {
        if (inputs[25] < 2.3917525) {
            var202 = 0.02206226;
        } else {
            if (inputs[17] < 1.535552) {
                if (inputs[2] < 1.5521429) {
                    if (inputs[5] < 1778.7025) {
                        var202 = 0.0137417205;
                    } else {
                        if (inputs[11] < 0.41) {
                            if (inputs[29] < 1.59) {
                                var202 = -0.027485495;
                            } else {
                                var202 = 0.0;
                            }
                        } else {
                            var202 = 0.0077206525;
                        }
                    }
                } else {
                    var202 = 0.037738375;
                }
            } else {
                var202 = -0.011896689;
            }
        }
    } else {
        if (inputs[27] < 23.976524) {
            if (inputs[28] < 24.629818) {
                var202 = 0.014614894;
            } else {
                if (inputs[19] < 3.222546) {
                    var202 = -0.016700719;
                } else {
                    var202 = 0.007521294;
                }
            }
        } else {
            var202 = -0.016563755;
        }
    }
    double var203;
    if (inputs[25] < 2.623053) {
        if (inputs[5] < 1786.2426) {
            if (inputs[19] < 1.3936301) {
                var203 = 0.0009787553;
            } else {
                var203 = -0.018155439;
            }
        } else {
            if (inputs[37] < 15.19) {
                if (inputs[37] < 0.945) {
                    if (inputs[27] < 8.456774) {
                        var203 = 0.019981854;
                    } else {
                        if (inputs[18] < 1.871688) {
                            if (inputs[17] < 1.26158) {
                                var203 = 0.0;
                            } else {
                                var203 = -0.02373771;
                            }
                        } else {
                            var203 = 0.0104031535;
                        }
                    }
                } else {
                    if (inputs[25] < 2.4956772) {
                        var203 = 0.0045572496;
                    } else {
                        var203 = 0.033627618;
                    }
                }
            } else {
                var203 = -0.01423216;
            }
        }
    } else {
        var203 = -0.0089443745;
    }
    double var204;
    if (inputs[23] < -26.164455) {
        if (inputs[20] < -0.24893561) {
            var204 = 0.010781576;
        } else {
            if (inputs[32] < -2.52) {
                var204 = 0.0;
            } else {
                var204 = -0.037191074;
            }
        }
    } else {
        if (inputs[36] < -4.8871126) {
            var204 = 0.027160766;
        } else {
            if (inputs[2] < 1.2657143) {
                var204 = -0.011840431;
            } else {
                if (inputs[2] < 1.7892857) {
                    if (inputs[29] < 1.28) {
                        var204 = 0.0010904198;
                    } else {
                        var204 = 0.025566205;
                    }
                } else {
                    if (inputs[23] < 0.3177864) {
                        if (inputs[23] < -10.580304) {
                            var204 = -0.006160649;
                        } else {
                            var204 = 0.015379682;
                        }
                    } else {
                        var204 = -0.01937865;
                    }
                }
            }
        }
    }
    double var205;
    if (inputs[28] < 7.917422) {
        var205 = -0.0108077;
    } else {
        if (inputs[28] < 9.198891) {
            var205 = 0.018700056;
        } else {
            if (inputs[38] < 9.0) {
                if (inputs[18] < 1.3673555) {
                    var205 = -0.03186176;
                } else {
                    var205 = 0.0053370586;
                }
            } else {
                if (inputs[38] < 12.0) {
                    if (inputs[18] < 1.4274677) {
                        var205 = 0.030207518;
                    } else {
                        var205 = -0.000033647957;
                    }
                } else {
                    if (inputs[24] < 14.119192) {
                        if (inputs[36] < -1.239904) {
                            if (inputs[29] < 2.9875) {
                                if (inputs[15] < -0.47048485) {
                                    var205 = 0.0;
                                } else {
                                    var205 = -0.023250468;
                                }
                            } else {
                                var205 = 0.011990448;
                            }
                        } else {
                            var205 = 0.016667662;
                        }
                    } else {
                        var205 = -0.01938195;
                    }
                }
            }
        }
    }
    double var206;
    if (inputs[18] < 3.397783) {
        if (inputs[10] < 5.0575) {
            if (inputs[23] < 10.870579) {
                if (inputs[15] < 0.5062424) {
                    if (inputs[1] < 69.681725) {
                        if (inputs[33] < 0.69918364) {
                            if (inputs[19] < 1.27377) {
                                var206 = 0.0;
                            } else {
                                var206 = 0.02669126;
                            }
                        } else {
                            if (inputs[33] < 0.7847997) {
                                var206 = -0.028396787;
                            } else {
                                if (inputs[2] < 2.0564287) {
                                    if (inputs[10] < 1.1225) {
                                        var206 = 0.028940015;
                                    } else {
                                        var206 = -0.0007607945;
                                    }
                                } else {
                                    var206 = -0.010195716;
                                }
                            }
                        }
                    } else {
                        var206 = -0.02078755;
                    }
                } else {
                    var206 = 0.021794083;
                }
            } else {
                var206 = -0.015411076;
            }
        } else {
            var206 = 0.023230705;
        }
    } else {
        var206 = -0.01671812;
    }
    double var207;
    if (inputs[28] < 16.36298) {
        if (inputs[10] < 0.315) {
            var207 = 0.025091548;
        } else {
            if (inputs[25] < 2.5521367) {
                if (inputs[25] < 2.502924) {
                    if (inputs[1] < 66.425255) {
                        var207 = 0.01497737;
                    } else {
                        var207 = -0.005892279;
                    }
                } else {
                    var207 = 0.0323325;
                }
            } else {
                var207 = -0.011383316;
            }
        }
    } else {
        if (inputs[1] < 36.823784) {
            if (inputs[28] < 35.46188) {
                if (inputs[26] < 27.55119) {
                    var207 = -0.005006156;
                } else {
                    if (inputs[1] < 30.784996) {
                        var207 = 0.0;
                    } else {
                        var207 = 0.032758396;
                    }
                }
            } else {
                var207 = -0.008652309;
            }
        } else {
            var207 = -0.022546155;
        }
    }
    double var208;
    if (inputs[8] < 1972.8) {
        if (inputs[32] < 13.01) {
            if (inputs[12] < 1936.37) {
                if (inputs[31] < 6.695) {
                    if (inputs[10] < 0.2125) {
                        var208 = -0.022612164;
                    } else {
                        if (inputs[19] < 2.173166) {
                            if (inputs[1] < 31.394823) {
                                var208 = 0.0;
                            } else {
                                if (inputs[35] < -1.592425) {
                                    var208 = 0.02652662;
                                } else {
                                    if (inputs[36] < 3.5044699) {
                                        var208 = -0.005004557;
                                    } else {
                                        var208 = 0.024568232;
                                    }
                                }
                            }
                        } else {
                            var208 = -0.0053585153;
                        }
                    }
                } else {
                    var208 = -0.03125437;
                }
            } else {
                var208 = 0.019233866;
            }
        } else {
            var208 = 0.014845222;
        }
    } else {
        var208 = -0.016708624;
    }
    double var209;
    if (inputs[15] < -0.45339394) {
        if (inputs[26] < 36.85896) {
            var209 = 0.02016385;
        } else {
            var209 = -0.004650869;
        }
    } else {
        if (inputs[24] < 18.7761) {
            if (inputs[24] < 10.491663) {
                if (inputs[15] < -0.3879394) {
                    var209 = -0.017873654;
                } else {
                    if (inputs[38] < 9.0) {
                        var209 = -0.009509193;
                    } else {
                        if (inputs[2] < 1.4235715) {
                            var209 = 0.03144447;
                        } else {
                            if (inputs[26] < 24.675793) {
                                var209 = 0.0076045753;
                            } else {
                                var209 = -0.008567854;
                            }
                        }
                    }
                }
            } else {
                if (inputs[35] < 2.7990565) {
                    var209 = 0.0;
                } else {
                    var209 = -0.027351568;
                }
            }
        } else {
            if (inputs[20] < 0.035118297) {
                var209 = 0.019481316;
            } else {
                var209 = -0.0051958207;
            }
        }
    }
    double var210;
    if (inputs[23] < -27.1777) {
        if (inputs[15] < 0.34339395) {
            if (inputs[31] < -6.535) {
                var210 = 0.0;
            } else {
                var210 = -0.029530212;
            }
        } else {
            var210 = 0.007897159;
        }
    } else {
        if (inputs[2] < 1.7892857) {
            if (inputs[2] < 1.5042857) {
                if (inputs[17] < 1.1144038) {
                    var210 = -0.011535334;
                } else {
                    if (inputs[10] < 1.1225) {
                        var210 = 0.0;
                    } else {
                        var210 = 0.024281956;
                    }
                }
            } else {
                var210 = 0.029517079;
            }
        } else {
            if (inputs[18] < 2.7831962) {
                if (inputs[8] < 1860.01) {
                    var210 = 0.00089687185;
                } else {
                    var210 = -0.02091432;
                }
            } else {
                var210 = 0.012366996;
            }
        }
    }
    double var211;
    if (inputs[15] < 0.38787878) {
        if (inputs[13] < 1815.63) {
            if (inputs[9] < 4.2175) {
                var211 = -0.006039529;
            } else {
                if (inputs[16] < -0.17314285) {
                    var211 = -0.005762403;
                } else {
                    var211 = 0.02683686;
                }
            }
        } else {
            if (inputs[20] < 1.2080423) {
                if (inputs[29] < 1.45) {
                    if (inputs[2] < 1.5657142) {
                        var211 = -0.016630037;
                    } else {
                        var211 = 0.00966037;
                    }
                } else {
                    if (inputs[20] < -0.41489676) {
                        var211 = -0.0036033946;
                    } else {
                        var211 = -0.03824991;
                    }
                }
            } else {
                var211 = 0.0052067116;
            }
        }
    } else {
        if (inputs[26] < 25.94796) {
            var211 = 0.025034048;
        } else {
            if (inputs[36] < 2.7536144) {
                var211 = -0.0122950375;
            } else {
                var211 = 0.005771593;
            }
        }
    }
    double var212;
    if (inputs[23] < 10.870579) {
        if (inputs[23] < -36.984165) {
            if (inputs[33] < 0.7415536) {
                var212 = 0.0010648514;
            } else {
                var212 = -0.025012136;
            }
        } else {
            if (inputs[27] < 29.68518) {
                if (inputs[19] < 2.456523) {
                    if (inputs[19] < 1.7002832) {
                        if (inputs[23] < -2.2112257) {
                            var212 = -0.0053831367;
                        } else {
                            var212 = 0.013650276;
                        }
                    } else {
                        var212 = 0.027148345;
                    }
                } else {
                    var212 = 0.0;
                }
            } else {
                if (inputs[17] < 1.4250249) {
                    var212 = -0.02143336;
                } else {
                    var212 = 0.000908681;
                }
            }
        }
    } else {
        var212 = -0.013318836;
    }
    double var213;
    var213 = sigmoid(var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29 + var30 + var31 + var32 + var33 + var34 + var35 + var36 + var37 + var38 + var39 + var40 + var41 + var42 + var43 + var44 + var45 + var46 + var47 + var48 + var49 + var50 + var51 + var52 + var53 + var54 + var55 + var56 + var57 + var58 + var59 + var60 + var61 + var62 + var63 + var64 + var65 + var66 + var67 + var68 + var69 + var70 + var71 + var72 + var73 + var74 + var75 + var76 + var77 + var78 + var79 + var80 + var81 + var82 + var83 + var84 + var85 + var86 + var87 + var88 + var89 + var90 + var91 + var92 + var93 + var94 + var95 + var96 + var97 + var98 + var99 + var100 + var101 + var102 + var103 + var104 + var105 + var106 + var107 + var108 + var109 + var110 + var111 + var112 + var113 + var114 + var115 + var116 + var117 + var118 + var119 + var120 + var121 + var122 + var123 + var124 + var125 + var126 + var127 + var128 + var129 + var130 + var131 + var132 + var133 + var134 + var135 + var136 + var137 + var138 + var139 + var140 + var141 + var142 + var143 + var144 + var145 + var146 + var147 + var148 + var149 + var150 + var151 + var152 + var153 + var154 + var155 + var156 + var157 + var158 + var159 + var160 + var161 + var162 + var163 + var164 + var165 + var166 + var167 + var168 + var169 + var170 + var171 + var172 + var173 + var174 + var175 + var176 + var177 + var178 + var179 + var180 + var181 + var182 + var183 + var184 + var185 + var186 + var187 + var188 + var189 + var190 + var191 + var192 + var193 + var194 + var195 + var196 + var197 + var198 + var199 + var200 + var201 + var202 + var203 + var204 + var205 + var206 + var207 + var208 + var209 + var210 + var211 + var212);
    memcpy(output, (double[]){1.0 - var213, var213}, 2 * sizeof(double));
}


// --- Fonction Wrapper pour une utilisation simple dans MQL5 ---
// Retourne la probabilité de la classe 'Gagnant' (classe 1)
double XGBoost_Predict(const double &inputs[])
{
   double prediction[2]; // Sortie pour la classe 0 et la classe 1
   xgboost_score(inputs, prediction);
   return prediction[1]; // Retourne la probabilité de la classe 1 (Gagnant)
}
