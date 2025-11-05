//+------------------------------------------------------------------+
//|   XGBoost Predictor for MQL5
//|   Généré par un script Python en utilisant m2cgen
//+------------------------------------------------------------------+
#property strict

// --- Seuil optimal trouvé pendant l'entraînement
const double BEST_THRESHOLD = 0.350000;

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
    if (inputs[2] < 17.267857) {
        if (inputs[2] < 15.951428) {
            if (inputs[19] < 6.4290714) {
                var0 = 0.014352841;
            } else {
                if (inputs[1] < 73.228836) {
                    var0 = -0.00593997;
                } else {
                    var0 = 0.012394002;
                }
            }
        } else {
            var0 = -0.022964235;
        }
    } else {
        if (inputs[3] < 17744.16) {
            if (inputs[10] < 9.166) {
                if (inputs[16] < 0.18087454) {
                    var0 = -0.018314837;
                } else {
                    var0 = -0.0064811218;
                }
            } else {
                var0 = 0.013241611;
            }
        } else {
            if (inputs[16] < -0.43712735) {
                if (inputs[13] < 16.299868) {
                    var0 = 0.007837306;
                } else {
                    var0 = 0.021567265;
                }
            } else {
                if (inputs[11] < -6.9302425) {
                    var0 = 0.020948466;
                } else {
                    var0 = -0.0023636452;
                }
            }
        }
    }
    double var1;
    if (inputs[15] < 5.356141) {
        if (inputs[10] < 1.375) {
            var1 = -0.02783627;
        } else {
            var1 = -0.00647016;
        }
    } else {
        if (inputs[3] < 19864.836) {
            if (inputs[14] < 19.819408) {
                if (inputs[15] < 24.335045) {
                    var1 = -0.0016005924;
                } else {
                    var1 = -0.016075127;
                }
            } else {
                if (inputs[4] < 18076.11) {
                    var1 = -0.0022614761;
                } else {
                    var1 = 0.0124782;
                }
            }
        } else {
            var1 = 0.01962943;
        }
    }
    double var2;
    if (inputs[19] >= 21.624651) {
        if (inputs[1] < 65.46143) {
            if (inputs[1] < 57.86574) {
                if (inputs[11] < -0.5821818) {
                    var2 = -0.011401204;
                } else {
                    var2 = 0.00823518;
                }
            } else {
                var2 = -0.022156982;
            }
        } else {
            var2 = 0.004499676;
        }
    } else {
        if (inputs[4] < 17834.82) {
            if (inputs[1] < 33.256645) {
                var2 = -0.021340352;
            } else {
                if (inputs[20] < 20.899883) {
                    var2 = -0.0033501545;
                } else {
                    var2 = 0.01360153;
                }
            }
        } else {
            if (inputs[7] < 56.5675) {
                if (inputs[15] < 22.42742) {
                    var2 = 0.0065839496;
                } else {
                    var2 = -0.012882008;
                }
            } else {
                if (inputs[20] < 22.261848) {
                    var2 = 0.013974168;
                } else {
                    var2 = -0.0024163972;
                }
            }
        }
    }
    double var3;
    if (inputs[14] < 20.733627) {
        if (inputs[19] < -26.784607) {
            var3 = 0.01782817;
        } else {
            if (inputs[10] < 4.651) {
                if (inputs[20] < -23.177559) {
                    var3 = 0.009326361;
                } else {
                    var3 = -0.009528532;
                }
            } else {
                if (inputs[10] < 6.75) {
                    var3 = 0.015374896;
                } else {
                    var3 = -0.0014705529;
                }
            }
        }
    } else {
        if (inputs[14] < 28.204103) {
            if (inputs[3] < 17841.83) {
                var3 = -0.0011774963;
            } else {
                if (inputs[9] < 1.46) {
                    var3 = 0.023781177;
                } else {
                    var3 = 0.010881714;
                }
            }
        } else {
            if (inputs[12] < -3.1967595) {
                var3 = 0.015387719;
            } else {
                if (inputs[17] < 2.3522162) {
                    var3 = -0.019679647;
                } else {
                    var3 = 0.007628717;
                }
            }
        }
    }
    double var4;
    if (inputs[7] < 92.1375) {
        if (inputs[19] < -25.014664) {
            var4 = 0.02043031;
        } else {
            if (inputs[16] < 1.2177398) {
                if (inputs[16] < 0.45865735) {
                    var4 = -0.0051956186;
                } else {
                    var4 = 0.008853992;
                }
            } else {
                if (inputs[17] < -0.9145946) {
                    var4 = -0.011874283;
                } else {
                    var4 = -0.02319451;
                }
            }
        }
    } else {
        if (inputs[10] < 3.999) {
            if (inputs[3] < 17983.79) {
                var4 = -0.006794448;
            } else {
                if (inputs[16] < 0.47722974) {
                    var4 = 0.0015274453;
                } else {
                    var4 = 0.01840099;
                }
            }
        } else {
            var4 = 0.019765085;
        }
    }
    double var5;
    if (inputs[10] < 15.095) {
        if (inputs[15] < 5.356141) {
            if (inputs[19] >= 116.51537) {
                var5 = -0.027117549;
            } else {
                var5 = 0.0008246754;
            }
        } else {
            if (inputs[4] < 18071.814) {
                if (inputs[15] < 29.011822) {
                    var5 = -0.0030750814;
                } else {
                    var5 = -0.023275726;
                }
            } else {
                if (inputs[3] < 18274.074) {
                    var5 = 0.020821856;
                } else {
                    var5 = 0.0015121854;
                }
            }
        }
    } else {
        var5 = 0.02018237;
    }
    double var6;
    if (inputs[19] < -21.662674) {
        var6 = 0.01735175;
    } else {
        if (inputs[2] < 17.687857) {
            if (inputs[16] < 1.1063302) {
                if (inputs[16] < 0.45834523) {
                    var6 = -0.0056845276;
                } else {
                    var6 = 0.0087595275;
                }
            } else {
                var6 = -0.0189007;
            }
        } else {
            if (inputs[3] < 18075.234) {
                if (inputs[16] < 0.25625527) {
                    var6 = -0.011526436;
                } else {
                    var6 = 0.0069737793;
                }
            } else {
                if (inputs[16] < -0.38527817) {
                    var6 = 0.018540975;
                } else {
                    var6 = 0.0020451786;
                }
            }
        }
    }
    double var7;
    if (inputs[7] < 104.82) {
        if (inputs[19] < -25.014664) {
            var7 = 0.017030794;
        } else {
            if (inputs[16] < 1.2177398) {
                if (inputs[16] < 0.78489846) {
                    var7 = -0.0037791329;
                } else {
                    var7 = 0.016239768;
                }
            } else {
                if (inputs[11] < -1.8206061) {
                    var7 = -0.0016662395;
                } else {
                    var7 = -0.026981693;
                }
            }
        }
    } else {
        if (inputs[10] < 5.124) {
            if (inputs[11] < -5.85697) {
                var7 = 0.012419761;
            } else {
                var7 = -0.0046994765;
            }
        } else {
            var7 = 0.02100791;
        }
    }
    double var8;
    if (inputs[2] < 17.267857) {
        if (inputs[15] < 19.323076) {
            if (inputs[5] < 18836.838) {
                if (inputs[2] < 11.947143) {
                    var8 = 0.0075747585;
                } else {
                    var8 = 0.021099972;
                }
            } else {
                if (inputs[21] < 2.7586765) {
                    var8 = -0.012164914;
                } else {
                    var8 = 0.008501248;
                }
            }
        } else {
            if (inputs[15] < 27.67673) {
                if (inputs[9] < 1.59) {
                    var8 = -0.023916172;
                } else {
                    var8 = -0.010627288;
                }
            } else {
                var8 = 0.005843003;
            }
        }
    } else {
        if (inputs[21] < 3.277861) {
            if (inputs[15] < 25.346832) {
                if (inputs[7] < 97.7175) {
                    var8 = 0.004660859;
                } else {
                    var8 = 0.023999063;
                }
            } else {
                if (inputs[14] < 20.966928) {
                    var8 = -0.01830485;
                } else {
                    var8 = 0.002175458;
                }
            }
        } else {
            var8 = 0.018593231;
        }
    }
    double var9;
    if (inputs[14] < 22.059683) {
        if (inputs[19] < -26.784607) {
            var9 = 0.014000363;
        } else {
            if (inputs[16] < 1.1063302) {
                if (inputs[16] < 0.77425003) {
                    var9 = -0.004463777;
                } else {
                    var9 = 0.0114230905;
                }
            } else {
                if (inputs[11] < -0.9881818) {
                    var9 = -0.005886129;
                } else {
                    var9 = -0.026450826;
                }
            }
        }
    } else {
        if (inputs[16] < -0.57930434) {
            if (inputs[13] < 22.422901) {
                var9 = 0.021899771;
            } else {
                var9 = 0.0075139324;
            }
        } else {
            if (inputs[14] < 28.204103) {
                if (inputs[4] < 18090.53) {
                    var9 = -0.0020544236;
                } else {
                    var9 = 0.02155665;
                }
            } else {
                if (inputs[22] < 17.0) {
                    var9 = -0.01520569;
                } else {
                    var9 = 0.011269187;
                }
            }
        }
    }
    double var10;
    if (inputs[10] < 15.095) {
        if (inputs[19] < -25.014664) {
            var10 = 0.013831001;
        } else {
            if (inputs[22] < 15.0) {
                if (inputs[13] < 5.316362) {
                    var10 = 0.00035517404;
                } else {
                    var10 = -0.008948745;
                }
            } else {
                if (inputs[6] < 17577.625) {
                    var10 = -0.0077762865;
                } else {
                    var10 = 0.006576542;
                }
            }
        }
    } else {
        var10 = 0.017689072;
    }
    double var11;
    if (inputs[15] < 6.5139675) {
        if (inputs[17] < 1.82) {
            var11 = -0.020481983;
        } else {
            var11 = -0.004258585;
        }
    } else {
        if (inputs[10] < 15.095) {
            if (inputs[4] < 17834.82) {
                if (inputs[9] < 1.17) {
                    var11 = -0.0151962;
                } else {
                    var11 = 0.0042916564;
                }
            } else {
                if (inputs[5] < 18836.838) {
                    var11 = 0.007641138;
                } else {
                    var11 = -0.0015947422;
                }
            }
        } else {
            var11 = 0.01682196;
        }
    }
    double var12;
    if (inputs[14] < 24.654566) {
        if (inputs[8] < 5.31) {
            if (inputs[22] < 7.0) {
                var12 = 0.0015692286;
            } else {
                if (inputs[22] < 13.0) {
                    var12 = -0.013440904;
                } else {
                    var12 = -0.026898893;
                }
            }
        } else {
            if (inputs[21] < 1.3688738) {
                if (inputs[5] < 19398.555) {
                    var12 = 0.0004298715;
                } else {
                    var12 = -0.021795206;
                }
            } else {
                if (inputs[21] < 2.3798716) {
                    var12 = 0.007971866;
                } else {
                    var12 = -0.0013145035;
                }
            }
        }
    } else {
        if (inputs[14] < 28.204103) {
            if (inputs[5] < 18219.05) {
                var12 = 0.013458047;
            } else {
                var12 = 0.026260484;
            }
        } else {
            if (inputs[2] < 20.225714) {
                var12 = -0.011685078;
            } else {
                if (inputs[21] < 2.3522162) {
                    var12 = -0.0065445504;
                } else {
                    var12 = 0.01641472;
                }
            }
        }
    }
    double var13;
    if (inputs[19] >= -25.014664) {
        if (inputs[14] < 19.595564) {
            if (inputs[14] < 11.459211) {
                if (inputs[10] < 1.088) {
                    var13 = 0.00016217203;
                } else {
                    var13 = -0.01605704;
                }
            } else {
                var13 = -0.020729741;
            }
        } else {
            var13 = 0.010647994;
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[10] < -2.288) {
                if (inputs[9] < 1.18) {
                    var13 = -0.019067442;
                } else {
                    var13 = -0.0015394707;
                }
            } else {
                if (inputs[11] < 2.277394) {
                    var13 = 0.016898045;
                } else {
                    var13 = -0.00060970435;
                }
            }
        } else {
            if (inputs[12] < 3.7038045) {
                if (inputs[5] < 19668.27) {
                    var13 = 0.014988001;
                } else {
                    var13 = -0.001699123;
                }
            } else {
                var13 = -0.008021543;
            }
        }
    }
    double var14;
    if (inputs[19] < -26.784607) {
        var14 = 0.018269738;
    } else {
        if (inputs[10] < 8.437) {
            if (inputs[14] < 20.733627) {
                if (inputs[1] < 73.228836) {
                    var14 = -0.008039133;
                } else {
                    var14 = 0.007856181;
                }
            } else {
                if (inputs[5] < 18115.053) {
                    var14 = -0.006672555;
                } else {
                    var14 = 0.01005296;
                }
            }
        } else {
            if (inputs[2] < 20.225714) {
                var14 = -0.0029400315;
            } else {
                if (inputs[2] < 24.596428) {
                    var14 = 0.02655827;
                } else {
                    var14 = 0.0052975607;
                }
            }
        }
    }
    double var15;
    if (inputs[2] < 17.267857) {
        if (inputs[2] < 15.951428) {
            if (inputs[5] < 19015.387) {
                if (inputs[21] < 2.58363) {
                    var15 = 0.021175602;
                } else {
                    var15 = -0.001340634;
                }
            } else {
                if (inputs[14] < 11.306554) {
                    var15 = -0.0042199083;
                } else {
                    var15 = -0.01786273;
                }
            }
        } else {
            var15 = -0.018472787;
        }
    } else {
        if (inputs[17] < 1.7438582) {
            if (inputs[4] < 18071.814) {
                if (inputs[2] < 28.079287) {
                    var15 = -0.0021396938;
                } else {
                    var15 = -0.017664121;
                }
            } else {
                if (inputs[22] < 16.0) {
                    var15 = -0.004101242;
                } else {
                    var15 = 0.015564938;
                }
            }
        } else {
            if (inputs[20] >= 10.515926) {
                if (inputs[4] < 18129.54) {
                    var15 = 0.0119346855;
                } else {
                    var15 = -0.0031036197;
                }
            } else {
                var15 = 0.024387788;
            }
        }
    }
    double var16;
    if (inputs[19] < -25.014664) {
        var16 = 0.016349366;
    } else {
        if (inputs[2] < 17.687857) {
            if (inputs[16] < 1.1063302) {
                if (inputs[16] < 0.78489846) {
                    var16 = -0.004262762;
                } else {
                    var16 = 0.010909128;
                }
            } else {
                if (inputs[12] < 0.10512782) {
                    var16 = -0.021045566;
                } else {
                    var16 = -0.015078875;
                }
            }
        } else {
            if (inputs[10] < 5.038) {
                if (inputs[3] < 17744.16) {
                    var16 = -0.011800412;
                } else {
                    var16 = 0.0051708664;
                }
            } else {
                if (inputs[8] < 27.625) {
                    var16 = 0.004515298;
                } else {
                    var16 = 0.022310926;
                }
            }
        }
    }
    double var17;
    if (inputs[10] < 15.095) {
        if (inputs[4] < 17834.82) {
            if (inputs[9] < 1.17) {
                if (inputs[2] < 19.159286) {
                    var17 = -0.026473377;
                } else {
                    var17 = -0.008717415;
                }
            } else {
                var17 = 0.00284426;
            }
        } else {
            if (inputs[19] >= -21.662674) {
                if (inputs[15] < 5.356141) {
                    var17 = -0.0144529035;
                } else {
                    var17 = -0.0017652184;
                }
            } else {
                if (inputs[20] < 21.847754) {
                    var17 = 0.008387831;
                } else {
                    var17 = -0.012622794;
                }
            }
        }
    } else {
        var17 = 0.01423523;
    }
    double var18;
    if (inputs[14] < 20.733627) {
        if (inputs[19] < -26.784607) {
            var18 = 0.015396687;
        } else {
            if (inputs[16] < 1.1315215) {
                if (inputs[18] < 1.0) {
                    var18 = 0.00042891255;
                } else {
                    var18 = -0.013453147;
                }
            } else {
                if (inputs[19] < 61.656414) {
                    var18 = -0.015536461;
                } else {
                    var18 = -0.02032217;
                }
            }
        }
    } else {
        if (inputs[3] < 17490.88) {
            var18 = -0.0088755675;
        } else {
            if (inputs[2] < 20.899286) {
                if (inputs[9] < 0.91) {
                    var18 = 0.014748754;
                } else {
                    var18 = -0.009611042;
                }
            } else {
                if (inputs[18] < 1.0) {
                    var18 = 0.022451553;
                } else {
                    var18 = 0.009906784;
                }
            }
        }
    }
    double var19;
    if (inputs[14] < 22.059683) {
        if (inputs[19] < -26.784607) {
            var19 = 0.011569587;
        } else {
            if (inputs[21] < 2.7594576) {
                if (inputs[5] < 19729.697) {
                    var19 = -0.0031790163;
                } else {
                    var19 = -0.019884596;
                }
            } else {
                if (inputs[19] < 452.9068) {
                    var19 = -0.012829142;
                } else {
                    var19 = 0.005537073;
                }
            }
        }
    } else {
        if (inputs[5] < 17587.016) {
            var19 = -0.008252068;
        } else {
            if (inputs[14] < 28.204103) {
                if (inputs[21] < 2.4887898) {
                    var19 = 0.02555576;
                } else {
                    var19 = 0.0137713365;
                }
            } else {
                if (inputs[16] < 0.31008777) {
                    var19 = 0.008897671;
                } else {
                    var19 = -0.009757183;
                }
            }
        }
    }
    double var20;
    if (inputs[2] < 18.883572) {
        if (inputs[15] < 20.86391) {
            if (inputs[5] < 18836.838) {
                if (inputs[3] < 17689.676) {
                    var20 = -0.0054155113;
                } else {
                    var20 = 0.017088145;
                }
            } else {
                if (inputs[15] < 5.849059) {
                    var20 = -0.011804684;
                } else {
                    var20 = -0.000534931;
                }
            }
        } else {
            if (inputs[15] < 27.67673) {
                if (inputs[17] < 2.8439124) {
                    var20 = -0.008908927;
                } else {
                    var20 = -0.022975102;
                }
            } else {
                var20 = 0.0028883198;
            }
        }
    } else {
        if (inputs[12] < 0.79799247) {
            if (inputs[5] < 17590.586) {
                var20 = -0.021120438;
            } else {
                if (inputs[13] < 20.005386) {
                    var20 = -0.0048041865;
                } else {
                    var20 = 0.007972789;
                }
            }
        } else {
            if (inputs[12] < 4.1602106) {
                if (inputs[16] < -0.5273845) {
                    var20 = 0.012993739;
                } else {
                    var20 = 0.023735616;
                }
            } else {
                var20 = 0.001418841;
            }
        }
    }
    double var21;
    if (inputs[2] < 17.267857) {
        if (inputs[16] < 1.0041281) {
            if (inputs[12] < 1.7146692) {
                if (inputs[12] < 0.48472932) {
                    var21 = -0.003944933;
                } else {
                    var21 = 0.015644025;
                }
            } else {
                if (inputs[7] < 63.7875) {
                    var21 = -0.019381925;
                } else {
                    var21 = -0.0032552127;
                }
            }
        } else {
            if (inputs[11] < -0.91345453) {
                var21 = -0.010394309;
            } else {
                var21 = -0.025124446;
            }
        }
    } else {
        if (inputs[21] < 3.5499365) {
            if (inputs[12] < 4.1602106) {
                if (inputs[12] < 1.2488571) {
                    var21 = 0.00005277203;
                } else {
                    var21 = 0.015106794;
                }
            } else {
                var21 = -0.017178686;
            }
        } else {
            var21 = 0.020338355;
        }
    }
    double var22;
    if (inputs[15] < 5.356141) {
        var22 = -0.014934887;
    } else {
        if (inputs[19] < -25.014664) {
            var22 = 0.017104914;
        } else {
            if (inputs[4] < 19878.975) {
                if (inputs[9] < 2.81) {
                    var22 = 0.0020646416;
                } else {
                    var22 = -0.007768242;
                }
            } else {
                var22 = 0.014484497;
            }
        }
    }
    double var23;
    if (inputs[11] < 7.1047273) {
        if (inputs[19] < -25.014664) {
            var23 = 0.015397605;
        } else {
            if (inputs[19] >= 24.331411) {
                if (inputs[8] < 14.685) {
                    var23 = -0.0028341443;
                } else {
                    var23 = -0.017892292;
                }
            } else {
                if (inputs[16] < -0.67364275) {
                    var23 = 0.0072935293;
                } else {
                    var23 = -0.004349412;
                }
            }
        }
    } else {
        if (inputs[20] >= 19.28609) {
            var23 = 0.0032099823;
        } else {
            var23 = 0.022807002;
        }
    }
    double var24;
    if (inputs[10] < 4.651) {
        if (inputs[21] < 2.7594576) {
            if (inputs[5] < 19729.697) {
                if (inputs[5] < 18113.068) {
                    var24 = -0.013533034;
                } else {
                    var24 = 0.0019679435;
                }
            } else {
                if (inputs[19] >= 184.42467) {
                    var24 = -0.015133176;
                } else {
                    var24 = -0.025620494;
                }
            }
        } else {
            if (inputs[4] < 19766.586) {
                if (inputs[14] < 14.141671) {
                    var24 = -0.011852059;
                } else {
                    var24 = 0.0062839533;
                }
            } else {
                var24 = 0.016327461;
            }
        }
    } else {
        if (inputs[8] < 21.635) {
            if (inputs[15] < 22.42742) {
                if (inputs[8] < 9.96) {
                    var24 = 0.01949327;
                } else {
                    var24 = -0.0023837823;
                }
            } else {
                var24 = -0.022489736;
            }
        } else {
            if (inputs[9] < 0.94) {
                var24 = 0.02552816;
            } else {
                if (inputs[10] < 7.125) {
                    var24 = 0.017409978;
                } else {
                    var24 = 0.0024037538;
                }
            }
        }
    }
    double var25;
    if (inputs[14] < 19.819408) {
        if (inputs[20] < -23.177559) {
            var25 = 0.012124072;
        } else {
            if (inputs[1] < 33.895977) {
                var25 = -0.022011891;
            } else {
                if (inputs[19] >= 80.6095) {
                    var25 = -0.0124592995;
                } else {
                    var25 = -0.0005982332;
                }
            }
        }
    } else {
        if (inputs[7] < 92.1375) {
            if (inputs[7] < 73.225) {
                if (inputs[2] < 18.594286) {
                    var25 = -0.0063251476;
                } else {
                    var25 = 0.0117426645;
                }
            } else {
                var25 = -0.018112138;
            }
        } else {
            if (inputs[1] < 31.937813) {
                var25 = 0.0047583296;
            } else {
                if (inputs[4] < 18229.18) {
                    var25 = 0.022617418;
                } else {
                    var25 = 0.011992413;
                }
            }
        }
    }
    double var26;
    if (inputs[2] < 14.269286) {
        if (inputs[15] < 13.579078) {
            if (inputs[2] < 9.67) {
                if (inputs[19] >= -1.4293238) {
                    var26 = -0.012535491;
                } else {
                    var26 = 0.009012215;
                }
            } else {
                var26 = 0.014237853;
            }
        } else {
            if (inputs[9] < 1.95) {
                var26 = -0.005693623;
            } else {
                var26 = -0.02268202;
            }
        }
    } else {
        if (inputs[21] < 3.277861) {
            if (inputs[21] < 2.939759) {
                if (inputs[3] < 17744.16) {
                    var26 = -0.007353293;
                } else {
                    var26 = 0.00733235;
                }
            } else {
                var26 = -0.015099535;
            }
        } else {
            if (inputs[11] < 3.7189696) {
                var26 = 0.009662491;
            } else {
                var26 = 0.021316893;
            }
        }
    }
    double var27;
    if (inputs[10] < 15.095) {
        if (inputs[4] < 17834.82) {
            if (inputs[9] < 1.11) {
                if (inputs[5] < 17235.965) {
                    var27 = -0.0053841784;
                } else {
                    var27 = -0.026175186;
                }
            } else {
                var27 = 0.0023481508;
            }
        } else {
            if (inputs[13] < 16.253092) {
                if (inputs[13] < 12.834479) {
                    var27 = 0.00010448054;
                } else {
                    var27 = -0.013213762;
                }
            } else {
                if (inputs[13] < 26.781828) {
                    var27 = 0.0137549015;
                } else {
                    var27 = -0.006652809;
                }
            }
        }
    } else {
        var27 = 0.017253371;
    }
    double var28;
    if (inputs[20] < 12.193009) {
        if (inputs[3] < 17490.88) {
            var28 = -0.021559564;
        } else {
            if (inputs[16] < -0.9431992) {
                if (inputs[1] < 56.937305) {
                    var28 = -0.0030045565;
                } else {
                    var28 = -0.018633738;
                }
            } else {
                if (inputs[16] < -0.77141327) {
                    var28 = 0.020748269;
                } else {
                    var28 = -0.00072722737;
                }
            }
        }
    } else {
        if (inputs[2] < 20.225714) {
            if (inputs[16] < -1.2699627) {
                var28 = 0.013528125;
            } else {
                if (inputs[16] < 0.28437614) {
                    var28 = -0.016400106;
                } else {
                    var28 = 0.0047765234;
                }
            }
        } else {
            if (inputs[12] < 2.318609) {
                var28 = 0.023465652;
            } else {
                var28 = 0.011999295;
            }
        }
    }
    double var29;
    if (inputs[2] < 18.883572) {
        if (inputs[21] < 2.7505727) {
            if (inputs[4] < 19570.45) {
                if (inputs[15] < 11.323254) {
                    var29 = 0.006228375;
                } else {
                    var29 = -0.016712625;
                }
            } else {
                if (inputs[16] < 0.10568233) {
                    var29 = -0.025328029;
                } else {
                    var29 = -0.0143352365;
                }
            }
        } else {
            if (inputs[4] < 19801.51) {
                if (inputs[16] < -1.2699627) {
                    var29 = 0.010144597;
                } else {
                    var29 = -0.007408064;
                }
            } else {
                var29 = 0.02496274;
            }
        }
    } else {
        if (inputs[1] < 62.15389) {
            if (inputs[6] < 17577.625) {
                var29 = -0.020263774;
            } else {
                if (inputs[14] < 19.32822) {
                    var29 = -0.009235885;
                } else {
                    var29 = 0.008419478;
                }
            }
        } else {
            if (inputs[18] < 1.0) {
                if (inputs[16] < -0.7316509) {
                    var29 = 0.012223624;
                } else {
                    var29 = 0.022454122;
                }
            } else {
                var29 = 0.004122551;
            }
        }
    }
    double var30;
    if (inputs[10] < 4.651) {
        if (inputs[3] < 17490.88) {
            var30 = -0.019432181;
        } else {
            if (inputs[1] < 57.86574) {
                if (inputs[16] < -0.67364275) {
                    var30 = 0.011893528;
                } else {
                    var30 = 0.0008536934;
                }
            } else {
                if (inputs[22] < 3.0) {
                    var30 = 0.013230696;
                } else {
                    var30 = -0.014606083;
                }
            }
        }
    } else {
        if (inputs[20] < 15.040677) {
            if (inputs[10] < 7.125) {
                var30 = 0.01239416;
            } else {
                var30 = -0.013930318;
            }
        } else {
            if (inputs[1] < 69.15591) {
                var30 = 0.021594841;
            } else {
                if (inputs[8] < 21.635) {
                    var30 = -0.009066911;
                } else {
                    var30 = 0.015803672;
                }
            }
        }
    }
    double var31;
    if (inputs[13] < 15.841378) {
        if (inputs[13] < 12.654446) {
            if (inputs[20] >= -23.177559) {
                if (inputs[15] < 23.909798) {
                    var31 = -0.0011863761;
                } else {
                    var31 = -0.011450408;
                }
            } else {
                var31 = 0.010575371;
            }
        } else {
            if (inputs[20] >= 6.351848) {
                var31 = -0.002112836;
            } else {
                var31 = -0.021766866;
            }
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[11] < -6.9302425) {
                var31 = -0.015727798;
            } else {
                if (inputs[6] < 17727.775) {
                    var31 = 0.011307403;
                } else {
                    var31 = -0.004890917;
                }
            }
        } else {
            if (inputs[4] < 18229.18) {
                var31 = 0.024550542;
            } else {
                if (inputs[13] < 21.893208) {
                    var31 = 0.015487756;
                } else {
                    var31 = -0.000661704;
                }
            }
        }
    }
    double var32;
    if (inputs[15] < 5.3504486) {
        if (inputs[19] >= 116.51537) {
            var32 = -0.020077752;
        } else {
            var32 = -0.0023960643;
        }
    } else {
        if (inputs[3] < 19850.186) {
            if (inputs[19] >= -25.014664) {
                if (inputs[22] < 8.0) {
                    var32 = -0.011410734;
                } else {
                    var32 = 0.003556658;
                }
            } else {
                if (inputs[4] < 18076.11) {
                    var32 = -0.0005023774;
                } else {
                    var32 = 0.008198748;
                }
            }
        } else {
            var32 = 0.01498777;
        }
    }
    double var33;
    if (inputs[20] < 12.193009) {
        if (inputs[3] < 17490.88) {
            var33 = -0.018456645;
        } else {
            if (inputs[4] < 19701.36) {
                if (inputs[18] < 1.0) {
                    var33 = 0.005037623;
                } else {
                    var33 = -0.007582251;
                }
            } else {
                if (inputs[4] < 19887.025) {
                    var33 = -0.021891795;
                } else {
                    var33 = -0.003622258;
                }
            }
        }
    } else {
        if (inputs[2] < 20.225714) {
            if (inputs[15] < 20.2197) {
                if (inputs[2] < 9.67) {
                    var33 = -0.00089850003;
                } else {
                    var33 = 0.02091043;
                }
            } else {
                if (inputs[18] < 1.0) {
                    var33 = -0.019329024;
                } else {
                    var33 = 0.005678995;
                }
            }
        } else {
            if (inputs[12] < 2.318609) {
                var33 = 0.022724431;
            } else {
                var33 = 0.011466108;
            }
        }
    }
    double var34;
    if (inputs[2] < 17.341429) {
        if (inputs[19] < 4.3918962) {
            var34 = 0.011818405;
        } else {
            if (inputs[16] < 1.1063302) {
                if (inputs[15] < 20.2197) {
                    var34 = 0.0009198728;
                } else {
                    var34 = -0.011249725;
                }
            } else {
                var34 = -0.018386452;
            }
        }
    } else {
        if (inputs[12] < 0.009172932) {
            if (inputs[21] < 2.167991) {
                var34 = -0.011433916;
            } else {
                if (inputs[7] < 59.5075) {
                    var34 = 0.01729833;
                } else {
                    var34 = 0.0011012382;
                }
            }
        } else {
            if (inputs[2] < 20.867144) {
                var34 = -0.002757609;
            } else {
                if (inputs[10] < 7.751) {
                    var34 = 0.007592867;
                } else {
                    var34 = 0.020878162;
                }
            }
        }
    }
    double var35;
    if (inputs[2] < 17.267857) {
        if (inputs[2] < 15.951428) {
            if (inputs[2] < 14.269286) {
                if (inputs[14] < 11.51551) {
                    var35 = -0.00023097618;
                } else {
                    var35 = -0.016767656;
                }
            } else {
                if (inputs[9] < 1.09) {
                    var35 = 0.0036140687;
                } else {
                    var35 = 0.013565837;
                }
            }
        } else {
            var35 = -0.016993675;
        }
    } else {
        if (inputs[17] < 1.6180851) {
            if (inputs[6] < 17577.625) {
                var35 = -0.015146482;
            } else {
                if (inputs[16] < 1.0702288) {
                    var35 = -0.0010983313;
                } else {
                    var35 = 0.01330598;
                }
            }
        } else {
            if (inputs[2] < 20.225714) {
                var35 = -0.007201369;
            } else {
                if (inputs[13] < 12.5315485) {
                    var35 = 0.00071135565;
                } else {
                    var35 = 0.018014701;
                }
            }
        }
    }
    double var36;
    if (inputs[19] >= -25.014664) {
        if (inputs[20] < 11.40759) {
            if (inputs[15] < 8.064122) {
                if (inputs[15] < 5.008898) {
                    var36 = -0.013740827;
                } else {
                    var36 = -0.020345526;
                }
            } else {
                if (inputs[15] < 10.543079) {
                    var36 = 0.012479298;
                } else {
                    var36 = -0.01372852;
                }
            }
        } else {
            var36 = 0.0052784826;
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[17] < 3.5373898) {
                if (inputs[21] < 2.5052972) {
                    var36 = 0.0007091747;
                } else {
                    var36 = -0.012771481;
                }
            } else {
                var36 = 0.01757809;
            }
        } else {
            if (inputs[13] < 4.257635) {
                var36 = -0.0062464676;
            } else {
                if (inputs[10] < 7.125) {
                    var36 = 0.012989646;
                } else {
                    var36 = 0.0018878682;
                }
            }
        }
    }
    double var37;
    if (inputs[14] < 20.733627) {
        if (inputs[19] < -26.950886) {
            var37 = 0.014315393;
        } else {
            if (inputs[10] < 4.437) {
                if (inputs[22] < 3.0) {
                    var37 = 0.005333735;
                } else {
                    var37 = -0.0085544;
                }
            } else {
                if (inputs[10] < 6.4) {
                    var37 = 0.017431742;
                } else {
                    var37 = -0.0024353655;
                }
            }
        }
    } else {
        if (inputs[5] < 18047.818) {
            if (inputs[20] < -20.802162) {
                var37 = -0.015219334;
            } else {
                if (inputs[21] < 2.3333879) {
                    var37 = -0.003583964;
                } else {
                    var37 = 0.0108717;
                }
            }
        } else {
            if (inputs[13] < 26.157684) {
                if (inputs[17] < -2.4618518) {
                    var37 = 0.025377639;
                } else {
                    var37 = 0.012392141;
                }
            } else {
                var37 = 0.0015219176;
            }
        }
    }
    double var38;
    if (inputs[2] < 9.866428) {
        if (inputs[2] < 7.2564287) {
            if (inputs[14] < 4.326916) {
                var38 = -0.008817364;
            } else {
                var38 = 0.007914704;
            }
        } else {
            if (inputs[7] < 26.095) {
                var38 = -0.003124299;
            } else {
                var38 = -0.025946474;
            }
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[10] < -3.989) {
                if (inputs[16] < 0.25625527) {
                    var38 = -0.025333917;
                } else {
                    var38 = -0.005551906;
                }
            } else {
                if (inputs[20] >= 7.90623) {
                    var38 = -0.00022228336;
                } else {
                    var38 = 0.014425236;
                }
            }
        } else {
            if (inputs[3] < 18274.074) {
                var38 = 0.018940724;
            } else {
                if (inputs[3] < 18395.37) {
                    var38 = -0.01267022;
                } else {
                    var38 = 0.004910058;
                }
            }
        }
    }
    double var39;
    if (inputs[14] < 19.303827) {
        if (inputs[17] < 1.82) {
            if (inputs[20] < -23.177559) {
                var39 = 0.008179431;
            } else {
                if (inputs[20] >= -12.440867) {
                    var39 = -0.0048805927;
                } else {
                    var39 = -0.025263777;
                }
            }
        } else {
            if (inputs[6] < 19771.96) {
                if (inputs[1] < 64.04755) {
                    var39 = 0.014341764;
                } else {
                    var39 = -0.005895892;
                }
            } else {
                var39 = 0.016049001;
            }
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[22] < 19.0) {
                if (inputs[20] < 12.193009) {
                    var39 = -0.012785591;
                } else {
                    var39 = 0.0042851237;
                }
            } else {
                var39 = 0.013611177;
            }
        } else {
            if (inputs[22] < 16.0) {
                if (inputs[14] < 25.502005) {
                    var39 = 0.009853554;
                } else {
                    var39 = -0.0016267814;
                }
            } else {
                if (inputs[5] < 18521.688) {
                    var39 = 0.023509385;
                } else {
                    var39 = 0.0068689864;
                }
            }
        }
    }
    double var40;
    if (inputs[19] >= 116.51537) {
        if (inputs[16] < -0.3203373) {
            var40 = -0.019517628;
        } else {
            var40 = -0.00862825;
        }
    } else {
        if (inputs[19] < -25.014664) {
            var40 = 0.015369835;
        } else {
            if (inputs[2] < 17.687857) {
                if (inputs[13] < 5.1977787) {
                    var40 = 0.0052602454;
                } else {
                    var40 = -0.008098519;
                }
            } else {
                if (inputs[21] < 3.277861) {
                    var40 = 0.0025321445;
                } else {
                    var40 = 0.017933898;
                }
            }
        }
    }
    double var41;
    if (inputs[2] < 14.096429) {
        if (inputs[13] < 5.1977787) {
            if (inputs[17] < 2.90849) {
                if (inputs[19] < 116.51537) {
                    var41 = 0.0052934866;
                } else {
                    var41 = -0.016377313;
                }
            } else {
                var41 = 0.012891824;
            }
        } else {
            if (inputs[20] < 14.322525) {
                if (inputs[16] < 0.06821353) {
                    var41 = -0.026081432;
                } else {
                    var41 = -0.015346982;
                }
            } else {
                var41 = -0.0035393105;
            }
        }
    } else {
        if (inputs[17] < 3.5499365) {
            if (inputs[17] < 2.8439124) {
                if (inputs[4] < 17834.82) {
                    var41 = -0.003918166;
                } else {
                    var41 = 0.006956677;
                }
            } else {
                if (inputs[12] < 2.8455565) {
                    var41 = 0.00065584807;
                } else {
                    var41 = -0.018247794;
                }
            }
        } else {
            var41 = 0.016690932;
        }
    }
    double var42;
    if (inputs[8] < 65.7525) {
        if (inputs[15] < 24.841236) {
            if (inputs[10] < 4.651) {
                if (inputs[1] < 57.86574) {
                    var42 = 0.0018113424;
                } else {
                    var42 = -0.00939522;
                }
            } else {
                if (inputs[22] < 5.0) {
                    var42 = -0.00687859;
                } else {
                    var42 = 0.010643334;
                }
            }
        } else {
            if (inputs[15] < 27.751934) {
                var42 = -0.018343668;
            } else {
                if (inputs[15] < 31.597681) {
                    var42 = 0.012660065;
                } else {
                    var42 = -0.0059417235;
                }
            }
        }
    } else {
        if (inputs[11] < 0.823697) {
            var42 = 0.00006460397;
        } else {
            var42 = 0.017725432;
        }
    }
    double var43;
    if (inputs[10] < 4.651) {
        if (inputs[10] < 2.074) {
            if (inputs[3] < 17490.88) {
                var43 = -0.014278179;
            } else {
                if (inputs[21] < 2.7594576) {
                    var43 = -0.0016374364;
                } else {
                    var43 = 0.009643775;
                }
            }
        } else {
            if (inputs[15] < 10.122243) {
                var43 = -0.003583233;
            } else {
                var43 = -0.02616467;
            }
        }
    } else {
        if (inputs[7] < 89.905) {
            if (inputs[15] < 24.444834) {
                if (inputs[22] < 12.0) {
                    var43 = -0.00845401;
                } else {
                    var43 = 0.013485151;
                }
            } else {
                var43 = -0.016767992;
            }
        } else {
            var43 = 0.020046601;
        }
    }
    double var44;
    if (inputs[15] < 5.356141) {
        if (inputs[11] < 0.6262424) {
            var44 = -0.01916148;
        } else {
            var44 = -0.004494435;
        }
    } else {
        if (inputs[20] < -27.187044) {
            var44 = -0.011351841;
        } else {
            if (inputs[20] < -23.177559) {
                var44 = 0.01698904;
            } else {
                if (inputs[10] < 15.095) {
                    var44 = 0.00054158416;
                } else {
                    var44 = 0.01604634;
                }
            }
        }
    }
    double var45;
    if (inputs[19] >= 116.51537) {
        var45 = -0.010958666;
    } else {
        if (inputs[14] < 20.505129) {
            if (inputs[12] < 3.9619398) {
                if (inputs[12] < -0.78084964) {
                    var45 = -0.008210843;
                } else {
                    var45 = 0.0030963896;
                }
            } else {
                var45 = -0.020781785;
            }
        } else {
            if (inputs[12] < -4.7260375) {
                var45 = 0.016072396;
            } else {
                if (inputs[11] < -7.372424) {
                    var45 = -0.007596635;
                } else {
                    var45 = 0.0060301535;
                }
            }
        }
    }
    double var46;
    if (inputs[19] < -25.014664) {
        var46 = 0.01640808;
    } else {
        if (inputs[2] < 18.608572) {
            if (inputs[16] < 1.1063302) {
                if (inputs[16] < 0.78489846) {
                    var46 = -0.003052659;
                } else {
                    var46 = 0.013295784;
                }
            } else {
                if (inputs[11] < -0.8779394) {
                    var46 = -0.004685872;
                } else {
                    var46 = -0.023432381;
                }
            }
        } else {
            if (inputs[1] < 62.15389) {
                if (inputs[14] < 25.206236) {
                    var46 = -0.008075186;
                } else {
                    var46 = 0.008236421;
                }
            } else {
                if (inputs[16] < -0.8728222) {
                    var46 = 0.005923808;
                } else {
                    var46 = 0.015968027;
                }
            }
        }
    }
    double var47;
    if (inputs[20] < 12.193009) {
        if (inputs[3] < 17490.88) {
            var47 = -0.017257651;
        } else {
            if (inputs[9] < 2.81) {
                if (inputs[4] < 18127.436) {
                    var47 = -0.0034792775;
                } else {
                    var47 = 0.011674124;
                }
            } else {
                if (inputs[3] < 18805.936) {
                    var47 = 0.008236288;
                } else {
                    var47 = -0.008356152;
                }
            }
        }
    } else {
        if (inputs[21] < 2.2936552) {
            var47 = 0.016333694;
        } else {
            if (inputs[8] < 35.4075) {
                if (inputs[21] < 3.2356162) {
                    var47 = 0.003054453;
                } else {
                    var47 = -0.012329271;
                }
            } else {
                if (inputs[17] < 3.3423505) {
                    var47 = -0.0027731382;
                } else {
                    var47 = 0.017655134;
                }
            }
        }
    }
    double var48;
    if (inputs[13] < 15.841378) {
        if (inputs[15] < 5.356141) {
            if (inputs[15] < 4.2154) {
                var48 = -0.0033616207;
            } else {
                var48 = -0.019325012;
            }
        } else {
            if (inputs[12] < -0.76877445) {
                if (inputs[3] < 18037.6) {
                    var48 = -0.020780476;
                } else {
                    var48 = -0.0033603748;
                }
            } else {
                if (inputs[10] < -0.988) {
                    var48 = 0.012205789;
                } else {
                    var48 = -0.0010093221;
                }
            }
        }
    } else {
        if (inputs[3] < 17490.88) {
            var48 = -0.008052483;
        } else {
            if (inputs[17] < 2.8439124) {
                if (inputs[15] < 24.841236) {
                    var48 = 0.017416919;
                } else {
                    var48 = 0.0022492227;
                }
            } else {
                var48 = -0.002161759;
            }
        }
    }
    double var49;
    if (inputs[2] < 17.267857) {
        if (inputs[2] < 15.951428) {
            if (inputs[2] < 14.269286) {
                if (inputs[14] < 11.51551) {
                    var49 = -0.0007560002;
                } else {
                    var49 = -0.017615708;
                }
            } else {
                var49 = 0.008904654;
            }
        } else {
            var49 = -0.01692802;
        }
    } else {
        if (inputs[10] < 5.038) {
            if (inputs[16] < 0.47722974) {
                if (inputs[14] < 24.654566) {
                    var49 = -0.014026372;
                } else {
                    var49 = 0.004082713;
                }
            } else {
                if (inputs[7] < 123.8775) {
                    var49 = 0.015787644;
                } else {
                    var49 = -0.0027297847;
                }
            }
        } else {
            if (inputs[1] < 69.61028) {
                if (inputs[20] < 12.1561165) {
                    var49 = 0.0038706472;
                } else {
                    var49 = 0.023374226;
                }
            } else {
                var49 = -0.0010571417;
            }
        }
    }
    double var50;
    if (inputs[10] < 15.095) {
        if (inputs[20] >= -24.019466) {
            if (inputs[11] < -6.416788) {
                var50 = 0.008297789;
            } else {
                if (inputs[12] < -1.9500151) {
                    var50 = -0.01835213;
                } else {
                    var50 = -0.0018753075;
                }
            }
        } else {
            if (inputs[20] < -27.187044) {
                var50 = -0.0023453522;
            } else {
                if (inputs[10] < -4.075) {
                    var50 = 0.0059897993;
                } else {
                    var50 = 0.020737607;
                }
            }
        }
    } else {
        var50 = 0.015606421;
    }
    double var51;
    if (inputs[14] < 19.303827) {
        if (inputs[16] < 1.1342015) {
            if (inputs[16] < 0.78489846) {
                if (inputs[12] < 3.6293309) {
                    var51 = -0.00021588954;
                } else {
                    var51 = -0.016611816;
                }
            } else {
                var51 = 0.014800677;
            }
        } else {
            var51 = -0.015294397;
        }
    } else {
        if (inputs[7] < 98.065) {
            if (inputs[8] < 17.315) {
                if (inputs[8] < 5.5425) {
                    var51 = 0.014158871;
                } else {
                    var51 = 0.0024414058;
                }
            } else {
                if (inputs[2] < 21.177856) {
                    var51 = -0.017648736;
                } else {
                    var51 = -0.0016152994;
                }
            }
        } else {
            if (inputs[14] < 29.705542) {
                if (inputs[13] < 19.397114) {
                    var51 = 0.024399135;
                } else {
                    var51 = 0.015686648;
                }
            } else {
                var51 = -0.0015681499;
            }
        }
    }
    double var52;
    if (inputs[16] < 1.8366648) {
        if (inputs[11] < 7.1047273) {
            if (inputs[3] < 18075.234) {
                if (inputs[20] < 27.652756) {
                    var52 = -0.007129531;
                } else {
                    var52 = 0.0074430783;
                }
            } else {
                if (inputs[10] < -1.924) {
                    var52 = 0.009431137;
                } else {
                    var52 = -0.00051674526;
                }
            }
        } else {
            if (inputs[8] < 35.4075) {
                var52 = 0.0012960064;
            } else {
                var52 = 0.01733932;
            }
        }
    } else {
        var52 = -0.011957264;
    }
    double var53;
    if (inputs[16] < 1.888416) {
        if (inputs[20] < 12.193009) {
            if (inputs[3] < 17490.88) {
                var53 = -0.016985115;
            } else {
                if (inputs[12] < -0.5651203) {
                    var53 = 0.005338663;
                } else {
                    var53 = -0.005547329;
                }
            }
        } else {
            if (inputs[21] < 2.644951) {
                if (inputs[7] < 68.245) {
                    var53 = 0.024991048;
                } else {
                    var53 = 0.005992528;
                }
            } else {
                if (inputs[7] < 130.475) {
                    var53 = -0.0040392866;
                } else {
                    var53 = 0.015205009;
                }
            }
        }
    } else {
        var53 = -0.014094469;
    }
    double var54;
    if (inputs[14] < 21.910452) {
        if (inputs[15] < 24.474863) {
            if (inputs[10] < 4.651) {
                if (inputs[12] < 1.685609) {
                    var54 = -0.0016069759;
                } else {
                    var54 = -0.020286966;
                }
            } else {
                if (inputs[20] < 13.724568) {
                    var54 = 0.0013163305;
                } else {
                    var54 = 0.016366687;
                }
            }
        } else {
            if (inputs[10] < 2.676) {
                var54 = -0.0060517997;
            } else {
                var54 = -0.022212112;
            }
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[10] < -4.13) {
                var54 = -0.0143455705;
            } else {
                var54 = 0.007048625;
            }
        } else {
            if (inputs[14] < 28.204103) {
                if (inputs[13] < 22.422901) {
                    var54 = 0.023519117;
                } else {
                    var54 = 0.013705699;
                }
            } else {
                var54 = 0.0023605293;
            }
        }
    }
    double var55;
    if (inputs[19] < -25.014664) {
        var55 = 0.014241886;
    } else {
        if (inputs[2] < 18.608572) {
            if (inputs[15] < 27.67673) {
                if (inputs[15] < 21.425499) {
                    var55 = -0.0031900292;
                } else {
                    var55 = -0.018580563;
                }
            } else {
                var55 = 0.006529006;
            }
        } else {
            if (inputs[21] < 3.2555566) {
                if (inputs[15] < 25.213606) {
                    var55 = 0.007877388;
                } else {
                    var55 = -0.0035060716;
                }
            } else {
                var55 = 0.017857015;
            }
        }
    }
    double var56;
    if (inputs[4] < 18076.11) {
        if (inputs[2] < 26.822857) {
            if (inputs[8] < 17.315) {
                if (inputs[8] < 5.33) {
                    var56 = -0.0026599565;
                } else {
                    var56 = 0.014324822;
                }
            } else {
                if (inputs[7] < 106.5575) {
                    var56 = -0.0109272245;
                } else {
                    var56 = 0.0062512173;
                }
            }
        } else {
            var56 = -0.018367466;
        }
    } else {
        if (inputs[4] < 18229.18) {
            var56 = 0.01369197;
        } else {
            if (inputs[1] < 32.14733) {
                if (inputs[20] < -26.631529) {
                    var56 = 0.0018046293;
                } else {
                    var56 = 0.014492885;
                }
            } else {
                if (inputs[20] < -13.872019) {
                    var56 = -0.011151954;
                } else {
                    var56 = 0.00046020126;
                }
            }
        }
    }
    double var57;
    if (inputs[15] < 5.356141) {
        if (inputs[5] < 19820.832) {
            var57 = -0.003989423;
        } else {
            var57 = -0.022899868;
        }
    } else {
        if (inputs[3] < 19850.186) {
            if (inputs[5] < 19713.963) {
                if (inputs[2] < 10.026428) {
                    var57 = -0.00912322;
                } else {
                    var57 = 0.0031739948;
                }
            } else {
                var57 = -0.015289912;
            }
        } else {
            var57 = 0.014992214;
        }
    }
    double var58;
    if (inputs[12] < 0.8105113) {
        if (inputs[5] < 17590.586) {
            var58 = -0.017335624;
        } else {
            if (inputs[19] >= -21.662674) {
                if (inputs[17] < 0.6531121) {
                    var58 = -0.0023190822;
                } else {
                    var58 = -0.012577167;
                }
            } else {
                if (inputs[6] < 18205.475) {
                    var58 = 0.00022353647;
                } else {
                    var58 = 0.010112839;
                }
            }
        }
    } else {
        if (inputs[12] < 1.7146692) {
            if (inputs[7] < 36.4075) {
                var58 = 0.0064255847;
            } else {
                var58 = 0.020882329;
            }
        } else {
            if (inputs[13] < 16.810863) {
                if (inputs[3] < 17542.895) {
                    var58 = 0.008653067;
                } else {
                    var58 = -0.008615179;
                }
            } else {
                var58 = 0.013264497;
            }
        }
    }
    double var59;
    if (inputs[9] < 2.81) {
        if (inputs[21] < 3.2599802) {
            if (inputs[13] < 10.311104) {
                var59 = -0.011739984;
            } else {
                if (inputs[3] < 18087.11) {
                    var59 = -0.0018465631;
                } else {
                    var59 = 0.0100503415;
                }
            }
        } else {
            if (inputs[13] < 15.014455) {
                if (inputs[13] < 8.814651) {
                    var59 = 0.009703654;
                } else {
                    var59 = -0.0014379527;
                }
            } else {
                var59 = 0.015958;
            }
        }
    } else {
        if (inputs[3] < 18816.105) {
            var59 = 0.009052024;
        } else {
            if (inputs[13] < 5.1977787) {
                if (inputs[13] < 3.7960505) {
                    var59 = -0.0073492164;
                } else {
                    var59 = 0.010260366;
                }
            } else {
                if (inputs[12] < 0.094052635) {
                    var59 = -0.025037274;
                } else {
                    var59 = -0.002532835;
                }
            }
        }
    }
    double var60;
    if (inputs[7] < 89.905) {
        if (inputs[1] < 71.55351) {
            if (inputs[6] < 19710.7) {
                if (inputs[5] < 19511.564) {
                    var60 = -0.00093455496;
                } else {
                    var60 = 0.014696898;
                }
            } else {
                if (inputs[21] < 2.90849) {
                    var60 = -0.013961343;
                } else {
                    var60 = 0.0055152844;
                }
            }
        } else {
            var60 = -0.017108032;
        }
    } else {
        if (inputs[16] < 0.10568233) {
            if (inputs[13] < 20.560394) {
                if (inputs[16] < -1.2180917) {
                    var60 = 0.0014282557;
                } else {
                    var60 = 0.012399334;
                }
            } else {
                var60 = 0.019235097;
            }
        } else {
            if (inputs[15] < 25.480194) {
                var60 = 0.012665305;
            } else {
                if (inputs[5] < 18487.203) {
                    var60 = -0.017235951;
                } else {
                    var60 = 0.0012564092;
                }
            }
        }
    }
    double var61;
    if (inputs[10] < 15.095) {
        if (inputs[16] < 0.45865735) {
            if (inputs[16] < -0.43712735) {
                if (inputs[16] < -0.9431992) {
                    var61 = -0.0029475924;
                } else {
                    var61 = 0.00814858;
                }
            } else {
                if (inputs[7] < 25.31) {
                    var61 = 0.005290485;
                } else {
                    var61 = -0.014261561;
                }
            }
        } else {
            if (inputs[16] < 0.6946821) {
                var61 = 0.016885541;
            } else {
                if (inputs[20] < -7.9805346) {
                    var61 = 0.0063957637;
                } else {
                    var61 = -0.011989511;
                }
            }
        }
    } else {
        var61 = 0.012303033;
    }
    double var62;
    if (inputs[15] < 5.356141) {
        if (inputs[6] < 19819.125) {
            var62 = -0.003978599;
        } else {
            var62 = -0.018615454;
        }
    } else {
        if (inputs[3] < 19961.445) {
            if (inputs[13] < 15.765904) {
                if (inputs[15] < 11.955792) {
                    var62 = 0.0035840438;
                } else {
                    var62 = -0.0046366267;
                }
            } else {
                if (inputs[10] < -17.426) {
                    var62 = -0.0067644613;
                } else {
                    var62 = 0.007644476;
                }
            }
        } else {
            var62 = 0.01579516;
        }
    }
    double var63;
    if (inputs[20] < 11.512124) {
        if (inputs[19] >= -25.014664) {
            if (inputs[19] < 17.366549) {
                var63 = -0.021977725;
            } else {
                if (inputs[1] < 57.86574) {
                    var63 = 0.003626427;
                } else {
                    var63 = -0.013987976;
                }
            }
        } else {
            if (inputs[6] < 18220.365) {
                if (inputs[3] < 17490.88) {
                    var63 = -0.015125256;
                } else {
                    var63 = -0.0023375917;
                }
            } else {
                if (inputs[5] < 18691.64) {
                    var63 = 0.0185111;
                } else {
                    var63 = -0.0004692425;
                }
            }
        }
    } else {
        if (inputs[16] < -1.2699627) {
            if (inputs[20] >= 16.514744) {
                var63 = 0.0069101183;
            } else {
                var63 = 0.023365386;
            }
        } else {
            if (inputs[14] < 19.819408) {
                if (inputs[16] < 0.28437614) {
                    var63 = -0.014044996;
                } else {
                    var63 = 0.0048755445;
                }
            } else {
                if (inputs[1] < 70.14485) {
                    var63 = 0.016416192;
                } else {
                    var63 = 0.001235829;
                }
            }
        }
    }
    double var64;
    if (inputs[7] < 92.1375) {
        if (inputs[7] < 82.5025) {
            if (inputs[13] < 7.068011) {
                if (inputs[12] < -0.5651203) {
                    var64 = 0.010250656;
                } else {
                    var64 = -0.0087427;
                }
            } else {
                if (inputs[18] < 1.0) {
                    var64 = 0.005403053;
                } else {
                    var64 = -0.008243935;
                }
            }
        } else {
            var64 = -0.012639526;
        }
    } else {
        if (inputs[14] < 15.002989) {
            var64 = -0.006837182;
        } else {
            if (inputs[14] < 29.705542) {
                if (inputs[3] < 18155.8) {
                    var64 = 0.022391304;
                } else {
                    var64 = 0.008131381;
                }
            } else {
                var64 = 0.0010295083;
            }
        }
    }
    double var65;
    if (inputs[19] < -25.014664) {
        var65 = 0.015085818;
    } else {
        if (inputs[20] < 12.193009) {
            if (inputs[20] < 7.6966357) {
                if (inputs[19] < 48.418976) {
                    var65 = -0.010918318;
                } else {
                    var65 = 0.0007908297;
                }
            } else {
                if (inputs[17] < 2.2047207) {
                    var65 = -0.021264808;
                } else {
                    var65 = -0.006760944;
                }
            }
        } else {
            if (inputs[2] < 20.225714) {
                if (inputs[2] < 15.951428) {
                    var65 = 0.0033767375;
                } else {
                    var65 = -0.01885853;
                }
            } else {
                if (inputs[22] < 17.0) {
                    var65 = 0.018094324;
                } else {
                    var65 = 0.0021698074;
                }
            }
        }
    }
    double var66;
    if (inputs[14] < 21.910452) {
        if (inputs[15] < 24.033882) {
            if (inputs[21] < 2.7594576) {
                if (inputs[3] < 19626.5) {
                    var66 = 0.000046056557;
                } else {
                    var66 = -0.015088741;
                }
            } else {
                if (inputs[3] < 19689.3) {
                    var66 = 0.0010478788;
                } else {
                    var66 = 0.015793543;
                }
            }
        } else {
            if (inputs[11] < 3.682606) {
                var66 = -0.016675465;
            } else {
                var66 = -0.002286914;
            }
        }
    } else {
        if (inputs[3] < 17744.16) {
            if (inputs[20] < 9.022995) {
                var66 = -0.014827368;
            } else {
                var66 = 0.009434406;
            }
        } else {
            if (inputs[17] < 2.8439124) {
                if (inputs[15] < 23.185968) {
                    var66 = 0.022874825;
                } else {
                    var66 = 0.007322577;
                }
            } else {
                var66 = -0.006455036;
            }
        }
    }
    double var67;
    if (inputs[13] < 8.562585) {
        if (inputs[12] < -0.6375564) {
            var67 = 0.0058646514;
        } else {
            if (inputs[12] < 0.118857145) {
                var67 = -0.015994277;
            } else {
                if (inputs[10] < 1.088) {
                    var67 = 0.0064689377;
                } else {
                    var67 = -0.009108971;
                }
            }
        }
    } else {
        if (inputs[8] < 27.625) {
            if (inputs[17] < 3.1889477) {
                if (inputs[21] < 1.9066513) {
                    var67 = -0.006862311;
                } else {
                    var67 = 0.0064065647;
                }
            } else {
                var67 = -0.014546319;
            }
        } else {
            if (inputs[17] < -1.8981965) {
                if (inputs[5] < 18203.225) {
                    var67 = -0.012254545;
                } else {
                    var67 = 0.0063186716;
                }
            } else {
                if (inputs[13] < 13.647793) {
                    var67 = 0.0036394496;
                } else {
                    var67 = 0.016325116;
                }
            }
        }
    }
    double var68;
    if (inputs[14] < 19.11301) {
        if (inputs[16] < 1.1342015) {
            if (inputs[16] < 0.78489846) {
                if (inputs[11] < -0.562) {
                    var68 = -0.014617431;
                } else {
                    var68 = -0.0004204803;
                }
            } else {
                var68 = 0.012977664;
            }
        } else {
            if (inputs[11] < -1.3551515) {
                var68 = -0.0012277703;
            } else {
                var68 = -0.022309814;
            }
        }
    } else {
        if (inputs[22] < 16.0) {
            if (inputs[22] < 8.0) {
                var68 = 0.009354527;
            } else {
                if (inputs[9] < 0.94) {
                    var68 = 0.0007444305;
                } else {
                    var68 = -0.014541522;
                }
            }
        } else {
            if (inputs[20] >= -15.318648) {
                if (inputs[3] < 18075.234) {
                    var68 = -0.009126439;
                } else {
                    var68 = 0.008680294;
                }
            } else {
                if (inputs[10] < -12.801) {
                    var68 = 0.004864161;
                } else {
                    var68 = 0.019530196;
                }
            }
        }
    }
    double var69;
    if (inputs[12] < 0.8105113) {
        if (inputs[5] < 19729.697) {
            if (inputs[3] < 17490.88) {
                var69 = -0.015732981;
            } else {
                if (inputs[13] < 3.5677521) {
                    var69 = 0.015914558;
                } else {
                    var69 = 0.00022949782;
                }
            }
        } else {
            if (inputs[7] < 19.365) {
                var69 = -0.007592019;
            } else {
                var69 = -0.023673786;
            }
        }
    } else {
        if (inputs[2] < 19.159286) {
            if (inputs[15] < 21.425499) {
                if (inputs[7] < 33.1775) {
                    var69 = -0.0054202853;
                } else {
                    var69 = 0.012526024;
                }
            } else {
                if (inputs[15] < 26.016628) {
                    var69 = -0.021414481;
                } else {
                    var69 = 0.002212693;
                }
            }
        } else {
            if (inputs[12] < 4.1602106) {
                if (inputs[21] < 2.114917) {
                    var69 = 0.018118957;
                } else {
                    var69 = 0.012254746;
                }
            } else {
                var69 = -0.001909986;
            }
        }
    }
    double var70;
    if (inputs[20] < 12.193009) {
        if (inputs[19] < -21.662674) {
            var70 = 0.013421894;
        } else {
            if (inputs[1] < 30.761576) {
                if (inputs[8] < 31.81) {
                    var70 = 0.010337533;
                } else {
                    var70 = -0.007915327;
                }
            } else {
                if (inputs[17] < -1.8904577) {
                    var70 = -0.020785015;
                } else {
                    var70 = -0.004314207;
                }
            }
        }
    } else {
        if (inputs[12] < 1.7146692) {
            if (inputs[12] < 0.8833308) {
                var70 = 0.0048327916;
            } else {
                var70 = 0.024428895;
            }
        } else {
            if (inputs[1] < 79.82045) {
                if (inputs[20] >= 20.001684) {
                    var70 = -0.015569465;
                } else {
                    var70 = 0.0032068484;
                }
            } else {
                var70 = 0.015292969;
            }
        }
    }
    double var71;
    if (inputs[19] < -25.014664) {
        var71 = 0.014345499;
    } else {
        if (inputs[10] < 4.651) {
            if (inputs[3] < 17490.88) {
                var71 = -0.017449709;
            } else {
                if (inputs[10] < -9.387) {
                    var71 = 0.0072232787;
                } else {
                    var71 = -0.0045226724;
                }
            }
        } else {
            if (inputs[15] < 24.474863) {
                if (inputs[17] < 3.2504532) {
                    var71 = 0.016298605;
                } else {
                    var71 = -0.001930019;
                }
            } else {
                if (inputs[7] < 75.565) {
                    var71 = -0.021424852;
                } else {
                    var71 = 0.0053803567;
                }
            }
        }
    }
    double var72;
    if (inputs[2] < 9.67) {
        if (inputs[2] < 7.2564287) {
            if (inputs[2] < 6.267857) {
                if (inputs[17] < 2.730378) {
                    var72 = -0.013519059;
                } else {
                    var72 = 0.00013214374;
                }
            } else {
                var72 = 0.010581091;
            }
        } else {
            var72 = -0.014275669;
        }
    } else {
        if (inputs[3] < 18075.234) {
            if (inputs[22] < 20.0) {
                if (inputs[8] < 17.315) {
                    var72 = 0.0023861234;
                } else {
                    var72 = -0.011904823;
                }
            } else {
                var72 = 0.008858429;
            }
        } else {
            if (inputs[3] < 18229.18) {
                var72 = 0.015028455;
            } else {
                if (inputs[7] < 28.935) {
                    var72 = -0.008831379;
                } else {
                    var72 = 0.00521507;
                }
            }
        }
    }
    double var73;
    if (inputs[10] < 15.095) {
        if (inputs[16] < 0.45865735) {
            if (inputs[16] < -0.4755567) {
                if (inputs[16] < -0.9431992) {
                    var73 = -0.0041821366;
                } else {
                    var73 = 0.007719973;
                }
            } else {
                if (inputs[21] < 2.8085456) {
                    var73 = -0.019156208;
                } else {
                    var73 = -0.005380263;
                }
            }
        } else {
            if (inputs[16] < 0.6860457) {
                var73 = 0.019263903;
            } else {
                if (inputs[20] >= -6.9110537) {
                    var73 = -0.01324757;
                } else {
                    var73 = 0.002982576;
                }
            }
        }
    } else {
        var73 = 0.01169112;
    }
    double var74;
    if (inputs[15] < 5.356141) {
        var74 = -0.011197375;
    } else {
        if (inputs[4] < 19878.975) {
            if (inputs[16] < -0.43712735) {
                if (inputs[10] < 5.124) {
                    var74 = 0.00053432374;
                } else {
                    var74 = 0.010488248;
                }
            } else {
                if (inputs[16] < 0.45865735) {
                    var74 = -0.00990878;
                } else {
                    var74 = 0.0012963121;
                }
            }
        } else {
            var74 = 0.012883;
        }
    }
    double var75;
    if (inputs[19] < -25.014664) {
        var75 = 0.013237081;
    } else {
        if (inputs[12] < 0.9021729) {
            if (inputs[22] < 20.0) {
                if (inputs[3] < 17490.88) {
                    var75 = -0.018794592;
                } else {
                    var75 = -0.00421213;
                }
            } else {
                var75 = 0.006768848;
            }
        } else {
            if (inputs[12] < 1.685609) {
                if (inputs[3] < 19146.95) {
                    var75 = 0.004799329;
                } else {
                    var75 = 0.018832294;
                }
            } else {
                if (inputs[14] < 14.447264) {
                    var75 = -0.009611472;
                } else {
                    var75 = 0.0046437015;
                }
            }
        }
    }
    double var76;
    if (inputs[2] < 14.096429) {
        if (inputs[14] < 11.51551) {
            if (inputs[11] < -1.3551515) {
                var76 = 0.017680472;
            } else {
                if (inputs[20] < 11.40759) {
                    var76 = -0.008059378;
                } else {
                    var76 = 0.0062912214;
                }
            }
        } else {
            if (inputs[3] < 18059.516) {
                var76 = -0.009312594;
            } else {
                var76 = -0.02472825;
            }
        }
    } else {
        if (inputs[21] < 3.277861) {
            if (inputs[1] < 70.14485) {
                if (inputs[10] < 5.038) {
                    var76 = -0.00071260816;
                } else {
                    var76 = 0.011579983;
                }
            } else {
                var76 = -0.0112173185;
            }
        } else {
            if (inputs[11] < 3.7189696) {
                var76 = 0.005511417;
            } else {
                var76 = 0.018884305;
            }
        }
    }
    double var77;
    if (inputs[15] < 22.42742) {
        if (inputs[10] < 5.5) {
            if (inputs[20] < 6.039089) {
                if (inputs[6] < 19805.176) {
                    var77 = 0.008290975;
                } else {
                    var77 = -0.007918044;
                }
            } else {
                if (inputs[2] < 7.2564287) {
                    var77 = 0.0011705585;
                } else {
                    var77 = -0.0169667;
                }
            }
        } else {
            if (inputs[20] < 12.1561165) {
                var77 = -0.0011266948;
            } else {
                if (inputs[11] < 4.2977576) {
                    var77 = 0.021712892;
                } else {
                    var77 = 0.010445695;
                }
            }
        }
    } else {
        if (inputs[15] < 27.751934) {
            if (inputs[2] < 24.687143) {
                if (inputs[15] < 24.474863) {
                    var77 = -0.008196648;
                } else {
                    var77 = -0.021300953;
                }
            } else {
                var77 = 0.0077212076;
            }
        } else {
            if (inputs[20] < 26.405508) {
                if (inputs[11] < -6.4671516) {
                    var77 = 0.011154627;
                } else {
                    var77 = -0.008859218;
                }
            } else {
                var77 = 0.016859949;
            }
        }
    }
    double var78;
    if (inputs[19] < -26.784607) {
        var78 = 0.016623443;
    } else {
        if (inputs[15] < 5.3504486) {
            if (inputs[15] < 4.2154) {
                var78 = -0.0028499716;
            } else {
                var78 = -0.017176256;
            }
        } else {
            if (inputs[4] < 19954.07) {
                if (inputs[2] < 9.67) {
                    var78 = -0.010809973;
                } else {
                    var78 = 0.0019026259;
                }
            } else {
                var78 = 0.014478606;
            }
        }
    }
    double var79;
    if (inputs[10] < 15.095) {
        if (inputs[18] < 1.0) {
            if (inputs[13] < 10.628429) {
                if (inputs[12] < 1.7146692) {
                    var79 = 0.00066199433;
                } else {
                    var79 = -0.016206898;
                }
            } else {
                if (inputs[13] < 20.139761) {
                    var79 = 0.010606399;
                } else {
                    var79 = -0.00096630864;
                }
            }
        } else {
            if (inputs[22] < 20.0) {
                if (inputs[10] < 5.346) {
                    var79 = -0.0034088406;
                } else {
                    var79 = -0.01855699;
                }
            } else {
                var79 = 0.007613511;
            }
        }
    } else {
        var79 = 0.011155743;
    }
    double var80;
    if (inputs[14] < 19.819408) {
        if (inputs[15] < 24.335045) {
            if (inputs[10] < 4.651) {
                if (inputs[3] < 18553.734) {
                    var80 = -0.01795067;
                } else {
                    var80 = -0.0024564504;
                }
            } else {
                if (inputs[10] < 7.125) {
                    var80 = 0.018305581;
                } else {
                    var80 = 0.0014980567;
                }
            }
        } else {
            if (inputs[3] < 18468.17) {
                var80 = -0.019877195;
            } else {
                var80 = -0.0052904454;
            }
        }
    } else {
        if (inputs[2] < 20.899286) {
            if (inputs[14] < 28.204103) {
                if (inputs[7] < 97.285) {
                    var80 = -0.0037017048;
                } else {
                    var80 = 0.013843517;
                }
            } else {
                var80 = -0.016692944;
            }
        } else {
            if (inputs[1] < 26.21714) {
                var80 = -0.002371867;
            } else {
                if (inputs[18] < 1.0) {
                    var80 = 0.019158768;
                } else {
                    var80 = 0.004970572;
                }
            }
        }
    }
    double var81;
    if (inputs[16] < 0.45865735) {
        if (inputs[15] < 36.83187) {
            if (inputs[15] < 9.219862) {
                if (inputs[3] < 19736.24) {
                    var81 = 0.012743971;
                } else {
                    var81 = -0.006456521;
                }
            } else {
                if (inputs[22] < 12.0) {
                    var81 = -0.015891643;
                } else {
                    var81 = -0.00034622685;
                }
            }
        } else {
            var81 = 0.011825504;
        }
    } else {
        if (inputs[15] < 8.064122) {
            var81 = -0.012432934;
        } else {
            if (inputs[15] < 36.175896) {
                if (inputs[16] < 0.6860457) {
                    var81 = 0.020274095;
                } else {
                    var81 = 0.006239342;
                }
            } else {
                var81 = -0.009472112;
            }
        }
    }
    double var82;
    if (inputs[15] < 5.356141) {
        if (inputs[17] < 1.6180851) {
            var82 = -0.012304481;
        } else {
            var82 = -0.002129351;
        }
    } else {
        if (inputs[3] < 19864.836) {
            if (inputs[4] < 19661.52) {
                if (inputs[4] < 17834.82) {
                    var82 = -0.0042954176;
                } else {
                    var82 = 0.0030584973;
                }
            } else {
                var82 = -0.0092640575;
            }
        } else {
            var82 = 0.017317658;
        }
    }
    double var83;
    if (inputs[10] < 4.651) {
        if (inputs[10] < 1.088) {
            if (inputs[11] < 0.7582424) {
                if (inputs[3] < 17490.88) {
                    var83 = -0.01780511;
                } else {
                    var83 = 0.0002345219;
                }
            } else {
                var83 = 0.014945216;
            }
        } else {
            if (inputs[15] < 10.122243) {
                if (inputs[22] < 5.0) {
                    var83 = 0.006576794;
                } else {
                    var83 = -0.009162227;
                }
            } else {
                var83 = -0.024452763;
            }
        }
    } else {
        if (inputs[8] < 57.755) {
            if (inputs[15] < 24.474863) {
                if (inputs[13] < 19.397114) {
                    var83 = 0.012779857;
                } else {
                    var83 = -0.0051952912;
                }
            } else {
                var83 = -0.015584315;
            }
        } else {
            var83 = 0.018234346;
        }
    }
    double var84;
    if (inputs[21] < 1.7890501) {
        if (inputs[4] < 19735.51) {
            if (inputs[15] < 10.543079) {
                var84 = 0.007400636;
            } else {
                if (inputs[7] < 64.51) {
                    var84 = -0.015205818;
                } else {
                    var84 = 0.00476063;
                }
            }
        } else {
            var84 = -0.021358468;
        }
    } else {
        if (inputs[4] < 19878.975) {
            if (inputs[2] < 18.608572) {
                if (inputs[9] < 0.84) {
                    var84 = 0.010413133;
                } else {
                    var84 = -0.0053170556;
                }
            } else {
                if (inputs[21] < 3.277861) {
                    var84 = 0.0016337043;
                } else {
                    var84 = 0.019402703;
                }
            }
        } else {
            var84 = 0.013306483;
        }
    }
    double var85;
    if (inputs[19] < -25.014664) {
        var85 = 0.011037456;
    } else {
        if (inputs[11] < 7.1047273) {
            if (inputs[19] < 452.9068) {
                if (inputs[16] < 0.5366254) {
                    var85 = -0.008345067;
                } else {
                    var85 = 0.0017502628;
                }
            } else {
                if (inputs[4] < 17834.82) {
                    var85 = -0.005043266;
                } else {
                    var85 = 0.0037612047;
                }
            }
        } else {
            if (inputs[11] < 9.117576) {
                var85 = 0.015341346;
            } else {
                var85 = -0.000625716;
            }
        }
    }
    double var86;
    if (inputs[2] < 9.67) {
        if (inputs[2] < 7.2564287) {
            if (inputs[2] < 6.267857) {
                if (inputs[17] < 2.8439124) {
                    var86 = -0.017547918;
                } else {
                    var86 = 0.006279211;
                }
            } else {
                var86 = 0.011879519;
            }
        } else {
            var86 = -0.015559691;
        }
    } else {
        if (inputs[4] < 18076.11) {
            if (inputs[6] < 17971.32) {
                if (inputs[4] < 17811.75) {
                    var86 = -0.00309657;
                } else {
                    var86 = 0.013986528;
                }
            } else {
                var86 = -0.014178849;
            }
        } else {
            if (inputs[12] < 4.0963235) {
                if (inputs[22] < 16.0) {
                    var86 = 0.002774408;
                } else {
                    var86 = 0.012300987;
                }
            } else {
                var86 = -0.010405843;
            }
        }
    }
    double var87;
    if (inputs[19] < -25.014664) {
        var87 = 0.010926311;
    } else {
        if (inputs[10] < 4.651) {
            if (inputs[10] < 3.214) {
                if (inputs[17] < 2.90849) {
                    var87 = -0.0034399475;
                } else {
                    var87 = 0.0108386;
                }
            } else {
                var87 = -0.01873609;
            }
        } else {
            if (inputs[7] < 107.085) {
                if (inputs[15] < 22.42742) {
                    var87 = 0.0074297297;
                } else {
                    var87 = -0.008451758;
                }
            } else {
                var87 = 0.018682633;
            }
        }
    }
    double var88;
    if (inputs[19] >= 116.51537) {
        var88 = -0.009962644;
    } else {
        if (inputs[19] >= 62.08193) {
            var88 = 0.011380128;
        } else {
            if (inputs[19] >= 24.331411) {
                var88 = -0.011264497;
            } else {
                if (inputs[17] < 4.0182233) {
                    var88 = 0.00031845982;
                } else {
                    var88 = 0.012360061;
                }
            }
        }
    }
    double var89;
    if (inputs[12] < 3.9619398) {
        if (inputs[13] < 8.264303) {
            if (inputs[8] < 33.46) {
                if (inputs[12] < -0.5651203) {
                    var89 = 0.012508764;
                } else {
                    var89 = -0.0039865673;
                }
            } else {
                var89 = -0.016695268;
            }
        } else {
            if (inputs[15] < 11.955792) {
                var89 = 0.020441514;
            } else {
                if (inputs[22] < 12.0) {
                    var89 = -0.011892962;
                } else {
                    var89 = 0.0041637523;
                }
            }
        }
    } else {
        if (inputs[15] < 38.59941) {
            var89 = -0.020136643;
        } else {
            var89 = 0.0032166801;
        }
    }
    double var90;
    if (inputs[20] < 12.193009) {
        if (inputs[20] < 7.3229785) {
            if (inputs[5] < 17590.586) {
                var90 = -0.013397886;
            } else {
                if (inputs[5] < 19729.697) {
                    var90 = 0.003832529;
                } else {
                    var90 = -0.00759668;
                }
            }
        } else {
            if (inputs[1] < 65.46143) {
                var90 = -0.01841968;
            } else {
                var90 = -0.0026115477;
            }
        }
    } else {
        if (inputs[21] < 2.3798716) {
            var90 = 0.015390848;
        } else {
            if (inputs[15] < 13.186485) {
                var90 = 0.012619871;
            } else {
                if (inputs[13] < 20.139761) {
                    var90 = -0.005127943;
                } else {
                    var90 = 0.011558601;
                }
            }
        }
    }
    double var91;
    if (inputs[2] < 17.687857) {
        if (inputs[21] < 2.7594576) {
            if (inputs[19] < -1.4293238) {
                var91 = 0.006437282;
            } else {
                if (inputs[19] < 318.549) {
                    var91 = -0.007814307;
                } else {
                    var91 = -0.02179842;
                }
            }
        } else {
            if (inputs[6] < 19771.96) {
                if (inputs[20] >= -20.753176) {
                    var91 = -0.007240662;
                } else {
                    var91 = 0.0066901664;
                }
            } else {
                var91 = 0.018087441;
            }
        }
    } else {
        if (inputs[10] < -14.188) {
            var91 = -0.009383858;
        } else {
            if (inputs[21] < 3.277861) {
                if (inputs[6] < 19021.846) {
                    var91 = 0.0018873572;
                } else {
                    var91 = 0.017029325;
                }
            } else {
                var91 = 0.020001072;
            }
        }
    }
    double var92;
    if (inputs[19] >= -25.014664) {
        if (inputs[21] < 3.2088356) {
            if (inputs[21] < 2.7594576) {
                if (inputs[14] < 12.940706) {
                    var92 = -0.0022657008;
                } else {
                    var92 = -0.017155305;
                }
            } else {
                var92 = 0.012235974;
            }
        } else {
            var92 = -0.013934974;
        }
    } else {
        if (inputs[10] < -17.107) {
            var92 = -0.012776173;
        } else {
            if (inputs[4] < 18076.11) {
                if (inputs[17] < 3.5373898) {
                    var92 = -0.0036289745;
                } else {
                    var92 = 0.01393403;
                }
            } else {
                if (inputs[10] < -4.35) {
                    var92 = 0.017068727;
                } else {
                    var92 = 0.0041779894;
                }
            }
        }
    }
    double var93;
    if (inputs[7] < 89.905) {
        if (inputs[12] < 3.7038045) {
            if (inputs[2] < 7.2564287) {
                if (inputs[7] < 11.6875) {
                    var93 = -0.006884926;
                } else {
                    var93 = 0.012378141;
                }
            } else {
                if (inputs[22] < 4.0) {
                    var93 = -0.01675131;
                } else {
                    var93 = 0.00010856558;
                }
            }
        } else {
            var93 = -0.016226301;
        }
    } else {
        if (inputs[17] < -3.1794524) {
            var93 = -0.0062654703;
        } else {
            if (inputs[14] < 29.705542) {
                if (inputs[14] < 19.11301) {
                    var93 = 0.003841694;
                } else {
                    var93 = 0.017137067;
                }
            } else {
                var93 = -0.0006358734;
            }
        }
    }
    double var94;
    if (inputs[14] < 24.654566) {
        if (inputs[12] < -2.0077744) {
            if (inputs[1] < 27.00644) {
                var94 = 0.0052713137;
            } else {
                var94 = -0.019668777;
            }
        } else {
            if (inputs[19] < -26.784607) {
                var94 = 0.01335977;
            } else {
                if (inputs[19] < 48.6697) {
                    var94 = -0.008109648;
                } else {
                    var94 = 0.0005711329;
                }
            }
        }
    } else {
        if (inputs[14] < 28.204103) {
            var94 = 0.014358461;
        } else {
            if (inputs[12] < -3.1967595) {
                var94 = 0.012590887;
            } else {
                if (inputs[2] < 20.899286) {
                    var94 = -0.01507398;
                } else {
                    var94 = 0.0033377823;
                }
            }
        }
    }
    double var95;
    if (inputs[15] < 5.356141) {
        if (inputs[17] < 1.6180851) {
            var95 = -0.016157398;
        } else {
            var95 = -0.0020303095;
        }
    } else {
        if (inputs[3] < 19961.445) {
            if (inputs[14] < 19.303827) {
                if (inputs[15] < 11.955792) {
                    var95 = 0.0044179447;
                } else {
                    var95 = -0.007681514;
                }
            } else {
                if (inputs[10] < -17.426) {
                    var95 = -0.008822075;
                } else {
                    var95 = 0.0055099097;
                }
            }
        } else {
            var95 = 0.017304149;
        }
    }
    double var96;
    if (inputs[19] < -25.014664) {
        var96 = 0.011708886;
    } else {
        if (inputs[16] < 1.2631494) {
            if (inputs[19] < 16.339067) {
                var96 = -0.011803589;
            } else {
                if (inputs[16] < 0.78489846) {
                    var96 = -0.00089478766;
                } else {
                    var96 = 0.0086277425;
                }
            }
        } else {
            if (inputs[11] < -1.9138788) {
                var96 = 0.0034468677;
            } else {
                var96 = -0.019061105;
            }
        }
    }
    double var97;
    if (inputs[2] < 14.269286) {
        if (inputs[14] < 11.51551) {
            if (inputs[19] >= -34.043823) {
                if (inputs[2] < 10.026428) {
                    var97 = -0.0072036292;
                } else {
                    var97 = 0.010108003;
                }
            } else {
                if (inputs[7] < 41.465) {
                    var97 = 0.014227778;
                } else {
                    var97 = 0.0017710917;
                }
            }
        } else {
            var97 = -0.015979093;
        }
    } else {
        if (inputs[20] < -27.187044) {
            var97 = -0.011320771;
        } else {
            if (inputs[20] < -22.954485) {
                var97 = 0.017929638;
            } else {
                if (inputs[17] < 3.5499365) {
                    var97 = 0.000071881695;
                } else {
                    var97 = 0.01653147;
                }
            }
        }
    }
    double var98;
    if (inputs[16] < 0.45865735) {
        if (inputs[6] < 17574.09) {
            var98 = -0.013633001;
        } else {
            if (inputs[19] >= -25.014664) {
                if (inputs[20] < 11.238702) {
                    var98 = -0.012378861;
                } else {
                    var98 = 0.0050599906;
                }
            } else {
                if (inputs[16] < -1.2699627) {
                    var98 = 0.012886175;
                } else {
                    var98 = 0.0006390547;
                }
            }
        }
    } else {
        if (inputs[16] < 0.6946821) {
            var98 = 0.015727945;
        } else {
            if (inputs[20] < -23.177559) {
                var98 = 0.011895502;
            } else {
                if (inputs[18] < 1.0) {
                    var98 = 0.0013368911;
                } else {
                    var98 = -0.013494149;
                }
            }
        }
    }
    double var99;
    if (inputs[19] < -25.014664) {
        var99 = 0.010488608;
    } else {
        if (inputs[14] < 20.428125) {
            if (inputs[18] < 1.0) {
                if (inputs[10] < 4.651) {
                    var99 = -0.004346249;
                } else {
                    var99 = 0.0071638864;
                }
            } else {
                if (inputs[8] < 36.3225) {
                    var99 = -0.016256008;
                } else {
                    var99 = -0.0047288053;
                }
            }
        } else {
            if (inputs[15] < 27.67673) {
                if (inputs[15] < 24.841236) {
                    var99 = 0.0037070683;
                } else {
                    var99 = -0.015376442;
                }
            } else {
                if (inputs[14] < 37.346775) {
                    var99 = 0.013284507;
                } else {
                    var99 = -0.0038329542;
                }
            }
        }
    }
    double var100;
    if (inputs[4] < 17834.82) {
        if (inputs[20] < 17.607653) {
            if (inputs[7] < 54.5675) {
                var100 = -0.0025816662;
            } else {
                var100 = -0.022955285;
            }
        } else {
            var100 = 0.006220167;
        }
    } else {
        if (inputs[19] >= -25.014664) {
            if (inputs[10] < 1.088) {
                if (inputs[12] < 0.118857145) {
                    var100 = -0.0036769456;
                } else {
                    var100 = 0.007441472;
                }
            } else {
                if (inputs[16] < -0.7316509) {
                    var100 = -0.003312572;
                } else {
                    var100 = -0.01861139;
                }
            }
        } else {
            if (inputs[5] < 17959.43) {
                var100 = 0.0141943665;
            } else {
                if (inputs[4] < 18076.11) {
                    var100 = -0.0095624365;
                } else {
                    var100 = 0.005909297;
                }
            }
        }
    }
    double var101;
    if (inputs[10] < 5.124) {
        if (inputs[4] < 17496.715) {
            var101 = -0.013993301;
        } else {
            if (inputs[10] < 2.676) {
                if (inputs[21] < 2.7594576) {
                    var101 = -0.0010320804;
                } else {
                    var101 = 0.008728405;
                }
            } else {
                var101 = -0.013229566;
            }
        }
    } else {
        if (inputs[3] < 17970.256) {
            if (inputs[12] < 2.318609) {
                var101 = 0.019133909;
            } else {
                var101 = 0.010614572;
            }
        } else {
            if (inputs[8] < 21.25) {
                var101 = -0.011160065;
            } else {
                if (inputs[2] < 17.687857) {
                    var101 = 0.0026642925;
                } else {
                    var101 = 0.015287952;
                }
            }
        }
    }
    double var102;
    if (inputs[2] < 18.608572) {
        if (inputs[9] < 0.84) {
            var102 = 0.013156941;
        } else {
            if (inputs[14] < 11.459211) {
                if (inputs[13] < 8.1988325) {
                    var102 = -0.00036931457;
                } else {
                    var102 = 0.016511045;
                }
            } else {
                if (inputs[2] < 14.205) {
                    var102 = -0.017609155;
                } else {
                    var102 = -0.0044973087;
                }
            }
        }
    } else {
        if (inputs[2] < 27.15) {
            if (inputs[7] < 41.88) {
                var102 = 0.017071674;
            } else {
                if (inputs[7] < 97.7175) {
                    var102 = -0.00054345635;
                } else {
                    var102 = 0.011661023;
                }
            }
        } else {
            if (inputs[2] < 31.704287) {
                var102 = -0.011165999;
            } else {
                if (inputs[13] < 21.78676) {
                    var102 = 0.011302969;
                } else {
                    var102 = -0.0020623782;
                }
            }
        }
    }
    double var103;
    if (inputs[9] < 0.63) {
        var103 = 0.010940266;
    } else {
        if (inputs[18] < 1.0) {
            if (inputs[2] < 22.550714) {
                if (inputs[14] < 23.642353) {
                    var103 = 0.0010629429;
                } else {
                    var103 = -0.014117795;
                }
            } else {
                if (inputs[2] < 28.627142) {
                    var103 = 0.014537844;
                } else {
                    var103 = -0.0038317502;
                }
            }
        } else {
            if (inputs[14] < 22.059683) {
                if (inputs[10] < 2.676) {
                    var103 = -0.006076343;
                } else {
                    var103 = -0.02029115;
                }
            } else {
                if (inputs[14] < 29.991703) {
                    var103 = 0.011748055;
                } else {
                    var103 = -0.0076698693;
                }
            }
        }
    }
    double var104;
    if (inputs[19] < -25.014664) {
        var104 = 0.018414533;
    } else {
        if (inputs[14] < 22.059683) {
            if (inputs[7] < 20.74) {
                if (inputs[10] < 1.937) {
                    var104 = -0.0043194927;
                } else {
                    var104 = 0.0124913575;
                }
            } else {
                if (inputs[8] < 6.3125) {
                    var104 = -0.01900392;
                } else {
                    var104 = -0.0032370142;
                }
            }
        } else {
            if (inputs[14] < 28.204103) {
                if (inputs[3] < 17884.77) {
                    var104 = -0.0010320193;
                } else {
                    var104 = 0.018526496;
                }
            } else {
                if (inputs[10] < -14.6) {
                    var104 = -0.01427907;
                } else {
                    var104 = 0.0026293665;
                }
            }
        }
    }
    double var105;
    if (inputs[2] < 9.67) {
        if (inputs[2] < 7.2564287) {
            if (inputs[17] < 2.8439124) {
                if (inputs[21] < 1.4691558) {
                    var105 = 0.006759632;
                } else {
                    var105 = -0.01737075;
                }
            } else {
                var105 = 0.011878778;
            }
        } else {
            var105 = -0.013734596;
        }
    } else {
        if (inputs[15] < 10.543079) {
            var105 = 0.013889897;
        } else {
            if (inputs[2] < 18.608572) {
                if (inputs[15] < 20.86391) {
                    var105 = 0.0030793357;
                } else {
                    var105 = -0.008194635;
                }
            } else {
                if (inputs[20] < 14.976483) {
                    var105 = -0.00038791637;
                } else {
                    var105 = 0.009491545;
                }
            }
        }
    }
    double var106;
    if (inputs[19] < -25.014664) {
        var106 = 0.012781977;
    } else {
        if (inputs[19] < 48.6697) {
            if (inputs[1] < 61.003597) {
                if (inputs[10] < -4.203) {
                    var106 = -0.009768372;
                } else {
                    var106 = -0.019358627;
                }
            } else {
                var106 = 0.0007643762;
            }
        } else {
            if (inputs[19] < 116.51537) {
                var106 = 0.011632515;
            } else {
                if (inputs[21] < 1.7025212) {
                    var106 = -0.012268911;
                } else {
                    var106 = 0.001100624;
                }
            }
        }
    }
    double var107;
    if (inputs[20] < 11.512124) {
        if (inputs[20] < 7.6966357) {
            if (inputs[5] < 19778.305) {
                if (inputs[13] < 5.316362) {
                    var107 = 0.015414961;
                } else {
                    var107 = -0.000945038;
                }
            } else {
                if (inputs[19] < 288.90808) {
                    var107 = -0.0023595507;
                } else {
                    var107 = -0.017774666;
                }
            }
        } else {
            var107 = -0.0133803375;
        }
    } else {
        if (inputs[22] < 4.0) {
            var107 = 0.013229548;
        } else {
            if (inputs[2] < 20.225714) {
                if (inputs[2] < 15.951428) {
                    var107 = -0.0015713499;
                } else {
                    var107 = -0.018697713;
                }
            } else {
                if (inputs[2] < 24.596428) {
                    var107 = 0.015631417;
                } else {
                    var107 = 0.001645252;
                }
            }
        }
    }
    double var108;
    if (inputs[16] < 0.47722974) {
        if (inputs[20] >= 9.639783) {
            if (inputs[13] < 8.557412) {
                if (inputs[3] < 19222.35) {
                    var108 = -0.013309902;
                } else {
                    var108 = 0.00584961;
                }
            } else {
                if (inputs[16] < -1.4065999) {
                    var108 = 0.017360838;
                } else {
                    var108 = 0.0019811834;
                }
            }
        } else {
            if (inputs[21] < 3.2775676) {
                if (inputs[7] < 27.38) {
                    var108 = -0.001478537;
                } else {
                    var108 = -0.013924899;
                }
            } else {
                var108 = 0.0040650624;
            }
        }
    } else {
        if (inputs[14] < 7.9626536) {
            var108 = -0.010174823;
        } else {
            if (inputs[1] < 66.89984) {
                if (inputs[7] < 126.965) {
                    var108 = 0.012420913;
                } else {
                    var108 = -0.0057937535;
                }
            } else {
                var108 = -0.008728895;
            }
        }
    }
    double var109;
    if (inputs[19] < -25.014664) {
        var109 = 0.01173256;
    } else {
        if (inputs[12] < 0.8105113) {
            if (inputs[20] < 1.2054093) {
                if (inputs[20] < -27.187044) {
                    var109 = -0.010981344;
                } else {
                    var109 = 0.0013100078;
                }
            } else {
                if (inputs[20] >= 11.512124) {
                    var109 = 0.000087617154;
                } else {
                    var109 = -0.017517498;
                }
            }
        } else {
            if (inputs[20] >= 5.86199) {
                if (inputs[12] < 1.2430676) {
                    var109 = 0.015301478;
                } else {
                    var109 = -0.0017911006;
                }
            } else {
                var109 = 0.0144991875;
            }
        }
    }
    double var110;
    if (inputs[19] < -25.014664) {
        var110 = 0.0136131095;
    } else {
        if (inputs[12] < 0.8105113) {
            if (inputs[11] < 1.5727273) {
                if (inputs[19] >= 118.89217) {
                    var110 = -0.013700333;
                } else {
                    var110 = -0.0002109362;
                }
            } else {
                var110 = -0.017626032;
            }
        } else {
            if (inputs[8] < 57.755) {
                if (inputs[15] < 10.937817) {
                    var110 = 0.011366442;
                } else {
                    var110 = -0.0024025377;
                }
            } else {
                var110 = 0.011119946;
            }
        }
    }
    double var111;
    if (inputs[21] < 1.0292515) {
        var111 = 0.009217148;
    } else {
        if (inputs[21] < 1.366332) {
            var111 = -0.012681645;
        } else {
            if (inputs[2] < 18.608572) {
                if (inputs[14] < 11.459211) {
                    var111 = 0.0021901997;
                } else {
                    var111 = -0.0078093857;
                }
            } else {
                if (inputs[20] < 12.193009) {
                    var111 = 0.00028159062;
                } else {
                    var111 = 0.011109356;
                }
            }
        }
    }
    double var112;
    if (inputs[7] < 89.905) {
        if (inputs[12] < 3.7038045) {
            if (inputs[21] < 2.7594576) {
                if (inputs[7] < 35.25) {
                    var112 = 0.0025526069;
                } else {
                    var112 = -0.008651701;
                }
            } else {
                if (inputs[4] < 19571.984) {
                    var112 = -0.00034210552;
                } else {
                    var112 = 0.015005233;
                }
            }
        } else {
            var112 = -0.014998429;
        }
    } else {
        if (inputs[20] >= -27.187044) {
            if (inputs[8] < 45.67) {
                var112 = 0.017399378;
            } else {
                if (inputs[9] < 1.08) {
                    var112 = -0.0023757876;
                } else {
                    var112 = 0.007589283;
                }
            }
        } else {
            var112 = -0.009872143;
        }
    }
    double var113;
    if (inputs[2] < 17.687857) {
        if (inputs[16] < 1.2631494) {
            if (inputs[8] < 2.2525) {
                var113 = 0.008769061;
            } else {
                if (inputs[10] < 6.986) {
                    var113 = -0.0013259777;
                } else {
                    var113 = -0.014121721;
                }
            }
        } else {
            var113 = -0.014778223;
        }
    } else {
        if (inputs[2] < 28.181429) {
            if (inputs[16] < 0.45214638) {
                if (inputs[6] < 17830.09) {
                    var113 = -0.009095193;
                } else {
                    var113 = 0.0071962094;
                }
            } else {
                if (inputs[6] < 18005.39) {
                    var113 = 0.020833086;
                } else {
                    var113 = 0.010534154;
                }
            }
        } else {
            if (inputs[16] < -0.24856366) {
                var113 = 0.008329999;
            } else {
                var113 = -0.010450417;
            }
        }
    }
    double var114;
    if (inputs[10] < 15.095) {
        if (inputs[20] >= -22.954485) {
            if (inputs[18] < 1.0) {
                if (inputs[19] >= 116.51537) {
                    var114 = -0.008309713;
                } else {
                    var114 = 0.0026722823;
                }
            } else {
                if (inputs[8] < 36.3225) {
                    var114 = -0.014919369;
                } else {
                    var114 = -0.00069086946;
                }
            }
        } else {
            if (inputs[20] >= -27.187044) {
                var114 = 0.016353829;
            } else {
                if (inputs[8] < 31.81) {
                    var114 = 0.006126529;
                } else {
                    var114 = -0.012404017;
                }
            }
        }
    } else {
        var114 = 0.011979797;
    }
    double var115;
    if (inputs[19] < -25.014664) {
        var115 = 0.011493281;
    } else {
        if (inputs[19] < 48.6697) {
            if (inputs[4] < 19410.475) {
                if (inputs[7] < 44.4225) {
                    var115 = 0.0027084397;
                } else {
                    var115 = -0.01202946;
                }
            } else {
                var115 = -0.017035693;
            }
        } else {
            if (inputs[16] < 1.2631494) {
                if (inputs[16] < 0.78489846) {
                    var115 = -0.00018589731;
                } else {
                    var115 = 0.016855292;
                }
            } else {
                var115 = -0.010145986;
            }
        }
    }
    double var116;
    if (inputs[14] < 20.733627) {
        if (inputs[15] < 24.335045) {
            if (inputs[21] < 2.7443748) {
                if (inputs[1] < 58.232033) {
                    var116 = 0.0027814293;
                } else {
                    var116 = -0.009520162;
                }
            } else {
                if (inputs[6] < 19771.96) {
                    var116 = 0.0011448327;
                } else {
                    var116 = 0.016845437;
                }
            }
        } else {
            if (inputs[16] < -0.27705225) {
                var116 = -0.0230768;
            } else {
                var116 = -0.0037453957;
            }
        }
    } else {
        if (inputs[13] < 36.21718) {
            if (inputs[11] < 9.103394) {
                if (inputs[15] < 27.67673) {
                    var116 = 0.0022686247;
                } else {
                    var116 = 0.014935549;
                }
            } else {
                var116 = -0.007234876;
            }
        } else {
            var116 = -0.008470509;
        }
    }
    double var117;
    if (inputs[9] < 1.19) {
        if (inputs[4] < 17796.4) {
            if (inputs[21] < 2.9378428) {
                var117 = -0.019214533;
            } else {
                var117 = -0.008043584;
            }
        } else {
            if (inputs[4] < 18006.734) {
                var117 = 0.010444366;
            } else {
                if (inputs[15] < 27.67673) {
                    var117 = -0.013329736;
                } else {
                    var117 = 0.0071581965;
                }
            }
        }
    } else {
        if (inputs[9] < 1.29) {
            var117 = 0.018478813;
        } else {
            if (inputs[15] < 31.224089) {
                if (inputs[22] < 16.0) {
                    var117 = -0.0014930124;
                } else {
                    var117 = 0.008835453;
                }
            } else {
                var117 = -0.009303859;
            }
        }
    }
    double var118;
    if (inputs[19] < -25.014664) {
        var118 = 0.012125687;
    } else {
        if (inputs[7] < 20.74) {
            if (inputs[17] < 2.0759547) {
                if (inputs[15] < 5.356141) {
                    var118 = -0.010542769;
                } else {
                    var118 = 0.008430118;
                }
            } else {
                var118 = 0.016855398;
            }
        } else {
            if (inputs[15] < 7.7912016) {
                var118 = -0.014500885;
            } else {
                if (inputs[15] < 10.543079) {
                    var118 = 0.01016553;
                } else {
                    var118 = -0.0021441458;
                }
            }
        }
    }
    double var119;
    if (inputs[10] < 8.437) {
        if (inputs[14] < 33.943516) {
            if (inputs[5] < 19668.27) {
                if (inputs[8] < 8.0) {
                    var119 = -0.0049502156;
                } else {
                    var119 = 0.004180242;
                }
            } else {
                if (inputs[3] < 19963.12) {
                    var119 = -0.013485548;
                } else {
                    var119 = 0.004356383;
                }
            }
        } else {
            var119 = -0.012666366;
        }
    } else {
        if (inputs[15] < 21.933056) {
            var119 = 0.015213873;
        } else {
            if (inputs[8] < 29.5) {
                var119 = -0.010113453;
            } else {
                var119 = 0.013083087;
            }
        }
    }
    double var120;
    if (inputs[19] < -25.014664) {
        var120 = 0.011081211;
    } else {
        if (inputs[15] < 27.751934) {
            if (inputs[15] < 25.346832) {
                if (inputs[10] < 4.651) {
                    var120 = -0.0030628485;
                } else {
                    var120 = 0.004649222;
                }
            } else {
                var120 = -0.0146959135;
            }
        } else {
            if (inputs[20] < 23.166368) {
                if (inputs[11] < -6.4671516) {
                    var120 = 0.0110923685;
                } else {
                    var120 = -0.0062096464;
                }
            } else {
                var120 = 0.015944906;
            }
        }
    }
    double var121;
    if (inputs[2] < 18.608572) {
        if (inputs[15] < 20.86391) {
            if (inputs[2] < 9.67) {
                if (inputs[2] < 7.2564287) {
                    var121 = 0.0028586297;
                } else {
                    var121 = -0.019864058;
                }
            } else {
                if (inputs[22] < 12.0) {
                    var121 = 0.00221951;
                } else {
                    var121 = 0.014920092;
                }
            }
        } else {
            if (inputs[15] < 27.67673) {
                if (inputs[16] < 0.34620702) {
                    var121 = -0.023591138;
                } else {
                    var121 = -0.004824638;
                }
            } else {
                var121 = 0.0038328515;
            }
        }
    } else {
        if (inputs[12] < 1.1834962) {
            if (inputs[14] < 25.206236) {
                if (inputs[12] < -1.0554286) {
                    var121 = -0.014226494;
                } else {
                    var121 = 0.002855017;
                }
            } else {
                if (inputs[12] < -3.1967595) {
                    var121 = 0.012869775;
                } else {
                    var121 = -0.0006970623;
                }
            }
        } else {
            if (inputs[12] < 2.438842) {
                var121 = 0.018276118;
            } else {
                if (inputs[2] < 25.992144) {
                    var121 = 0.00006804696;
                } else {
                    var121 = 0.0139694465;
                }
            }
        }
    }
    double var122;
    if (inputs[10] < 4.651) {
        if (inputs[21] < 1.0104973) {
            var122 = 0.0096365055;
        } else {
            if (inputs[21] < 1.3688738) {
                var122 = -0.015527929;
            } else {
                if (inputs[3] < 18065.08) {
                    var122 = -0.006601882;
                } else {
                    var122 = 0.0018198658;
                }
            }
        }
    } else {
        if (inputs[8] < 21.635) {
            if (inputs[15] < 22.42742) {
                if (inputs[8] < 9.735) {
                    var122 = 0.016751818;
                } else {
                    var122 = -0.004166033;
                }
            } else {
                var122 = -0.018847717;
            }
        } else {
            if (inputs[7] < 107.085) {
                if (inputs[11] < 3.8210304) {
                    var122 = 0.017131029;
                } else {
                    var122 = 0.00091842934;
                }
            } else {
                var122 = 0.018079588;
            }
        }
    }
    double var123;
    if (inputs[19] >= 116.51537) {
        var123 = -0.0106577305;
    } else {
        if (inputs[20] < -27.187044) {
            var123 = -0.0076549365;
        } else {
            if (inputs[20] < -24.019466) {
                var123 = 0.0175296;
            } else {
                if (inputs[12] < -1.9500151) {
                    var123 = -0.008113297;
                } else {
                    var123 = 0.002522365;
                }
            }
        }
    }
    double var124;
    if (inputs[17] < 3.4179919) {
        if (inputs[20] < 27.953316) {
            if (inputs[15] < 5.356141) {
                var124 = -0.0084324265;
            } else {
                if (inputs[18] < 1.0) {
                    var124 = 0.0033752986;
                } else {
                    var124 = -0.0045382627;
                }
            }
        } else {
            var124 = -0.012428711;
        }
    } else {
        if (inputs[8] < 43.685) {
            var124 = -0.0028185116;
        } else {
            var124 = 0.018034147;
        }
    }
    double var125;
    if (inputs[14] < 22.059683) {
        if (inputs[20] < -23.177559) {
            var125 = 0.0072990013;
        } else {
            if (inputs[1] < 35.583416) {
                var125 = -0.015246891;
            } else {
                if (inputs[20] < 27.652756) {
                    var125 = -0.0021939643;
                } else {
                    var125 = 0.0097238;
                }
            }
        }
    } else {
        if (inputs[15] < 27.67673) {
            if (inputs[15] < 24.841236) {
                if (inputs[16] < 0.06821353) {
                    var125 = -0.0020905056;
                } else {
                    var125 = 0.016308915;
                }
            } else {
                var125 = -0.01553637;
            }
        } else {
            if (inputs[14] < 37.346775) {
                if (inputs[21] < 2.4618518) {
                    var125 = 0.012775673;
                } else {
                    var125 = 0.019358927;
                }
            } else {
                var125 = -0.0054560034;
            }
        }
    }
    double var126;
    if (inputs[2] < 18.883572) {
        if (inputs[15] < 20.86391) {
            if (inputs[17] < 2.8439124) {
                if (inputs[5] < 19565.66) {
                    var126 = 0.0038003623;
                } else {
                    var126 = -0.009681545;
                }
            } else {
                if (inputs[4] < 19681.38) {
                    var126 = 0.0013924972;
                } else {
                    var126 = 0.017965037;
                }
            }
        } else {
            if (inputs[4] < 18297.186) {
                if (inputs[2] < 15.063571) {
                    var126 = -0.009997413;
                } else {
                    var126 = -0.019949783;
                }
            } else {
                var126 = 0.0005503203;
            }
        }
    } else {
        if (inputs[18] < 1.0) {
            if (inputs[4] < 18076.11) {
                if (inputs[16] < 0.21688162) {
                    var126 = -0.008155598;
                } else {
                    var126 = 0.01374397;
                }
            } else {
                var126 = 0.017024867;
            }
        } else {
            if (inputs[15] < 30.983479) {
                var126 = -0.012343821;
            } else {
                if (inputs[16] < 0.6946821) {
                    var126 = 0.009485432;
                } else {
                    var126 = -0.0090439385;
                }
            }
        }
    }
    double var127;
    if (inputs[19] >= -25.014664) {
        if (inputs[15] < 10.543079) {
            if (inputs[2] < 9.866428) {
                if (inputs[2] < 7.2564287) {
                    var127 = 0.0013825358;
                } else {
                    var127 = -0.017359812;
                }
            } else {
                var127 = 0.018278638;
            }
        } else {
            if (inputs[15] < 20.186201) {
                var127 = -0.01663224;
            } else {
                if (inputs[12] < 0.7269549) {
                    var127 = -0.0066208574;
                } else {
                    var127 = 0.005229748;
                }
            }
        }
    } else {
        if (inputs[15] < 22.42742) {
            if (inputs[3] < 17689.676) {
                var127 = -0.0028685555;
            } else {
                if (inputs[8] < 27.05) {
                    var127 = 0.0052265623;
                } else {
                    var127 = 0.021600429;
                }
            }
        } else {
            if (inputs[8] < 58.8575) {
                if (inputs[17] < 2.4735138) {
                    var127 = 0.000122037665;
                } else {
                    var127 = -0.012824655;
                }
            } else {
                var127 = 0.0071105603;
            }
        }
    }
    double var128;
    if (inputs[2] < 9.67) {
        if (inputs[2] < 8.177857) {
            if (inputs[2] < 6.267857) {
                var128 = -0.0072623673;
            } else {
                var128 = 0.0051693213;
            }
        } else {
            var128 = -0.022543492;
        }
    } else {
        if (inputs[15] < 10.937817) {
            var128 = 0.015196869;
        } else {
            if (inputs[13] < 16.299868) {
                if (inputs[16] < -1.2699627) {
                    var128 = 0.009331013;
                } else {
                    var128 = -0.006217914;
                }
            } else {
                if (inputs[4] < 17518.006) {
                    var128 = -0.009002693;
                } else {
                    var128 = 0.0057029324;
                }
            }
        }
    }
    double var129;
    if (inputs[16] < 1.2631494) {
        if (inputs[16] < 0.47722974) {
            if (inputs[16] < -0.4755567) {
                if (inputs[21] < 3.2775676) {
                    var129 = 0.00009056033;
                } else {
                    var129 = 0.0089495955;
                }
            } else {
                if (inputs[12] < -1.5242406) {
                    var129 = -0.012684569;
                } else {
                    var129 = -0.00044969327;
                }
            }
        } else {
            if (inputs[21] < 2.7979956) {
                if (inputs[8] < 14.685) {
                    var129 = 0.02206377;
                } else {
                    var129 = 0.007005111;
                }
            } else {
                if (inputs[15] < 21.596983) {
                    var129 = 0.008579474;
                } else {
                    var129 = -0.012761512;
                }
            }
        }
    } else {
        if (inputs[11] < -1.9138788) {
            var129 = 0.008577094;
        } else {
            var129 = -0.01671702;
        }
    }
    double var130;
    if (inputs[1] < 79.12076) {
        if (inputs[19] < -25.014664) {
            var130 = 0.010215655;
        } else {
            if (inputs[21] < 4.296845) {
                if (inputs[15] < 8.064122) {
                    var130 = -0.006349358;
                } else {
                    var130 = 0.0016247593;
                }
            } else {
                var130 = -0.009468467;
            }
        }
    } else {
        var130 = 0.012424489;
    }
    double var131;
    if (inputs[2] < 9.866428) {
        if (inputs[7] < 36.4325) {
            if (inputs[17] < 0.73016936) {
                var131 = 0.010459737;
            } else {
                if (inputs[8] < 6.3125) {
                    var131 = -0.01757444;
                } else {
                    var131 = -0.00035678028;
                }
            }
        } else {
            var131 = -0.015925216;
        }
    } else {
        if (inputs[16] < -0.4755567) {
            if (inputs[16] < -0.9431992) {
                if (inputs[17] < 3.0755315) {
                    var131 = -0.00513724;
                } else {
                    var131 = 0.014101232;
                }
            } else {
                if (inputs[4] < 18274.074) {
                    var131 = 0.0033606745;
                } else {
                    var131 = 0.02024463;
                }
            }
        } else {
            if (inputs[16] < 0.31111237) {
                if (inputs[7] < 91.31) {
                    var131 = -0.016463049;
                } else {
                    var131 = 0.004295855;
                }
            } else {
                if (inputs[18] < 1.0) {
                    var131 = 0.0076872623;
                } else {
                    var131 = -0.005019283;
                }
            }
        }
    }
    double var132;
    if (inputs[10] < 15.095) {
        if (inputs[12] < 3.9619398) {
            if (inputs[21] < 2.7594576) {
                if (inputs[4] < 19661.52) {
                    var132 = -0.000141877;
                } else {
                    var132 = -0.013896938;
                }
            } else {
                if (inputs[4] < 19766.586) {
                    var132 = -0.00023450503;
                } else {
                    var132 = 0.01557252;
                }
            }
        } else {
            var132 = -0.008413935;
        }
    } else {
        var132 = 0.010516528;
    }
    double var133;
    if (inputs[19] >= 116.51537) {
        var133 = -0.012148255;
    } else {
        if (inputs[20] >= -24.019466) {
            if (inputs[12] < -1.9500151) {
                if (inputs[13] < 14.424168) {
                    var133 = -0.017009184;
                } else {
                    var133 = 0.0011981187;
                }
            } else {
                if (inputs[12] < -0.67643607) {
                    var133 = 0.012009915;
                } else {
                    var133 = 0.0000007559622;
                }
            }
        } else {
            if (inputs[20] >= -27.187044) {
                var133 = 0.017220149;
            } else {
                if (inputs[17] < -2.644951) {
                    var133 = -0.0068120556;
                } else {
                    var133 = 0.00888754;
                }
            }
        }
    }
    double var134;
    if (inputs[7] < 89.905) {
        if (inputs[11] < 6.0091515) {
            if (inputs[3] < 17490.88) {
                var134 = -0.009763042;
            } else {
                if (inputs[3] < 17998.574) {
                    var134 = 0.010980332;
                } else {
                    var134 = -0.000027036898;
                }
            }
        } else {
            var134 = -0.010581035;
        }
    } else {
        if (inputs[16] < 0.10568233) {
            if (inputs[21] < 3.1365495) {
                var134 = 0.0059650466;
            } else {
                var134 = 0.01794096;
            }
        } else {
            if (inputs[15] < 25.213606) {
                var134 = 0.010141857;
            } else {
                var134 = -0.00980876;
            }
        }
    }
    double var135;
    if (inputs[2] < 17.687857) {
        if (inputs[13] < 5.1977787) {
            if (inputs[19] >= 116.51537) {
                var135 = -0.009103078;
            } else {
                if (inputs[13] < 3.7538855) {
                    var135 = 0.0002812756;
                } else {
                    var135 = 0.020485424;
                }
            }
        } else {
            if (inputs[13] < 7.068011) {
                var135 = -0.018588439;
            } else {
                if (inputs[15] < 11.955792) {
                    var135 = 0.0058369073;
                } else {
                    var135 = -0.005679882;
                }
            }
        }
    } else {
        if (inputs[6] < 19021.846) {
            if (inputs[14] < 20.733627) {
                if (inputs[5] < 17947.7) {
                    var135 = 0.00050484954;
                } else {
                    var135 = -0.013316744;
                }
            } else {
                if (inputs[1] < 26.227798) {
                    var135 = -0.0066641243;
                } else {
                    var135 = 0.0074969456;
                }
            }
        } else {
            var135 = 0.012687523;
        }
    }
    double var136;
    if (inputs[2] < 37.587143) {
        if (inputs[9] < 0.7) {
            var136 = -0.011607738;
        } else {
            if (inputs[12] < 4.1602106) {
                if (inputs[22] < 16.0) {
                    var136 = -0.001533784;
                } else {
                    var136 = 0.004846243;
                }
            } else {
                var136 = -0.011030488;
            }
        }
    } else {
        var136 = 0.011115649;
    }
    double var137;
    if (inputs[21] < 1.0292515) {
        var137 = 0.009314453;
    } else {
        if (inputs[22] < 19.0) {
            if (inputs[21] < 1.3278477) {
                var137 = -0.013704649;
            } else {
                if (inputs[15] < 24.841236) {
                    var137 = 0.0009815007;
                } else {
                    var137 = -0.0053867265;
                }
            }
        } else {
            if (inputs[9] < 0.81) {
                var137 = 0.015117354;
            } else {
                if (inputs[15] < 24.474863) {
                    var137 = 0.008425607;
                } else {
                    var137 = -0.005902694;
                }
            }
        }
    }
    double var138;
    if (inputs[19] >= 116.51537) {
        var138 = -0.008107635;
    } else {
        if (inputs[16] < -1.5741276) {
            if (inputs[10] < 2.801) {
                var138 = 0.01851866;
            } else {
                var138 = 0.0038572429;
            }
        } else {
            if (inputs[2] < 19.159286) {
                if (inputs[8] < 2.065) {
                    var138 = 0.011851024;
                } else {
                    var138 = -0.0052089635;
                }
            } else {
                if (inputs[10] < 5.038) {
                    var138 = -0.0015263483;
                } else {
                    var138 = 0.009743664;
                }
            }
        }
    }
    double var139;
    if (inputs[9] < 1.17) {
        if (inputs[14] < 14.620058) {
            var139 = -0.018515872;
        } else {
            if (inputs[4] < 17834.82) {
                var139 = -0.010779621;
            } else {
                if (inputs[3] < 18002.88) {
                    var139 = 0.016697474;
                } else {
                    var139 = -0.0018856509;
                }
            }
        }
    } else {
        if (inputs[9] < 1.31) {
            var139 = 0.016177358;
        } else {
            if (inputs[15] < 24.474863) {
                if (inputs[22] < 16.0) {
                    var139 = -0.00084410823;
                } else {
                    var139 = 0.014537831;
                }
            } else {
                if (inputs[8] < 37.9175) {
                    var139 = -0.012750783;
                } else {
                    var139 = -0.00091923965;
                }
            }
        }
    }
    double var140;
    if (inputs[19] >= 116.51537) {
        var140 = -0.011324665;
    } else {
        if (inputs[4] < 19776.715) {
            if (inputs[21] < 1.0292515) {
                var140 = 0.012370599;
            } else {
                if (inputs[2] < 9.67) {
                    var140 = -0.010957286;
                } else {
                    var140 = 0.0013437523;
                }
            }
        } else {
            var140 = 0.013241674;
        }
    }
    double var141;
    if (inputs[22] < 19.0) {
        if (inputs[3] < 18071.814) {
            if (inputs[5] < 17947.7) {
                if (inputs[5] < 17715.78) {
                    var141 = -0.0066964296;
                } else {
                    var141 = 0.0074961134;
                }
            } else {
                var141 = -0.014668026;
            }
        } else {
            if (inputs[13] < 17.232878) {
                if (inputs[13] < 12.834479) {
                    var141 = 0.0010996184;
                } else {
                    var141 = -0.014704041;
                }
            } else {
                if (inputs[13] < 26.157684) {
                    var141 = 0.016446391;
                } else {
                    var141 = -0.0031293598;
                }
            }
        }
    } else {
        if (inputs[3] < 17970.256) {
            var141 = 0.012148792;
        } else {
            var141 = 0.0004798447;
        }
    }
    double var142;
    if (inputs[3] < 17782.664) {
        if (inputs[1] < 33.256645) {
            var142 = -0.015785517;
        } else {
            if (inputs[5] < 17508.79) {
                if (inputs[3] < 17117.824) {
                    var142 = 0.0007325239;
                } else {
                    var142 = 0.010988867;
                }
            } else {
                var142 = -0.0076341825;
            }
        }
    } else {
        if (inputs[5] < 17954.193) {
            var142 = 0.01319692;
        } else {
            if (inputs[4] < 18076.11) {
                var142 = -0.007982207;
            } else {
                if (inputs[1] < 57.86574) {
                    var142 = 0.004436439;
                } else {
                    var142 = -0.0021009732;
                }
            }
        }
    }
    double var143;
    if (inputs[21] < 2.7505727) {
        if (inputs[3] < 19736.24) {
            if (inputs[13] < 5.316362) {
                var143 = 0.01237421;
            } else {
                if (inputs[20] < 12.193009) {
                    var143 = -0.0047675925;
                } else {
                    var143 = 0.0064045982;
                }
            }
        } else {
            var143 = -0.015456601;
        }
    } else {
        if (inputs[3] < 19864.836) {
            if (inputs[7] < 39.5975) {
                var143 = -0.00946787;
            } else {
                if (inputs[15] < 21.452278) {
                    var143 = 0.009287645;
                } else {
                    var143 = 0.000106341766;
                }
            }
        } else {
            var143 = 0.017224047;
        }
    }
    double var144;
    if (inputs[17] < 4.185952) {
        if (inputs[22] < 19.0) {
            if (inputs[18] < 1.0) {
                if (inputs[13] < 8.264303) {
                    var144 = -0.0046479264;
                } else {
                    var144 = 0.0040003816;
                }
            } else {
                if (inputs[9] < 1.12) {
                    var144 = -0.01603589;
                } else {
                    var144 = -0.0020552007;
                }
            }
        } else {
            if (inputs[3] < 17564.96) {
                var144 = 0.013564689;
            } else {
                if (inputs[11] < -4.396121) {
                    var144 = 0.007120305;
                } else {
                    var144 = -0.0056254673;
                }
            }
        }
    } else {
        var144 = 0.007863004;
    }
    double var145;
    if (inputs[2] < 18.608572) {
        if (inputs[15] < 20.86391) {
            if (inputs[21] < 2.7443748) {
                if (inputs[1] < 57.86574) {
                    var145 = 0.004323419;
                } else {
                    var145 = -0.013210052;
                }
            } else {
                if (inputs[6] < 19771.96) {
                    var145 = 0.0024651103;
                } else {
                    var145 = 0.019886136;
                }
            }
        } else {
            if (inputs[15] < 28.729736) {
                if (inputs[2] < 15.884286) {
                    var145 = -0.005759557;
                } else {
                    var145 = -0.020271812;
                }
            } else {
                var145 = 0.0031617528;
            }
        }
    } else {
        if (inputs[21] < 3.277861) {
            if (inputs[21] < 2.8984554) {
                if (inputs[2] < 27.15) {
                    var145 = 0.009827799;
                } else {
                    var145 = -0.0015235303;
                }
            } else {
                var145 = -0.011707191;
            }
        } else {
            var145 = 0.015283884;
        }
    }
    double var146;
    if (inputs[2] < 9.67) {
        if (inputs[2] < 7.232143) {
            if (inputs[7] < 14.53) {
                var146 = -0.0061403336;
            } else {
                var146 = 0.005290402;
            }
        } else {
            var146 = -0.018869163;
        }
    } else {
        if (inputs[20] >= -33.020267) {
            if (inputs[4] < 17339.314) {
                var146 = -0.008860512;
            } else {
                if (inputs[20] < -22.954485) {
                    var146 = 0.009495241;
                } else {
                    var146 = 0.0012077956;
                }
            }
        } else {
            var146 = -0.008532152;
        }
    }
    double var147;
    if (inputs[19] < -25.014664) {
        var147 = 0.012659511;
    } else {
        if (inputs[20] < -27.206348) {
            var147 = -0.0088361455;
        } else {
            if (inputs[20] < -24.019466) {
                var147 = 0.018440781;
            } else {
                if (inputs[7] < 89.905) {
                    var147 = -0.0015457828;
                } else {
                    var147 = 0.0052696886;
                }
            }
        }
    }
    double var148;
    if (inputs[19] >= -25.014664) {
        if (inputs[13] < 5.316362) {
            if (inputs[19] < 116.51537) {
                var148 = 0.011227572;
            } else {
                var148 = -0.007418549;
            }
        } else {
            if (inputs[14] < 17.566181) {
                if (inputs[14] < 7.9626536) {
                    var148 = -0.021982674;
                } else {
                    var148 = -0.0100872535;
                }
            } else {
                var148 = 0.003014444;
            }
        }
    } else {
        if (inputs[3] < 17841.83) {
            if (inputs[10] < 1.925) {
                if (inputs[16] < 0.28437614) {
                    var148 = -0.018953772;
                } else {
                    var148 = -0.003888888;
                }
            } else {
                if (inputs[14] < 18.330345) {
                    var148 = 0.012299512;
                } else {
                    var148 = -0.000509597;
                }
            }
        } else {
            if (inputs[20] < 7.256839) {
                if (inputs[20] < -17.490326) {
                    var148 = 0.0042570294;
                } else {
                    var148 = 0.014386625;
                }
            } else {
                if (inputs[15] < 20.687708) {
                    var148 = 0.010742018;
                } else {
                    var148 = -0.009207536;
                }
            }
        }
    }
    double var149;
    if (inputs[16] < 0.45865735) {
        if (inputs[11] < 0.19072728) {
            if (inputs[22] < 15.0) {
                var149 = -0.022538234;
            } else {
                if (inputs[11] < -7.7435756) {
                    var149 = 0.00970151;
                } else {
                    var149 = -0.008838;
                }
            }
        } else {
            if (inputs[13] < 5.1977787) {
                if (inputs[19] >= 116.51537) {
                    var149 = -0.007897691;
                } else {
                    var149 = 0.010665164;
                }
            } else {
                if (inputs[2] < 20.225714) {
                    var149 = -0.0056366166;
                } else {
                    var149 = 0.005655004;
                }
            }
        }
    } else {
        if (inputs[16] < 0.6946821) {
            var149 = 0.014201915;
        } else {
            if (inputs[22] < 17.0) {
                if (inputs[6] < 18168.89) {
                    var149 = -0.019286638;
                } else {
                    var149 = 0.0007535402;
                }
            } else {
                if (inputs[9] < 1.03) {
                    var149 = 0.0016357201;
                } else {
                    var149 = 0.013812637;
                }
            }
        }
    }
    double var150;
    if (inputs[15] < 10.543079) {
        if (inputs[15] < 8.064122) {
            if (inputs[21] < 2.860778) {
                if (inputs[6] < 19718.275) {
                    var150 = 0.0040232264;
                } else {
                    var150 = -0.015123288;
                }
            } else {
                var150 = 0.008649873;
            }
        } else {
            if (inputs[1] < 56.456814) {
                var150 = 0.019189948;
            } else {
                var150 = 0.0005747233;
            }
        }
    } else {
        if (inputs[10] < 4.437) {
            if (inputs[10] < 1.025) {
                if (inputs[12] < 1.1791503) {
                    var150 = -0.0032852436;
                } else {
                    var150 = 0.01284326;
                }
            } else {
                var150 = -0.01992133;
            }
        } else {
            if (inputs[15] < 22.42742) {
                if (inputs[12] < 2.0268872) {
                    var150 = 0.0030743103;
                } else {
                    var150 = 0.017754277;
                }
            } else {
                if (inputs[8] < 27.625) {
                    var150 = -0.017039;
                } else {
                    var150 = 0.006942948;
                }
            }
        }
    }
    double var151;
    if (inputs[15] < 5.356141) {
        var151 = -0.0075929095;
    } else {
        if (inputs[3] < 19864.836) {
            if (inputs[8] < 17.39) {
                if (inputs[14] < 20.966928) {
                    var151 = -0.0004706579;
                } else {
                    var151 = 0.011325057;
                }
            } else {
                if (inputs[8] < 22.05) {
                    var151 = -0.012944535;
                } else {
                    var151 = 0.000046746514;
                }
            }
        } else {
            var151 = 0.013080644;
        }
    }
    double var152;
    if (inputs[1] < 79.82045) {
        if (inputs[15] < 24.841236) {
            if (inputs[8] < 54.15) {
                if (inputs[8] < 37.9175) {
                    var152 = 0.0014394268;
                } else {
                    var152 = -0.012685407;
                }
            } else {
                var152 = 0.011929438;
            }
        } else {
            if (inputs[14] < 20.966928) {
                var152 = -0.014767907;
            } else {
                if (inputs[15] < 27.67673) {
                    var152 = -0.015230216;
                } else {
                    var152 = 0.005559156;
                }
            }
        }
    } else {
        var152 = 0.0115633765;
    }
    double var153;
    if (inputs[14] < 19.303827) {
        if (inputs[20] >= 11.512124) {
            if (inputs[12] < 1.7146692) {
                var153 = 0.011443264;
            } else {
                if (inputs[7] < 59.785) {
                    var153 = 0.0038285824;
                } else {
                    var153 = -0.012337397;
                }
            }
        } else {
            if (inputs[20] >= 7.6966357) {
                var153 = -0.014647832;
            } else {
                if (inputs[8] < 23.0) {
                    var153 = 0.0006318555;
                } else {
                    var153 = -0.010335248;
                }
            }
        }
    } else {
        if (inputs[7] < 98.065) {
            if (inputs[7] < 74.555) {
                if (inputs[20] >= -6.607779) {
                    var153 = -0.0029383742;
                } else {
                    var153 = 0.00979171;
                }
            } else {
                var153 = -0.012803156;
            }
        } else {
            if (inputs[14] < 29.705542) {
                if (inputs[14] < 22.756666) {
                    var153 = 0.010561745;
                } else {
                    var153 = 0.01795834;
                }
            } else {
                var153 = -0.001830933;
            }
        }
    }
    double var154;
    if (inputs[19] < -25.014664) {
        var154 = 0.012127057;
    } else {
        if (inputs[16] < -2.1370826) {
            var154 = -0.011643908;
        } else {
            if (inputs[16] < -0.67364275) {
                if (inputs[16] < -0.9855694) {
                    var154 = 0.00043746745;
                } else {
                    var154 = 0.014550281;
                }
            } else {
                if (inputs[1] < 70.821815) {
                    var154 = -0.00039769834;
                } else {
                    var154 = -0.013309153;
                }
            }
        }
    }
    double var155;
    if (inputs[10] < 4.651) {
        if (inputs[10] < 2.801) {
            if (inputs[6] < 19653.145) {
                if (inputs[3] < 17744.16) {
                    var155 = -0.007783815;
                } else {
                    var155 = 0.005524098;
                }
            } else {
                if (inputs[7] < 27.34) {
                    var155 = -0.002981867;
                } else {
                    var155 = -0.015544916;
                }
            }
        } else {
            var155 = -0.012445307;
        }
    } else {
        if (inputs[8] < 21.635) {
            if (inputs[8] < 11.0) {
                var155 = 0.0046615824;
            } else {
                var155 = -0.0124909645;
            }
        } else {
            if (inputs[22] < 16.0) {
                var155 = 0.0066420776;
            } else {
                var155 = 0.016331293;
            }
        }
    }
    double var156;
    if (inputs[1] < 79.82045) {
        if (inputs[18] < 1.0) {
            if (inputs[8] < 54.15) {
                if (inputs[8] < 17.39) {
                    var156 = 0.0030326347;
                } else {
                    var156 = -0.005586165;
                }
            } else {
                var156 = 0.013857995;
            }
        } else {
            if (inputs[14] < 21.910452) {
                if (inputs[14] < 15.66869) {
                    var156 = -0.00541059;
                } else {
                    var156 = -0.019830879;
                }
            } else {
                if (inputs[9] < 1.11) {
                    var156 = -0.0062389937;
                } else {
                    var156 = 0.010963456;
                }
            }
        }
    } else {
        var156 = 0.008931098;
    }
    double var157;
    if (inputs[8] < 58.8575) {
        if (inputs[12] < 3.9619398) {
            if (inputs[16] < 0.28437614) {
                if (inputs[9] < 0.83) {
                    var157 = 0.007375576;
                } else {
                    var157 = -0.0045583905;
                }
            } else {
                if (inputs[16] < 1.1596645) {
                    var157 = 0.008734924;
                } else {
                    var157 = -0.004605241;
                }
            }
        } else {
            var157 = -0.010259973;
        }
    } else {
        if (inputs[10] < -0.376) {
            var157 = -0.006410946;
        } else {
            var157 = 0.01530498;
        }
    }
    double var158;
    if (inputs[1] < 79.82045) {
        if (inputs[18] < 1.0) {
            if (inputs[8] < 53.7575) {
                if (inputs[8] < 37.9175) {
                    var158 = 0.0012887622;
                } else {
                    var158 = -0.011526401;
                }
            } else {
                var158 = 0.013253955;
            }
        } else {
            if (inputs[10] < 2.074) {
                if (inputs[17] < -1.5776527) {
                    var158 = -0.005496022;
                } else {
                    var158 = 0.008947852;
                }
            } else {
                var158 = -0.014014955;
            }
        }
    } else {
        var158 = 0.011017233;
    }
    double var159;
    if (inputs[10] < 15.095) {
        if (inputs[4] < 17834.82) {
            if (inputs[20] < 20.899883) {
                if (inputs[15] < 24.444834) {
                    var159 = -0.0070702233;
                } else {
                    var159 = -0.014884444;
                }
            } else {
                var159 = 0.0021006493;
            }
        } else {
            if (inputs[14] < 22.059683) {
                if (inputs[20] < -23.177559) {
                    var159 = 0.0120626055;
                } else {
                    var159 = -0.001719554;
                }
            } else {
                if (inputs[14] < 28.016373) {
                    var159 = 0.01816236;
                } else {
                    var159 = -0.002213227;
                }
            }
        }
    } else {
        var159 = 0.011107909;
    }
    double var160;
    if (inputs[20] < 12.193009) {
        if (inputs[3] < 17490.88) {
            var160 = -0.014075018;
        } else {
            if (inputs[4] < 19701.36) {
                if (inputs[20] < 7.3229785) {
                    var160 = 0.004068294;
                } else {
                    var160 = -0.011658508;
                }
            } else {
                if (inputs[3] < 19963.12) {
                    var160 = -0.015826039;
                } else {
                    var160 = 0.00025589115;
                }
            }
        }
    } else {
        if (inputs[12] < 4.0963235) {
            if (inputs[2] < 20.142857) {
                if (inputs[22] < 7.0) {
                    var160 = 0.011709702;
                } else {
                    var160 = -0.0047501805;
                }
            } else {
                var160 = 0.015861874;
            }
        } else {
            var160 = -0.007324333;
        }
    }
    double var161;
    if (inputs[20] >= 12.193009) {
        if (inputs[16] < -1.2699627) {
            var161 = 0.012107962;
        } else {
            if (inputs[2] < 20.142857) {
                if (inputs[16] < -0.25901812) {
                    var161 = -0.016470287;
                } else {
                    var161 = 0.00246394;
                }
            } else {
                var161 = 0.010783567;
            }
        }
    } else {
        if (inputs[20] >= 7.6966357) {
            if (inputs[16] < -0.8988836) {
                var161 = -0.0055319164;
            } else {
                var161 = -0.019423865;
            }
        } else {
            if (inputs[5] < 19729.697) {
                if (inputs[6] < 18220.365) {
                    var161 = -0.003965664;
                } else {
                    var161 = 0.0072659864;
                }
            } else {
                if (inputs[16] < 0.10568233) {
                    var161 = -0.017511934;
                } else {
                    var161 = 0.0021970118;
                }
            }
        }
    }
    double var162;
    if (inputs[8] < 58.8575) {
        if (inputs[12] < 3.9619398) {
            if (inputs[8] < 17.39) {
                if (inputs[8] < 14.3125) {
                    var162 = 0.0010468651;
                } else {
                    var162 = 0.013693379;
                }
            } else {
                if (inputs[16] < 0.77425003) {
                    var162 = -0.006712013;
                } else {
                    var162 = 0.004579083;
                }
            }
        } else {
            var162 = -0.011991038;
        }
    } else {
        if (inputs[12] < 1.1834962) {
            var162 = -0.0021176578;
        } else {
            var162 = 0.014842332;
        }
    }
    double var163;
    if (inputs[19] < -25.014664) {
        var163 = 0.01226358;
    } else {
        if (inputs[22] < 19.0) {
            if (inputs[19] < 13.026849) {
                var163 = -0.010069971;
            } else {
                if (inputs[15] < 5.356141) {
                    var163 = -0.009144187;
                } else {
                    var163 = 0.00040292268;
                }
            }
        } else {
            if (inputs[14] < 19.303827) {
                var163 = -0.002194855;
            } else {
                var163 = 0.010295531;
            }
        }
    }
    double var164;
    if (inputs[1] < 79.82045) {
        if (inputs[4] < 19887.025) {
            if (inputs[4] < 19701.36) {
                if (inputs[1] < 71.55351) {
                    var164 = 0.0007568336;
                } else {
                    var164 = -0.009763362;
                }
            } else {
                var164 = -0.012629998;
            }
        } else {
            if (inputs[21] < 2.734217) {
                var164 = -0.0048361626;
            } else {
                var164 = 0.019009896;
            }
        }
    } else {
        var164 = 0.013878478;
    }
    double var165;
    if (inputs[20] < -23.177559) {
        if (inputs[20] < -27.187044) {
            var165 = -0.0028447907;
        } else {
            var165 = 0.01460957;
        }
    } else {
        if (inputs[17] < -2.5052972) {
            var165 = -0.013318745;
        } else {
            if (inputs[11] < -6.416788) {
                var165 = 0.013735027;
            } else {
                if (inputs[20] < -14.820083) {
                    var165 = -0.010833767;
                } else {
                    var165 = 0.000033940894;
                }
            }
        }
    }
    double var166;
    if (inputs[4] < 17834.82) {
        if (inputs[7] < 42.7525) {
            var166 = 0.006947521;
        } else {
            if (inputs[21] < 2.6756628) {
                var166 = -0.022095367;
            } else {
                var166 = 0.0012644489;
            }
        }
    } else {
        if (inputs[5] < 17959.43) {
            var166 = 0.012221857;
        } else {
            if (inputs[4] < 18071.814) {
                var166 = -0.00922514;
            } else {
                if (inputs[9] < 2.81) {
                    var166 = 0.005573403;
                } else {
                    var166 = -0.0009379821;
                }
            }
        }
    }
    double var167;
    if (inputs[7] < 89.905) {
        if (inputs[17] < -2.8875835) {
            var167 = 0.008128555;
        } else {
            if (inputs[12] < -1.9500151) {
                var167 = -0.01419093;
            } else {
                if (inputs[20] >= 1.4448328) {
                    var167 = -0.0038153005;
                } else {
                    var167 = 0.004789372;
                }
            }
        }
    } else {
        if (inputs[10] < 3.999) {
            if (inputs[7] < 129.38) {
                if (inputs[5] < 18253.03) {
                    var167 = -0.0021051632;
                } else {
                    var167 = 0.013295471;
                }
            } else {
                var167 = -0.008584115;
            }
        } else {
            var167 = 0.012681454;
        }
    }
    double var168;
    if (inputs[2] < 17.267857) {
        if (inputs[8] < 2.2525) {
            var168 = 0.0061598564;
        } else {
            if (inputs[2] < 7.2564287) {
                if (inputs[14] < 4.326916) {
                    var168 = -0.0052618873;
                } else {
                    var168 = 0.011017957;
                }
            } else {
                if (inputs[2] < 9.67) {
                    var168 = -0.019410098;
                } else {
                    var168 = -0.0023421787;
                }
            }
        }
    } else {
        if (inputs[18] < 1.0) {
            if (inputs[5] < 17590.586) {
                var168 = -0.0030869243;
            } else {
                if (inputs[10] < -7.714) {
                    var168 = 0.018435655;
                } else {
                    var168 = 0.0052032005;
                }
            }
        } else {
            if (inputs[10] < -12.889) {
                var168 = -0.010433812;
            } else {
                if (inputs[10] < 1.025) {
                    var168 = 0.0077995467;
                } else {
                    var168 = -0.007670086;
                }
            }
        }
    }
    double var169;
    if (inputs[21] < 1.0292515) {
        var169 = 0.01089702;
    } else {
        if (inputs[21] < 1.7890501) {
            if (inputs[1] < 58.232033) {
                if (inputs[1] < 38.63588) {
                    var169 = -0.0069425157;
                } else {
                    var169 = 0.002614469;
                }
            } else {
                var169 = -0.014659761;
            }
        } else {
            if (inputs[21] < 1.934001) {
                var169 = 0.013885639;
            } else {
                if (inputs[2] < 4.8942857) {
                    var169 = 0.0089649195;
                } else {
                    var169 = -0.00015898191;
                }
            }
        }
    }
    double var170;
    if (inputs[2] < 9.67) {
        if (inputs[2] < 7.2564287) {
            if (inputs[12] < 0.583985) {
                if (inputs[6] < 19806.83) {
                    var170 = 0.008041516;
                } else {
                    var170 = -0.011836316;
                }
            } else {
                var170 = 0.011436892;
            }
        } else {
            var170 = -0.015362673;
        }
    } else {
        if (inputs[6] < 18273.926) {
            if (inputs[21] < 3.4796393) {
                if (inputs[16] < 0.25625527) {
                    var170 = -0.0095109735;
                } else {
                    var170 = 0.0043421616;
                }
            } else {
                if (inputs[2] < 14.232857) {
                    var170 = -0.0020710374;
                } else {
                    var170 = 0.015859038;
                }
            }
        } else {
            if (inputs[16] < -0.5312669) {
                if (inputs[16] < -1.0574496) {
                    var170 = 0.00238278;
                } else {
                    var170 = 0.01981537;
                }
            } else {
                if (inputs[16] < 0.47722974) {
                    var170 = -0.009510621;
                } else {
                    var170 = 0.0063689034;
                }
            }
        }
    }
    double var171;
    if (inputs[2] < 17.267857) {
        if (inputs[16] < -1.4044703) {
            if (inputs[6] < 19559.79) {
                if (inputs[17] < 1.9702243) {
                    var171 = 0.01831328;
                } else {
                    var171 = 0.00635464;
                }
            } else {
                var171 = -0.008121132;
            }
        } else {
            if (inputs[4] < 17904.05) {
                var171 = -0.017332284;
            } else {
                if (inputs[10] < 0.675) {
                    var171 = 0.0040461966;
                } else {
                    var171 = -0.007391093;
                }
            }
        }
    } else {
        if (inputs[16] < 0.45865735) {
            if (inputs[16] < -0.073744334) {
                if (inputs[5] < 17766.418) {
                    var171 = -0.0070282454;
                } else {
                    var171 = 0.008269835;
                }
            } else {
                var171 = -0.012255361;
            }
        } else {
            if (inputs[2] < 24.392143) {
                var171 = 0.0153976595;
            } else {
                if (inputs[5] < 18158.123) {
                    var171 = 0.011472914;
                } else {
                    var171 = -0.0027403864;
                }
            }
        }
    }
    double var172;
    if (inputs[21] < 4.296845) {
        if (inputs[21] < 3.7917194) {
            if (inputs[12] < 3.7038045) {
                if (inputs[12] < 1.3059398) {
                    var172 = 0.00055786275;
                } else {
                    var172 = 0.008704988;
                }
            } else {
                var172 = -0.0076902066;
            }
        } else {
            var172 = 0.018007481;
        }
    } else {
        var172 = -0.00591115;
    }
    double var173;
    if (inputs[20] < -27.187044) {
        var173 = -0.010235112;
    } else {
        if (inputs[20] < -24.200352) {
            var173 = 0.014787255;
        } else {
            if (inputs[12] < -1.4036843) {
                if (inputs[11] < -6.416788) {
                    var173 = 0.0053936536;
                } else {
                    var173 = -0.015316649;
                }
            } else {
                if (inputs[12] < -0.5651203) {
                    var173 = 0.010471851;
                } else {
                    var173 = 0.00013374675;
                }
            }
        }
    }
    double var174;
    if (inputs[8] < 65.7525) {
        if (inputs[8] < 45.67) {
            if (inputs[21] < 1.0292515) {
                var174 = 0.0091485875;
            } else {
                if (inputs[8] < 1.85) {
                    var174 = -0.014663209;
                } else {
                    var174 = -0.000928673;
                }
            }
        } else {
            if (inputs[2] < 18.454287) {
                var174 = -0.013903495;
            } else {
                var174 = -0.003195431;
            }
        }
    } else {
        if (inputs[14] < 21.910452) {
            var174 = 0.00032858632;
        } else {
            var174 = 0.012854389;
        }
    }
    double var175;
    if (inputs[12] < 4.0963235) {
        if (inputs[20] < 11.40759) {
            if (inputs[16] < -0.9431992) {
                if (inputs[1] < 57.86574) {
                    var175 = -0.0010064803;
                } else {
                    var175 = -0.01622461;
                }
            } else {
                if (inputs[16] < -0.77141327) {
                    var175 = 0.016592816;
                } else {
                    var175 = -0.00088846666;
                }
            }
        } else {
            if (inputs[16] < -1.3387622) {
                var175 = 0.011909505;
            } else {
                if (inputs[16] < 0.28437614) {
                    var175 = -0.006742654;
                } else {
                    var175 = 0.009375238;
                }
            }
        }
    } else {
        var175 = -0.007053228;
    }
    double var176;
    if (inputs[20] < -27.187044) {
        var176 = -0.008113071;
    } else {
        if (inputs[20] < -23.177559) {
            var176 = 0.0126057565;
        } else {
            if (inputs[11] < -6.416788) {
                var176 = 0.008486668;
            } else {
                if (inputs[1] < 33.067528) {
                    var176 = -0.016691491;
                } else {
                    var176 = 0.00049405487;
                }
            }
        }
    }
    double var177;
    if (inputs[21] < 1.0292515) {
        var177 = 0.0102094645;
    } else {
        if (inputs[21] < 1.3688738) {
            var177 = -0.011197661;
        } else {
            if (inputs[22] < 3.0) {
                if (inputs[22] < 2.0) {
                    var177 = 0.000062004365;
                } else {
                    var177 = 0.014889536;
                }
            } else {
                if (inputs[14] < 7.8048434) {
                    var177 = -0.010746764;
                } else {
                    var177 = 0.00069508026;
                }
            }
        }
    }
    double var178;
    if (inputs[21] < 1.7025212) {
        if (inputs[6] < 19556.56) {
            if (inputs[15] < 10.078527) {
                var178 = 0.0097985165;
            } else {
                var178 = -0.009623039;
            }
        } else {
            var178 = -0.0151387295;
        }
    } else {
        if (inputs[21] < 1.934001) {
            var178 = 0.011532543;
        } else {
            if (inputs[4] < 19959.676) {
                if (inputs[15] < 8.361936) {
                    var178 = -0.010718633;
                } else {
                    var178 = -0.0002230165;
                }
            } else {
                var178 = 0.010961628;
            }
        }
    }
    double var179;
    if (inputs[4] < 17834.82) {
        if (inputs[4] < 17588.336) {
            if (inputs[12] < 2.920564) {
                if (inputs[6] < 17344.215) {
                    var179 = -0.014205595;
                } else {
                    var179 = 0.0016921397;
                }
            } else {
                var179 = 0.008855669;
            }
        } else {
            var179 = -0.016408268;
        }
    } else {
        if (inputs[10] < -9.838) {
            if (inputs[15] < 25.213606) {
                var179 = 0.016932594;
            } else {
                var179 = 0.0053088283;
            }
        } else {
            if (inputs[16] < 1.1342015) {
                if (inputs[16] < 0.8135177) {
                    var179 = -0.0009516895;
                } else {
                    var179 = 0.016700393;
                }
            } else {
                var179 = -0.008480171;
            }
        }
    }
    double var180;
    if (inputs[17] < 4.0182233) {
        if (inputs[5] < 17935.795) {
            if (inputs[16] < 0.25625527) {
                var180 = -0.017091293;
            } else {
                if (inputs[2] < 19.165) {
                    var180 = -0.008795612;
                } else {
                    var180 = 0.0036464166;
                }
            }
        } else {
            if (inputs[17] < -2.7586765) {
                if (inputs[12] < -3.987812) {
                    var180 = 0.012417191;
                } else {
                    var180 = -0.00047795993;
                }
            } else {
                if (inputs[2] < 18.608572) {
                    var180 = -0.0033811936;
                } else {
                    var180 = 0.0030849043;
                }
            }
        }
    } else {
        var180 = 0.006048472;
    }
    double var181;
    if (inputs[2] < 9.866428) {
        if (inputs[14] < 6.2321715) {
            if (inputs[21] < 2.90849) {
                if (inputs[3] < 19668.46) {
                    var181 = 0.0051032947;
                } else {
                    var181 = -0.010641776;
                }
            } else {
                var181 = 0.008561085;
            }
        } else {
            var181 = -0.018876106;
        }
    } else {
        if (inputs[15] < 10.321135) {
            var181 = 0.019338582;
        } else {
            if (inputs[2] < 21.177856) {
                if (inputs[7] < 34.815) {
                    var181 = -0.017682374;
                } else {
                    var181 = 0.00032474514;
                }
            } else {
                if (inputs[2] < 27.15) {
                    var181 = 0.0093208505;
                } else {
                    var181 = -0.0022775047;
                }
            }
        }
    }
    double var182;
    if (inputs[19] < -25.014664) {
        var182 = 0.009499375;
    } else {
        if (inputs[20] < -27.187044) {
            var182 = -0.007148729;
        } else {
            if (inputs[20] < -23.177559) {
                var182 = 0.012946434;
            } else {
                if (inputs[17] < -2.5052972) {
                    var182 = -0.011868568;
                } else {
                    var182 = -0.00008305292;
                }
            }
        }
    }
    double var183;
    if (inputs[2] < 9.67) {
        if (inputs[13] < 4.6668086) {
            if (inputs[16] < -1.4905654) {
                var183 = 0.008513541;
            } else {
                if (inputs[3] < 19830.98) {
                    var183 = -0.0079402225;
                } else {
                    var183 = -0.0025876516;
                }
            }
        } else {
            var183 = -0.016312912;
        }
    } else {
        if (inputs[15] < 16.269487) {
            if (inputs[13] < 7.183986) {
                var183 = 0.0028209933;
            } else {
                if (inputs[13] < 10.628429) {
                    var183 = 0.01217097;
                } else {
                    var183 = 0.019892743;
                }
            }
        } else {
            if (inputs[14] < 19.819408) {
                if (inputs[11] < 1.4083636) {
                    var183 = -0.012905519;
                } else {
                    var183 = 0.0025051215;
                }
            } else {
                if (inputs[3] < 18087.11) {
                    var183 = -0.0010980171;
                } else {
                    var183 = 0.007843463;
                }
            }
        }
    }
    double var184;
    if (inputs[10] < -17.426) {
        var184 = -0.012456694;
    } else {
        if (inputs[14] < 24.654566) {
            if (inputs[11] < -5.374) {
                var184 = -0.014087493;
            } else {
                if (inputs[1] < 58.232033) {
                    var184 = 0.0050155856;
                } else {
                    var184 = -0.001989499;
                }
            }
        } else {
            if (inputs[17] < -2.4407218) {
                var184 = 0.016735364;
            } else {
                if (inputs[2] < 20.225714) {
                    var184 = -0.01253467;
                } else {
                    var184 = 0.006302418;
                }
            }
        }
    }
    double var185;
    if (inputs[21] < 1.0292515) {
        var185 = 0.0080927815;
    } else {
        if (inputs[21] < 1.3688738) {
            var185 = -0.011169842;
        } else {
            if (inputs[15] < 5.5812836) {
                var185 = -0.008483524;
            } else {
                if (inputs[3] < 19864.836) {
                    var185 = 0.0004490356;
                } else {
                    var185 = 0.015742972;
                }
            }
        }
    }
    double var186;
    if (inputs[14] < 22.059683) {
        if (inputs[14] < 11.51551) {
            if (inputs[14] < 9.603012) {
                if (inputs[15] < 13.579078) {
                    var186 = 0.00020973882;
                } else {
                    var186 = -0.010991484;
                }
            } else {
                var186 = 0.014497834;
            }
        } else {
            if (inputs[2] < 15.919286) {
                if (inputs[15] < 17.702614) {
                    var186 = -0.01819342;
                } else {
                    var186 = -0.0115242135;
                }
            } else {
                if (inputs[18] < 1.0) {
                    var186 = 0.0047211745;
                } else {
                    var186 = -0.010479599;
                }
            }
        }
    } else {
        if (inputs[15] < 27.67673) {
            if (inputs[15] < 24.78951) {
                if (inputs[3] < 18075.234) {
                    var186 = -0.0009827262;
                } else {
                    var186 = 0.011026271;
                }
            } else {
                var186 = -0.016153824;
            }
        } else {
            if (inputs[14] < 32.257446) {
                var186 = 0.01563956;
            } else {
                var186 = -0.0015170976;
            }
        }
    }
    double var187;
    if (inputs[19] >= -25.014664) {
        if (inputs[20] < 11.40759) {
            if (inputs[1] < 57.86574) {
                if (inputs[19] < 48.418976) {
                    var187 = -0.0074033514;
                } else {
                    var187 = 0.010341919;
                }
            } else {
                if (inputs[10] < 2.632) {
                    var187 = -0.0073296484;
                } else {
                    var187 = -0.02127617;
                }
            }
        } else {
            var187 = 0.004706145;
        }
    } else {
        if (inputs[10] < -18.199) {
            var187 = -0.0076557957;
        } else {
            if (inputs[1] < 66.89984) {
                if (inputs[1] < 61.914845) {
                    var187 = 0.001963635;
                } else {
                    var187 = 0.01255737;
                }
            } else {
                if (inputs[7] < 107.085) {
                    var187 = -0.0057672895;
                } else {
                    var187 = 0.011521783;
                }
            }
        }
    }
    double var188;
    if (inputs[20] >= -33.020267) {
        if (inputs[16] < 0.6946821) {
            if (inputs[16] < 0.47722974) {
                if (inputs[7] < 134.6925) {
                    var188 = -0.0006015648;
                } else {
                    var188 = 0.011415514;
                }
            } else {
                var188 = 0.017758327;
            }
        } else {
            if (inputs[21] < 3.1794524) {
                if (inputs[21] < 2.2714608) {
                    var188 = -0.0030345437;
                } else {
                    var188 = 0.007663953;
                }
            } else {
                var188 = -0.015709415;
            }
        }
    } else {
        var188 = -0.014092455;
    }
    double var189;
    if (inputs[15] < 5.356141) {
        var189 = -0.008014178;
    } else {
        if (inputs[5] < 19903.65) {
            if (inputs[2] < 9.866428) {
                if (inputs[8] < 16.715) {
                    var189 = -0.0010905426;
                } else {
                    var189 = -0.014454393;
                }
            } else {
                if (inputs[15] < 11.752636) {
                    var189 = 0.014709793;
                } else {
                    var189 = 0.00014684966;
                }
            }
        } else {
            var189 = 0.011901318;
        }
    }
    double var190;
    if (inputs[7] < 13.255) {
        if (inputs[15] < 5.849059) {
            var190 = -0.0028149106;
        } else {
            var190 = 0.015578001;
        }
    } else {
        if (inputs[1] < 61.003597) {
            if (inputs[5] < 17590.586) {
                var190 = -0.015943406;
            } else {
                if (inputs[20] < -23.177559) {
                    var190 = 0.0063820495;
                } else {
                    var190 = -0.005162671;
                }
            }
        } else {
            if (inputs[20] >= 5.2601457) {
                if (inputs[8] < 21.6675) {
                    var190 = -0.0062885974;
                } else {
                    var190 = 0.004783269;
                }
            } else {
                var190 = 0.0129600605;
            }
        }
    }
    double var191;
    if (inputs[9] < 0.75) {
        if (inputs[13] < 21.961267) {
            var191 = 0.005012033;
        } else {
            var191 = 0.010720873;
        }
    } else {
        if (inputs[15] < 24.841236) {
            if (inputs[2] < 9.67) {
                if (inputs[2] < 7.2564287) {
                    var191 = 0.0025473177;
                } else {
                    var191 = -0.016212776;
                }
            } else {
                if (inputs[15] < 10.543079) {
                    var191 = 0.01446499;
                } else {
                    var191 = 0.0014719253;
                }
            }
        } else {
            if (inputs[10] < 2.676) {
                if (inputs[17] < -1.9782552) {
                    var191 = -0.007134101;
                } else {
                    var191 = 0.010832051;
                }
            } else {
                var191 = -0.013222424;
            }
        }
    }
    double var192;
    if (inputs[3] < 19963.12) {
        if (inputs[6] < 19805.176) {
            if (inputs[20] >= 6.0734453) {
                if (inputs[8] < 58.8575) {
                    var192 = -0.0058926702;
                } else {
                    var192 = 0.010025194;
                }
            } else {
                if (inputs[10] < -0.266) {
                    var192 = -0.00025866728;
                } else {
                    var192 = 0.012758587;
                }
            }
        } else {
            var192 = -0.012915229;
        }
    } else {
        var192 = 0.008341652;
    }
    double var193;
    if (inputs[17] < 3.5373898) {
        if (inputs[1] < 72.62081) {
            if (inputs[10] < 5.069) {
                if (inputs[20] < 13.654511) {
                    var193 = -0.0005689592;
                } else {
                    var193 = -0.017309712;
                }
            } else {
                if (inputs[20] < 14.976483) {
                    var193 = -0.002745159;
                } else {
                    var193 = 0.013230303;
                }
            }
        } else {
            var193 = -0.011132253;
        }
    } else {
        if (inputs[2] < 14.232857) {
            var193 = 0.00049998745;
        } else {
            var193 = 0.015598907;
        }
    }
    double var194;
    if (inputs[21] < 1.0292515) {
        var194 = 0.008949424;
    } else {
        if (inputs[21] < 1.4544226) {
            var194 = -0.013327975;
        } else {
            if (inputs[21] < 1.9866916) {
                if (inputs[7] < 64.5025) {
                    var194 = 0.0008373718;
                } else {
                    var194 = 0.0145612545;
                }
            } else {
                if (inputs[21] < 2.167991) {
                    var194 = -0.010877053;
                } else {
                    var194 = 0.0006991927;
                }
            }
        }
    }
    double var195;
    if (inputs[8] < 15.56) {
        if (inputs[20] >= 6.039089) {
            if (inputs[7] < 33.1775) {
                var195 = -0.014244037;
            } else {
                var195 = 0.006345306;
            }
        } else {
            if (inputs[15] < 10.937817) {
                if (inputs[15] < 5.849059) {
                    var195 = 0.0032167637;
                } else {
                    var195 = 0.024585135;
                }
            } else {
                if (inputs[20] >= -19.714949) {
                    var195 = -0.008743718;
                } else {
                    var195 = 0.005557209;
                }
            }
        }
    } else {
        if (inputs[8] < 27.625) {
            if (inputs[1] < 65.402374) {
                if (inputs[13] < 11.507192) {
                    var195 = 0.00043214063;
                } else {
                    var195 = -0.012501972;
                }
            } else {
                var195 = -0.020407401;
            }
        } else {
            if (inputs[20] >= -27.187044) {
                if (inputs[13] < 13.647793) {
                    var195 = -0.0020025417;
                } else {
                    var195 = 0.009954279;
                }
            } else {
                var195 = -0.010243987;
            }
        }
    }
    double var196;
    if (inputs[19] < -25.014664) {
        var196 = 0.011131786;
    } else {
        if (inputs[16] < 1.2177398) {
            if (inputs[16] < 0.45865735) {
                if (inputs[13] < 17.439014) {
                    var196 = -0.0035337904;
                } else {
                    var196 = 0.005086362;
                }
            } else {
                if (inputs[21] < 2.7979956) {
                    var196 = 0.014539487;
                } else {
                    var196 = -0.0027092735;
                }
            }
        } else {
            if (inputs[11] < -1.9138788) {
                var196 = 0.010717525;
            } else {
                var196 = -0.020782301;
            }
        }
    }
    double var197;
    if (inputs[16] < 1.2631494) {
        if (inputs[16] < 0.47722974) {
            if (inputs[16] < -0.67364275) {
                if (inputs[21] < 2.90849) {
                    var197 = -0.0017728785;
                } else {
                    var197 = 0.0101481285;
                }
            } else {
                if (inputs[10] < 8.175) {
                    var197 = -0.0073770606;
                } else {
                    var197 = 0.005904396;
                }
            }
        } else {
            if (inputs[16] < 0.6946821) {
                var197 = 0.016062899;
            } else {
                if (inputs[9] < 1.24) {
                    var197 = -0.00964835;
                } else {
                    var197 = 0.0070372163;
                }
            }
        }
    } else {
        if (inputs[11] < -1.9138788) {
            var197 = 0.0058421358;
        } else {
            var197 = -0.015498052;
        }
    }
    double var198;
    if (inputs[10] < -17.426) {
        var198 = -0.008206774;
    } else {
        if (inputs[9] < 0.74) {
            var198 = 0.009843292;
        } else {
            if (inputs[9] < 1.23) {
                if (inputs[9] < 1.03) {
                    var198 = -0.0011412827;
                } else {
                    var198 = -0.013940697;
                }
            } else {
                if (inputs[3] < 17601.846) {
                    var198 = 0.014308263;
                } else {
                    var198 = 0.00025563987;
                }
            }
        }
    }
    double var199;
    if (inputs[10] < -17.426) {
        var199 = -0.00896764;
    } else {
        if (inputs[11] < -7.7435756) {
            var199 = 0.009092943;
        } else {
            if (inputs[16] < 1.2177398) {
                if (inputs[16] < 0.45865735) {
                    var199 = -0.0013171289;
                } else {
                    var199 = 0.00754046;
                }
            } else {
                if (inputs[11] < -1.5232728) {
                    var199 = 0.0020995867;
                } else {
                    var199 = -0.017425643;
                }
            }
        }
    }
    double var200;
    if (inputs[15] < 24.841236) {
        if (inputs[7] < 104.82) {
            if (inputs[20] < -15.362697) {
                if (inputs[20] < -24.019466) {
                    var200 = 0.0025877804;
                } else {
                    var200 = -0.01332473;
                }
            } else {
                if (inputs[20] < -7.9805346) {
                    var200 = 0.012631631;
                } else {
                    var200 = 0.0005148703;
                }
            }
        } else {
            var200 = 0.014823468;
        }
    } else {
        if (inputs[15] < 27.67673) {
            var200 = -0.014458474;
        } else {
            if (inputs[14] < 20.733627) {
                var200 = -0.008092634;
            } else {
                if (inputs[14] < 35.924866) {
                    var200 = 0.011136842;
                } else {
                    var200 = -0.004545247;
                }
            }
        }
    }
    double var201;
    if (inputs[19] >= 116.51537) {
        var201 = -0.011642917;
    } else {
        if (inputs[14] < 5.5701637) {
            var201 = 0.009813529;
        } else {
            if (inputs[14] < 24.654566) {
                if (inputs[8] < 57.12) {
                    var201 = -0.0030629665;
                } else {
                    var201 = 0.006930872;
                }
            } else {
                if (inputs[14] < 28.204103) {
                    var201 = 0.0121928;
                } else {
                    var201 = -0.00031414174;
                }
            }
        }
    }
    double var202;
    if (inputs[17] < 4.0182233) {
        if (inputs[12] < 3.6293309) {
            if (inputs[22] < 5.0) {
                if (inputs[12] < -0.06499248) {
                    var202 = -0.01271963;
                } else {
                    var202 = 0.0001780909;
                }
            } else {
                if (inputs[10] < 4.651) {
                    var202 = 0.000031099604;
                } else {
                    var202 = 0.008840307;
                }
            }
        } else {
            var202 = -0.010692684;
        }
    } else {
        var202 = 0.007957918;
    }
    double var203;
    if (inputs[20] < -27.187044) {
        var203 = -0.008236836;
    } else {
        if (inputs[20] < -23.177559) {
            var203 = 0.01267964;
        } else {
            if (inputs[20] < -17.137478) {
                if (inputs[14] < 21.910452) {
                    var203 = -0.017791523;
                } else {
                    var203 = 0.004219917;
                }
            } else {
                if (inputs[19] < -26.784607) {
                    var203 = 0.010792315;
                } else {
                    var203 = 0.00017688723;
                }
            }
        }
    }
    double var204;
    if (inputs[1] < 79.82045) {
        if (inputs[20] < -27.187044) {
            var204 = -0.009133799;
        } else {
            if (inputs[20] >= -23.177559) {
                if (inputs[9] < 1.18) {
                    var204 = -0.0064873663;
                } else {
                    var204 = 0.0008971603;
                }
            } else {
                if (inputs[7] < 54.5675) {
                    var204 = 0.013505844;
                } else {
                    var204 = 0.0027049629;
                }
            }
        }
    } else {
        var204 = 0.011287004;
    }
    double var205;
    if (inputs[21] < 1.0292515) {
        var205 = 0.010172268;
    } else {
        if (inputs[21] < 1.3688738) {
            var205 = -0.009728528;
        } else {
            if (inputs[5] < 17364.145) {
                var205 = -0.00694083;
            } else {
                if (inputs[8] < 3.3775) {
                    var205 = -0.0049854727;
                } else {
                    var205 = 0.0032339932;
                }
            }
        }
    }
    double var206;
    if (inputs[19] < -25.014664) {
        var206 = 0.009207938;
    } else {
        if (inputs[8] < 58.345) {
            if (inputs[8] < 49.125) {
                if (inputs[16] < 1.2177398) {
                    var206 = 0.00091885333;
                } else {
                    var206 = -0.008572025;
                }
            } else {
                var206 = -0.011605267;
            }
        } else {
            if (inputs[17] < 1.3688738) {
                var206 = -0.0007815264;
            } else {
                var206 = 0.010856863;
            }
        }
    }
    double var207;
    if (inputs[7] < 89.905) {
        if (inputs[17] < -2.7586765) {
            var207 = 0.0073343;
        } else {
            if (inputs[18] < 1.0) {
                if (inputs[13] < 8.043361) {
                    var207 = -0.004709285;
                } else {
                    var207 = 0.0031633503;
                }
            } else {
                if (inputs[19] < 37.21965) {
                    var207 = -0.0026531378;
                } else {
                    var207 = -0.012509562;
                }
            }
        }
    } else {
        if (inputs[17] < 3.502689) {
            if (inputs[3] < 18059.516) {
                var207 = -0.0062445;
            } else {
                if (inputs[9] < 1.98) {
                    var207 = 0.012333948;
                } else {
                    var207 = 0.000060036775;
                }
            }
        } else {
            var207 = 0.014204037;
        }
    }
    double var208;
    if (inputs[2] < 9.866428) {
        if (inputs[13] < 4.6668086) {
            if (inputs[19] < 116.51537) {
                var208 = 0.008683155;
            } else {
                if (inputs[19] < 471.01923) {
                    var208 = -0.011955325;
                } else {
                    var208 = 0.00060282403;
                }
            }
        } else {
            var208 = -0.018163586;
        }
    } else {
        if (inputs[12] < -1.9500151) {
            if (inputs[1] < 30.761576) {
                if (inputs[22] < 15.0) {
                    var208 = -0.008601878;
                } else {
                    var208 = 0.0074216016;
                }
            } else {
                var208 = -0.01641031;
            }
        } else {
            if (inputs[12] < 3.9619398) {
                if (inputs[13] < 7.183986) {
                    var208 = -0.0061326837;
                } else {
                    var208 = 0.006117181;
                }
            } else {
                if (inputs[12] < 5.523647) {
                    var208 = -0.010444095;
                } else {
                    var208 = 0.003908219;
                }
            }
        }
    }
    double var209;
    if (inputs[19] < -25.014664) {
        var209 = 0.010769723;
    } else {
        if (inputs[14] < 19.576471) {
            if (inputs[7] < 44.4225) {
                if (inputs[16] < 1.1315215) {
                    var209 = 0.0025420892;
                } else {
                    var209 = -0.011680913;
                }
            } else {
                if (inputs[7] < 75.2175) {
                    var209 = -0.015167672;
                } else {
                    var209 = -0.0021344037;
                }
            }
        } else {
            if (inputs[7] < 92.1375) {
                if (inputs[2] < 21.177856) {
                    var209 = -0.0077680643;
                } else {
                    var209 = 0.0030873083;
                }
            } else {
                if (inputs[14] < 29.705542) {
                    var209 = 0.013290958;
                } else {
                    var209 = -0.0029689698;
                }
            }
        }
    }
    double var210;
    if (inputs[15] < 5.356141) {
        var210 = -0.009100018;
    } else {
        if (inputs[3] < 19864.836) {
            if (inputs[2] < 9.67) {
                var210 = -0.0104514435;
            } else {
                if (inputs[15] < 11.323254) {
                    var210 = 0.011743134;
                } else {
                    var210 = -0.0007918057;
                }
            }
        } else {
            var210 = 0.01490093;
        }
    }
    double var211;
    if (inputs[3] < 19963.12) {
        if (inputs[2] < 9.67) {
            if (inputs[16] < -1.5741276) {
                var211 = 0.0019482218;
            } else {
                var211 = -0.0117927985;
            }
        } else {
            if (inputs[20] >= 12.193009) {
                if (inputs[2] < 20.225714) {
                    var211 = -0.0001289887;
                } else {
                    var211 = 0.01332267;
                }
            } else {
                if (inputs[20] >= 7.6966357) {
                    var211 = -0.017576085;
                } else {
                    var211 = 0.0007074311;
                }
            }
        }
    } else {
        var211 = 0.008249707;
    }
    double var212;
    if (inputs[13] < 5.316362) {
        if (inputs[19] < 116.51537) {
            if (inputs[8] < 10.7475) {
                var212 = 0.018322192;
            } else {
                var212 = 0.0053746663;
            }
        } else {
            if (inputs[17] < 2.8439124) {
                var212 = -0.01176001;
            } else {
                var212 = 0.009149655;
            }
        }
    } else {
        if (inputs[13] < 7.068011) {
            var212 = -0.014724723;
        } else {
            if (inputs[15] < 11.955792) {
                var212 = 0.011503096;
            } else {
                if (inputs[19] < 67.92769) {
                    var212 = -0.011798818;
                } else {
                    var212 = -0.00026021354;
                }
            }
        }
    }
    double var213;
    if (inputs[3] < 19963.12) {
        if (inputs[4] < 19701.36) {
            if (inputs[4] < 19523.506) {
                if (inputs[4] < 19410.475) {
                    var213 = 0.00015358659;
                } else {
                    var213 = -0.0147026945;
                }
            } else {
                var213 = 0.00899929;
            }
        } else {
            if (inputs[13] < 4.6668086) {
                var213 = -0.0014874646;
            } else {
                var213 = -0.015683105;
            }
        }
    } else {
        var213 = 0.0059572044;
    }
    double var214;
    if (inputs[2] < 17.267857) {
        if (inputs[15] < 10.458148) {
            if (inputs[2] < 9.866428) {
                if (inputs[2] < 7.634286) {
                    var214 = 0.0057201264;
                } else {
                    var214 = -0.012759252;
                }
            } else {
                var214 = 0.013683489;
            }
        } else {
            if (inputs[16] < -1.3552966) {
                var214 = 0.0036106913;
            } else {
                if (inputs[16] < 0.28437614) {
                    var214 = -0.014453158;
                } else {
                    var214 = -0.0018226416;
                }
            }
        }
    } else {
        if (inputs[2] < 27.15) {
            if (inputs[1] < 69.15591) {
                if (inputs[1] < 36.070274) {
                    var214 = 0.0037864677;
                } else {
                    var214 = 0.0138673475;
                }
            } else {
                var214 = -0.0030535113;
            }
        } else {
            if (inputs[4] < 17872.9) {
                var214 = -0.011511202;
            } else {
                if (inputs[8] < 30.445) {
                    var214 = -0.003973696;
                } else {
                    var214 = 0.009603618;
                }
            }
        }
    }
    double var215;
    if (inputs[10] < 4.651) {
        if (inputs[10] < 2.801) {
            if (inputs[2] < 28.181429) {
                if (inputs[7] < 99.21) {
                    var215 = -0.00034109547;
                } else {
                    var215 = 0.009248026;
                }
            } else {
                var215 = -0.009186573;
            }
        } else {
            var215 = -0.014756088;
        }
    } else {
        if (inputs[15] < 21.933056) {
            if (inputs[20] < 19.487139) {
                var215 = 0.0052679684;
            } else {
                var215 = 0.018103277;
            }
        } else {
            if (inputs[8] < 21.635) {
                var215 = -0.014983691;
            } else {
                var215 = 0.0049409135;
            }
        }
    }
    double var216;
    if (inputs[8] < 27.625) {
        if (inputs[8] < 17.39) {
            if (inputs[16] < 1.1596645) {
                if (inputs[16] < 0.5366254) {
                    var216 = 0.0007328634;
                } else {
                    var216 = 0.013576338;
                }
            } else {
                var216 = -0.008748695;
            }
        } else {
            if (inputs[6] < 19021.846) {
                var216 = -0.019036006;
            } else {
                var216 = 0.00013198996;
            }
        }
    } else {
        if (inputs[13] < 13.047034) {
            if (inputs[16] < -1.188005) {
                var216 = 0.0074896086;
            } else {
                if (inputs[6] < 18238.59) {
                    var216 = -0.015513909;
                } else {
                    var216 = -0.0014223949;
                }
            }
        } else {
            if (inputs[17] < -1.8981965) {
                var216 = -0.000014488412;
            } else {
                if (inputs[13] < 19.397114) {
                    var216 = 0.019117376;
                } else {
                    var216 = 0.008373972;
                }
            }
        }
    }
    double var217;
    if (inputs[8] < 58.8575) {
        if (inputs[8] < 45.91) {
            if (inputs[7] < 92.1375) {
                if (inputs[7] < 78.65) {
                    var217 = -0.00014855435;
                } else {
                    var217 = -0.013435173;
                }
            } else {
                var217 = 0.013635528;
            }
        } else {
            var217 = -0.010335661;
        }
    } else {
        if (inputs[17] < 1.3688738) {
            var217 = -0.003348668;
        } else {
            var217 = 0.011726658;
        }
    }
    double var218;
    if (inputs[17] < 3.5373898) {
        if (inputs[16] < -0.9431992) {
            if (inputs[16] < -1.9098649) {
                var218 = 0.00417792;
            } else {
                if (inputs[3] < 19222.35) {
                    var218 = -0.016198387;
                } else {
                    var218 = -0.0060129715;
                }
            }
        } else {
            if (inputs[16] < -0.7316509) {
                var218 = 0.014825667;
            } else {
                if (inputs[17] < 3.0976224) {
                    var218 = 0.00080531806;
                } else {
                    var218 = -0.012085867;
                }
            }
        }
    } else {
        if (inputs[2] < 14.232857) {
            var218 = -0.0017212414;
        } else {
            var218 = 0.015702397;
        }
    }
    double var219;
    if (inputs[16] < 1.2631494) {
        if (inputs[7] < 20.74) {
            if (inputs[12] < -0.16417293) {
                var219 = -0.0011288713;
            } else {
                if (inputs[13] < 4.2032437) {
                    var219 = 0.0046243165;
                } else {
                    var219 = 0.018159464;
                }
            }
        } else {
            if (inputs[21] < 3.277861) {
                if (inputs[21] < 3.139606) {
                    var219 = -0.0006829672;
                } else {
                    var219 = -0.016429318;
                }
            } else {
                if (inputs[14] < 14.620058) {
                    var219 = -0.003838452;
                } else {
                    var219 = 0.011169209;
                }
            }
        }
    } else {
        if (inputs[7] < 42.815) {
            var219 = -0.016481819;
        } else {
            var219 = 0.000709366;
        }
    }
    double var220;
    if (inputs[16] < 0.28437614) {
        if (inputs[16] < -0.14531119) {
            if (inputs[13] < 17.439014) {
                if (inputs[15] < 8.923564) {
                    var220 = 0.0034477445;
                } else {
                    var220 = -0.007235393;
                }
            } else {
                if (inputs[15] < 26.98867) {
                    var220 = -0.00044047364;
                } else {
                    var220 = 0.014649353;
                }
            }
        } else {
            var220 = -0.013476774;
        }
    } else {
        if (inputs[15] < 36.175896) {
            if (inputs[16] < 0.6860457) {
                if (inputs[20] < 4.713728) {
                    var220 = 0.020733;
                } else {
                    var220 = 0.010682417;
                }
            } else {
                if (inputs[15] < 9.211346) {
                    var220 = -0.00883789;
                } else {
                    var220 = 0.0038203103;
                }
            }
        } else {
            var220 = -0.01029264;
        }
    }
    double var221;
    if (inputs[2] < 18.608572) {
        if (inputs[11] < 2.0853333) {
            if (inputs[21] < 2.7594576) {
                if (inputs[19] < 318.549) {
                    var221 = 0.0021796396;
                } else {
                    var221 = -0.019478722;
                }
            } else {
                if (inputs[3] < 19774.34) {
                    var221 = 0.00088464;
                } else {
                    var221 = 0.01509134;
                }
            }
        } else {
            if (inputs[16] < -1.2574953) {
                var221 = 0.0031195201;
            } else {
                if (inputs[16] < 0.28437614) {
                    var221 = -0.019804846;
                } else {
                    var221 = -0.0035357727;
                }
            }
        }
    } else {
        if (inputs[7] < 34.79) {
            var221 = 0.014668217;
        } else {
            if (inputs[14] < 19.32822) {
                var221 = -0.008534313;
            } else {
                if (inputs[3] < 17744.16) {
                    var221 = -0.0046371287;
                } else {
                    var221 = 0.008022734;
                }
            }
        }
    }
    double var222;
    if (inputs[19] >= -24.833563) {
        if (inputs[1] < 57.86574) {
            if (inputs[19] < 48.418976) {
                var222 = -0.0052761054;
            } else {
                var222 = 0.008112377;
            }
        } else {
            if (inputs[20] < 11.238702) {
                var222 = -0.016332101;
            } else {
                if (inputs[1] < 68.122375) {
                    var222 = 0.006619252;
                } else {
                    var222 = 0.00046831358;
                }
            }
        }
    } else {
        if (inputs[16] < -1.2699627) {
            if (inputs[3] < 18435.92) {
                var222 = 0.009514731;
            } else {
                var222 = 0.0136981625;
            }
        } else {
            if (inputs[16] < -0.9855694) {
                var222 = -0.015138584;
            } else {
                if (inputs[3] < 17490.88) {
                    var222 = -0.0063414876;
                } else {
                    var222 = 0.003963815;
                }
            }
        }
    }
    double var223;
    if (inputs[1] < 79.82045) {
        if (inputs[16] < 0.45865735) {
            if (inputs[4] < 18076.11) {
                if (inputs[8] < 15.425) {
                    var223 = -0.003020991;
                } else {
                    var223 = -0.014374403;
                }
            } else {
                if (inputs[13] < 15.231146) {
                    var223 = -0.003200576;
                } else {
                    var223 = 0.0072412444;
                }
            }
        } else {
            if (inputs[16] < 0.6946821) {
                var223 = 0.0128380265;
            } else {
                if (inputs[20] < -23.177559) {
                    var223 = 0.009282313;
                } else {
                    var223 = -0.0026038142;
                }
            }
        }
    } else {
        var223 = 0.010803954;
    }
    double var224;
    if (inputs[20] < 12.193009) {
        if (inputs[20] < 7.3229785) {
            if (inputs[17] < 1.82) {
                if (inputs[5] < 19729.697) {
                    var224 = 0.0011743193;
                } else {
                    var224 = -0.009187749;
                }
            } else {
                var224 = 0.0107763605;
            }
        } else {
            if (inputs[17] < 2.2047207) {
                var224 = -0.018851178;
            } else {
                var224 = -0.004282869;
            }
        }
    } else {
        if (inputs[2] < 20.225714) {
            if (inputs[15] < 21.452278) {
                if (inputs[2] < 9.67) {
                    var224 = -0.0043952554;
                } else {
                    var224 = 0.015099037;
                }
            } else {
                var224 = -0.008686233;
            }
        } else {
            if (inputs[12] < 2.318609) {
                var224 = 0.017469734;
            } else {
                var224 = 0.0044847657;
            }
        }
    }
    double var225;
    if (inputs[22] < 19.0) {
        if (inputs[17] < 4.0182233) {
            if (inputs[18] < 1.0) {
                if (inputs[21] < 2.2620287) {
                    var225 = 0.0044196006;
                } else {
                    var225 = -0.0032744748;
                }
            } else {
                if (inputs[20] < -23.446354) {
                    var225 = 0.0033146986;
                } else {
                    var225 = -0.0121465335;
                }
            }
        } else {
            var225 = 0.01003412;
        }
    } else {
        if (inputs[13] < 15.841378) {
            var225 = 0.001808637;
        } else {
            var225 = 0.013044275;
        }
    }
    double var226;
    if (inputs[16] < 0.47722974) {
        if (inputs[21] < 2.7594576) {
            if (inputs[5] < 19729.697) {
                if (inputs[7] < 41.88) {
                    var226 = 0.006748941;
                } else {
                    var226 = -0.006378075;
                }
            } else {
                var226 = -0.016429363;
            }
        } else {
            if (inputs[15] < 10.937817) {
                var226 = 0.01445415;
            } else {
                if (inputs[15] < 27.751934) {
                    var226 = -0.0058580292;
                } else {
                    var226 = 0.009037687;
                }
            }
        }
    } else {
        if (inputs[16] < 0.6946821) {
            var226 = 0.017559754;
        } else {
            if (inputs[9] < 0.97) {
                var226 = -0.009980513;
            } else {
                if (inputs[22] < 17.0) {
                    var226 = 0.00005378741;
                } else {
                    var226 = 0.01634221;
                }
            }
        }
    }
    double var227;
    if (inputs[21] < 1.0104973) {
        var227 = 0.007877644;
    } else {
        if (inputs[21] < 1.3688738) {
            var227 = -0.011625601;
        } else {
            if (inputs[3] < 19963.12) {
                if (inputs[2] < 8.768572) {
                    var227 = -0.013202159;
                } else {
                    var227 = -0.00020771542;
                }
            } else {
                var227 = 0.008816389;
            }
        }
    }
    double var228;
    if (inputs[8] < 15.56) {
        if (inputs[16] < 1.2589207) {
            if (inputs[16] < 0.5366254) {
                if (inputs[19] >= -21.662674) {
                    var228 = -0.0034428558;
                } else {
                    var228 = 0.0069666877;
                }
            } else {
                var228 = 0.015066638;
            }
        } else {
            var228 = -0.009317598;
        }
    } else {
        if (inputs[8] < 21.6675) {
            if (inputs[17] < 0.73016936) {
                var228 = 0.0034347791;
            } else {
                var228 = -0.019426424;
            }
        } else {
            if (inputs[2] < 18.526428) {
                if (inputs[2] < 15.884286) {
                    var228 = -0.00048327935;
                } else {
                    var228 = -0.013132799;
                }
            } else {
                if (inputs[17] < -1.6281271) {
                    var228 = -0.005031355;
                } else {
                    var228 = 0.010220479;
                }
            }
        }
    }
    double var229;
    if (inputs[19] >= -25.014664) {
        if (inputs[21] < 1.2268077) {
            var229 = 0.003028968;
        } else {
            if (inputs[8] < 7.06) {
                var229 = -0.016588693;
            } else {
                if (inputs[3] < 19534.355) {
                    var229 = -0.008832215;
                } else {
                    var229 = 0.0026609441;
                }
            }
        }
    } else {
        if (inputs[16] < -1.2699627) {
            if (inputs[2] < 13.091429) {
                var229 = 0.013033068;
            } else {
                var229 = 0.00757607;
            }
        } else {
            if (inputs[16] < -0.9431992) {
                var229 = -0.013316796;
            } else {
                if (inputs[3] < 18087.11) {
                    var229 = -0.002449523;
                } else {
                    var229 = 0.0057839225;
                }
            }
        }
    }
    double var230;
    if (inputs[2] < 18.608572) {
        if (inputs[15] < 20.86391) {
            if (inputs[16] < 1.1063302) {
                if (inputs[2] < 14.096429) {
                    var230 = 0.0014819758;
                } else {
                    var230 = 0.012841321;
                }
            } else {
                var230 = -0.007982328;
            }
        } else {
            if (inputs[16] < 0.35832712) {
                if (inputs[21] < 3.3423505) {
                    var230 = -0.021844665;
                } else {
                    var230 = -0.005285108;
                }
            } else {
                var230 = 0.0019643696;
            }
        }
    } else {
        if (inputs[10] < -1.087) {
            if (inputs[14] < 25.206236) {
                var230 = -0.011718284;
            } else {
                var230 = 0.0046338825;
            }
        } else {
            if (inputs[14] < 21.910452) {
                if (inputs[21] < 2.2936552) {
                    var230 = 0.0104941195;
                } else {
                    var230 = -0.0010856029;
                }
            } else {
                if (inputs[21] < 2.224668) {
                    var230 = 0.008226303;
                } else {
                    var230 = 0.015988532;
                }
            }
        }
    }
    double var231;
    if (inputs[20] >= -22.954485) {
        if (inputs[17] < -2.5052972) {
            var231 = -0.010744264;
        } else {
            if (inputs[1] < 58.232033) {
                if (inputs[16] < -0.8291251) {
                    var231 = 0.013410244;
                } else {
                    var231 = 0.0005402735;
                }
            } else {
                if (inputs[1] < 61.003597) {
                    var231 = -0.015587661;
                } else {
                    var231 = -0.00033626382;
                }
            }
        }
    } else {
        if (inputs[20] >= -27.187044) {
            var231 = 0.01250793;
        } else {
            if (inputs[16] < 0.45214638) {
                var231 = -0.008495224;
            } else {
                var231 = 0.005983666;
            }
        }
    }
    double var232;
    if (inputs[19] >= -25.014664) {
        if (inputs[13] < 5.316362) {
            if (inputs[19] < 116.51537) {
                var232 = 0.011466973;
            } else {
                var232 = -0.0072553228;
            }
        } else {
            if (inputs[12] < 0.11686466) {
                var232 = -0.014509721;
            } else {
                if (inputs[15] < 11.955792) {
                    var232 = 0.0069521964;
                } else {
                    var232 = -0.009602942;
                }
            }
        }
    } else {
        if (inputs[3] < 18075.234) {
            if (inputs[10] < -2.288) {
                if (inputs[9] < 1.17) {
                    var232 = -0.009617596;
                } else {
                    var232 = 0.002866312;
                }
            } else {
                if (inputs[7] < 59.785) {
                    var232 = 0.009986812;
                } else {
                    var232 = -0.0019147184;
                }
            }
        } else {
            if (inputs[20] < 5.842607) {
                if (inputs[5] < 18691.64) {
                    var232 = 0.017870838;
                } else {
                    var232 = 0.0037204246;
                }
            } else {
                if (inputs[15] < 22.371447) {
                    var232 = 0.008540771;
                } else {
                    var232 = -0.007512022;
                }
            }
        }
    }
    double var233;
    if (inputs[21] < 4.296845) {
        if (inputs[5] < 17364.145) {
            var233 = -0.0061198715;
        } else {
            if (inputs[17] < -2.7586765) {
                var233 = 0.011357279;
            } else {
                if (inputs[12] < -1.9500151) {
                    var233 = -0.0066082627;
                } else {
                    var233 = 0.0019457893;
                }
            }
        }
    } else {
        var233 = -0.0071307234;
    }
    double var234;
    if (inputs[20] >= 11.512124) {
        if (inputs[11] < 2.277394) {
            var234 = 0.012300854;
        } else {
            if (inputs[2] < 20.225714) {
                if (inputs[2] < 15.063571) {
                    var234 = 0.0018386922;
                } else {
                    var234 = -0.018068317;
                }
            } else {
                var234 = 0.008869612;
            }
        }
    } else {
        if (inputs[22] < 5.0) {
            if (inputs[2] < 12.375) {
                var234 = -0.014266844;
            } else {
                var234 = 0.002487493;
            }
        } else {
            if (inputs[3] < 17490.88) {
                var234 = -0.008812458;
            } else {
                if (inputs[22] < 17.0) {
                    var234 = -0.00051598344;
                } else {
                    var234 = 0.0075464174;
                }
            }
        }
    }
    double var235;
    if (inputs[12] < 4.0963235) {
        if (inputs[9] < 0.71) {
            var235 = -0.008270117;
        } else {
            if (inputs[2] < 17.248571) {
                if (inputs[14] < 11.51551) {
                    var235 = 0.0020045824;
                } else {
                    var235 = -0.00630251;
                }
            } else {
                if (inputs[6] < 17577.625) {
                    var235 = -0.0026541082;
                } else {
                    var235 = 0.006421842;
                }
            }
        }
    } else {
        var235 = -0.006408118;
    }
    double var236;
    if (inputs[14] < 22.059683) {
        if (inputs[15] < 24.474863) {
            if (inputs[21] < 2.7594576) {
                if (inputs[5] < 19729.697) {
                    var236 = 0.0014501448;
                } else {
                    var236 = -0.014370519;
                }
            } else {
                if (inputs[6] < 19771.96) {
                    var236 = 0.0012949925;
                } else {
                    var236 = 0.01930039;
                }
            }
        } else {
            if (inputs[16] < 0.45865735) {
                var236 = -0.010921261;
            } else {
                var236 = -0.0014680368;
            }
        }
    } else {
        if (inputs[2] < 19.303572) {
            if (inputs[9] < 0.95) {
                var236 = 0.0063145454;
            } else {
                var236 = -0.008600056;
            }
        } else {
            if (inputs[9] < 1.11) {
                var236 = 0.0006014629;
            } else {
                var236 = 0.011335449;
            }
        }
    }
    double var237;
    if (inputs[9] < 1.12) {
        if (inputs[4] < 17834.82) {
            if (inputs[12] < 1.8622632) {
                var237 = -0.020323938;
            } else {
                var237 = -0.0013020554;
            }
        } else {
            if (inputs[3] < 18002.88) {
                var237 = 0.013005364;
            } else {
                if (inputs[5] < 18219.05) {
                    var237 = -0.011267669;
                } else {
                    var237 = 0.002858314;
                }
            }
        }
    } else {
        if (inputs[9] < 1.29) {
            var237 = 0.01335367;
        } else {
            if (inputs[10] < 1.088) {
                if (inputs[13] < 11.554856) {
                    var237 = 0.005498451;
                } else {
                    var237 = -0.0041877665;
                }
            } else {
                if (inputs[20] < 13.937125) {
                    var237 = -0.006975719;
                } else {
                    var237 = 0.0032694088;
                }
            }
        }
    }
    double var238;
    if (inputs[19] < -21.662674) {
        var238 = 0.0088451365;
    } else {
        if (inputs[15] < 5.3504486) {
            var238 = -0.007787814;
        } else {
            if (inputs[15] < 10.543079) {
                if (inputs[8] < 19.75) {
                    var238 = 0.012118283;
                } else {
                    var238 = -0.00056269404;
                }
            } else {
                if (inputs[19] < 16.339067) {
                    var238 = -0.012935716;
                } else {
                    var238 = -0.000302423;
                }
            }
        }
    }
    double var239;
    if (inputs[16] < 1.888416) {
        if (inputs[3] < 19961.445) {
            if (inputs[4] < 19701.36) {
                if (inputs[17] < 2.6756628) {
                    var239 = 0.0029531359;
                } else {
                    var239 = -0.002675029;
                }
            } else {
                var239 = -0.009325451;
            }
        } else {
            var239 = 0.008458471;
        }
    } else {
        var239 = -0.00842972;
    }
    double var240;
    if (inputs[22] < 3.0) {
        if (inputs[12] < 0.24931578) {
            var240 = -0.0079347715;
        } else {
            var240 = 0.012165197;
        }
    } else {
        if (inputs[12] < 3.9619398) {
            if (inputs[21] < 1.0292515) {
                var240 = 0.009290735;
            } else {
                if (inputs[21] < 1.7890501) {
                    var240 = -0.0074052652;
                } else {
                    var240 = 0.0009966217;
                }
            }
        } else {
            var240 = -0.010900332;
        }
    }
    double var241;
    if (inputs[20] < -27.187044) {
        var241 = -0.011784667;
    } else {
        if (inputs[20] < -22.954485) {
            var241 = 0.013408679;
        } else {
            if (inputs[12] < -1.9500151) {
                if (inputs[14] < 21.910452) {
                    var241 = -0.017860752;
                } else {
                    var241 = 0.0005874413;
                }
            } else {
                if (inputs[19] < -25.014664) {
                    var241 = 0.011298769;
                } else {
                    var241 = -0.00050096185;
                }
            }
        }
    }
    double var242;
    if (inputs[20] < -27.187044) {
        var242 = -0.011355114;
    } else {
        if (inputs[20] < -23.177559) {
            var242 = 0.012268089;
        } else {
            if (inputs[14] < 22.059683) {
                if (inputs[1] < 33.771202) {
                    var242 = -0.014111779;
                } else {
                    var242 = -0.0011091734;
                }
            } else {
                if (inputs[13] < 24.362001) {
                    var242 = 0.0077892435;
                } else {
                    var242 = -0.0015940778;
                }
            }
        }
    }
    double var243;
    if (inputs[20] < 11.512124) {
        if (inputs[16] < -0.9431992) {
            if (inputs[12] < 0.118857145) {
                var243 = -0.016561076;
            } else {
                var243 = -0.0044705006;
            }
        } else {
            if (inputs[16] < -0.77141327) {
                var243 = 0.01583167;
            } else {
                if (inputs[20] < 5.6830163) {
                    var243 = 0.0023089256;
                } else {
                    var243 = -0.008709642;
                }
            }
        }
    } else {
        if (inputs[16] < -1.2699627) {
            if (inputs[20] >= 17.413336) {
                var243 = 0.0073497654;
            } else {
                var243 = 0.017255781;
            }
        } else {
            if (inputs[21] < 2.860778) {
                var243 = 0.0098051755;
            } else {
                if (inputs[21] < 3.5348291) {
                    var243 = -0.010164977;
                } else {
                    var243 = 0.004465735;
                }
            }
        }
    }
    double var244;
    if (inputs[15] < 24.841236) {
        if (inputs[16] < 0.28437614) {
            if (inputs[16] < -0.4755567) {
                if (inputs[1] < 66.50139) {
                    var244 = -0.0019521051;
                } else {
                    var244 = 0.008586983;
                }
            } else {
                var244 = -0.009984625;
            }
        } else {
            if (inputs[16] < 1.1315215) {
                if (inputs[20] < 0.5081556) {
                    var244 = 0.019409066;
                } else {
                    var244 = 0.0050669303;
                }
            } else {
                if (inputs[10] < -4.775) {
                    var244 = 0.0039248373;
                } else {
                    var244 = -0.009390207;
                }
            }
        }
    } else {
        if (inputs[15] < 28.955471) {
            if (inputs[10] < 0.675) {
                var244 = -0.0051107057;
            } else {
                var244 = -0.018871257;
            }
        } else {
            if (inputs[22] < 18.0) {
                if (inputs[13] < 18.802526) {
                    var244 = -0.0073680147;
                } else {
                    var244 = 0.0038478393;
                }
            } else {
                var244 = 0.0076733795;
            }
        }
    }
    double var245;
    if (inputs[22] < 19.0) {
        if (inputs[3] < 17820.44) {
            if (inputs[20] < 27.652756) {
                if (inputs[16] < 0.25625527) {
                    var245 = -0.017016305;
                } else {
                    var245 = -0.0035646514;
                }
            } else {
                var245 = 0.007296084;
            }
        } else {
            if (inputs[13] < 16.299868) {
                if (inputs[13] < 12.834479) {
                    var245 = 0.0009518588;
                } else {
                    var245 = -0.01167446;
                }
            } else {
                if (inputs[14] < 28.204103) {
                    var245 = 0.0135353515;
                } else {
                    var245 = -0.002436696;
                }
            }
        }
    } else {
        if (inputs[20] < -7.8533735) {
            var245 = 0.012668947;
        } else {
            var245 = 0.00089442276;
        }
    }
    double var246;
    if (inputs[13] < 34.50541) {
        if (inputs[10] < -15.389) {
            var246 = 0.010008;
        } else {
            if (inputs[13] < 22.827894) {
                if (inputs[2] < 31.704287) {
                    var246 = 0.00008466448;
                } else {
                    var246 = 0.009690669;
                }
            } else {
                var246 = -0.011300035;
            }
        }
    } else {
        var246 = -0.008515898;
    }
    double var247;
    if (inputs[14] < 32.257446) {
        if (inputs[12] < 0.118857145) {
            if (inputs[14] < 25.206236) {
                if (inputs[1] < 27.00644) {
                    var247 = 0.0071078283;
                } else {
                    var247 = -0.0056004757;
                }
            } else {
                var247 = 0.007330106;
            }
        } else {
            if (inputs[12] < 1.7146692) {
                if (inputs[22] < 3.0) {
                    var247 = 0.018263157;
                } else {
                    var247 = 0.003263686;
                }
            } else {
                if (inputs[14] < 14.447264) {
                    var247 = -0.00891595;
                } else {
                    var247 = 0.00503773;
                }
            }
        }
    } else {
        var247 = -0.007223027;
    }
    double var248;
    if (inputs[19] < -25.014664) {
        var248 = 0.010662674;
    } else {
        if (inputs[19] < 44.674747) {
            if (inputs[20] < 11.40759) {
                if (inputs[16] < 0.47722974) {
                    var248 = -0.013661493;
                } else {
                    var248 = -0.004355064;
                }
            } else {
                var248 = 0.0027560627;
            }
        } else {
            if (inputs[7] < 20.74) {
                if (inputs[13] < 4.166156) {
                    var248 = -0.00045379082;
                } else {
                    var248 = 0.017620241;
                }
            } else {
                if (inputs[21] < 3.277861) {
                    var248 = -0.0032515447;
                } else {
                    var248 = 0.002773384;
                }
            }
        }
    }
    double var249;
    if (inputs[20] >= 27.652756) {
        var249 = 0.009396965;
    } else {
        if (inputs[12] < 4.0963235) {
            if (inputs[22] < 19.0) {
                if (inputs[4] < 17701.785) {
                    var249 = -0.007499588;
                } else {
                    var249 = 0.0011592162;
                }
            } else {
                if (inputs[21] < 2.8798838) {
                    var249 = 0.001283721;
                } else {
                    var249 = 0.014325377;
                }
            }
        } else {
            var249 = -0.0073786834;
        }
    }
    double var250;
    if (inputs[20] >= 11.512124) {
        if (inputs[20] < 13.654511) {
            var250 = 0.015029148;
        } else {
            if (inputs[8] < 21.635) {
                if (inputs[3] < 18071.375) {
                    var250 = 0.003919283;
                } else {
                    var250 = -0.009931665;
                }
            } else {
                if (inputs[8] < 49.125) {
                    var250 = 0.010194197;
                } else {
                    var250 = -0.0031938625;
                }
            }
        }
    } else {
        if (inputs[20] >= 7.6966357) {
            var250 = -0.012080167;
        } else {
            if (inputs[4] < 19661.52) {
                if (inputs[6] < 18220.365) {
                    var250 = -0.0033789817;
                } else {
                    var250 = 0.0066809747;
                }
            } else {
                if (inputs[7] < 13.9025) {
                    var250 = 0.0010571453;
                } else {
                    var250 = -0.01457013;
                }
            }
        }
    }
    double var251;
    if (inputs[15] < 10.543079) {
        if (inputs[2] < 10.026428) {
            if (inputs[17] < 2.8439124) {
                if (inputs[3] < 19736.24) {
                    var251 = 0.003643075;
                } else {
                    var251 = -0.01113247;
                }
            } else {
                var251 = 0.013778972;
            }
        } else {
            var251 = 0.018008968;
        }
    } else {
        if (inputs[2] < 14.096429) {
            if (inputs[14] < 11.459211) {
                var251 = 0.0013797685;
            } else {
                var251 = -0.020984849;
            }
        } else {
            if (inputs[17] < 3.277861) {
                if (inputs[17] < 2.8439124) {
                    var251 = 0.0010912312;
                } else {
                    var251 = -0.012701951;
                }
            } else {
                var251 = 0.009547578;
            }
        }
    }
    double var252;
    if (inputs[19] < -25.014664) {
        var252 = 0.013471675;
    } else {
        if (inputs[15] < 5.356141) {
            var252 = -0.006931362;
        } else {
            if (inputs[5] < 19922.148) {
                if (inputs[2] < 31.704287) {
                    var252 = -0.0005946629;
                } else {
                    var252 = 0.008316422;
                }
            } else {
                var252 = 0.01258354;
            }
        }
    }
    double var253;
    if (inputs[4] < 19701.36) {
        if (inputs[5] < 19529.52) {
            if (inputs[4] < 19410.475) {
                if (inputs[15] < 11.752636) {
                    var253 = 0.0084522925;
                } else {
                    var253 = -0.0005406402;
                }
            } else {
                var253 = -0.013485634;
            }
        } else {
            var253 = 0.009270198;
        }
    } else {
        if (inputs[21] < 2.7594576) {
            var253 = -0.01340096;
        } else {
            var253 = 0.0037051698;
        }
    }
    double var254;
    if (inputs[9] < 0.7) {
        var254 = -0.009888851;
    } else {
        if (inputs[2] < 18.608572) {
            if (inputs[14] < 23.642353) {
                if (inputs[1] < 27.00644) {
                    var254 = 0.013778203;
                } else {
                    var254 = -0.0013341913;
                }
            } else {
                var254 = -0.012598525;
            }
        } else {
            if (inputs[2] < 27.15) {
                if (inputs[21] < 2.507296) {
                    var254 = 0.012115844;
                } else {
                    var254 = 0.0032786222;
                }
            } else {
                if (inputs[8] < 30.445) {
                    var254 = -0.012277581;
                } else {
                    var254 = 0.0072820354;
                }
            }
        }
    }
    double var255;
    if (inputs[19] >= -21.662674) {
        if (inputs[10] < 1.088) {
            if (inputs[12] < 0.118857145) {
                if (inputs[5] < 19591.555) {
                    var255 = -0.014215743;
                } else {
                    var255 = 0.0025286837;
                }
            } else {
                var255 = 0.009674721;
            }
        } else {
            if (inputs[20] < 11.40759) {
                var255 = -0.013329393;
            } else {
                var255 = 0.00048688715;
            }
        }
    } else {
        if (inputs[9] < 2.42) {
            if (inputs[9] < 1.95) {
                if (inputs[9] < 1.13) {
                    var255 = -0.0006776118;
                } else {
                    var255 = 0.008559683;
                }
            } else {
                var255 = -0.008755242;
            }
        } else {
            if (inputs[19] >= -47.614716) {
                var255 = 0.014044019;
            } else {
                var255 = 0.0050217793;
            }
        }
    }
    double var256;
    if (inputs[12] < 3.7038045) {
        if (inputs[12] < 2.9989324) {
            if (inputs[4] < 17339.314) {
                var256 = -0.0100309085;
            } else {
                if (inputs[16] < 0.47722974) {
                    var256 = -0.0011340212;
                } else {
                    var256 = 0.0048182607;
                }
            }
        } else {
            var256 = 0.013771456;
        }
    } else {
        if (inputs[12] < 5.6458645) {
            var256 = -0.012195544;
        } else {
            var256 = 0.0011793284;
        }
    }
    double var257;
    if (inputs[8] < 58.8575) {
        if (inputs[12] < 1.2430676) {
            if (inputs[21] < 2.90849) {
                if (inputs[14] < 29.229725) {
                    var257 = -0.0026582263;
                } else {
                    var257 = 0.009989017;
                }
            } else {
                if (inputs[8] < 36.8875) {
                    var257 = 0.010987955;
                } else {
                    var257 = -0.005421215;
                }
            }
        } else {
            if (inputs[19] >= -14.190108) {
                var257 = -0.012037627;
            } else {
                if (inputs[9] < 1.13) {
                    var257 = -0.008627854;
                } else {
                    var257 = 0.0032434838;
                }
            }
        }
    } else {
        if (inputs[12] < 0.7269549) {
            var257 = -0.0015589552;
        } else {
            var257 = 0.0116375005;
        }
    }
    double var258;
    if (inputs[4] < 19410.475) {
        if (inputs[14] < 11.382567) {
            if (inputs[13] < 7.097722) {
                var258 = 0.0010237788;
            } else {
                var258 = 0.012633333;
            }
        } else {
            if (inputs[8] < 59.715) {
                if (inputs[1] < 72.62081) {
                    var258 = 0.00017234577;
                } else {
                    var258 = -0.012340367;
                }
            } else {
                var258 = 0.00828837;
            }
        }
    } else {
        if (inputs[5] < 19529.52) {
            var258 = -0.014782055;
        } else {
            if (inputs[4] < 19661.52) {
                var258 = 0.009233108;
            } else {
                if (inputs[21] < 2.7443748) {
                    var258 = -0.011976957;
                } else {
                    var258 = 0.0036129178;
                }
            }
        }
    }
    double var259;
    if (inputs[20] < -27.187044) {
        var259 = -0.012028048;
    } else {
        if (inputs[20] < -22.954485) {
            var259 = 0.0110706175;
        } else {
            if (inputs[12] < -1.5242406) {
                if (inputs[14] < 20.733627) {
                    var259 = -0.02077571;
                } else {
                    var259 = 0.00018245695;
                }
            } else {
                if (inputs[20] >= 6.039089) {
                    var259 = -0.0014891743;
                } else {
                    var259 = 0.00605642;
                }
            }
        }
    }
    double var260;
    if (inputs[1] < 76.038605) {
        if (inputs[3] < 17782.664) {
            if (inputs[10] < 1.925) {
                if (inputs[20] < -18.635002) {
                    var260 = -0.0064952406;
                } else {
                    var260 = -0.013535573;
                }
            } else {
                var260 = 0.0029186613;
            }
        } else {
            if (inputs[13] < 26.781828) {
                if (inputs[14] < 22.059683) {
                    var260 = 0.0010235292;
                } else {
                    var260 = 0.012050761;
                }
            } else {
                var260 = -0.0058513097;
            }
        }
    } else {
        var260 = 0.010242828;
    }
    double var261;
    if (inputs[2] < 20.899286) {
        if (inputs[16] < -1.9654067) {
            var261 = 0.008180881;
        } else {
            if (inputs[10] < 2.006) {
                if (inputs[17] < 2.0759547) {
                    var261 = -0.0006245197;
                } else {
                    var261 = 0.009177082;
                }
            } else {
                if (inputs[3] < 18002.88) {
                    var261 = 0.0018331198;
                } else {
                    var261 = -0.011746228;
                }
            }
        }
    } else {
        if (inputs[14] < 19.303827) {
            var261 = -0.0033639586;
        } else {
            if (inputs[2] < 26.543571) {
                if (inputs[16] < 0.31111237) {
                    var261 = 0.0058437623;
                } else {
                    var261 = 0.01907402;
                }
            } else {
                if (inputs[6] < 18053.82) {
                    var261 = -0.0061805234;
                } else {
                    var261 = 0.0076183006;
                }
            }
        }
    }
    double var262;
    if (inputs[10] < -16.008) {
        var262 = -0.009512574;
    } else {
        if (inputs[11] < -8.162364) {
            var262 = 0.011490204;
        } else {
            if (inputs[20] >= -22.954485) {
                if (inputs[12] < -1.9500151) {
                    var262 = -0.011023175;
                } else {
                    var262 = 0.0004390456;
                }
            } else {
                if (inputs[20] >= -27.187044) {
                    var262 = 0.012362154;
                } else {
                    var262 = -0.001623203;
                }
            }
        }
    }
    double var263;
    if (inputs[12] < 0.8105113) {
        if (inputs[4] < 17518.006) {
            var263 = -0.012690223;
        } else {
            if (inputs[1] < 57.86574) {
                if (inputs[10] < -0.266) {
                    var263 = 0.0009168394;
                } else {
                    var263 = 0.012544332;
                }
            } else {
                if (inputs[20] < 11.238702) {
                    var263 = -0.016108397;
                } else {
                    var263 = 0.0029168227;
                }
            }
        }
    } else {
        if (inputs[20] >= 5.86199) {
            if (inputs[12] < 4.0963235) {
                if (inputs[2] < 18.865715) {
                    var263 = 0.00013396994;
                } else {
                    var263 = 0.013983742;
                }
            } else {
                var263 = -0.008301006;
            }
        } else {
            var263 = 0.013672477;
        }
    }
    double var264;
    if (inputs[1] < 79.12076) {
        if (inputs[3] < 17782.664) {
            if (inputs[13] < 12.995694) {
                var264 = -0.013630224;
            } else {
                if (inputs[10] < -10.412) {
                    var264 = -0.009740172;
                } else {
                    var264 = 0.00831326;
                }
            }
        } else {
            if (inputs[13] < 5.316362) {
                if (inputs[21] < 2.9648397) {
                    var264 = 0.00041197264;
                } else {
                    var264 = 0.016234595;
                }
            } else {
                if (inputs[13] < 8.466966) {
                    var264 = -0.009666108;
                } else {
                    var264 = 0.0009009066;
                }
            }
        }
    } else {
        var264 = 0.008774408;
    }
    double var265;
    if (inputs[1] < 40.12216) {
        if (inputs[8] < 8.175) {
            var265 = -0.010681897;
        } else {
            if (inputs[7] < 126.965) {
                if (inputs[2] < 13.545) {
                    var265 = -0.007419834;
                } else {
                    var265 = 0.004779439;
                }
            } else {
                var265 = -0.01033349;
            }
        }
    } else {
        if (inputs[1] < 58.232033) {
            var265 = 0.009396586;
        } else {
            if (inputs[17] < 1.6180851) {
                var265 = -0.010074904;
            } else {
                if (inputs[2] < 18.608572) {
                    var265 = -0.0016166718;
                } else {
                    var265 = 0.0061749546;
                }
            }
        }
    }
    double var266;
    if (inputs[15] < 5.356141) {
        var266 = -0.010775043;
    } else {
        if (inputs[3] < 19864.836) {
            if (inputs[2] < 9.866428) {
                var266 = -0.008138619;
            } else {
                if (inputs[15] < 11.323254) {
                    var266 = 0.013151513;
                } else {
                    var266 = -0.0002171483;
                }
            }
        } else {
            var266 = 0.01004819;
        }
    }
    double var267;
    if (inputs[20] < -27.187044) {
        var267 = -0.010685829;
    } else {
        if (inputs[20] < -23.177559) {
            var267 = 0.011804044;
        } else {
            if (inputs[17] < -2.5052972) {
                var267 = -0.011778333;
            } else {
                if (inputs[19] >= 116.51537) {
                    var267 = -0.010491976;
                } else {
                    var267 = 0.00002851818;
                }
            }
        }
    }
    double var268;
    if (inputs[13] < 34.50541) {
        if (inputs[7] < 98.065) {
            if (inputs[7] < 82.5025) {
                if (inputs[11] < -7.7435756) {
                    var268 = 0.012485489;
                } else {
                    var268 = 0.00036698705;
                }
            } else {
                var268 = -0.008718703;
            }
        } else {
            if (inputs[8] < 56.1625) {
                var268 = 0.013763631;
            } else {
                if (inputs[20] >= -14.820083) {
                    var268 = -0.0030140374;
                } else {
                    var268 = 0.006683434;
                }
            }
        }
    } else {
        var268 = -0.008018545;
    }
    double var269;
    if (inputs[12] < 4.0963235) {
        if (inputs[16] < 0.28437614) {
            if (inputs[16] < -0.49620417) {
                if (inputs[1] < 58.232033) {
                    var269 = 0.0074346224;
                } else {
                    var269 = -0.0020687168;
                }
            } else {
                if (inputs[21] < 2.9648397) {
                    var269 = -0.018312998;
                } else {
                    var269 = -0.005678776;
                }
            }
        } else {
            if (inputs[7] < 126.965) {
                if (inputs[2] < 11.705) {
                    var269 = -0.0023059642;
                } else {
                    var269 = 0.008289066;
                }
            } else {
                var269 = -0.00610503;
            }
        }
    } else {
        var269 = -0.0072525046;
    }
    double var270;
    if (inputs[20] < 27.652756) {
        if (inputs[4] < 17834.82) {
            if (inputs[16] < 0.25625527) {
                var270 = -0.014064814;
            } else {
                var270 = 0.0010829427;
            }
        } else {
            if (inputs[4] < 17976.21) {
                var270 = 0.014005943;
            } else {
                if (inputs[20] < 6.039089) {
                    var270 = 0.00257483;
                } else {
                    var270 = -0.0025003369;
                }
            }
        }
    } else {
        var270 = 0.006965055;
    }
    double var271;
    if (inputs[1] < 79.82045) {
        if (inputs[15] < 32.05365) {
            if (inputs[7] < 100.15) {
                if (inputs[8] < 38.9425) {
                    var271 = -0.0000721695;
                } else {
                    var271 = -0.012934639;
                }
            } else {
                if (inputs[2] < 18.427143) {
                    var271 = 0.0028774152;
                } else {
                    var271 = 0.01000743;
                }
            }
        } else {
            if (inputs[2] < 31.261429) {
                var271 = -0.01175964;
            } else {
                var271 = -0.0019534694;
            }
        }
    } else {
        var271 = 0.008885148;
    }
    double var272;
    if (inputs[20] < -27.187044) {
        var272 = -0.0077345856;
    } else {
        if (inputs[20] < -24.019466) {
            var272 = 0.015047311;
        } else {
            if (inputs[17] < -2.5052972) {
                var272 = -0.010042276;
            } else {
                if (inputs[15] < 11.955792) {
                    var272 = 0.0046645296;
                } else {
                    var272 = -0.00080599124;
                }
            }
        }
    }
    double var273;
    if (inputs[16] < 1.1342015) {
        if (inputs[12] < 0.9021729) {
            if (inputs[8] < 38.9425) {
                if (inputs[16] < 0.39848062) {
                    var273 = -0.0018931011;
                } else {
                    var273 = 0.012026683;
                }
            } else {
                var273 = -0.00741565;
            }
        } else {
            if (inputs[12] < 1.7146692) {
                var273 = 0.011511357;
            } else {
                if (inputs[12] < 2.6844285) {
                    var273 = -0.006463976;
                } else {
                    var273 = 0.004211339;
                }
            }
        }
    } else {
        if (inputs[11] < -1.9887879) {
            var273 = 0.0047166594;
        } else {
            var273 = -0.014009052;
        }
    }
    double var274;
    if (inputs[19] < -25.014664) {
        var274 = 0.009045697;
    } else {
        if (inputs[2] < 17.687857) {
            if (inputs[2] < 15.951428) {
                if (inputs[1] < 73.228836) {
                    var274 = -0.002625787;
                } else {
                    var274 = 0.008229943;
                }
            } else {
                var274 = -0.012757938;
            }
        } else {
            if (inputs[18] < 1.0) {
                if (inputs[10] < 2.175) {
                    var274 = 0.00069671567;
                } else {
                    var274 = 0.010334555;
                }
            } else {
                if (inputs[22] < 20.0) {
                    var274 = -0.0062221317;
                } else {
                    var274 = 0.008040576;
                }
            }
        }
    }
    double var275;
    if (inputs[7] < 8.37) {
        var275 = 0.00970824;
    } else {
        if (inputs[7] < 89.905) {
            if (inputs[8] < 17.39) {
                if (inputs[2] < 26.822857) {
                    var275 = 0.0031401843;
                } else {
                    var275 = -0.008142469;
                }
            } else {
                if (inputs[12] < 0.10512782) {
                    var275 = -0.014169907;
                } else {
                    var275 = -0.0012071566;
                }
            }
        } else {
            if (inputs[8] < 45.91) {
                var275 = 0.013848261;
            } else {
                if (inputs[15] < 25.346832) {
                    var275 = 0.007619305;
                } else {
                    var275 = -0.0056729554;
                }
            }
        }
    }
    double var276;
    if (inputs[21] < 2.7594576) {
        if (inputs[5] < 19729.697) {
            if (inputs[7] < 35.25) {
                if (inputs[0] < 1.0) {
                    var276 = 0.011096162;
                } else {
                    var276 = -0.0034815462;
                }
            } else {
                if (inputs[3] < 17744.16) {
                    var276 = -0.013874085;
                } else {
                    var276 = -0.0012437487;
                }
            }
        } else {
            var276 = -0.014041146;
        }
    } else {
        if (inputs[3] < 19774.34) {
            if (inputs[7] < 38.345) {
                var276 = -0.015556098;
            } else {
                if (inputs[3] < 18002.88) {
                    var276 = 0.008506435;
                } else {
                    var276 = -0.0011023153;
                }
            }
        } else {
            var276 = 0.012702202;
        }
    }
    double var277;
    if (inputs[4] < 19959.676) {
        if (inputs[20] >= 7.6966357) {
            if (inputs[13] < 8.557412) {
                if (inputs[4] < 19220.84) {
                    var277 = -0.017932283;
                } else {
                    var277 = -0.006787931;
                }
            } else {
                if (inputs[15] < 21.425499) {
                    var277 = 0.00980487;
                } else {
                    var277 = -0.0027278627;
                }
            }
        } else {
            if (inputs[8] < 17.39) {
                if (inputs[8] < 8.0) {
                    var277 = 0.00083816546;
                } else {
                    var277 = 0.0125944;
                }
            } else {
                if (inputs[2] < 11.651428) {
                    var277 = -0.0126328375;
                } else {
                    var277 = -0.0000024346862;
                }
            }
        }
    } else {
        var277 = 0.008190175;
    }
    double var278;
    if (inputs[15] < 10.543079) {
        if (inputs[15] < 8.064122) {
            if (inputs[11] < 0.40363637) {
                var278 = -0.008635992;
            } else {
                var278 = 0.004946816;
            }
        } else {
            if (inputs[20] >= 1.0259343) {
                var278 = 0.0038864936;
            } else {
                var278 = 0.01738458;
            }
        }
    } else {
        if (inputs[14] < 8.967584) {
            var278 = -0.01218193;
        } else {
            if (inputs[7] < 91.31) {
                if (inputs[7] < 78.65) {
                    var278 = -0.00027110404;
                } else {
                    var278 = -0.0127937235;
                }
            } else {
                if (inputs[13] < 22.239845) {
                    var278 = 0.0022209017;
                } else {
                    var278 = 0.010609038;
                }
            }
        }
    }
    double var279;
    if (inputs[2] < 9.866428) {
        if (inputs[13] < 4.6668086) {
            if (inputs[21] < 2.8085456) {
                if (inputs[17] < 1.0104973) {
                    var279 = 0.0040638046;
                } else {
                    var279 = -0.013208796;
                }
            } else {
                var279 = 0.009566107;
            }
        } else {
            var279 = -0.015583253;
        }
    } else {
        if (inputs[15] < 10.937817) {
            var279 = 0.014493643;
        } else {
            if (inputs[20] >= 12.193009) {
                if (inputs[22] < 6.0) {
                    var279 = 0.015670812;
                } else {
                    var279 = 0.00036020897;
                }
            } else {
                if (inputs[22] < 6.0) {
                    var279 = -0.014238084;
                } else {
                    var279 = -0.000689157;
                }
            }
        }
    }
    double var280;
    if (inputs[4] < 17834.82) {
        if (inputs[7] < 42.7525) {
            var280 = 0.0052195685;
        } else {
            if (inputs[21] < 2.9178314) {
                var280 = -0.017564723;
            } else {
                var280 = -0.0007174608;
            }
        }
    } else {
        if (inputs[5] < 17959.43) {
            var280 = 0.015408388;
        } else {
            if (inputs[4] < 18076.11) {
                var280 = -0.008794266;
            } else {
                if (inputs[3] < 18229.18) {
                    var280 = 0.009439842;
                } else {
                    var280 = 0.0006832704;
                }
            }
        }
    }
    double var281;
    if (inputs[8] < 7.06) {
        if (inputs[8] < 3.97) {
            if (inputs[13] < 3.9692447) {
                var281 = -0.011046583;
            } else {
                var281 = 0.003004441;
            }
        } else {
            var281 = -0.0133923;
        }
    } else {
        if (inputs[14] < 28.204103) {
            if (inputs[21] < 1.3688738) {
                var281 = -0.006319325;
            } else {
                if (inputs[21] < 2.4094586) {
                    var281 = 0.007416079;
                } else {
                    var281 = 0.00046062;
                }
            }
        } else {
            if (inputs[22] < 16.0) {
                var281 = -0.0151803605;
            } else {
                var281 = 0.002926863;
            }
        }
    }
    double var282;
    if (inputs[15] < 27.751934) {
        if (inputs[15] < 24.826832) {
            if (inputs[8] < 2.065) {
                var282 = 0.007859495;
            } else {
                if (inputs[8] < 57.755) {
                    var282 = -0.002567669;
                } else {
                    var282 = 0.008835452;
                }
            }
        } else {
            var282 = -0.012006499;
        }
    } else {
        if (inputs[8] < 49.015) {
            if (inputs[17] < -2.4407218) {
                var282 = 0.014861498;
            } else {
                var282 = 0.0041456064;
            }
        } else {
            var282 = -0.003924279;
        }
    }
    double var283;
    if (inputs[16] < 0.47722974) {
        if (inputs[20] < -11.605066) {
            if (inputs[4] < 18648.81) {
                var283 = -0.0003404116;
            } else {
                var283 = -0.018108482;
            }
        } else {
            if (inputs[8] < 2.2525) {
                var283 = 0.013124551;
            } else {
                if (inputs[21] < 4.1344595) {
                    var283 = -0.0019730218;
                } else {
                    var283 = 0.0074135605;
                }
            }
        }
    } else {
        if (inputs[16] < 0.6946821) {
            var283 = 0.013269965;
        } else {
            if (inputs[20] < -23.177559) {
                var283 = 0.009901796;
            } else {
                if (inputs[18] < 1.0) {
                    var283 = 0.0011585453;
                } else {
                    var283 = -0.0129745975;
                }
            }
        }
    }
    double var284;
    if (inputs[13] < 34.50541) {
        if (inputs[20] >= 7.3229785) {
            if (inputs[20] < 11.238702) {
                var284 = -0.0133432355;
            } else {
                if (inputs[20] < 13.654511) {
                    var284 = 0.01260079;
                } else {
                    var284 = -0.00130882;
                }
            }
        } else {
            if (inputs[21] < 2.7594576) {
                if (inputs[5] < 19729.697) {
                    var284 = 0.0028221547;
                } else {
                    var284 = -0.010014193;
                }
            } else {
                if (inputs[8] < 31.81) {
                    var284 = 0.0142385885;
                } else {
                    var284 = -0.0022254132;
                }
            }
        }
    } else {
        var284 = -0.006806527;
    }
    double var285;
    if (inputs[13] < 5.316362) {
        if (inputs[19] >= 116.51537) {
            var285 = -0.005543388;
        } else {
            if (inputs[16] < -0.8291251) {
                var285 = 0.013709239;
            } else {
                var285 = 0.00077714445;
            }
        }
    } else {
        if (inputs[13] < 7.068011) {
            var285 = -0.010841911;
        } else {
            if (inputs[20] < 15.040677) {
                if (inputs[10] < 7.125) {
                    var285 = -0.00060107483;
                } else {
                    var285 = -0.01620339;
                }
            } else {
                if (inputs[16] < -1.3455857) {
                    var285 = 0.013323313;
                } else {
                    var285 = -0.00009909457;
                }
            }
        }
    }
    double var286;
    if (inputs[4] < 19701.36) {
        if (inputs[1] < 69.07136) {
            if (inputs[5] < 19511.564) {
                if (inputs[16] < -0.9431992) {
                    var286 = -0.005607016;
                } else {
                    var286 = 0.0024009827;
                }
            } else {
                var286 = 0.013547404;
            }
        } else {
            if (inputs[7] < 89.905) {
                var286 = -0.011512743;
            } else {
                var286 = 0.005217449;
            }
        }
    } else {
        if (inputs[4] < 19887.025) {
            var286 = -0.011476884;
        } else {
            var286 = 0.0022381488;
        }
    }
    double var287;
    if (inputs[16] < -0.9431992) {
        if (inputs[12] < -0.09117293) {
            var287 = -0.013225438;
        } else {
            if (inputs[13] < 4.6881022) {
                var287 = 0.008421784;
            } else {
                if (inputs[10] < 5.124) {
                    var287 = -0.013311039;
                } else {
                    var287 = -0.00020014313;
                }
            }
        }
    } else {
        if (inputs[16] < -0.77141327) {
            var287 = 0.013707906;
        } else {
            if (inputs[1] < 70.14485) {
                if (inputs[20] < 17.607653) {
                    var287 = 0.0005716122;
                } else {
                    var287 = 0.013083278;
                }
            } else {
                var287 = -0.009056497;
            }
        }
    }
    double var288;
    if (inputs[4] < 19959.676) {
        if (inputs[16] < -0.4755567) {
            if (inputs[1] < 58.232033) {
                if (inputs[15] < 19.656555) {
                    var288 = 0.017568018;
                } else {
                    var288 = 0.003970195;
                }
            } else {
                if (inputs[1] < 62.852398) {
                    var288 = -0.018078186;
                } else {
                    var288 = 0.0015030791;
                }
            }
        } else {
            if (inputs[1] < 70.14485) {
                if (inputs[16] < 0.18087454) {
                    var288 = -0.010423218;
                } else {
                    var288 = 0.0006522166;
                }
            } else {
                var288 = -0.01746708;
            }
        }
    } else {
        var288 = 0.0056362594;
    }
    double var289;
    if (inputs[19] < -21.662674) {
        var289 = 0.007408014;
    } else {
        if (inputs[17] < -0.9925697) {
            if (inputs[4] < 17586.89) {
                var289 = -0.01564343;
            } else {
                if (inputs[19] < 46.875935) {
                    var289 = -0.01221215;
                } else {
                    var289 = 0.0018012903;
                }
            }
        } else {
            if (inputs[10] < 1.088) {
                if (inputs[15] < 9.211346) {
                    var289 = 0.0011364596;
                } else {
                    var289 = 0.016433205;
                }
            } else {
                if (inputs[10] < 1.937) {
                    var289 = -0.012014874;
                } else {
                    var289 = 0.0007895239;
                }
            }
        }
    }
    double var290;
    if (inputs[9] < 0.7) {
        var290 = -0.0069499034;
    } else {
        if (inputs[2] < 18.883572) {
            if (inputs[11] < 1.8196363) {
                if (inputs[22] < 3.0) {
                    var290 = 0.010189954;
                } else {
                    var290 = -0.0016256905;
                }
            } else {
                if (inputs[16] < -1.2278502) {
                    var290 = 0.0039880257;
                } else {
                    var290 = -0.013882358;
                }
            }
        } else {
            if (inputs[1] < 62.15389) {
                if (inputs[22] < 16.0) {
                    var290 = -0.0077762655;
                } else {
                    var290 = 0.003099147;
                }
            } else {
                if (inputs[2] < 24.596428) {
                    var290 = 0.013732315;
                } else {
                    var290 = 0.0023201716;
                }
            }
        }
    }
    double var291;
    if (inputs[2] < 7.2564287) {
        if (inputs[15] < 5.356141) {
            var291 = -0.0022077253;
        } else {
            var291 = 0.0120068835;
        }
    } else {
        if (inputs[2] < 9.552857) {
            var291 = -0.010755435;
        } else {
            if (inputs[15] < 10.321135) {
                var291 = 0.013245916;
            } else {
                if (inputs[21] < 1.4733272) {
                    var291 = -0.010179538;
                } else {
                    var291 = 0.0008172713;
                }
            }
        }
    }
    double var292;
    if (inputs[19] < -25.014664) {
        var292 = 0.007999904;
    } else {
        if (inputs[19] < 48.6697) {
            if (inputs[2] < 10.026428) {
                var292 = -0.012869768;
            } else {
                if (inputs[17] < 1.1032097) {
                    var292 = -0.006055429;
                } else {
                    var292 = 0.0061182627;
                }
            }
        } else {
            if (inputs[7] < 20.74) {
                if (inputs[19] < 318.549) {
                    var292 = 0.017219285;
                } else {
                    var292 = 0.0005939525;
                }
            } else {
                if (inputs[7] < 34.5925) {
                    var292 = -0.010711511;
                } else {
                    var292 = 0.0008473959;
                }
            }
        }
    }
    double var293;
    if (inputs[15] < 5.356141) {
        var293 = -0.0079420265;
    } else {
        if (inputs[4] < 19878.975) {
            if (inputs[1] < 79.82045) {
                if (inputs[20] >= 7.6966357) {
                    var293 = -0.0044983216;
                } else {
                    var293 = 0.0018290197;
                }
            } else {
                var293 = 0.00842709;
            }
        } else {
            var293 = 0.01063278;
        }
    }
    double var294;
    if (inputs[12] < 3.7038045) {
        if (inputs[1] < 61.987473) {
            if (inputs[1] < 58.232033) {
                if (inputs[3] < 17771.305) {
                    var294 = -0.008995613;
                } else {
                    var294 = 0.0023144558;
                }
            } else {
                var294 = -0.012993165;
            }
        } else {
            if (inputs[2] < 20.142857) {
                if (inputs[5] < 19678.582) {
                    var294 = -0.004028739;
                } else {
                    var294 = 0.012034922;
                }
            } else {
                var294 = 0.013564836;
            }
        }
    } else {
        if (inputs[5] < 18109.91) {
            var294 = 0.0009315457;
        } else {
            var294 = -0.015703427;
        }
    }
    double var295;
    if (inputs[19] < -25.014664) {
        var295 = 0.008374227;
    } else {
        if (inputs[2] < 19.303572) {
            if (inputs[16] < 1.1342015) {
                if (inputs[5] < 19503.744) {
                    var295 = -0.004074889;
                } else {
                    var295 = 0.003528529;
                }
            } else {
                var295 = -0.013087068;
            }
        } else {
            if (inputs[2] < 27.15) {
                if (inputs[14] < 19.32822) {
                    var295 = -0.0010653752;
                } else {
                    var295 = 0.009705804;
                }
            } else {
                if (inputs[16] < -0.24856366) {
                    var295 = 0.005914308;
                } else {
                    var295 = -0.00792567;
                }
            }
        }
    }
    double var296;
    if (inputs[5] < 19963.29) {
        if (inputs[5] < 19713.963) {
            if (inputs[10] < 1.088) {
                if (inputs[12] < 0.10512782) {
                    var296 = -0.0010311535;
                } else {
                    var296 = 0.010864599;
                }
            } else {
                if (inputs[19] < 62.08193) {
                    var296 = -0.010270397;
                } else {
                    var296 = -0.00064085826;
                }
            }
        } else {
            var296 = -0.009386937;
        }
    } else {
        var296 = 0.0065479386;
    }
    double var297;
    if (inputs[14] < 7.104442) {
        if (inputs[7] < 19.365) {
            var297 = 0.0021790585;
        } else {
            var297 = -0.010332014;
        }
    } else {
        if (inputs[11] < 9.117576) {
            if (inputs[11] < 7.1047273) {
                if (inputs[6] < 17452.395) {
                    var297 = -0.0053892154;
                } else {
                    var297 = 0.0022048634;
                }
            } else {
                var297 = 0.012069572;
            }
        } else {
            var297 = -0.0076937797;
        }
    }
    double var298;
    if (inputs[21] < 1.0292515) {
        var298 = 0.005979466;
    } else {
        if (inputs[2] < 17.687857) {
            if (inputs[2] < 15.951428) {
                if (inputs[21] < 1.7890501) {
                    var298 = -0.009273215;
                } else {
                    var298 = 0.00055161177;
                }
            } else {
                var298 = -0.012537495;
            }
        } else {
            if (inputs[7] < 43.4025) {
                if (inputs[9] < 1.18) {
                    var298 = 0.0025771821;
                } else {
                    var298 = 0.014011839;
                }
            } else {
                if (inputs[6] < 18273.926) {
                    var298 = -0.004925789;
                } else {
                    var298 = 0.006072224;
                }
            }
        }
    }
    double var299;
    if (inputs[20] < -27.187044) {
        var299 = -0.006757478;
    } else {
        if (inputs[14] < 24.654566) {
            if (inputs[12] < -2.6880076) {
                var299 = -0.016303495;
            } else {
                if (inputs[16] < 1.1063302) {
                    var299 = 0.0017873981;
                } else {
                    var299 = -0.0039062947;
                }
            }
        } else {
            if (inputs[20] >= 19.28609) {
                var299 = -0.0043961676;
            } else {
                if (inputs[5] < 18301.957) {
                    var299 = 0.005583119;
                } else {
                    var299 = 0.016320154;
                }
            }
        }
    }
    double var300;
    if (inputs[3] < 19963.12) {
        if (inputs[21] < 1.0292515) {
            var300 = 0.0064825066;
        } else {
            if (inputs[2] < 9.67) {
                if (inputs[20] >= 4.594927) {
                    var300 = -0.015654908;
                } else {
                    var300 = 0.0009812965;
                }
            } else {
                if (inputs[22] < 3.0) {
                    var300 = 0.0075647873;
                } else {
                    var300 = -0.0015390981;
                }
            }
        }
    } else {
        var300 = 0.0065156193;
    }
    double var301;
    if (inputs[2] < 18.608572) {
        if (inputs[14] < 25.502005) {
            if (inputs[21] < 2.7443748) {
                if (inputs[19] < 318.549) {
                    var301 = 0.0001565907;
                } else {
                    var301 = -0.019258853;
                }
            } else {
                if (inputs[4] < 19737.06) {
                    var301 = -0.0009011671;
                } else {
                    var301 = 0.012565658;
                }
            }
        } else {
            var301 = -0.0117570385;
        }
    } else {
        if (inputs[18] < 1.0) {
            if (inputs[14] < 24.268852) {
                var301 = 0.0036329324;
            } else {
                var301 = 0.01478019;
            }
        } else {
            if (inputs[2] < 22.428572) {
                var301 = 0.007261664;
            } else {
                if (inputs[2] < 29.225714) {
                    var301 = -0.008472884;
                } else {
                    var301 = 0.00218919;
                }
            }
        }
    }
    double var302;
    if (inputs[16] < -1.9654067) {
        var302 = 0.0058653792;
    } else {
        if (inputs[16] < -0.9431992) {
            if (inputs[20] < 14.592328) {
                var302 = -0.012785231;
            } else {
                var302 = 0.0043748394;
            }
        } else {
            if (inputs[16] < -0.7316509) {
                var302 = 0.01159389;
            } else {
                if (inputs[16] < 0.28437614) {
                    var302 = -0.004813344;
                } else {
                    var302 = 0.0018787914;
                }
            }
        }
    }
    double var303;
    if (inputs[2] < 7.2564287) {
        if (inputs[10] < 1.52) {
            var303 = -0.00025520322;
        } else {
            var303 = 0.01417566;
        }
    } else {
        if (inputs[2] < 9.67) {
            var303 = -0.011155785;
        } else {
            if (inputs[10] < 4.651) {
                if (inputs[3] < 17490.88) {
                    var303 = -0.010427321;
                } else {
                    var303 = 0.000042413616;
                }
            } else {
                if (inputs[12] < 3.9619398) {
                    var303 = 0.007301566;
                } else {
                    var303 = -0.0055266493;
                }
            }
        }
    }
    double var304;
    if (inputs[10] < -17.426) {
        var304 = -0.009959401;
    } else {
        if (inputs[11] < -7.7435756) {
            var304 = 0.010463833;
        } else {
            if (inputs[11] < -5.374) {
                var304 = -0.0074818335;
            } else {
                if (inputs[20] < -23.177559) {
                    var304 = 0.009363541;
                } else {
                    var304 = -0.00014144024;
                }
            }
        }
    }
    double var305;
    if (inputs[19] < -25.014664) {
        var305 = 0.010583853;
    } else {
        if (inputs[17] < 4.185952) {
            if (inputs[7] < 36.4325) {
                if (inputs[16] < 1.0041281) {
                    var305 = 0.0045871176;
                } else {
                    var305 = -0.009922887;
                }
            } else {
                if (inputs[16] < 1.3823215) {
                    var305 = -0.0050526056;
                } else {
                    var305 = 0.010295191;
                }
            }
        } else {
            var305 = 0.007244178;
        }
    }
    double var306;
    if (inputs[2] < 9.67) {
        if (inputs[7] < 24.2775) {
            if (inputs[15] < 5.356141) {
                var306 = -0.005510169;
            } else {
                var306 = 0.0071918974;
            }
        } else {
            var306 = -0.010538979;
        }
    } else {
        if (inputs[15] < 11.323254) {
            var306 = 0.011572141;
        } else {
            if (inputs[20] >= -33.020267) {
                if (inputs[20] < -22.954485) {
                    var306 = 0.00887863;
                } else {
                    var306 = -0.0012569474;
                }
            } else {
                var306 = -0.010469683;
            }
        }
    }
    double var307;
    if (inputs[19] < -21.662674) {
        var307 = 0.008849153;
    } else {
        if (inputs[2] < 17.687857) {
            if (inputs[2] < 15.951428) {
                if (inputs[16] < 1.1063302) {
                    var307 = 0.0006177254;
                } else {
                    var307 = -0.012125661;
                }
            } else {
                var307 = -0.015090244;
            }
        } else {
            if (inputs[21] < 3.277861) {
                if (inputs[18] < 1.0) {
                    var307 = 0.005119112;
                } else {
                    var307 = -0.005927069;
                }
            } else {
                var307 = 0.012933202;
            }
        }
    }
    double var308;
    if (inputs[14] < 28.204103) {
        if (inputs[13] < 18.802526) {
            if (inputs[11] < -5.374) {
                var308 = -0.014396152;
            } else {
                if (inputs[19] >= 20.327654) {
                    var308 = -0.0047275284;
                } else {
                    var308 = 0.0028505924;
                }
            }
        } else {
            if (inputs[7] < 64.5025) {
                var308 = 0.0011409909;
            } else {
                var308 = 0.0132636605;
            }
        }
    } else {
        if (inputs[10] < -14.6) {
            var308 = -0.011567692;
        } else {
            var308 = -0.0014387664;
        }
    }
    double var309;
    if (inputs[19] < -25.014664) {
        var309 = 0.010281289;
    } else {
        if (inputs[19] < 48.418976) {
            if (inputs[20] < 11.40759) {
                if (inputs[22] < 9.0) {
                    var309 = -0.015007434;
                } else {
                    var309 = -0.004962973;
                }
            } else {
                var309 = 0.0022759058;
            }
        } else {
            if (inputs[20] < -27.187044) {
                var309 = -0.008269488;
            } else {
                if (inputs[20] < -22.954485) {
                    var309 = 0.012159206;
                } else {
                    var309 = 0.0006031231;
                }
            }
        }
    }
    double var310;
    if (inputs[16] < 0.47722974) {
        if (inputs[19] >= 116.51537) {
            var310 = -0.012457485;
        } else {
            if (inputs[14] < 4.7765512) {
                var310 = 0.013099326;
            } else {
                if (inputs[19] < 13.026849) {
                    var310 = -0.011228757;
                } else {
                    var310 = -0.00038885302;
                }
            }
        }
    } else {
        if (inputs[16] < 0.6946821) {
            var310 = 0.01459183;
        } else {
            if (inputs[21] < 3.1794524) {
                if (inputs[8] < 8.7475) {
                    var310 = -0.005829603;
                } else {
                    var310 = 0.0058473237;
                }
            } else {
                var310 = -0.0074850647;
            }
        }
    }
    double var311;
    if (inputs[16] < 1.2177398) {
        if (inputs[8] < 15.56) {
            if (inputs[16] < 0.5366254) {
                if (inputs[3] < 18633.766) {
                    var311 = 0.008822571;
                } else {
                    var311 = -0.002262324;
                }
            } else {
                var311 = 0.015100311;
            }
        } else {
            if (inputs[9] < 1.17) {
                if (inputs[15] < 27.348177) {
                    var311 = -0.011939471;
                } else {
                    var311 = 0.0018598827;
                }
            } else {
                if (inputs[9] < 1.49) {
                    var311 = 0.011515796;
                } else {
                    var311 = -0.0009430253;
                }
            }
        }
    } else {
        if (inputs[11] < -1.9138788) {
            var311 = 0.005835827;
        } else {
            var311 = -0.015397952;
        }
    }
    double var312;
    if (inputs[22] < 3.0) {
        if (inputs[22] < 2.0) {
            var312 = -0.0010548491;
        } else {
            var312 = 0.015413559;
        }
    } else {
        if (inputs[17] < 2.6756628) {
            if (inputs[3] < 17744.16) {
                if (inputs[16] < 0.31008777) {
                    var312 = -0.016146388;
                } else {
                    var312 = 0.0028913722;
                }
            } else {
                if (inputs[4] < 19661.52) {
                    var312 = 0.0036813084;
                } else {
                    var312 = -0.006908188;
                }
            }
        } else {
            if (inputs[16] < -1.1951858) {
                var312 = 0.00398966;
            } else {
                if (inputs[15] < 22.42742) {
                    var312 = -0.0019098558;
                } else {
                    var312 = -0.019013457;
                }
            }
        }
    }
    double var313;
    if (inputs[10] < 4.651) {
        if (inputs[3] < 17744.16) {
            if (inputs[15] < 26.800123) {
                var313 = -0.01652431;
            } else {
                var313 = -0.0017111821;
            }
        } else {
            if (inputs[10] < 2.676) {
                if (inputs[3] < 19736.24) {
                    var313 = 0.0033308582;
                } else {
                    var313 = -0.0032496022;
                }
            } else {
                var313 = -0.010120717;
            }
        }
    } else {
        if (inputs[15] < 24.474863) {
            if (inputs[3] < 17970.256) {
                var313 = 0.014070029;
            } else {
                if (inputs[17] < 2.8439124) {
                    var313 = 0.009887607;
                } else {
                    var313 = -0.0069232425;
                }
            }
        } else {
            var313 = -0.006786009;
        }
    }
    double var314;
    if (inputs[15] < 10.543079) {
        if (inputs[2] < 10.026428) {
            if (inputs[2] < 7.634286) {
                if (inputs[11] < 0.47612122) {
                    var314 = -0.0023264717;
                } else {
                    var314 = 0.010214825;
                }
            } else {
                var314 = -0.010402692;
            }
        } else {
            var314 = 0.015059107;
        }
    } else {
        if (inputs[2] < 14.096429) {
            if (inputs[14] < 11.382567) {
                var314 = -0.00028238504;
            } else {
                var314 = -0.013075799;
            }
        } else {
            if (inputs[14] < 13.984755) {
                var314 = -0.0080926735;
            } else {
                if (inputs[2] < 15.965) {
                    var314 = 0.010959335;
                } else {
                    var314 = 0.00042205935;
                }
            }
        }
    }
    double var315;
    if (inputs[20] < -27.187044) {
        var315 = -0.007305463;
    } else {
        if (inputs[7] < 89.905) {
            if (inputs[2] < 21.177856) {
                if (inputs[15] < 20.86391) {
                    var315 = 0.00059288077;
                } else {
                    var315 = -0.01289332;
                }
            } else {
                if (inputs[20] < 12.193009) {
                    var315 = -0.0016701937;
                } else {
                    var315 = 0.013878835;
                }
            }
        } else {
            if (inputs[7] < 113.94) {
                var315 = 0.0113930125;
            } else {
                if (inputs[20] < 15.357328) {
                    var315 = -0.0051476653;
                } else {
                    var315 = 0.0067071584;
                }
            }
        }
    }
    double var316;
    if (inputs[6] < 17386.984) {
        var316 = -0.008118379;
    } else {
        if (inputs[3] < 17564.96) {
            var316 = 0.009842587;
        } else {
            if (inputs[3] < 17744.16) {
                var316 = -0.010245024;
            } else {
                if (inputs[1] < 58.232033) {
                    var316 = 0.0032298437;
                } else {
                    var316 = -0.0014408078;
                }
            }
        }
    }
    double var317;
    if (inputs[20] < -27.187044) {
        var317 = -0.0059100664;
    } else {
        if (inputs[20] >= -23.177559) {
            if (inputs[11] < -6.416788) {
                var317 = 0.0075142425;
            } else {
                if (inputs[1] < 33.067528) {
                    var317 = -0.015640963;
                } else {
                    var317 = 0.00035905596;
                }
            }
        } else {
            var317 = 0.010547234;
        }
    }
    double var318;
    if (inputs[8] < 17.39) {
        if (inputs[2] < 26.822857) {
            if (inputs[5] < 18647.73) {
                if (inputs[21] < 2.5790474) {
                    var318 = 0.015448094;
                } else {
                    var318 = 0.0043545444;
                }
            } else {
                if (inputs[15] < 10.543079) {
                    var318 = 0.005406742;
                } else {
                    var318 = -0.009786677;
                }
            }
        } else {
            var318 = -0.008918368;
        }
    } else {
        if (inputs[8] < 27.625) {
            if (inputs[5] < 18952.682) {
                var318 = -0.014516171;
            } else {
                var318 = 0.00029375314;
            }
        } else {
            if (inputs[10] < 3.788) {
                if (inputs[16] < 1.2315242) {
                    var318 = -0.0051875706;
                } else {
                    var318 = 0.007454049;
                }
            } else {
                if (inputs[22] < 16.0) {
                    var318 = -0.00018953942;
                } else {
                    var318 = 0.017031152;
                }
            }
        }
    }
    double var319;
    if (inputs[8] < 17.39) {
        if (inputs[20] >= 6.039089) {
            if (inputs[2] < 19.159286) {
                var319 = -0.0071419245;
            } else {
                var319 = 0.0068206647;
            }
        } else {
            if (inputs[8] < 11.6725) {
                if (inputs[11] < -0.28006062) {
                    var319 = -0.003607044;
                } else {
                    var319 = 0.00992589;
                }
            } else {
                var319 = 0.014994661;
            }
        }
    } else {
        if (inputs[8] < 21.6675) {
            var319 = -0.009310024;
        } else {
            if (inputs[10] < 5.069) {
                if (inputs[3] < 19222.35) {
                    var319 = -0.0069218776;
                } else {
                    var319 = 0.0039164647;
                }
            } else {
                if (inputs[2] < 20.225714) {
                    var319 = 0.0010236325;
                } else {
                    var319 = 0.015287851;
                }
            }
        }
    }
    double var320;
    if (inputs[5] < 19398.555) {
        if (inputs[15] < 11.752636) {
            var320 = 0.008923145;
        } else {
            if (inputs[15] < 18.33918) {
                var320 = -0.0074336673;
            } else {
                if (inputs[15] < 20.687708) {
                    var320 = 0.0075200386;
                } else {
                    var320 = -0.0010990006;
                }
            }
        }
    } else {
        if (inputs[21] < 1.7890501) {
            var320 = -0.013532593;
        } else {
            if (inputs[5] < 19820.832) {
                if (inputs[20] < 8.072346) {
                    var320 = 0.00013130486;
                } else {
                    var320 = -0.01111336;
                }
            } else {
                var320 = 0.005432624;
            }
        }
    }
    double var321;
    if (inputs[22] < 19.0) {
        if (inputs[4] < 17701.785) {
            if (inputs[7] < 60.315) {
                var321 = 0.0033740122;
            } else {
                var321 = -0.013779784;
            }
        } else {
            if (inputs[5] < 17954.193) {
                var321 = 0.011891646;
            } else {
                if (inputs[4] < 18071.814) {
                    var321 = -0.012080732;
                } else {
                    var321 = 0.0004058078;
                }
            }
        }
    } else {
        if (inputs[14] < 24.21053) {
            var321 = 0.0004504933;
        } else {
            var321 = 0.010045325;
        }
    }
    double var322;
    if (inputs[10] < 5.124) {
        if (inputs[10] < 2.801) {
            if (inputs[3] < 17490.88) {
                var322 = -0.008132034;
            } else {
                if (inputs[5] < 19729.697) {
                    var322 = 0.004102489;
                } else {
                    var322 = -0.0030905425;
                }
            }
        } else {
            var322 = -0.012199592;
        }
    } else {
        if (inputs[10] < 7.125) {
            var322 = 0.01337945;
        } else {
            if (inputs[3] < 17970.256) {
                var322 = 0.008109787;
            } else {
                if (inputs[10] < 10.813) {
                    var322 = -0.011012553;
                } else {
                    var322 = 0.001003905;
                }
            }
        }
    }
    double var323;
    if (inputs[1] < 30.761576) {
        if (inputs[20] >= -27.187044) {
            if (inputs[20] < -22.954485) {
                var323 = 0.017238645;
            } else {
                var323 = 0.00043535972;
            }
        } else {
            var323 = -0.0028293985;
        }
    } else {
        if (inputs[20] < -15.66691) {
            var323 = -0.012378003;
        } else {
            if (inputs[19] < -26.784607) {
                var323 = 0.009788435;
            } else {
                if (inputs[8] < 28.875) {
                    var323 = -0.0032963862;
                } else {
                    var323 = 0.0032697592;
                }
            }
        }
    }
    double var324;
    if (inputs[16] < 0.45865735) {
        if (inputs[11] < 0.19072728) {
            if (inputs[5] < 18647.73) {
                if (inputs[5] < 18039.193) {
                    var324 = -0.006534104;
                } else {
                    var324 = 0.011291381;
                }
            } else {
                var324 = -0.016346114;
            }
        } else {
            if (inputs[20] < 5.2601457) {
                var324 = 0.009616393;
            } else {
                if (inputs[8] < 22.05) {
                    var324 = -0.006716381;
                } else {
                    var324 = 0.0033149035;
                }
            }
        }
    } else {
        if (inputs[16] < 0.654293) {
            var324 = 0.015905827;
        } else {
            if (inputs[20] < -23.177559) {
                var324 = 0.009683228;
            } else {
                if (inputs[18] < 1.0) {
                    var324 = 0.0013356672;
                } else {
                    var324 = -0.013271282;
                }
            }
        }
    }
    double var325;
    if (inputs[7] < 7.0275) {
        var325 = 0.00799675;
    } else {
        if (inputs[7] < 16.84) {
            var325 = -0.010674209;
        } else {
            if (inputs[2] < 7.2564287) {
                var325 = 0.009528853;
            } else {
                if (inputs[2] < 9.67) {
                    var325 = -0.018220382;
                } else {
                    var325 = 0.0010301822;
                }
            }
        }
    }
    double var326;
    if (inputs[2] < 20.899286) {
        if (inputs[11] < 5.088424) {
            if (inputs[15] < 24.78951) {
                if (inputs[19] >= -34.043823) {
                    var326 = -0.0018820193;
                } else {
                    var326 = 0.005488011;
                }
            } else {
                var326 = -0.0073786676;
            }
        } else {
            var326 = -0.012971019;
        }
    } else {
        if (inputs[17] < -1.1857233) {
            if (inputs[9] < 1.19) {
                var326 = -0.010380963;
            } else {
                var326 = 0.0043100053;
            }
        } else {
            if (inputs[13] < 11.679833) {
                var326 = -0.00083273737;
            } else {
                if (inputs[8] < 25.315) {
                    var326 = 0.00595334;
                } else {
                    var326 = 0.016667617;
                }
            }
        }
    }
    double var327;
    if (inputs[19] < -25.014664) {
        var327 = 0.01012935;
    } else {
        if (inputs[4] < 19959.676) {
            if (inputs[20] >= 7.6966357) {
                if (inputs[8] < 21.635) {
                    var327 = -0.011039287;
                } else {
                    var327 = 0.0016532497;
                }
            } else {
                if (inputs[10] < -0.266) {
                    var327 = -0.0014719585;
                } else {
                    var327 = 0.007643448;
                }
            }
        } else {
            var327 = 0.0077555175;
        }
    }
    double var328;
    if (inputs[15] < 10.937817) {
        if (inputs[2] < 10.026428) {
            if (inputs[2] < 7.634286) {
                if (inputs[10] < 1.937) {
                    var328 = -0.00045627725;
                } else {
                    var328 = 0.012270185;
                }
            } else {
                var328 = -0.009344811;
            }
        } else {
            var328 = 0.013406016;
        }
    } else {
        if (inputs[2] < 14.096429) {
            if (inputs[2] < 10.659286) {
                var328 = -0.0025673914;
            } else {
                var328 = -0.014031401;
            }
        } else {
            if (inputs[21] < 3.2603307) {
                if (inputs[22] < 16.0) {
                    var328 = -0.008125058;
                } else {
                    var328 = 0.0013500383;
                }
            } else {
                if (inputs[10] < 1.025) {
                    var328 = 0.013599863;
                } else {
                    var328 = 0.002846454;
                }
            }
        }
    }
    double var329;
    if (inputs[17] < 4.0182233) {
        if (inputs[16] < 0.47722974) {
            if (inputs[15] < 16.269487) {
                if (inputs[17] < 2.8439124) {
                    var329 = -0.0027379068;
                } else {
                    var329 = 0.014613633;
                }
            } else {
                if (inputs[14] < 20.733627) {
                    var329 = -0.011488709;
                } else {
                    var329 = -0.0011394324;
                }
            }
        } else {
            if (inputs[16] < 0.6946821) {
                var329 = 0.015671277;
            } else {
                if (inputs[11] < -1.9138788) {
                    var329 = 0.005188035;
                } else {
                    var329 = -0.006808498;
                }
            }
        }
    } else {
        var329 = 0.008973987;
    }
    double var330;
    if (inputs[17] < 3.5373898) {
        if (inputs[9] < 0.7) {
            var330 = -0.009080415;
        } else {
            if (inputs[1] < 71.55351) {
                if (inputs[4] < 19701.36) {
                    var330 = 0.0022376634;
                } else {
                    var330 = -0.005023791;
                }
            } else {
                var330 = -0.0076968432;
            }
        }
    } else {
        if (inputs[6] < 18030.09) {
            var330 = 0.012543786;
        } else {
            var330 = -0.0005605045;
        }
    }
    double var331;
    if (inputs[22] < 20.0) {
        if (inputs[18] < 1.0) {
            if (inputs[3] < 17600.926) {
                var331 = -0.0065036523;
            } else {
                if (inputs[2] < 26.31) {
                    var331 = 0.0002227051;
                } else {
                    var331 = 0.016016496;
                }
            }
        } else {
            if (inputs[17] < 3.27124) {
                if (inputs[9] < 1.12) {
                    var331 = -0.017458653;
                } else {
                    var331 = -0.002024097;
                }
            } else {
                var331 = 0.0057664327;
            }
        }
    } else {
        if (inputs[1] < 39.375595) {
            var331 = 0.010574034;
        } else {
            var331 = -0.0010156205;
        }
    }
    double var332;
    if (inputs[19] < -25.014664) {
        var332 = 0.010099936;
    } else {
        if (inputs[19] < 48.6697) {
            if (inputs[4] < 19410.475) {
                if (inputs[4] < 19018.23) {
                    var332 = -0.009646469;
                } else {
                    var332 = 0.0093243085;
                }
            } else {
                var332 = -0.013934039;
            }
        } else {
            if (inputs[7] < 20.74) {
                if (inputs[2] < 6.34) {
                    var332 = -0.0008493379;
                } else {
                    var332 = 0.015762296;
                }
            } else {
                if (inputs[7] < 34.5925) {
                    var332 = -0.009290738;
                } else {
                    var332 = 0.0010872885;
                }
            }
        }
    }
    double var333;
    if (inputs[8] < 17.39) {
        if (inputs[16] < 1.2589207) {
            if (inputs[20] >= 6.039089) {
                if (inputs[4] < 18106.686) {
                    var333 = 0.0063613714;
                } else {
                    var333 = -0.0067407135;
                }
            } else {
                if (inputs[16] < 0.45214638) {
                    var333 = 0.004032108;
                } else {
                    var333 = 0.01983995;
                }
            }
        } else {
            var333 = -0.010408539;
        }
    } else {
        if (inputs[20] < 11.363098) {
            if (inputs[14] < 9.513214) {
                var333 = -0.017672729;
            } else {
                if (inputs[4] < 18071.814) {
                    var333 = -0.01483426;
                } else {
                    var333 = 0.003166974;
                }
            }
        } else {
            if (inputs[16] < -1.2699627) {
                var333 = 0.011729502;
            } else {
                if (inputs[13] < 13.047034) {
                    var333 = -0.007675011;
                } else {
                    var333 = 0.003460511;
                }
            }
        }
    }
    double var334;
    if (inputs[20] < -23.177559) {
        if (inputs[7] < 77.685) {
            var334 = 0.012754592;
        } else {
            var334 = 0.0003011383;
        }
    } else {
        if (inputs[20] < -12.74075) {
            if (inputs[14] < 22.756666) {
                var334 = -0.015354278;
            } else {
                var334 = 0.0040708813;
            }
        } else {
            if (inputs[20] < -7.8533735) {
                var334 = 0.008729105;
            } else {
                if (inputs[16] < 1.2177398) {
                    var334 = 0.00085608725;
                } else {
                    var334 = -0.010382236;
                }
            }
        }
    }
    double var335;
    if (inputs[10] < 4.651) {
        if (inputs[10] < 2.676) {
            if (inputs[3] < 17490.88) {
                var335 = -0.012223001;
            } else {
                if (inputs[8] < 7.06) {
                    var335 = -0.0040532933;
                } else {
                    var335 = 0.0035848813;
                }
            }
        } else {
            var335 = -0.012913056;
        }
    } else {
        if (inputs[10] < 5.874) {
            var335 = 0.013815178;
        } else {
            if (inputs[8] < 21.635) {
                if (inputs[8] < 7.72) {
                    var335 = 0.007107219;
                } else {
                    var335 = -0.015216617;
                }
            } else {
                if (inputs[2] < 20.225714) {
                    var335 = 0.0020345836;
                } else {
                    var335 = 0.012444266;
                }
            }
        }
    }
    double var336;
    if (inputs[19] < 62.08193) {
        if (inputs[2] < 9.67) {
            var336 = -0.014063213;
        } else {
            if (inputs[13] < 12.834479) {
                if (inputs[21] < 2.139352) {
                    var336 = -0.002200049;
                } else {
                    var336 = 0.011785129;
                }
            } else {
                var336 = -0.010048726;
            }
        }
    } else {
        if (inputs[19] < 116.51537) {
            var336 = 0.012483285;
        } else {
            if (inputs[22] < 3.0) {
                var336 = 0.008578384;
            } else {
                if (inputs[2] < 16.645) {
                    var336 = -0.006721788;
                } else {
                    var336 = 0.0017000841;
                }
            }
        }
    }
    double var337;
    if (inputs[3] < 19963.12) {
        if (inputs[4] < 19661.52) {
            if (inputs[3] < 19534.355) {
                if (inputs[4] < 19410.475) {
                    var337 = 0.00081908057;
                } else {
                    var337 = -0.011050769;
                }
            } else {
                var337 = 0.013032768;
            }
        } else {
            var337 = -0.006975675;
        }
    } else {
        var337 = 0.0077176606;
    }
    double var338;
    if (inputs[13] < 5.316362) {
        if (inputs[13] < 3.305496) {
            if (inputs[17] < 1.3278477) {
                var338 = 0.0068761497;
            } else {
                var338 = -0.0060292203;
            }
        } else {
            if (inputs[16] < -0.8291251) {
                var338 = 0.014926318;
            } else {
                var338 = 0.00297844;
            }
        }
    } else {
        if (inputs[13] < 7.068011) {
            var338 = -0.01059209;
        } else {
            if (inputs[18] < 1.0) {
                if (inputs[13] < 20.815304) {
                    var338 = 0.0045901868;
                } else {
                    var338 = -0.0027386239;
                }
            } else {
                if (inputs[13] < 20.620935) {
                    var338 = -0.009069506;
                } else {
                    var338 = 0.0014765116;
                }
            }
        }
    }
    double var339;
    if (inputs[20] >= 7.3229785) {
        if (inputs[20] < 11.512124) {
            var339 = -0.013711145;
        } else {
            if (inputs[16] < -1.2699627) {
                var339 = 0.008848533;
            } else {
                if (inputs[10] < 8.025) {
                    var339 = -0.01101629;
                } else {
                    var339 = 0.002537712;
                }
            }
        }
    } else {
        if (inputs[5] < 19713.963) {
            if (inputs[3] < 19518.506) {
                if (inputs[3] < 18805.936) {
                    var339 = 0.002653323;
                } else {
                    var339 = -0.0068517006;
                }
            } else {
                var339 = 0.015306045;
            }
        } else {
            var339 = -0.005491835;
        }
    }
    double var340;
    if (inputs[19] < -21.662674) {
        var340 = 0.008492255;
    } else {
        if (inputs[19] < 48.418976) {
            if (inputs[20] < 11.40759) {
                if (inputs[8] < 20.9825) {
                    var340 = -0.005174699;
                } else {
                    var340 = -0.013566308;
                }
            } else {
                var340 = 0.0043159057;
            }
        } else {
            if (inputs[19] < 116.51537) {
                var340 = 0.0076788845;
            } else {
                if (inputs[8] < 62.595) {
                    var340 = -0.0014013201;
                } else {
                    var340 = 0.007485597;
                }
            }
        }
    }
    double var341;
    if (inputs[17] < 3.5373898) {
        if (inputs[12] < 3.9619398) {
            if (inputs[4] < 17834.82) {
                if (inputs[9] < 1.19) {
                    var341 = -0.010728047;
                } else {
                    var341 = 0.002786865;
                }
            } else {
                if (inputs[4] < 17988.72) {
                    var341 = 0.012036831;
                } else {
                    var341 = -0.00044101127;
                }
            }
        } else {
            var341 = -0.012781712;
        }
    } else {
        if (inputs[2] < 14.205) {
            var341 = -0.0004097629;
        } else {
            var341 = 0.012519127;
        }
    }
    double var342;
    if (inputs[19] < -24.833563) {
        var342 = 0.01082257;
    } else {
        if (inputs[20] >= -22.954485) {
            if (inputs[17] < -2.0118186) {
                var342 = -0.007968498;
            } else {
                if (inputs[2] < 20.225714) {
                    var342 = -0.0017822485;
                } else {
                    var342 = 0.0050739194;
                }
            }
        } else {
            if (inputs[20] >= -27.187044) {
                var342 = 0.013068385;
            } else {
                if (inputs[1] < 26.227798) {
                    var342 = -0.005981273;
                } else {
                    var342 = 0.0043973555;
                }
            }
        }
    }
    double var343;
    if (inputs[13] < 5.316362) {
        if (inputs[1] < 57.86574) {
            var343 = 0.0101943305;
        } else {
            if (inputs[17] < 2.90849) {
                var343 = -0.007192013;
            } else {
                var343 = 0.010701985;
            }
        }
    } else {
        if (inputs[13] < 8.557412) {
            if (inputs[10] < 1.025) {
                var343 = 0.0014070446;
            } else {
                var343 = -0.014082411;
            }
        } else {
            if (inputs[17] < -0.9925697) {
                if (inputs[13] < 14.243442) {
                    var343 = -0.012661183;
                } else {
                    var343 = 0.0017176188;
                }
            } else {
                if (inputs[10] < 5.874) {
                    var343 = 0.0131643275;
                } else {
                    var343 = 0.00002482159;
                }
            }
        }
    }
    double var344;
    if (inputs[22] < 3.0) {
        if (inputs[19] < 118.89217) {
            var344 = -0.0023865784;
        } else {
            var344 = 0.011861515;
        }
    } else {
        if (inputs[12] < 3.7038045) {
            if (inputs[19] >= 118.89217) {
                var344 = -0.010486734;
            } else {
                if (inputs[19] >= 62.08193) {
                    var344 = 0.014355303;
                } else {
                    var344 = -0.00023364581;
                }
            }
        } else {
            var344 = -0.009961884;
        }
    }
    double var345;
    if (inputs[2] < 7.2564287) {
        if (inputs[2] < 6.267857) {
            var345 = 0.00035763448;
        } else {
            var345 = 0.012703847;
        }
    } else {
        if (inputs[2] < 9.67) {
            var345 = -0.013827311;
        } else {
            if (inputs[15] < 11.323254) {
                var345 = 0.011554243;
            } else {
                if (inputs[8] < 27.625) {
                    var345 = -0.0030952385;
                } else {
                    var345 = 0.0023152947;
                }
            }
        }
    }
    double var346;
    if (inputs[19] < -21.662674) {
        var346 = 0.008231745;
    } else {
        if (inputs[15] < 27.751934) {
            if (inputs[13] < 19.397114) {
                if (inputs[13] < 15.841378) {
                    var346 = -0.00094416767;
                } else {
                    var346 = 0.010494233;
                }
            } else {
                if (inputs[13] < 25.876942) {
                    var346 = -0.0178469;
                } else {
                    var346 = -0.003213435;
                }
            }
        } else {
            if (inputs[14] < 20.733627) {
                var346 = -0.005325094;
            } else {
                if (inputs[14] < 33.943516) {
                    var346 = 0.012648813;
                } else {
                    var346 = -0.0016254608;
                }
            }
        }
    }
    double var347;
    if (inputs[15] < 5.006349) {
        var347 = -0.008644632;
    } else {
        if (inputs[4] < 19887.025) {
            if (inputs[10] < 4.651) {
                if (inputs[10] < 2.801) {
                    var347 = -0.0005493267;
                } else {
                    var347 = -0.018318746;
                }
            } else {
                if (inputs[15] < 24.474863) {
                    var347 = 0.0064331866;
                } else {
                    var347 = -0.007076724;
                }
            }
        } else {
            var347 = 0.010101205;
        }
    }
    double var348;
    if (inputs[2] < 32.545) {
        if (inputs[2] < 28.627142) {
            if (inputs[20] >= 6.039089) {
                if (inputs[2] < 20.225714) {
                    var348 = -0.0039656614;
                } else {
                    var348 = 0.006272888;
                }
            } else {
                if (inputs[1] < 61.12736) {
                    var348 = 0.0014099531;
                } else {
                    var348 = 0.015192534;
                }
            }
        } else {
            var348 = -0.008845462;
        }
    } else {
        var348 = 0.007449319;
    }
    double var349;
    if (inputs[22] < 3.0) {
        if (inputs[20] < 11.098869) {
            var349 = -0.0016380243;
        } else {
            var349 = 0.013303925;
        }
    } else {
        if (inputs[22] < 5.0) {
            var349 = -0.009473666;
        } else {
            if (inputs[12] < 3.9619398) {
                if (inputs[16] < 0.77425003) {
                    var349 = 0.000066359644;
                } else {
                    var349 = 0.005374449;
                }
            } else {
                var349 = -0.0067499895;
            }
        }
    }
    double var350;
    if (inputs[20] < -27.187044) {
        var350 = -0.0075581186;
    } else {
        if (inputs[20] < -23.177559) {
            var350 = 0.00927958;
        } else {
            if (inputs[11] < -6.416788) {
                var350 = 0.0066312784;
            } else {
                if (inputs[20] < -17.137478) {
                    var350 = -0.01404702;
                } else {
                    var350 = -0.00011107084;
                }
            }
        }
    }
    double var351;
    if (inputs[3] < 19963.12) {
        if (inputs[11] < 7.1047273) {
            if (inputs[8] < 17.39) {
                if (inputs[8] < 12.155) {
                    var351 = -0.0020003957;
                } else {
                    var351 = 0.010740523;
                }
            } else {
                if (inputs[8] < 22.05) {
                    var351 = -0.011418406;
                } else {
                    var351 = -0.0019371891;
                }
            }
        } else {
            if (inputs[11] < 9.103394) {
                var351 = 0.009873525;
            } else {
                var351 = -0.0012355811;
            }
        }
    } else {
        var351 = 0.0068364153;
    }
    double var352;
    if (inputs[19] < 48.6697) {
        if (inputs[12] < 1.3059398) {
            if (inputs[21] < 2.3333879) {
                if (inputs[15] < 10.1269245) {
                    var352 = 0.0011409734;
                } else {
                    var352 = -0.008661165;
                }
            } else {
                var352 = -0.01634362;
            }
        } else {
            var352 = 0.0032390757;
        }
    } else {
        if (inputs[7] < 20.74) {
            if (inputs[19] < 318.549) {
                var352 = 0.015781462;
            } else {
                var352 = -0.00083699875;
            }
        } else {
            if (inputs[21] < 3.277861) {
                if (inputs[17] < 2.860778) {
                    var352 = -0.0008740485;
                } else {
                    var352 = -0.011043833;
                }
            } else {
                if (inputs[2] < 14.096429) {
                    var352 = -0.0035039913;
                } else {
                    var352 = 0.011332757;
                }
            }
        }
    }
    double var353;
    if (inputs[10] < 4.651) {
        if (inputs[20] >= 13.724568) {
            var353 = -0.011781923;
        } else {
            if (inputs[17] < 2.2047207) {
                if (inputs[16] < 0.47722974) {
                    var353 = -0.0042876457;
                } else {
                    var353 = 0.0027826042;
                }
            } else {
                var353 = 0.011011387;
            }
        }
    } else {
        if (inputs[20] < 15.040677) {
            if (inputs[22] < 16.0) {
                var353 = -0.00954377;
            } else {
                var353 = 0.0026649216;
            }
        } else {
            if (inputs[15] < 20.687708) {
                var353 = 0.019634569;
            } else {
                if (inputs[5] < 18038.9) {
                    var353 = 0.007569979;
                } else {
                    var353 = -0.003590638;
                }
            }
        }
    }
    double var354;
    if (inputs[16] < 1.2631494) {
        if (inputs[7] < 13.9025) {
            var354 = 0.009358167;
        } else {
            if (inputs[4] < 19887.025) {
                if (inputs[4] < 19607.445) {
                    var354 = 0.0011025976;
                } else {
                    var354 = -0.012936471;
                }
            } else {
                var354 = 0.008811983;
            }
        }
    } else {
        if (inputs[11] < -1.3551515) {
            var354 = 0.0046668095;
        } else {
            var354 = -0.014893989;
        }
    }
    double var355;
    if (inputs[20] < -27.187044) {
        var355 = -0.0071277674;
    } else {
        if (inputs[20] < -22.954485) {
            var355 = 0.009135589;
        } else {
            if (inputs[12] < -1.9500151) {
                if (inputs[15] < 27.36444) {
                    var355 = -0.014066012;
                } else {
                    var355 = -0.00018524834;
                }
            } else {
                if (inputs[19] < -24.833563) {
                    var355 = 0.010010134;
                } else {
                    var355 = 0.000549141;
                }
            }
        }
    }
    double var356;
    var356 = sigmoid(var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29 + var30 + var31 + var32 + var33 + var34 + var35 + var36 + var37 + var38 + var39 + var40 + var41 + var42 + var43 + var44 + var45 + var46 + var47 + var48 + var49 + var50 + var51 + var52 + var53 + var54 + var55 + var56 + var57 + var58 + var59 + var60 + var61 + var62 + var63 + var64 + var65 + var66 + var67 + var68 + var69 + var70 + var71 + var72 + var73 + var74 + var75 + var76 + var77 + var78 + var79 + var80 + var81 + var82 + var83 + var84 + var85 + var86 + var87 + var88 + var89 + var90 + var91 + var92 + var93 + var94 + var95 + var96 + var97 + var98 + var99 + var100 + var101 + var102 + var103 + var104 + var105 + var106 + var107 + var108 + var109 + var110 + var111 + var112 + var113 + var114 + var115 + var116 + var117 + var118 + var119 + var120 + var121 + var122 + var123 + var124 + var125 + var126 + var127 + var128 + var129 + var130 + var131 + var132 + var133 + var134 + var135 + var136 + var137 + var138 + var139 + var140 + var141 + var142 + var143 + var144 + var145 + var146 + var147 + var148 + var149 + var150 + var151 + var152 + var153 + var154 + var155 + var156 + var157 + var158 + var159 + var160 + var161 + var162 + var163 + var164 + var165 + var166 + var167 + var168 + var169 + var170 + var171 + var172 + var173 + var174 + var175 + var176 + var177 + var178 + var179 + var180 + var181 + var182 + var183 + var184 + var185 + var186 + var187 + var188 + var189 + var190 + var191 + var192 + var193 + var194 + var195 + var196 + var197 + var198 + var199 + var200 + var201 + var202 + var203 + var204 + var205 + var206 + var207 + var208 + var209 + var210 + var211 + var212 + var213 + var214 + var215 + var216 + var217 + var218 + var219 + var220 + var221 + var222 + var223 + var224 + var225 + var226 + var227 + var228 + var229 + var230 + var231 + var232 + var233 + var234 + var235 + var236 + var237 + var238 + var239 + var240 + var241 + var242 + var243 + var244 + var245 + var246 + var247 + var248 + var249 + var250 + var251 + var252 + var253 + var254 + var255 + var256 + var257 + var258 + var259 + var260 + var261 + var262 + var263 + var264 + var265 + var266 + var267 + var268 + var269 + var270 + var271 + var272 + var273 + var274 + var275 + var276 + var277 + var278 + var279 + var280 + var281 + var282 + var283 + var284 + var285 + var286 + var287 + var288 + var289 + var290 + var291 + var292 + var293 + var294 + var295 + var296 + var297 + var298 + var299 + var300 + var301 + var302 + var303 + var304 + var305 + var306 + var307 + var308 + var309 + var310 + var311 + var312 + var313 + var314 + var315 + var316 + var317 + var318 + var319 + var320 + var321 + var322 + var323 + var324 + var325 + var326 + var327 + var328 + var329 + var330 + var331 + var332 + var333 + var334 + var335 + var336 + var337 + var338 + var339 + var340 + var341 + var342 + var343 + var344 + var345 + var346 + var347 + var348 + var349 + var350 + var351 + var352 + var353 + var354 + var355);
    memcpy(output, (double[]){1.0 - var356, var356}, 2 * sizeof(double));
}


// --- Fonction Wrapper pour une utilisation simple dans MQL5 ---
// Retourne la probabilité de la classe 'Gagnant' (classe 1)
double XGBoost_Predict(const double &features[])
{
   double prediction[2]; // Sortie pour la classe 0 et la classe 1
   xgboost_score(features, prediction);
   return prediction[1]; // Retourne la probabilité de la classe 1 (Gagnant)
}
