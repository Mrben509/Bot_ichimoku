//+------------------------------------------------------------------+
//|   XGBoost Predictor for MQL5
//|   Généré par un script Python en utilisant m2cgen
//+------------------------------------------------------------------+
#property strict

// --- Seuil optimal trouvé pendant l'entraînement (basé sur des contraintes de performance: fréquence et précision)
const double BEST_THRESHOLD = 0.410000;

// --- Liste des features attendues par le modèle ---
// 0: type
// 1: rsiV
// 2: atrV
// 3: zScore50V
// 4: distance_to_sl_art
// 5: volatility_regime
// 6: prix_vs_ema200
// 7: rsi_vs_ema_rsi
// 8: risk_reward_ratio
// 9: ADX_14
// 10: cloud_thickness
// 11: tk_cross_signal
// 12: tenkan_slope
// 13: kijun_slope
// 14: atr_relative
// 15: price_vs_kijun
// 16: dist_from_spanA
// 17: dist_from_spanB
// 18: tk_cross_strength
// 19: tk_cross_stability
// 20: hour_of_day
// 21: rsi_stability
// 22: adx_trend_strength
// 23: cross_x_adx
// 24: kijun_x_rsi_stab

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
    if (inputs[14] < 0.6035505) {
        if (inputs[8] < 2.6235294) {
            if (inputs[21] < 17.880342) {
                var0 = -0.014213111;
            } else {
                if (inputs[20] < 10.0) {
                    if (inputs[3] < -0.4953674) {
                        var0 = 0.110027246;
                    } else {
                        var0 = 0.011509967;
                    }
                } else {
                    var0 = 0.1340461;
                }
            }
        } else {
            var0 = -0.059190333;
        }
    } else {
        if (inputs[6] < -54.69902) {
            if (inputs[23] < -24.365) {
                var0 = -0.15327112;
            } else {
                var0 = -0.03449318;
            }
        } else {
            if (inputs[18] < 14.13) {
                if (inputs[3] < 0.106602594) {
                    if (inputs[10] < 1.4825) {
                        if (inputs[20] < 17.0) {
                            var0 = 0.077682704;
                        } else {
                            var0 = -0.025819026;
                        }
                    } else {
                        if (inputs[21] < 18.741793) {
                            var0 = 0.03805352;
                        } else {
                            var0 = -0.041221883;
                        }
                    }
                } else {
                    if (inputs[18] < 4.115) {
                        if (inputs[3] < 0.4358175) {
                            var0 = -0.09449554;
                        } else {
                            var0 = 0.011142064;
                        }
                    } else {
                        var0 = -0.10057963;
                    }
                }
            } else {
                if (inputs[8] < 2.5031645) {
                    if (inputs[5] < 1.0) {
                        var0 = -0.15327112;
                    } else {
                        var0 = -0.052683473;
                    }
                } else {
                    var0 = 0.021619804;
                }
            }
        }
    }
    double var1;
    if (inputs[21] < 24.328299) {
        if (inputs[13] < 24.76) {
            if (inputs[15] < -3.7456567) {
                var1 = 0.092230015;
            } else {
                if (inputs[15] < -2.9777894) {
                    if (inputs[17] < -5.4881516) {
                        var1 = -0.052267626;
                    } else {
                        var1 = -0.15049016;
                    }
                } else {
                    if (inputs[7] < -19.664974) {
                        if (inputs[17] < -2.4848874) {
                            var1 = 0.026347606;
                        } else {
                            var1 = 0.121276334;
                        }
                    } else {
                        if (inputs[23] < -30.36) {
                            var1 = 0.041577026;
                        } else {
                            var1 = -0.0074225;
                        }
                    }
                }
            }
        } else {
            var1 = -0.09673224;
        }
    } else {
        var1 = 0.09782301;
    }
    double var2;
    if (inputs[13] < -16.35) {
        if (inputs[4] < -3.1190884) {
            var2 = -0.03627414;
        } else {
            if (inputs[24] < -23.18662) {
                if (inputs[24] < -37.02792) {
                    var2 = 0.0649048;
                } else {
                    var2 = 0.13566539;
                }
            } else {
                var2 = 0.014711003;
            }
        }
    } else {
        if (inputs[15] < -3.769897) {
            var2 = 0.09029737;
        } else {
            if (inputs[12] < -4.85) {
                if (inputs[9] < 29.42567) {
                    if (inputs[20] < 14.0) {
                        var2 = 0.028235076;
                    } else {
                        if (inputs[10] < 2.2675) {
                            var2 = -0.104827665;
                        } else {
                            var2 = 0.018988475;
                        }
                    }
                } else {
                    if (inputs[8] < 2.5202312) {
                        if (inputs[14] < 0.7304101) {
                            var2 = -0.014328;
                        } else {
                            var2 = -0.09550181;
                        }
                    } else {
                        var2 = -0.15200216;
                    }
                }
            } else {
                if (inputs[16] < -4.529412) {
                    var2 = -0.10537568;
                } else {
                    if (inputs[24] < -35.728333) {
                        if (inputs[1] < 30.82347) {
                            var2 = -0.016027937;
                        } else {
                            var2 = 0.09504983;
                        }
                    } else {
                        if (inputs[17] < -1.2168224) {
                            var2 = -0.099533536;
                        } else {
                            var2 = -0.007784281;
                        }
                    }
                }
            }
        }
    }
    double var3;
    if (inputs[12] < 27.92) {
        if (inputs[3] < 0.106602594) {
            if (inputs[18] < 0.855) {
                if (inputs[7] < -20.653982) {
                    if (inputs[12] < 3.11) {
                        var3 = -0.0055929483;
                    } else {
                        var3 = 0.09163934;
                    }
                } else {
                    if (inputs[9] < 36.614616) {
                        if (inputs[12] < 2.16) {
                            var3 = 0.028893935;
                        } else {
                            var3 = -0.03905989;
                        }
                    } else {
                        var3 = -0.06784619;
                    }
                }
            } else {
                if (inputs[10] < 4.27) {
                    if (inputs[23] < 47.265) {
                        if (inputs[1] < 62.464783) {
                            var3 = -0.025588777;
                        } else {
                            var3 = 0.059224196;
                        }
                    } else {
                        var3 = -0.036060873;
                    }
                } else {
                    var3 = 0.119057514;
                }
            }
        } else {
            if (inputs[2] < 3.1442857) {
                if (inputs[15] < 2.9960687) {
                    if (inputs[10] < 2.2625) {
                        if (inputs[3] < 0.4305812) {
                            var3 = -0.11145483;
                        } else {
                            var3 = -0.021587294;
                        }
                    } else {
                        if (inputs[3] < 1.2200185) {
                            var3 = 0.057182565;
                        } else {
                            var3 = -0.04480073;
                        }
                    }
                } else {
                    var3 = -0.12357114;
                }
            } else {
                var3 = 0.07279385;
            }
        }
    } else {
        var3 = -0.1208886;
    }
    double var4;
    if (inputs[21] < 24.328299) {
        if (inputs[10] < 0.4625) {
            if (inputs[17] < 2.7121458) {
                if (inputs[16] < -2.066866) {
                    if (inputs[1] < 28.362093) {
                        var4 = 0.10344941;
                    } else {
                        var4 = -0.0028974637;
                    }
                } else {
                    if (inputs[13] < -2.365) {
                        var4 = 0.09184757;
                    } else {
                        var4 = 0.12481451;
                    }
                }
            } else {
                if (inputs[6] < -7.982278) {
                    var4 = 0.036968388;
                } else {
                    var4 = -0.085960954;
                }
            }
        } else {
            if (inputs[3] < 0.08772628) {
                if (inputs[4] < -2.872818) {
                    if (inputs[9] < 36.343536) {
                        var4 = -0.12574807;
                    } else {
                        var4 = -0.0071731876;
                    }
                } else {
                    if (inputs[16] < 6.925231) {
                        if (inputs[8] < 2.5661972) {
                            var4 = 0.04406316;
                        } else {
                            var4 = -0.018073486;
                        }
                    } else {
                        var4 = -0.07988845;
                    }
                }
            } else {
                if (inputs[16] < 1.976524) {
                    if (inputs[2] < 1.6492857) {
                        if (inputs[9] < 31.703928) {
                            var4 = 0.06440326;
                        } else {
                            var4 = -0.018412717;
                        }
                    } else {
                        if (inputs[10] < 2.3075) {
                            var4 = -0.10191027;
                        } else {
                            var4 = 0.00027636488;
                        }
                    }
                } else {
                    if (inputs[6] < -22.89667) {
                        var4 = -0.027264003;
                    } else {
                        if (inputs[18] < 10.46) {
                            var4 = -0.1432864;
                        } else {
                            var4 = -0.07166896;
                        }
                    }
                }
            }
        }
    } else {
        var4 = 0.10522177;
    }
    double var5;
    if (inputs[6] < 27.239037) {
        if (inputs[8] < 2.1819549) {
            var5 = 0.08410715;
        } else {
            if (inputs[3] < -0.4338425) {
                if (inputs[12] < -7.375) {
                    if (inputs[21] < 17.83488) {
                        var5 = 0.04277407;
                    } else {
                        var5 = -0.05135779;
                    }
                } else {
                    if (inputs[21] < 21.558628) {
                        if (inputs[6] < -22.778442) {
                            var5 = 0.05489467;
                        } else {
                            var5 = 0.002314006;
                        }
                    } else {
                        if (inputs[21] < 23.143839) {
                            var5 = 0.104631774;
                        } else {
                            var5 = 0.038735017;
                        }
                    }
                }
            } else {
                if (inputs[16] < 3.5614035) {
                    if (inputs[20] < 7.0) {
                        var5 = -0.06969914;
                    } else {
                        if (inputs[8] < 2.481739) {
                            var5 = -0.017509772;
                        } else {
                            var5 = 0.030631505;
                        }
                    }
                } else {
                    if (inputs[10] < 0.815) {
                        var5 = 0.025917105;
                    } else {
                        if (inputs[9] < 38.008316) {
                            var5 = -0.06102696;
                        } else {
                            var5 = -0.14335805;
                        }
                    }
                }
            }
        }
    } else {
        var5 = -0.073233984;
    }
    double var6;
    if (inputs[12] < 27.92) {
        if (inputs[23] < -4.17) {
            if (inputs[8] < 2.402556) {
                if (inputs[8] < 2.3473053) {
                    if (inputs[12] < -7.96) {
                        var6 = 0.036111083;
                    } else {
                        var6 = -0.05234649;
                    }
                } else {
                    var6 = 0.09357058;
                }
            } else {
                if (inputs[14] < 0.6929307) {
                    if (inputs[6] < -6.8828635) {
                        var6 = -0.033131737;
                    } else {
                        var6 = 0.06668647;
                    }
                } else {
                    if (inputs[2] < 1.53) {
                        if (inputs[23] < -36.69) {
                            var6 = -0.044711813;
                        } else {
                            var6 = -0.1341428;
                        }
                    } else {
                        if (inputs[13] < -1.82) {
                            var6 = -0.06069486;
                        } else {
                            var6 = 0.020906622;
                        }
                    }
                }
            }
        } else {
            if (inputs[19] < 3.0) {
                if (inputs[12] < 0.87) {
                    if (inputs[13] < -16.35) {
                        var6 = 0.06630965;
                    } else {
                        if (inputs[13] < -11.84) {
                            var6 = -0.084684946;
                        } else {
                            var6 = 0.007322164;
                        }
                    }
                } else {
                    if (inputs[20] < 17.0) {
                        if (inputs[2] < 1.3192858) {
                            var6 = 0.14547296;
                        } else {
                            var6 = 0.053167608;
                        }
                    } else {
                        var6 = -0.024353122;
                    }
                }
            } else {
                if (inputs[7] < 17.166454) {
                    if (inputs[8] < 2.4713542) {
                        if (inputs[4] < 2.1979854) {
                            var6 = -0.07704287;
                        } else {
                            var6 = 0.013752079;
                        }
                    } else {
                        if (inputs[8] < 2.5004926) {
                            var6 = 0.09953865;
                        } else {
                            var6 = 0.018410401;
                        }
                    }
                } else {
                    if (inputs[24] < 60.473915) {
                        if (inputs[14] < 0.72506756) {
                            var6 = -0.09815576;
                        } else {
                            var6 = -0.1275521;
                        }
                    } else {
                        var6 = -0.012402565;
                    }
                }
            }
        }
    } else {
        var6 = -0.09044087;
    }
    double var7;
    if (inputs[21] < 24.010128) {
        if (inputs[12] < 15.95) {
            if (inputs[12] < 11.64) {
                if (inputs[8] < 2.5164557) {
                    if (inputs[8] < 2.5093834) {
                        if (inputs[23] < 29.685) {
                            var7 = 0.011541066;
                        } else {
                            var7 = -0.08217078;
                        }
                    } else {
                        var7 = 0.113735646;
                    }
                } else {
                    if (inputs[4] < 2.334938) {
                        if (inputs[10] < 0.905) {
                            var7 = -0.00028458118;
                        } else {
                            var7 = -0.083320044;
                        }
                    } else {
                        if (inputs[16] < 3.502729) {
                            var7 = 0.059132;
                        } else {
                            var7 = -0.035219546;
                        }
                    }
                }
            } else {
                if (inputs[7] < 3.3011563) {
                    var7 = -0.016270734;
                } else {
                    if (inputs[1] < 67.20021) {
                        var7 = 0.13569334;
                    } else {
                        var7 = 0.03721578;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.0375) {
                var7 = -0.11776391;
            } else {
                if (inputs[9] < 35.83771) {
                    var7 = -0.07400424;
                } else {
                    var7 = 0.035748668;
                }
            }
        }
    } else {
        var7 = 0.068828225;
    }
    double var8;
    if (inputs[1] < 30.82347) {
        if (inputs[15] < -3.769897) {
            var8 = 0.067481846;
        } else {
            if (inputs[3] < 1.5817401) {
                if (inputs[13] < 6.41) {
                    if (inputs[13] < -7.225) {
                        if (inputs[21] < 20.264345) {
                            var8 = -0.0575651;
                        } else {
                            var8 = 0.024668429;
                        }
                    } else {
                        if (inputs[3] < 0.007195763) {
                            var8 = -0.07601031;
                        } else {
                            var8 = -0.13944523;
                        }
                    }
                } else {
                    if (inputs[3] < -0.09276572) {
                        var8 = 0.06480257;
                    } else {
                        var8 = -0.043916102;
                    }
                }
            } else {
                var8 = 0.029469702;
            }
        }
    } else {
        if (inputs[18] < 16.505) {
            if (inputs[8] < 2.6235294) {
                if (inputs[9] < 27.667595) {
                    if (inputs[21] < 16.175642) {
                        var8 = -0.08586041;
                    } else {
                        if (inputs[18] < -2.9) {
                            var8 = -0.045149624;
                        } else {
                            var8 = 0.039916273;
                        }
                    }
                } else {
                    if (inputs[10] < 1.9925) {
                        if (inputs[3] < -0.8499863) {
                            var8 = 0.06750705;
                        } else {
                            var8 = 0.0037304526;
                        }
                    } else {
                        if (inputs[21] < 17.58866) {
                            var8 = 0.121361166;
                        } else {
                            var8 = 0.05117497;
                        }
                    }
                }
            } else {
                if (inputs[10] < 0.4575) {
                    var8 = 0.057025455;
                } else {
                    if (inputs[19] < 3.0) {
                        var8 = -0.09144579;
                    } else {
                        var8 = -0.007830579;
                    }
                }
            }
        } else {
            if (inputs[4] < 3.405927) {
                if (inputs[20] < 15.0) {
                    var8 = -0.13493083;
                } else {
                    var8 = -0.005988538;
                }
            } else {
                var8 = 0.027936578;
            }
        }
    }
    double var9;
    if (inputs[9] < 18.506268) {
        if (inputs[20] < 15.0) {
            var9 = 0.117180504;
        } else {
            var9 = 0.028072288;
        }
    } else {
        if (inputs[13] < -15.83) {
            if (inputs[17] < -4.1263156) {
                if (inputs[7] < -18.783993) {
                    var9 = 0.02338608;
                } else {
                    var9 = -0.072657764;
                }
            } else {
                if (inputs[20] < 12.0) {
                    var9 = 0.039691094;
                } else {
                    var9 = 0.09173191;
                }
            }
        } else {
            if (inputs[21] < 17.270449) {
                if (inputs[3] < 0.1593122) {
                    if (inputs[5] < 1.0) {
                        if (inputs[7] < 5.0871315) {
                            var9 = -0.09571469;
                        } else {
                            var9 = 0.005501888;
                        }
                    } else {
                        var9 = 0.055611968;
                    }
                } else {
                    var9 = -0.100315996;
                }
            } else {
                if (inputs[2] < 1.7264286) {
                    if (inputs[9] < 30.646248) {
                        if (inputs[7] < 20.95334) {
                            var9 = 0.027821101;
                        } else {
                            var9 = 0.11165824;
                        }
                    } else {
                        if (inputs[21] < 21.689503) {
                            var9 = 0.010128386;
                        } else {
                            var9 = -0.05715327;
                        }
                    }
                } else {
                    if (inputs[21] < 21.602522) {
                        if (inputs[21] < 20.176733) {
                            var9 = -0.010805769;
                        } else {
                            var9 = -0.07818859;
                        }
                    } else {
                        var9 = 0.05146231;
                    }
                }
            }
        }
    }
    double var10;
    if (inputs[16] < -6.9189024) {
        var10 = 0.07512172;
    } else {
        if (inputs[1] < 30.82347) {
            if (inputs[2] < 1.0035714) {
                var10 = 0.051559288;
            } else {
                if (inputs[8] < 2.2955146) {
                    var10 = 0.05116805;
                } else {
                    if (inputs[9] < 36.512947) {
                        if (inputs[14] < 0.8117286) {
                            var10 = -0.07442285;
                        } else {
                            var10 = 0.017886681;
                        }
                    } else {
                        if (inputs[15] < -2.813249) {
                            var10 = -0.063976265;
                        } else {
                            var10 = -0.1358674;
                        }
                    }
                }
            }
        } else {
            if (inputs[1] < 36.326664) {
                if (inputs[2] < 2.6035714) {
                    if (inputs[20] < 15.0) {
                        if (inputs[13] < -6.25) {
                            var10 = 0.022754401;
                        } else {
                            var10 = 0.10218896;
                        }
                    } else {
                        if (inputs[3] < 0.535828) {
                            var10 = -0.06447066;
                        } else {
                            var10 = 0.0499569;
                        }
                    }
                } else {
                    var10 = 0.108201616;
                }
            } else {
                if (inputs[20] < 21.0) {
                    if (inputs[12] < 16.505) {
                        if (inputs[13] < 13.025) {
                            var10 = -0.0015933847;
                        } else {
                            var10 = 0.091108665;
                        }
                    } else {
                        if (inputs[3] < -0.72686684) {
                            var10 = 0.017212767;
                        } else {
                            var10 = -0.10253676;
                        }
                    }
                } else {
                    var10 = -0.07447867;
                }
            }
        }
    }
    double var11;
    if (inputs[21] < 24.010128) {
        if (inputs[7] < 28.382496) {
            if (inputs[6] < -55.599304) {
                if (inputs[6] < -72.63183) {
                    var11 = -0.008563524;
                } else {
                    var11 = -0.0889129;
                }
            } else {
                if (inputs[3] < 0.11182756) {
                    if (inputs[15] < -3.0006073) {
                        var11 = -0.0609268;
                    } else {
                        if (inputs[8] < 2.3928058) {
                            var11 = 0.06398814;
                        } else {
                            var11 = 0.013027103;
                        }
                    }
                } else {
                    if (inputs[7] < -18.783993) {
                        if (inputs[7] < -25.921698) {
                            var11 = -0.03544637;
                        } else {
                            var11 = 0.05313396;
                        }
                    } else {
                        if (inputs[10] < 2.2625) {
                            var11 = -0.04785389;
                        } else {
                            var11 = 0.009218824;
                        }
                    }
                }
            }
        } else {
            var11 = -0.07923076;
        }
    } else {
        var11 = 0.08049001;
    }
    double var12;
    if (inputs[13] < -15.15) {
        if (inputs[21] < 21.585377) {
            if (inputs[8] < 2.527957) {
                if (inputs[14] < 0.9558383) {
                    var12 = -0.014061772;
                } else {
                    var12 = 0.07124537;
                }
            } else {
                var12 = 0.1126881;
            }
        } else {
            var12 = -0.04735614;
        }
    } else {
        if (inputs[21] < 22.741905) {
            if (inputs[13] < 6.675) {
                if (inputs[7] < 20.256338) {
                    if (inputs[16] < 3.378218) {
                        if (inputs[24] < 45.802517) {
                            var12 = -0.03778557;
                        } else {
                            var12 = 0.04424377;
                        }
                    } else {
                        var12 = -0.10346414;
                    }
                } else {
                    if (inputs[10] < 1.0725) {
                        var12 = -0.04659984;
                    } else {
                        if (inputs[8] < 2.5023365) {
                            var12 = 0.0009836847;
                        } else {
                            var12 = 0.116526954;
                        }
                    }
                }
            } else {
                if (inputs[7] < 21.994337) {
                    if (inputs[21] < 20.487743) {
                        if (inputs[21] < 17.554108) {
                            var12 = -0.026631864;
                        } else {
                            var12 = 0.051998645;
                        }
                    } else {
                        var12 = -0.042835794;
                    }
                } else {
                    var12 = -0.0852182;
                }
            }
        } else {
            if (inputs[13] < 7.48) {
                if (inputs[6] < -20.647436) {
                    var12 = 0.10840318;
                } else {
                    var12 = 0.01574479;
                }
            } else {
                var12 = -0.019200908;
            }
        }
    }
    double var13;
    if (inputs[18] < -18.235) {
        if (inputs[8] < 2.4987774) {
            var13 = -0.006421209;
        } else {
            var13 = -0.11192369;
        }
    } else {
        if (inputs[12] < -14.43) {
            if (inputs[3] < 0.8231325) {
                if (inputs[13] < -18.065) {
                    var13 = 0.05718408;
                } else {
                    var13 = -0.0077481517;
                }
            } else {
                var13 = 0.083385624;
            }
        } else {
            if (inputs[8] < 2.3393393) {
                if (inputs[8] < 2.2955146) {
                    if (inputs[20] < 16.0) {
                        var13 = -0.06287097;
                    } else {
                        var13 = 0.013682385;
                    }
                } else {
                    var13 = -0.11865321;
                }
            } else {
                if (inputs[8] < 2.3963253) {
                    if (inputs[20] < 16.0) {
                        var13 = 0.008861108;
                    } else {
                        var13 = 0.10646653;
                    }
                } else {
                    if (inputs[16] < -6.3154984) {
                        var13 = 0.062522314;
                    } else {
                        if (inputs[12] < -4.85) {
                            var13 = -0.03213339;
                        } else {
                            var13 = 0.005517644;
                        }
                    }
                }
            }
        }
    }
    double var14;
    if (inputs[1] < 61.282856) {
        if (inputs[1] < 35.795807) {
            if (inputs[1] < 30.82347) {
                if (inputs[17] < -2.8768346) {
                    if (inputs[15] < -2.3095493) {
                        if (inputs[10] < 0.905) {
                            var14 = 0.05392061;
                        } else {
                            var14 = -0.0037521059;
                        }
                    } else {
                        var14 = -0.06960753;
                    }
                } else {
                    var14 = -0.11685225;
                }
            } else {
                if (inputs[14] < 1.2116929) {
                    if (inputs[18] < -4.89) {
                        if (inputs[23] < -36.375) {
                            var14 = 0.026510697;
                        } else {
                            var14 = -0.07478606;
                        }
                    } else {
                        if (inputs[18] < -0.905) {
                            var14 = 0.08512485;
                        } else {
                            var14 = 0.022055907;
                        }
                    }
                } else {
                    var14 = 0.104679145;
                }
            }
        } else {
            if (inputs[3] < -0.61608714) {
                var14 = -0.10972662;
            } else {
                if (inputs[4] < -2.0275404) {
                    var14 = -0.09639251;
                } else {
                    if (inputs[9] < 21.89453) {
                        var14 = 0.05889837;
                    } else {
                        var14 = -0.049146414;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 63.736034) {
            if (inputs[24] < 32.909748) {
                var14 = 0.12813875;
            } else {
                var14 = 0.032545388;
            }
        } else {
            if (inputs[1] < 64.91959) {
                var14 = -0.08542991;
            } else {
                if (inputs[13] < -4.78) {
                    if (inputs[23] < 25.065) {
                        var14 = 0.10190122;
                    } else {
                        var14 = 0.0142192915;
                    }
                } else {
                    if (inputs[3] < -0.5083069) {
                        if (inputs[17] < 4.7224197) {
                            var14 = -0.04382376;
                        } else {
                            var14 = 0.06396933;
                        }
                    } else {
                        if (inputs[17] < 4.061261) {
                            var14 = 0.006201281;
                        } else {
                            var14 = -0.08526386;
                        }
                    }
                }
            }
        }
    }
    double var15;
    if (inputs[9] < 60.570217) {
        if (inputs[3] < -0.07619367) {
            if (inputs[14] < 1.3339728) {
                if (inputs[19] < 4.0) {
                    if (inputs[10] < 2.6175) {
                        if (inputs[10] < 1.725) {
                            var15 = 0.041226123;
                        } else {
                            var15 = -0.052720066;
                        }
                    } else {
                        if (inputs[1] < 64.01309) {
                            var15 = 0.05010593;
                        } else {
                            var15 = 0.10890797;
                        }
                    }
                } else {
                    if (inputs[9] < 28.382587) {
                        var15 = -0.07607571;
                    } else {
                        var15 = 0.031186737;
                    }
                }
            } else {
                if (inputs[2] < 2.732143) {
                    var15 = -0.10896172;
                } else {
                    var15 = -0.0031842664;
                }
            }
        } else {
            if (inputs[9] < 39.132736) {
                if (inputs[6] < 15.803005) {
                    if (inputs[1] < 69.46455) {
                        if (inputs[4] < 2.1747572) {
                            var15 = -0.0059563005;
                        } else {
                            var15 = 0.06750038;
                        }
                    } else {
                        var15 = -0.064417385;
                    }
                } else {
                    var15 = -0.09871925;
                }
            } else {
                if (inputs[6] < -14.196849) {
                    var15 = -0.13152526;
                } else {
                    var15 = -0.023576057;
                }
            }
        }
    } else {
        var15 = 0.08738074;
    }
    double var16;
    if (inputs[21] < 19.424759) {
        if (inputs[24] < 53.70007) {
            if (inputs[6] < -52.418877) {
                if (inputs[2] < 1.2314286) {
                    var16 = -0.0050520045;
                } else {
                    var16 = -0.10939583;
                }
            } else {
                if (inputs[6] < -45.13154) {
                    var16 = 0.11781808;
                } else {
                    if (inputs[16] < -4.765365) {
                        var16 = -0.08513532;
                    } else {
                        if (inputs[9] < 26.005053) {
                            var16 = -0.03138788;
                        } else {
                            var16 = 0.01507702;
                        }
                    }
                }
            }
        } else {
            var16 = -0.074584074;
        }
    } else {
        if (inputs[18] < -19.1) {
            var16 = -0.06727705;
        } else {
            if (inputs[12] < -16.295) {
                var16 = 0.08362483;
            } else {
                if (inputs[21] < 20.030624) {
                    if (inputs[14] < 1.0921121) {
                        if (inputs[6] < -38.370102) {
                            var16 = 0.017250117;
                        } else {
                            var16 = 0.1148637;
                        }
                    } else {
                        var16 = -0.016304502;
                    }
                } else {
                    if (inputs[13] < -7.6) {
                        if (inputs[6] < -14.196849) {
                            var16 = -0.081914365;
                        } else {
                            var16 = -0.0016581197;
                        }
                    } else {
                        if (inputs[21] < 21.763521) {
                            var16 = -0.007482115;
                        } else {
                            var16 = 0.04506258;
                        }
                    }
                }
            }
        }
    }
    double var17;
    if (inputs[3] < -1.9792619) {
        var17 = -0.06857892;
    } else {
        if (inputs[21] < 24.328299) {
            if (inputs[23] < 48.885) {
                if (inputs[2] < 1.7892857) {
                    if (inputs[2] < 1.2185714) {
                        if (inputs[3] < -1.3065057) {
                            var17 = 0.0726676;
                        } else {
                            var17 = -0.017348254;
                        }
                    } else {
                        if (inputs[21] < 21.524632) {
                            var17 = 0.04451316;
                        } else {
                            var17 = -0.020389857;
                        }
                    }
                } else {
                    if (inputs[1] < 64.21748) {
                        if (inputs[21] < 14.675635) {
                            var17 = 0.057352398;
                        } else {
                            var17 = -0.0049386467;
                        }
                    } else {
                        if (inputs[14] < 1.3339728) {
                            var17 = -0.12027626;
                        } else {
                            var17 = -0.002454181;
                        }
                    }
                }
            } else {
                var17 = -0.055350676;
            }
        } else {
            var17 = 0.07918113;
        }
    }
    double var18;
    if (inputs[3] < 0.19802953) {
        if (inputs[6] < 3.5438905) {
            if (inputs[10] < 2.6175) {
                if (inputs[16] < -1.1435823) {
                    if (inputs[8] < 2.3963253) {
                        var18 = 0.027134448;
                    } else {
                        if (inputs[12] < 8.56) {
                            var18 = -0.09465827;
                        } else {
                            var18 = 0.021291245;
                        }
                    }
                } else {
                    if (inputs[18] < 17.42) {
                        if (inputs[14] < 0.9453626) {
                            var18 = 0.05638051;
                        } else {
                            var18 = -0.0054246574;
                        }
                    } else {
                        var18 = -0.06806272;
                    }
                }
            } else {
                if (inputs[20] < 17.0) {
                    var18 = 0.016003486;
                } else {
                    if (inputs[21] < 19.677914) {
                        var18 = 0.10350978;
                    } else {
                        var18 = 0.030810893;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.4825) {
                var18 = 0.019268535;
            } else {
                var18 = -0.094118915;
            }
        }
    } else {
        if (inputs[15] < -3.6658084) {
            var18 = 0.06663716;
        } else {
            if (inputs[16] < -5.1501026) {
                var18 = -0.092116766;
            } else {
                if (inputs[16] < 1.976524) {
                    if (inputs[14] < 1.2650809) {
                        if (inputs[9] < 33.038826) {
                            var18 = 0.03281619;
                        } else {
                            var18 = -0.049043734;
                        }
                    } else {
                        var18 = -0.06944116;
                    }
                } else {
                    if (inputs[3] < 0.6004593) {
                        var18 = 0.0043737036;
                    } else {
                        if (inputs[12] < -2.245) {
                            var18 = -0.05236652;
                        } else {
                            var18 = -0.112486824;
                        }
                    }
                }
            }
        }
    }
    double var19;
    if (inputs[24] < -36.201096) {
        if (inputs[6] < -2.358174) {
            if (inputs[12] < -2.245) {
                if (inputs[17] < -5.646766) {
                    var19 = 0.028846642;
                } else {
                    if (inputs[4] < -2.872818) {
                        var19 = -0.098530576;
                    } else {
                        var19 = -0.022612866;
                    }
                }
            } else {
                if (inputs[3] < -0.27667353) {
                    var19 = 0.10164039;
                } else {
                    if (inputs[3] < 0.718797) {
                        var19 = -0.029663906;
                    } else {
                        var19 = 0.044236884;
                    }
                }
            }
        } else {
            if (inputs[1] < 29.687616) {
                if (inputs[10] < 1.1425) {
                    var19 = 0.07650308;
                } else {
                    var19 = -0.021009225;
                }
            } else {
                if (inputs[17] < -3.210673) {
                    var19 = 0.11579018;
                } else {
                    var19 = 0.06345909;
                }
            }
        }
    } else {
        if (inputs[12] < -16.295) {
            if (inputs[10] < 2.01) {
                var19 = 0.06106394;
            } else {
                var19 = 0.048081975;
            }
        } else {
            if (inputs[1] < 61.282856) {
                if (inputs[14] < 1.2955356) {
                    if (inputs[1] < 35.097878) {
                        var19 = -0.070994936;
                    } else {
                        if (inputs[19] < 3.0) {
                            var19 = 0.053719833;
                        } else {
                            var19 = -0.036503986;
                        }
                    }
                } else {
                    if (inputs[21] < 17.69725) {
                        var19 = -0.038563687;
                    } else {
                        var19 = -0.11460841;
                    }
                }
            } else {
                if (inputs[3] < 0.87841815) {
                    if (inputs[17] < 2.1905231) {
                        if (inputs[1] < 63.875416) {
                            var19 = 0.098154396;
                        } else {
                            var19 = 0.01801672;
                        }
                    } else {
                        if (inputs[17] < 4.8139157) {
                            var19 = -0.022770043;
                        } else {
                            var19 = 0.02762261;
                        }
                    }
                } else {
                    var19 = -0.0528132;
                }
            }
        }
    }
    double var20;
    if (inputs[21] < 24.436716) {
        if (inputs[13] < -16.075) {
            if (inputs[18] < -22.535) {
                var20 = -0.026159573;
            } else {
                if (inputs[9] < 30.822323) {
                    if (inputs[24] < -27.336327) {
                        var20 = 0.109087005;
                    } else {
                        var20 = 0.04919722;
                    }
                } else {
                    var20 = 0.013267418;
                }
            }
        } else {
            if (inputs[10] < 2.2675) {
                if (inputs[9] < 23.660772) {
                    if (inputs[17] < 3.512051) {
                        if (inputs[6] < -32.103245) {
                            var20 = 0.07285917;
                        } else {
                            var20 = -0.029803272;
                        }
                    } else {
                        var20 = 0.09496375;
                    }
                } else {
                    if (inputs[9] < 24.870266) {
                        var20 = -0.10570648;
                    } else {
                        if (inputs[14] < 0.72506756) {
                            var20 = 0.007922872;
                        } else {
                            var20 = -0.034389343;
                        }
                    }
                }
            } else {
                if (inputs[4] < 3.4715025) {
                    if (inputs[9] < 29.76932) {
                        if (inputs[18] < 7.285) {
                            var20 = 0.024508901;
                        } else {
                            var20 = -0.080609076;
                        }
                    } else {
                        if (inputs[13] < -3.355) {
                            var20 = 0.0047650696;
                        } else {
                            var20 = 0.0787692;
                        }
                    }
                } else {
                    var20 = -0.054403372;
                }
            }
        }
    } else {
        var20 = 0.065645605;
    }
    double var21;
    if (inputs[6] < -80.08378) {
        var21 = -0.07812728;
    } else {
        if (inputs[12] < 16.505) {
            if (inputs[2] < 1.6985714) {
                if (inputs[9] < 29.42567) {
                    if (inputs[9] < 28.453474) {
                        if (inputs[14] < 0.6603716) {
                            var21 = -0.04510085;
                        } else {
                            var21 = 0.04593947;
                        }
                    } else {
                        var21 = 0.12326437;
                    }
                } else {
                    if (inputs[14] < 0.74342716) {
                        if (inputs[12] < -12.53) {
                            var21 = 0.09614648;
                        } else {
                            var21 = 0.012367912;
                        }
                    } else {
                        if (inputs[6] < -22.89667) {
                            var21 = 0.021010702;
                        } else {
                            var21 = -0.08286943;
                        }
                    }
                }
            } else {
                if (inputs[2] < 2.732143) {
                    if (inputs[14] < 1.0268162) {
                        var21 = -0.07858928;
                    } else {
                        if (inputs[20] < 15.0) {
                            var21 = 0.05755324;
                        } else {
                            var21 = -0.031726375;
                        }
                    }
                } else {
                    if (inputs[10] < 0.9725) {
                        var21 = 0.08774075;
                    } else {
                        if (inputs[2] < 3.2471428) {
                            var21 = 0.05237017;
                        } else {
                            var21 = -0.023078544;
                        }
                    }
                }
            }
        } else {
            if (inputs[3] < -0.72686684) {
                var21 = 0.020001817;
            } else {
                var21 = -0.09845093;
            }
        }
    }
    double var22;
    if (inputs[16] < -6.857122) {
        var22 = 0.06264653;
    } else {
        if (inputs[16] < -5.819462) {
            var22 = -0.11237463;
        } else {
            if (inputs[2] < 2.732143) {
                if (inputs[2] < 1.7892857) {
                    if (inputs[2] < 1.53) {
                        if (inputs[18] < 15.365) {
                            var22 = 0.00032742822;
                        } else {
                            var22 = -0.07100186;
                        }
                    } else {
                        if (inputs[6] < -26.165287) {
                            var22 = -0.040192883;
                        } else {
                            var22 = 0.06719603;
                        }
                    }
                } else {
                    if (inputs[6] < -25.04989) {
                        if (inputs[8] < 2.489796) {
                            var22 = -0.028090598;
                        } else {
                            var22 = 0.05123673;
                        }
                    } else {
                        if (inputs[10] < 2.8025) {
                            var22 = -0.07105639;
                        } else {
                            var22 = 0.00073918834;
                        }
                    }
                }
            } else {
                if (inputs[2] < 2.9221427) {
                    var22 = 0.08621639;
                } else {
                    if (inputs[14] < 1.6042682) {
                        var22 = -0.038119406;
                    } else {
                        if (inputs[14] < 2.0595863) {
                            var22 = 0.07012862;
                        } else {
                            var22 = -0.0076668225;
                        }
                    }
                }
            }
        }
    }
    double var23;
    if (inputs[6] < 25.207453) {
        if (inputs[13] < 6.35) {
            if (inputs[10] < 0.8275) {
                if (inputs[17] < -4.7906694) {
                    var23 = 0.0872341;
                } else {
                    if (inputs[18] < 0.855) {
                        if (inputs[15] < -2.5105317) {
                            var23 = 0.025091527;
                        } else {
                            var23 = -0.06939077;
                        }
                    } else {
                        if (inputs[21] < 19.292173) {
                            var23 = -0.0042195222;
                        } else {
                            var23 = 0.067227654;
                        }
                    }
                }
            } else {
                if (inputs[16] < -5.284009) {
                    var23 = -0.111031674;
                } else {
                    if (inputs[16] < 5.220605) {
                        if (inputs[14] < 0.64749306) {
                            var23 = 0.05431025;
                        } else {
                            var23 = -0.008767823;
                        }
                    } else {
                        var23 = -0.078943945;
                    }
                }
            }
        } else {
            if (inputs[12] < 20.11) {
                if (inputs[15] < 2.942869) {
                    if (inputs[1] < 67.20021) {
                        if (inputs[2] < 2.67) {
                            var23 = 0.030014459;
                        } else {
                            var23 = 0.09320422;
                        }
                    } else {
                        if (inputs[20] < 15.0) {
                            var23 = 0.025695162;
                        } else {
                            var23 = -0.07343168;
                        }
                    }
                } else {
                    var23 = 0.107604615;
                }
            } else {
                if (inputs[2] < 1.5921428) {
                    var23 = -0.06724199;
                } else {
                    var23 = 0.01565697;
                }
            }
        }
    } else {
        var23 = -0.054467328;
    }
    double var24;
    if (inputs[18] < 20.36) {
        if (inputs[10] < 1.21) {
            if (inputs[9] < 54.98018) {
                if (inputs[9] < 24.675793) {
                    if (inputs[21] < 18.977814) {
                        if (inputs[8] < 2.501355) {
                            var24 = -0.050060015;
                        } else {
                            var24 = 0.051590156;
                        }
                    } else {
                        if (inputs[8] < 2.4886878) {
                            var24 = 0.119184785;
                        } else {
                            var24 = 0.07469446;
                        }
                    }
                } else {
                    if (inputs[10] < 0.17) {
                        var24 = -0.093732715;
                    } else {
                        if (inputs[10] < 0.2725) {
                            var24 = 0.076166235;
                        } else {
                            var24 = -0.000012334412;
                        }
                    }
                }
            } else {
                var24 = 0.093923375;
            }
        } else {
            if (inputs[21] < 21.037428) {
                if (inputs[8] < 2.638587) {
                    if (inputs[1] < 25.032011) {
                        var24 = -0.05537913;
                    } else {
                        if (inputs[6] < 10.910757) {
                            var24 = 0.024374692;
                        } else {
                            var24 = -0.048383683;
                        }
                    }
                } else {
                    var24 = -0.062003028;
                }
            } else {
                if (inputs[6] < -20.647436) {
                    var24 = -0.01260762;
                } else {
                    var24 = -0.10497853;
                }
            }
        }
    } else {
        var24 = -0.059487265;
    }
    double var25;
    if (inputs[13] < 26.305) {
        if (inputs[14] < 0.73148984) {
            if (inputs[3] < -1.3344076) {
                if (inputs[16] < 4.2087154) {
                    var25 = 0.04035471;
                } else {
                    var25 = 0.11138043;
                }
            } else {
                if (inputs[20] < 10.0) {
                    if (inputs[3] < -0.04057971) {
                        if (inputs[6] < -50.30599) {
                            var25 = 0.07047419;
                        } else {
                            var25 = -0.009794997;
                        }
                    } else {
                        if (inputs[17] < -4.7906694) {
                            var25 = -0.007301143;
                        } else {
                            var25 = -0.08151854;
                        }
                    }
                } else {
                    if (inputs[20] < 11.0) {
                        var25 = 0.104635544;
                    } else {
                        if (inputs[21] < 20.77686) {
                            var25 = -0.0042890855;
                        } else {
                            var25 = 0.067213066;
                        }
                    }
                }
            }
        } else {
            if (inputs[3] < -1.9224318) {
                var25 = -0.082385086;
            } else {
                if (inputs[6] < -52.418877) {
                    var25 = -0.06681206;
                } else {
                    if (inputs[7] < 24.453222) {
                        if (inputs[2] < 1.4592857) {
                            var25 = -0.053134903;
                        } else {
                            var25 = 0.00578972;
                        }
                    } else {
                        var25 = 0.070998445;
                    }
                }
            }
        }
    } else {
        var25 = -0.08281773;
    }
    double var26;
    if (inputs[24] < -47.42504) {
        if (inputs[2] < 0.96428573) {
            var26 = 0.073044114;
        } else {
            if (inputs[13] < -7.225) {
                if (inputs[9] < 32.71458) {
                    var26 = 0.040871214;
                } else {
                    var26 = -0.036048573;
                }
            } else {
                if (inputs[5] < 1.0) {
                    if (inputs[13] < 4.335) {
                        var26 = -0.12619247;
                    } else {
                        var26 = -0.064052686;
                    }
                } else {
                    var26 = -0.010927424;
                }
            }
        }
    } else {
        if (inputs[24] < -36.201096) {
            if (inputs[3] < 0.33301044) {
                var26 = 0.095191605;
            } else {
                if (inputs[4] < -2.5894048) {
                    var26 = 0.056048308;
                } else {
                    var26 = -0.037505995;
                }
            }
        } else {
            if (inputs[12] < 26.215) {
                if (inputs[16] < -3.2604187) {
                    var26 = -0.06500739;
                } else {
                    if (inputs[20] < 14.0) {
                        if (inputs[6] < -29.362022) {
                            var26 = 0.057675432;
                        } else {
                            var26 = 0.0039397795;
                        }
                    } else {
                        if (inputs[13] < -16.88) {
                            var26 = 0.07878511;
                        } else {
                            var26 = -0.010493164;
                        }
                    }
                }
            } else {
                var26 = -0.077742256;
            }
        }
    }
    double var27;
    if (inputs[6] < 19.42722) {
        if (inputs[4] < -4.285976) {
            var27 = 0.07272814;
        } else {
            if (inputs[8] < 2.169643) {
                var27 = 0.06496834;
            } else {
                if (inputs[1] < 31.394823) {
                    if (inputs[15] < -2.1662493) {
                        if (inputs[14] < 1.5466088) {
                            var27 = -0.028589668;
                        } else {
                            var27 = 0.055423908;
                        }
                    } else {
                        var27 = -0.09214202;
                    }
                } else {
                    if (inputs[1] < 32.20932) {
                        var27 = 0.082586855;
                    } else {
                        if (inputs[2] < 3.335) {
                            var27 = 0.00015191412;
                        } else {
                            var27 = 0.0488563;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[23] < -4.17) {
            var27 = -0.10438196;
        } else {
            var27 = -0.01505391;
        }
    }
    double var28;
    if (inputs[20] < 10.0) {
        if (inputs[8] < 2.5661972) {
            if (inputs[10] < 2.1975) {
                if (inputs[21] < 17.015306) {
                    var28 = 0.0470725;
                } else {
                    if (inputs[13] < 8.135) {
                        if (inputs[8] < 2.4972973) {
                            var28 = -0.12147532;
                        } else {
                            var28 = -0.050433256;
                        }
                    } else {
                        var28 = 0.012102279;
                    }
                }
            } else {
                var28 = 0.049100667;
            }
        } else {
            if (inputs[8] < 2.638587) {
                var28 = -0.120824344;
            } else {
                var28 = -0.027155725;
            }
        }
    } else {
        if (inputs[4] < 3.6998076) {
            if (inputs[14] < 0.69918364) {
                if (inputs[21] < 18.030575) {
                    var28 = -0.021429759;
                } else {
                    if (inputs[3] < -0.234652) {
                        var28 = 0.036151763;
                    } else {
                        if (inputs[8] < 2.497006) {
                            var28 = 0.12993972;
                        } else {
                            var28 = 0.08468184;
                        }
                    }
                }
            } else {
                if (inputs[10] < 4.27) {
                    if (inputs[14] < 0.80040574) {
                        if (inputs[20] < 13.0) {
                            var28 = -0.0011576507;
                        } else {
                            var28 = -0.08479983;
                        }
                    } else {
                        if (inputs[2] < 1.4335715) {
                            var28 = 0.09521683;
                        } else {
                            var28 = 0.0057692365;
                        }
                    }
                } else {
                    if (inputs[6] < -5.9325104) {
                        var28 = 0.023876455;
                    } else {
                        var28 = 0.09168232;
                    }
                }
            }
        } else {
            var28 = -0.06355916;
        }
    }
    double var29;
    if (inputs[24] < 73.70589) {
        if (inputs[8] < 2.4561403) {
            if (inputs[24] < 58.23511) {
                if (inputs[5] < 1.0) {
                    if (inputs[13] < -6.74) {
                        if (inputs[8] < 2.3369863) {
                            var29 = 0.094223276;
                        } else {
                            var29 = -0.014504453;
                        }
                    } else {
                        if (inputs[8] < 2.3393393) {
                            var29 = -0.07650532;
                        } else {
                            var29 = 0.005773068;
                        }
                    }
                } else {
                    if (inputs[9] < 32.253033) {
                        if (inputs[24] < -27.122751) {
                            var29 = 0.067577876;
                        } else {
                            var29 = 0.107483916;
                        }
                    } else {
                        var29 = 0.009584372;
                    }
                }
            } else {
                var29 = 0.10296936;
            }
        } else {
            if (inputs[8] < 2.4968152) {
                if (inputs[10] < 0.815) {
                    var29 = 0.013694902;
                } else {
                    if (inputs[10] < 2.745) {
                        if (inputs[24] < -28.565866) {
                            var29 = -0.05921941;
                        } else {
                            var29 = -0.13528179;
                        }
                    } else {
                        var29 = -0.0014579056;
                    }
                }
            } else {
                if (inputs[9] < 18.907682) {
                    var29 = 0.09327416;
                } else {
                    if (inputs[21] < 17.880342) {
                        if (inputs[9] < 26.59737) {
                            var29 = -0.07971384;
                        } else {
                            var29 = -0.00849031;
                        }
                    } else {
                        if (inputs[1] < 25.699049) {
                            var29 = 0.0698916;
                        } else {
                            var29 = 0.0058682095;
                        }
                    }
                }
            }
        }
    } else {
        var29 = -0.06514373;
    }
    double var30;
    if (inputs[6] < -63.956158) {
        if (inputs[16] < -2.5141747) {
            var30 = -0.085724935;
        } else {
            var30 = -0.0053433864;
        }
    } else {
        if (inputs[2] < 1.7892857) {
            if (inputs[2] < 1.53) {
                if (inputs[13] < -7.38) {
                    if (inputs[14] < 0.74342716) {
                        if (inputs[24] < -45.11521) {
                            var30 = 0.10209312;
                        } else {
                            var30 = 0.03656854;
                        }
                    } else {
                        var30 = 0.0027636786;
                    }
                } else {
                    if (inputs[12] < -2.455) {
                        var30 = -0.062329832;
                    } else {
                        if (inputs[16] < 5.62066) {
                            var30 = 0.017003285;
                        } else {
                            var30 = -0.05530879;
                        }
                    }
                }
            } else {
                if (inputs[8] < 2.476489) {
                    var30 = -0.025035392;
                } else {
                    if (inputs[14] < 0.9453626) {
                        if (inputs[21] < 18.44265) {
                            var30 = 0.056876298;
                        } else {
                            var30 = 0.12104809;
                        }
                    } else {
                        var30 = 0.027147785;
                    }
                }
            }
        } else {
            if (inputs[2] < 1.9107143) {
                var30 = -0.1056553;
            } else {
                if (inputs[8] < 2.6153846) {
                    if (inputs[17] < -2.5856314) {
                        if (inputs[17] < -5.3398623) {
                            var30 = 0.048760355;
                        } else {
                            var30 = -0.047423698;
                        }
                    } else {
                        if (inputs[16] < 1.5420665) {
                            var30 = 0.057660002;
                        } else {
                            var30 = 0.0033760674;
                        }
                    }
                } else {
                    var30 = -0.058672555;
                }
            }
        }
    }
    double var31;
    if (inputs[8] < 2.4176931) {
        if (inputs[20] < 19.0) {
            if (inputs[8] < 2.3506494) {
                if (inputs[13] < -6.25) {
                    var31 = 0.026418742;
                } else {
                    if (inputs[13] < 5.595) {
                        var31 = -0.10311314;
                    } else {
                        var31 = -0.0114081465;
                    }
                }
            } else {
                if (inputs[13] < 2.53) {
                    var31 = 0.021894798;
                } else {
                    var31 = 0.10255254;
                }
            }
        } else {
            var31 = 0.09192018;
        }
    } else {
        if (inputs[21] < 16.99723) {
            if (inputs[1] < 62.81552) {
                if (inputs[1] < 37.129726) {
                    var31 = -0.025316257;
                } else {
                    var31 = -0.119327866;
                }
            } else {
                var31 = 0.016850652;
            }
        } else {
            if (inputs[18] < -7.975) {
                if (inputs[14] < 0.74342716) {
                    if (inputs[17] < -5.646766) {
                        var31 = 0.07138726;
                    } else {
                        var31 = -0.007844853;
                    }
                } else {
                    if (inputs[21] < 18.824001) {
                        var31 = -0.021731965;
                    } else {
                        var31 = -0.09744692;
                    }
                }
            } else {
                if (inputs[16] < 1.976524) {
                    if (inputs[4] < 2.1979854) {
                        if (inputs[14] < 1.242519) {
                            var31 = 0.005860492;
                        } else {
                            var31 = 0.06259626;
                        }
                    } else {
                        var31 = 0.100507654;
                    }
                } else {
                    if (inputs[3] < 0.28234375) {
                        if (inputs[23] < 29.685) {
                            var31 = -0.019754363;
                        } else {
                            var31 = 0.036838118;
                        }
                    } else {
                        if (inputs[12] < -1.875) {
                            var31 = -0.002989721;
                        } else {
                            var31 = -0.10982232;
                        }
                    }
                }
            }
        }
    }
    double var32;
    if (inputs[21] < 23.765123) {
        if (inputs[10] < 0.4625) {
            if (inputs[9] < 42.092125) {
                if (inputs[17] < 2.7121458) {
                    if (inputs[15] < -1.7530926) {
                        if (inputs[15] < -2.5599685) {
                            var32 = 0.030674621;
                        } else {
                            var32 = -0.03916935;
                        }
                    } else {
                        var32 = 0.093275115;
                    }
                } else {
                    var32 = -0.040321525;
                }
            } else {
                var32 = 0.09133617;
            }
        } else {
            if (inputs[10] < 2.2675) {
                if (inputs[9] < 39.132736) {
                    if (inputs[2] < 1.6728572) {
                        if (inputs[20] < 12.0) {
                            var32 = 0.03672475;
                        } else {
                            var32 = -0.015024577;
                        }
                    } else {
                        if (inputs[1] < 64.21748) {
                            var32 = -0.011531675;
                        } else {
                            var32 = -0.097307;
                        }
                    }
                } else {
                    if (inputs[12] < 2.16) {
                        var32 = -0.09056757;
                    } else {
                        var32 = -0.02155456;
                    }
                }
            } else {
                if (inputs[10] < 3.4925) {
                    if (inputs[16] < -3.1268196) {
                        var32 = -0.037735436;
                    } else {
                        if (inputs[13] < 7.245) {
                            var32 = 0.07776192;
                        } else {
                            var32 = 0.0016432746;
                        }
                    }
                } else {
                    if (inputs[20] < 20.0) {
                        if (inputs[2] < 2.515) {
                            var32 = -0.0606248;
                        } else {
                            var32 = 0.015585789;
                        }
                    } else {
                        var32 = 0.040210053;
                    }
                }
            }
        }
    } else {
        var32 = 0.06251301;
    }
    double var33;
    if (inputs[2] < 2.78) {
        if (inputs[2] < 2.195) {
            if (inputs[3] < -0.9081138) {
                if (inputs[8] < 2.5029585) {
                    if (inputs[1] < 40.085823) {
                        var33 = 0.04079559;
                    } else {
                        var33 = -0.028346183;
                    }
                } else {
                    if (inputs[10] < 0.63) {
                        var33 = 0.009929582;
                    } else {
                        if (inputs[24] < 41.961746) {
                            var33 = 0.100967325;
                        } else {
                            var33 = 0.039800316;
                        }
                    }
                }
            } else {
                if (inputs[16] < 4.6066175) {
                    if (inputs[1] < 32.795147) {
                        if (inputs[7] < -15.301786) {
                            var33 = -0.003858176;
                        } else {
                            var33 = -0.098732576;
                        }
                    } else {
                        if (inputs[23] < -7.77) {
                            var33 = 0.05496073;
                        } else {
                            var33 = 0.0021277296;
                        }
                    }
                } else {
                    var33 = -0.06460011;
                }
            }
        } else {
            if (inputs[21] < 18.699093) {
                var33 = 0.006982854;
            } else {
                if (inputs[8] < 2.4886878) {
                    var33 = -0.11648726;
                } else {
                    var33 = -0.015546771;
                }
            }
        }
    } else {
        if (inputs[8] < 2.4444444) {
            var33 = 0.086951755;
        } else {
            if (inputs[10] < 0.905) {
                var33 = 0.06561597;
            } else {
                if (inputs[10] < 2.9875) {
                    var33 = -0.06364805;
                } else {
                    var33 = 0.025846163;
                }
            }
        }
    }
    double var34;
    if (inputs[6] < -35.493023) {
        if (inputs[9] < 29.42567) {
            if (inputs[18] < -1.49) {
                var34 = -0.081133306;
            } else {
                if (inputs[21] < 19.447554) {
                    var34 = 0.010688691;
                } else {
                    var34 = 0.10831492;
                }
            }
        } else {
            if (inputs[7] < -18.783993) {
                var34 = -0.0062399274;
            } else {
                if (inputs[17] < 1.6897446) {
                    var34 = -0.10542425;
                } else {
                    var34 = -0.033444513;
                }
            }
        }
    } else {
        if (inputs[6] < -32.103245) {
            var34 = 0.09669351;
        } else {
            if (inputs[14] < 0.6794056) {
                if (inputs[2] < 1.1685715) {
                    if (inputs[17] < -3.3032737) {
                        var34 = 0.07927964;
                    } else {
                        if (inputs[23] < 6.705) {
                            var34 = -0.0834206;
                        } else {
                            var34 = 0.026818;
                        }
                    }
                } else {
                    var34 = 0.09752497;
                }
            } else {
                if (inputs[6] < 0.3177864) {
                    if (inputs[20] < 17.0) {
                        if (inputs[8] < 2.453416) {
                            var34 = 0.024409266;
                        } else {
                            var34 = -0.029852027;
                        }
                    } else {
                        if (inputs[21] < 21.458338) {
                            var34 = 0.023057047;
                        } else {
                            var34 = 0.08497154;
                        }
                    }
                } else {
                    if (inputs[13] < 8.88) {
                        if (inputs[6] < 20.818884) {
                            var34 = 0.004777782;
                        } else {
                            var34 = -0.06337573;
                        }
                    } else {
                        var34 = -0.10443649;
                    }
                }
            }
        }
    }
    double var35;
    if (inputs[13] < 26.305) {
        if (inputs[12] < 0.555) {
            if (inputs[12] < -0.595) {
                if (inputs[7] < 19.951187) {
                    if (inputs[1] < 40.519524) {
                        if (inputs[4] < -2.00622) {
                            var35 = -0.015405066;
                        } else {
                            var35 = 0.05096355;
                        }
                    } else {
                        if (inputs[18] < 1.085) {
                            var35 = -0.121260844;
                        } else {
                            var35 = -0.036451634;
                        }
                    }
                } else {
                    if (inputs[8] < 2.5028737) {
                        var35 = 0.0018940958;
                    } else {
                        var35 = 0.07432359;
                    }
                }
            } else {
                var35 = -0.09805441;
            }
        } else {
            if (inputs[20] < 21.0) {
                if (inputs[13] < 1.105) {
                    var35 = 0.07694227;
                } else {
                    if (inputs[3] < 1.0083526) {
                        if (inputs[2] < 1.8114285) {
                            var35 = 0.037797205;
                        } else {
                            var35 = -0.010745323;
                        }
                    } else {
                        var35 = -0.06983221;
                    }
                }
            } else {
                var35 = -0.0689914;
            }
        }
    } else {
        var35 = -0.090521075;
    }
    double var36;
    if (inputs[4] < -3.227704) {
        if (inputs[21] < 20.890009) {
            if (inputs[7] < -18.488583) {
                if (inputs[9] < 43.584274) {
                    var36 = -0.005887504;
                } else {
                    var36 = 0.06912911;
                }
            } else {
                var36 = -0.06514335;
            }
        } else {
            var36 = -0.082456075;
        }
    } else {
        if (inputs[13] < -15.15) {
            if (inputs[3] < -0.06108165) {
                var36 = -0.028025884;
            } else {
                if (inputs[21] < 18.061483) {
                    var36 = 0.021293458;
                } else {
                    if (inputs[19] < 3.0) {
                        var36 = 0.10441208;
                    } else {
                        var36 = 0.05142244;
                    }
                }
            }
        } else {
            if (inputs[3] < 0.06041935) {
                if (inputs[3] < -0.16443706) {
                    if (inputs[8] < 2.5540898) {
                        if (inputs[8] < 2.5228572) {
                            var36 = 0.014281763;
                        } else {
                            var36 = 0.0971213;
                        }
                    } else {
                        if (inputs[6] < -21.316923) {
                            var36 = 0.03711036;
                        } else {
                            var36 = -0.060573947;
                        }
                    }
                } else {
                    if (inputs[10] < 1.1425) {
                        var36 = 0.10098134;
                    } else {
                        var36 = 0.028736798;
                    }
                }
            } else {
                if (inputs[6] < -32.626118) {
                    if (inputs[8] < 2.50028) {
                        var36 = 0.05232835;
                    } else {
                        var36 = -0.015878657;
                    }
                } else {
                    if (inputs[3] < 1.37717) {
                        if (inputs[24] < -35.554955) {
                            var36 = 0.025963336;
                        } else {
                            var36 = -0.046243764;
                        }
                    } else {
                        var36 = -0.109271854;
                    }
                }
            }
        }
    }
    double var37;
    if (inputs[21] < 24.010128) {
        if (inputs[15] < 3.7718) {
            if (inputs[15] < 3.0270271) {
                if (inputs[14] < 0.5497865) {
                    var37 = -0.06398622;
                } else {
                    if (inputs[8] < 2.5406976) {
                        if (inputs[3] < -0.72686684) {
                            var37 = 0.027092328;
                        } else {
                            var37 = -0.004162748;
                        }
                    } else {
                        if (inputs[3] < -0.234652) {
                            var37 = -0.07030054;
                        } else {
                            var37 = 0.007721675;
                        }
                    }
                }
            } else {
                if (inputs[3] < 0.07103209) {
                    var37 = 0.08814707;
                } else {
                    var37 = -0.016239693;
                }
            }
        } else {
            var37 = -0.06134503;
        }
    } else {
        var37 = 0.058068052;
    }
    double var38;
    if (inputs[2] < 1.6985714) {
        if (inputs[9] < 29.42567) {
            if (inputs[9] < 28.382587) {
                if (inputs[20] < 9.0) {
                    var38 = -0.028642027;
                } else {
                    if (inputs[20] < 12.0) {
                        if (inputs[8] < 2.5029585) {
                            var38 = 0.04391274;
                        } else {
                            var38 = 0.10084865;
                        }
                    } else {
                        if (inputs[20] < 16.0) {
                            var38 = -0.021150412;
                        } else {
                            var38 = 0.057652496;
                        }
                    }
                }
            } else {
                var38 = 0.09797215;
            }
        } else {
            if (inputs[12] < 3.11) {
                if (inputs[12] < -1.875) {
                    if (inputs[7] < 22.944393) {
                        if (inputs[14] < 0.69977564) {
                            var38 = 0.0042588115;
                        } else {
                            var38 = -0.064659715;
                        }
                    } else {
                        var38 = 0.048390266;
                    }
                } else {
                    var38 = -0.07353726;
                }
            } else {
                if (inputs[9] < 36.297005) {
                    var38 = -0.037342448;
                } else {
                    if (inputs[7] < 17.219347) {
                        var38 = 0.018085921;
                    } else {
                        var38 = 0.0894103;
                    }
                }
            }
        }
    } else {
        if (inputs[6] < -32.886917) {
            var38 = -0.0794805;
        } else {
            if (inputs[9] < 30.288824) {
                if (inputs[19] < 3.0) {
                    if (inputs[17] < -2.0654962) {
                        var38 = 0.06739787;
                    } else {
                        if (inputs[6] < -1.9876205) {
                            var38 = -0.001802269;
                        } else {
                            var38 = -0.071261086;
                        }
                    }
                } else {
                    if (inputs[8] < 2.503896) {
                        if (inputs[6] < -4.5796494) {
                            var38 = -0.07525709;
                        } else {
                            var38 = 0.000698736;
                        }
                    } else {
                        var38 = -0.10735518;
                    }
                }
            } else {
                if (inputs[2] < 4.05) {
                    if (inputs[21] < 18.699093) {
                        if (inputs[8] < 2.4992125) {
                            var38 = 0.10177044;
                        } else {
                            var38 = 0.030989382;
                        }
                    } else {
                        if (inputs[6] < -13.268932) {
                            var38 = -0.035883132;
                        } else {
                            var38 = 0.0476102;
                        }
                    }
                } else {
                    var38 = -0.041807447;
                }
            }
        }
    }
    double var39;
    if (inputs[9] < 54.98018) {
        if (inputs[9] < 47.309727) {
            if (inputs[23] < 9.93) {
                if (inputs[10] < 2.2675) {
                    if (inputs[3] < -0.9081138) {
                        if (inputs[16] < -1.5868479) {
                            var39 = 0.081451304;
                        } else {
                            var39 = 0.02102637;
                        }
                    } else {
                        if (inputs[3] < 0.7862127) {
                            var39 = -0.028181322;
                        } else {
                            var39 = 0.020318637;
                        }
                    }
                } else {
                    if (inputs[16] < -3.5775623) {
                        var39 = -0.02071011;
                    } else {
                        if (inputs[15] < -1.9934584) {
                            var39 = 0.110242814;
                        } else {
                            var39 = 0.03639444;
                        }
                    }
                }
            } else {
                if (inputs[8] < 2.4561403) {
                    if (inputs[6] < -21.98774) {
                        var39 = 0.0936293;
                    } else {
                        var39 = -0.0141897;
                    }
                } else {
                    if (inputs[7] < 22.278522) {
                        if (inputs[23] < 26.655) {
                            var39 = -0.06209966;
                        } else {
                            var39 = 0.014317143;
                        }
                    } else {
                        var39 = -0.08587411;
                    }
                }
            }
        } else {
            var39 = -0.0812433;
        }
    } else {
        var39 = 0.06875738;
    }
    double var40;
    if (inputs[15] < 3.7718) {
        if (inputs[24] < 60.127644) {
            if (inputs[1] < 69.5182) {
                if (inputs[20] < 20.0) {
                    if (inputs[10] < 4.9475) {
                        if (inputs[16] < 3.502729) {
                            var40 = 0.007459681;
                        } else {
                            var40 = -0.049509086;
                        }
                    } else {
                        var40 = -0.08508093;
                    }
                } else {
                    if (inputs[8] < 2.4878378) {
                        var40 = 0.09991724;
                    } else {
                        var40 = 0.018815123;
                    }
                }
            } else {
                if (inputs[3] < 0.106602594) {
                    if (inputs[12] < 6.14) {
                        var40 = 0.028000103;
                    } else {
                        var40 = -0.049287256;
                    }
                } else {
                    var40 = -0.113602936;
                }
            }
        } else {
            if (inputs[8] < 2.5004926) {
                var40 = 0.06823009;
            } else {
                var40 = -0.012484415;
            }
        }
    } else {
        var40 = -0.06559612;
    }
    double var41;
    if (inputs[13] < 26.955) {
        if (inputs[17] < 6.754386) {
            if (inputs[15] < 3.1952574) {
                if (inputs[12] < 9.895) {
                    if (inputs[4] < 2.0631578) {
                        if (inputs[1] < 36.89342) {
                            var41 = 0.012667879;
                        } else {
                            var41 = -0.039936095;
                        }
                    } else {
                        if (inputs[15] < 2.1147807) {
                            var41 = 0.063798845;
                        } else {
                            var41 = 0.017211847;
                        }
                    }
                } else {
                    if (inputs[17] < -2.1781795) {
                        var41 = -0.08238903;
                    } else {
                        if (inputs[16] < 2.2328188) {
                            var41 = 0.035664923;
                        } else {
                            var41 = -0.039014075;
                        }
                    }
                }
            } else {
                var41 = -0.06548692;
            }
        } else {
            var41 = 0.052821778;
        }
    } else {
        var41 = -0.07485032;
    }
    double var42;
    if (inputs[20] < 22.0) {
        if (inputs[17] < 3.512051) {
            if (inputs[16] < 3.5614035) {
                if (inputs[23] < 6.15) {
                    if (inputs[17] < 1.9830967) {
                        if (inputs[8] < 2.503896) {
                            var42 = 0.013820621;
                        } else {
                            var42 = -0.019356426;
                        }
                    } else {
                        var42 = 0.06871546;
                    }
                } else {
                    if (inputs[3] < -0.30427587) {
                        var42 = -0.0703604;
                    } else {
                        if (inputs[3] < 0.115218945) {
                            var42 = 0.0733933;
                        } else {
                            var42 = -0.039267406;
                        }
                    }
                }
            } else {
                var42 = -0.06953323;
            }
        } else {
            if (inputs[3] < -0.72686684) {
                if (inputs[1] < 71.80589) {
                    if (inputs[20] < 17.0) {
                        var42 = 0.04288528;
                    } else {
                        var42 = 0.11056239;
                    }
                } else {
                    var42 = 0.004439425;
                }
            } else {
                if (inputs[21] < 18.332918) {
                    var42 = 0.048818734;
                } else {
                    if (inputs[17] < 5.319853) {
                        var42 = -0.004768828;
                    } else {
                        var42 = -0.0739134;
                    }
                }
            }
        }
    } else {
        var42 = -0.047340307;
    }
    double var43;
    if (inputs[7] < -20.471956) {
        if (inputs[12] < 9.795) {
            if (inputs[17] < -6.8352275) {
                var43 = -0.026664317;
            } else {
                if (inputs[12] < -1.34) {
                    var43 = 0.031380348;
                } else {
                    var43 = 0.0964296;
                }
            }
        } else {
            var43 = -0.038627535;
        }
    } else {
        if (inputs[7] < 18.969734) {
            if (inputs[10] < 3.17) {
                if (inputs[10] < 2.7125) {
                    if (inputs[10] < 2.2675) {
                        if (inputs[10] < 1.9025) {
                            var43 = -0.012638058;
                        } else {
                            var43 = -0.09371147;
                        }
                    } else {
                        if (inputs[2] < 1.7264286) {
                            var43 = 0.056126382;
                        } else {
                            var43 = 0.015893115;
                        }
                    }
                } else {
                    var43 = -0.07734062;
                }
            } else {
                if (inputs[17] < 1.7406528) {
                    if (inputs[21] < 18.362953) {
                        var43 = 0.094429955;
                    } else {
                        var43 = 0.016987327;
                    }
                } else {
                    var43 = -0.02815192;
                }
            }
        } else {
            if (inputs[17] < 6.9677625) {
                if (inputs[1] < 74.73677) {
                    if (inputs[16] < 2.844461) {
                        var43 = -0.032495044;
                    } else {
                        if (inputs[3] < 0.11182756) {
                            var43 = 0.06401922;
                        } else {
                            var43 = 0.004672794;
                        }
                    }
                } else {
                    var43 = -0.052129146;
                }
            } else {
                var43 = 0.07220509;
            }
        }
    }
    double var44;
    if (inputs[8] < 2.460452) {
        if (inputs[9] < 21.588202) {
            var44 = -0.043112997;
        } else {
            if (inputs[9] < 35.980595) {
                if (inputs[9] < 28.561193) {
                    if (inputs[9] < 25.785551) {
                        if (inputs[21] < 19.447554) {
                            var44 = 0.0093494095;
                        } else {
                            var44 = 0.07528727;
                        }
                    } else {
                        var44 = -0.030018568;
                    }
                } else {
                    if (inputs[17] < -2.84417) {
                        var44 = 0.10346858;
                    } else {
                        var44 = 0.030338723;
                    }
                }
            } else {
                if (inputs[3] < -0.234652) {
                    var44 = 0.031902723;
                } else {
                    var44 = -0.06018005;
                }
            }
        }
    } else {
        if (inputs[18] < 17.42) {
            if (inputs[12] < 12.23) {
                if (inputs[8] < 2.4963856) {
                    if (inputs[24] < -27.122751) {
                        var44 = 0.0028123944;
                    } else {
                        var44 = -0.08808176;
                    }
                } else {
                    if (inputs[10] < 1.0375) {
                        if (inputs[10] < 0.41) {
                            var44 = -0.00284013;
                        } else {
                            var44 = -0.05440774;
                        }
                    } else {
                        if (inputs[8] < 2.5004926) {
                            var44 = 0.055624295;
                        } else {
                            var44 = -0.0013686881;
                        }
                    }
                }
            } else {
                if (inputs[18] < -13.16) {
                    var44 = -0.03155861;
                } else {
                    if (inputs[1] < 67.42437) {
                        var44 = 0.12257679;
                    } else {
                        var44 = 0.04518181;
                    }
                }
            }
        } else {
            var44 = -0.08405812;
        }
    }
    double var45;
    if (inputs[8] < 2.5661972) {
        if (inputs[9] < 55.74809) {
            if (inputs[6] < -3.152488) {
                if (inputs[2] < 1.6985714) {
                    if (inputs[4] < -2.8872595) {
                        if (inputs[24] < -56.50228) {
                            var45 = 0.0059099346;
                        } else {
                            var45 = -0.08562501;
                        }
                    } else {
                        if (inputs[20] < 11.0) {
                            var45 = 0.004207089;
                        } else {
                            var45 = 0.060763594;
                        }
                    }
                } else {
                    if (inputs[18] < -4.73) {
                        var45 = -0.07227952;
                    } else {
                        if (inputs[24] < 27.072304) {
                            var45 = 0.023846736;
                        } else {
                            var45 = -0.055632822;
                        }
                    }
                }
            } else {
                if (inputs[5] < 1.0) {
                    if (inputs[6] < 18.32136) {
                        if (inputs[10] < 2.01) {
                            var45 = 0.00077756174;
                        } else {
                            var45 = 0.050810013;
                        }
                    } else {
                        var45 = -0.039391752;
                    }
                } else {
                    if (inputs[24] < 24.976204) {
                        if (inputs[1] < 32.738472) {
                            var45 = 0.05339041;
                        } else {
                            var45 = 0.111822866;
                        }
                    } else {
                        var45 = 0.017200612;
                    }
                }
            }
        } else {
            var45 = 0.057404734;
        }
    } else {
        if (inputs[6] < -3.152488) {
            if (inputs[14] < 0.8233038) {
                var45 = -0.024702843;
            } else {
                if (inputs[23] < 4.2) {
                    var45 = 0.052593492;
                } else {
                    var45 = -0.014332719;
                }
            }
        } else {
            if (inputs[19] < 3.0) {
                var45 = -0.11369356;
            } else {
                var45 = -0.02349212;
            }
        }
    }
    double var46;
    if (inputs[21] < 24.010128) {
        if (inputs[3] < -0.72686684) {
            if (inputs[14] < 1.069266) {
                if (inputs[19] < 2.0) {
                    var46 = 0.07785549;
                } else {
                    if (inputs[21] < 16.872692) {
                        var46 = 0.06421537;
                    } else {
                        if (inputs[8] < 2.4758735) {
                            var46 = -0.048424155;
                        } else {
                            var46 = 0.022798067;
                        }
                    }
                }
            } else {
                if (inputs[8] < 2.453416) {
                    var46 = 0.046240453;
                } else {
                    var46 = -0.055653576;
                }
            }
        } else {
            if (inputs[12] < 20.11) {
                if (inputs[19] < 2.0) {
                    if (inputs[8] < 2.490196) {
                        var46 = -0.09047368;
                    } else {
                        var46 = 0.0031913281;
                    }
                } else {
                    if (inputs[1] < 25.699049) {
                        if (inputs[8] < 2.4972973) {
                            var46 = 0.02027928;
                        } else {
                            var46 = 0.08394963;
                        }
                    } else {
                        if (inputs[17] < -1.3204769) {
                            var46 = -0.021352824;
                        } else {
                            var46 = 0.0125075355;
                        }
                    }
                }
            } else {
                var46 = -0.07189441;
            }
        }
    } else {
        var46 = 0.056140214;
    }
    double var47;
    if (inputs[24] < 73.70589) {
        if (inputs[24] < 60.127644) {
            if (inputs[7] < -20.653982) {
                if (inputs[17] < -3.4696357) {
                    if (inputs[1] < 27.259417) {
                        if (inputs[13] < -0.49) {
                            var47 = -0.0013925773;
                        } else {
                            var47 = 0.07329346;
                        }
                    } else {
                        var47 = -0.05309284;
                    }
                } else {
                    if (inputs[7] < -25.231743) {
                        var47 = 0.03063145;
                    } else {
                        var47 = 0.08821494;
                    }
                }
            } else {
                if (inputs[14] < 1.8218293) {
                    if (inputs[4] < -3.327291) {
                        var47 = -0.058816444;
                    } else {
                        if (inputs[23] < -30.36) {
                            var47 = 0.044198353;
                        } else {
                            var47 = -0.007192709;
                        }
                    }
                } else {
                    var47 = -0.063325055;
                }
            }
        } else {
            if (inputs[4] < 3.383228) {
                var47 = 0.08959605;
            } else {
                var47 = 0.011441741;
            }
        }
    } else {
        var47 = -0.0693869;
    }
    double var48;
    if (inputs[2] < 1.6828572) {
        if (inputs[2] < 1.5521429) {
            if (inputs[9] < 22.546814) {
                var48 = 0.053678915;
            } else {
                if (inputs[14] < 0.7492225) {
                    if (inputs[2] < 1.2728572) {
                        if (inputs[2] < 0.9671429) {
                            var48 = 0.03781051;
                        } else {
                            var48 = -0.018209232;
                        }
                    } else {
                        if (inputs[19] < 3.0) {
                            var48 = 0.041281044;
                        } else {
                            var48 = 0.08531854;
                        }
                    }
                } else {
                    if (inputs[7] < 18.138844) {
                        if (inputs[19] < 3.0) {
                            var48 = -0.093960255;
                        } else {
                            var48 = -0.021450682;
                        }
                    } else {
                        var48 = -0.001934681;
                    }
                }
            }
        } else {
            if (inputs[3] < 0.1593122) {
                var48 = 0.076931156;
            } else {
                var48 = 0.0025073756;
            }
        }
    } else {
        if (inputs[6] < -39.019794) {
            var48 = -0.080664665;
        } else {
            if (inputs[9] < 30.288824) {
                if (inputs[17] < 2.6598606) {
                    if (inputs[24] < -25.33634) {
                        if (inputs[8] < 2.43309) {
                            var48 = 0.0057496494;
                        } else {
                            var48 = -0.07925426;
                        }
                    } else {
                        if (inputs[24] < 27.695694) {
                            var48 = 0.051034763;
                        } else {
                            var48 = -0.010973259;
                        }
                    }
                } else {
                    var48 = -0.09337854;
                }
            } else {
                if (inputs[17] < 4.8139157) {
                    if (inputs[21] < 17.346165) {
                        var48 = 0.049376596;
                    } else {
                        if (inputs[7] < -12.862494) {
                            var48 = 0.023707174;
                        } else {
                            var48 = -0.03649749;
                        }
                    }
                } else {
                    var48 = 0.07320325;
                }
            }
        }
    }
    double var49;
    if (inputs[13] < -15.15) {
        if (inputs[9] < 23.967363) {
            var49 = -0.043235954;
        } else {
            if (inputs[23] < -50.25) {
                var49 = 0.0038389873;
            } else {
                if (inputs[6] < -32.103245) {
                    var49 = 0.04118631;
                } else {
                    var49 = 0.09897171;
                }
            }
        }
    } else {
        if (inputs[20] < 21.0) {
            if (inputs[12] < -2.825) {
                if (inputs[6] < -3.9755354) {
                    if (inputs[21] < 19.8902) {
                        if (inputs[12] < -7.72) {
                            var49 = -0.047362532;
                        } else {
                            var49 = -0.10136925;
                        }
                    } else {
                        if (inputs[10] < 0.945) {
                            var49 = 0.050946143;
                        } else {
                            var49 = -0.061080236;
                        }
                    }
                } else {
                    if (inputs[7] < -6.7801075) {
                        var49 = 0.04893757;
                    } else {
                        var49 = -0.031727284;
                    }
                }
            } else {
                if (inputs[17] < 2.6598606) {
                    if (inputs[17] < -2.1781795) {
                        if (inputs[3] < 0.8231325) {
                            var49 = -0.026279349;
                        } else {
                            var49 = 0.054168664;
                        }
                    } else {
                        if (inputs[13] < 1.785) {
                            var49 = 0.07722075;
                        } else {
                            var49 = 0.022049006;
                        }
                    }
                } else {
                    if (inputs[17] < 4.7224197) {
                        if (inputs[4] < 2.4199445) {
                            var49 = -0.09542243;
                        } else {
                            var49 = -0.035298906;
                        }
                    } else {
                        if (inputs[3] < -1.1419783) {
                            var49 = 0.059600353;
                        } else {
                            var49 = -0.018712882;
                        }
                    }
                }
            }
        } else {
            var49 = -0.07563209;
        }
    }
    double var50;
    if (inputs[15] < -3.7456567) {
        var50 = 0.08122535;
    } else {
        if (inputs[15] < -2.9554014) {
            if (inputs[10] < 1.21) {
                var50 = 0.005155853;
            } else {
                var50 = -0.078889266;
            }
        } else {
            if (inputs[15] < -2.771616) {
                var50 = 0.052052498;
            } else {
                if (inputs[24] < -47.42504) {
                    if (inputs[16] < -4.6686416) {
                        var50 = 0.022853324;
                    } else {
                        var50 = -0.065824434;
                    }
                } else {
                    if (inputs[15] < -2.2227693) {
                        var50 = 0.058674715;
                    } else {
                        if (inputs[16] < -3.5775623) {
                            var50 = -0.042853773;
                        } else {
                            var50 = 0.011434374;
                        }
                    }
                }
            }
        }
    }
    double var51;
    if (inputs[23] < -60.33) {
        var51 = -0.035527006;
    } else {
        if (inputs[13] < -15.83) {
            if (inputs[10] < 1.885) {
                var51 = 0.06438458;
            } else {
                var51 = 0.006116399;
            }
        } else {
            if (inputs[10] < 2.2675) {
                if (inputs[21] < 22.972445) {
                    if (inputs[12] < -2.825) {
                        if (inputs[17] < -4.7438426) {
                            var51 = 0.026415756;
                        } else {
                            var51 = -0.06830106;
                        }
                    } else {
                        if (inputs[10] < 0.32) {
                            var51 = 0.041336667;
                        } else {
                            var51 = -0.013250391;
                        }
                    }
                } else {
                    var51 = 0.044210587;
                }
            } else {
                if (inputs[19] < 4.0) {
                    if (inputs[17] < 2.622856) {
                        if (inputs[15] < -2.5482912) {
                            var51 = 0.0037680734;
                        } else {
                            var51 = 0.06539037;
                        }
                    } else {
                        if (inputs[7] < 19.951187) {
                            var51 = -0.045186546;
                        } else {
                            var51 = 0.016975755;
                        }
                    }
                } else {
                    var51 = -0.03761859;
                }
            }
        }
    }
    double var52;
    if (inputs[10] < 2.2675) {
        if (inputs[1] < 59.03053) {
            if (inputs[16] < -4.969621) {
                if (inputs[6] < -26.829597) {
                    var52 = -0.016530845;
                } else {
                    var52 = 0.070497714;
                }
            } else {
                if (inputs[2] < 1.1821429) {
                    var52 = -0.09465989;
                } else {
                    if (inputs[20] < 16.0) {
                        if (inputs[3] < -0.09276572) {
                            var52 = 0.02270445;
                        } else {
                            var52 = -0.0270438;
                        }
                    } else {
                        if (inputs[18] < -4.73) {
                            var52 = -0.10711317;
                        } else {
                            var52 = -0.033804547;
                        }
                    }
                }
            }
        } else {
            if (inputs[1] < 63.736034) {
                var52 = 0.06896502;
            } else {
                if (inputs[15] < 3.1116202) {
                    if (inputs[16] < 2.2666667) {
                        var52 = 0.03823561;
                    } else {
                        if (inputs[9] < 23.131304) {
                            var52 = 0.011884676;
                        } else {
                            var52 = -0.050069354;
                        }
                    }
                } else {
                    var52 = 0.033779137;
                }
            }
        }
    } else {
        if (inputs[9] < 19.683298) {
            var52 = 0.07635708;
        } else {
            if (inputs[9] < 27.667595) {
                if (inputs[7] < 3.8379583) {
                    var52 = -0.07229664;
                } else {
                    var52 = 0.027597211;
                }
            } else {
                if (inputs[16] < -5.0933933) {
                    var52 = -0.022081535;
                } else {
                    if (inputs[18] < -7.36) {
                        var52 = 0.087383635;
                    } else {
                        if (inputs[12] < 1.325) {
                            var52 = 0.048963472;
                        } else {
                            var52 = 0.00077380886;
                        }
                    }
                }
            }
        }
    }
    double var53;
    if (inputs[18] < 25.335) {
        if (inputs[2] < 2.1321428) {
            if (inputs[23] < 36.48) {
                if (inputs[16] < 1.3293198) {
                    if (inputs[4] < -2.00622) {
                        if (inputs[15] < -1.8573798) {
                            var53 = 0.020270314;
                        } else {
                            var53 = -0.045471154;
                        }
                    } else {
                        if (inputs[3] < 0.7422704) {
                            var53 = 0.03504989;
                        } else {
                            var53 = 0.1004862;
                        }
                    }
                } else {
                    if (inputs[3] < 0.9026732) {
                        if (inputs[2] < 1.7578571) {
                            var53 = 0.0119654415;
                        } else {
                            var53 = -0.064175524;
                        }
                    } else {
                        var53 = -0.07994493;
                    }
                }
            } else {
                if (inputs[14] < 0.7944056) {
                    var53 = 0.02257721;
                } else {
                    var53 = 0.08306567;
                }
            }
        } else {
            if (inputs[8] < 2.5004926) {
                if (inputs[21] < 17.852242) {
                    if (inputs[8] < 2.4444444) {
                        var53 = 0.08315129;
                    } else {
                        var53 = 0.03177791;
                    }
                } else {
                    if (inputs[8] < 2.4842455) {
                        if (inputs[2] < 2.6385715) {
                            var53 = -0.086410254;
                        } else {
                            var53 = -0.0004410039;
                        }
                    } else {
                        var53 = 0.044233978;
                    }
                }
            } else {
                if (inputs[14] < 1.4483577) {
                    var53 = -0.1083353;
                } else {
                    var53 = -0.0070650727;
                }
            }
        }
    } else {
        var53 = -0.052905194;
    }
    double var54;
    if (inputs[7] < 28.382496) {
        if (inputs[24] < 56.153873) {
            if (inputs[6] < -3.152488) {
                if (inputs[23] < 25.065) {
                    if (inputs[3] < -1.6227406) {
                        var54 = 0.054639444;
                    } else {
                        if (inputs[9] < 35.515194) {
                            var54 = 0.0020599207;
                        } else {
                            var54 = -0.040680673;
                        }
                    }
                } else {
                    var54 = -0.066013075;
                }
            } else {
                if (inputs[15] < 2.6337066) {
                    if (inputs[16] < 3.830675) {
                        if (inputs[10] < 0.19) {
                            var54 = 0.091356054;
                        } else {
                            var54 = 0.008772095;
                        }
                    } else {
                        var54 = 0.095635764;
                    }
                } else {
                    var54 = -0.045487624;
                }
            }
        } else {
            if (inputs[4] < 3.6626353) {
                if (inputs[16] < 3.8022358) {
                    var54 = 0.028730692;
                } else {
                    var54 = 0.08417265;
                }
            } else {
                var54 = 0.0029675786;
            }
        }
    } else {
        var54 = -0.04931806;
    }
    double var55;
    if (inputs[20] < 10.0) {
        if (inputs[13] < 2.53) {
            if (inputs[9] < 29.282501) {
                var55 = 0.009833951;
            } else {
                if (inputs[12] < -7.495) {
                    var55 = -0.037521664;
                } else {
                    var55 = -0.10797837;
                }
            }
        } else {
            if (inputs[4] < 2.4294343) {
                var55 = -0.028733384;
            } else {
                var55 = 0.041965786;
            }
        }
    } else {
        if (inputs[14] < 0.6929307) {
            if (inputs[21] < 20.642052) {
                if (inputs[3] < -0.8277281) {
                    var55 = 0.050243743;
                } else {
                    var55 = -0.002694578;
                }
            } else {
                var55 = 0.07529929;
            }
        } else {
            if (inputs[4] < 3.4954956) {
                if (inputs[24] < 52.189053) {
                    if (inputs[1] < 69.5182) {
                        if (inputs[3] < -0.9396294) {
                            var55 = -0.023557821;
                        } else {
                            var55 = 0.014132273;
                        }
                    } else {
                        var55 = -0.058602475;
                    }
                } else {
                    var55 = 0.05750679;
                }
            } else {
                var55 = -0.06552765;
            }
        }
    }
    double var56;
    if (inputs[1] < 78.39382) {
        if (inputs[23] < -62.16) {
            var56 = -0.050904777;
        } else {
            if (inputs[10] < 0.095) {
                var56 = -0.057835076;
            } else {
                if (inputs[23] < -34.92) {
                    if (inputs[16] < -4.2167816) {
                        var56 = 0.011522011;
                    } else {
                        var56 = 0.07215077;
                    }
                } else {
                    if (inputs[20] < 17.0) {
                        if (inputs[23] < -24.135) {
                            var56 = -0.06560199;
                        } else {
                            var56 = 0.00032052214;
                        }
                    } else {
                        if (inputs[6] < 0.3177864) {
                            var56 = 0.036784254;
                        } else {
                            var56 = -0.027890975;
                        }
                    }
                }
            }
        }
    } else {
        var56 = -0.057860915;
    }
    double var57;
    if (inputs[6] < 27.239037) {
        if (inputs[20] < 12.0) {
            if (inputs[10] < 1.81) {
                if (inputs[9] < 23.953922) {
                    var57 = 0.080100834;
                } else {
                    if (inputs[7] < -15.680102) {
                        if (inputs[10] < 0.725) {
                            var57 = 0.04482341;
                        } else {
                            var57 = -0.027618734;
                        }
                    } else {
                        if (inputs[13] < -7.225) {
                            var57 = -0.09866366;
                        } else {
                            var57 = -0.017756104;
                        }
                    }
                }
            } else {
                if (inputs[9] < 28.382587) {
                    var57 = -0.022964485;
                } else {
                    if (inputs[21] < 19.055643) {
                        var57 = 0.06260827;
                    } else {
                        var57 = 0.10459422;
                    }
                }
            }
        } else {
            if (inputs[17] < -5.3398623) {
                if (inputs[16] < -5.819462) {
                    var57 = -0.01693714;
                } else {
                    var57 = 0.080003574;
                }
            } else {
                if (inputs[18] < -5.74) {
                    if (inputs[21] < 20.12239) {
                        if (inputs[6] < -16.935852) {
                            var57 = 0.038448576;
                        } else {
                            var57 = -0.051740415;
                        }
                    } else {
                        var57 = -0.08718062;
                    }
                } else {
                    if (inputs[12] < -13.445) {
                        var57 = 0.065177605;
                    } else {
                        if (inputs[12] < -8.32) {
                            var57 = -0.0724425;
                        } else {
                            var57 = -0.002787553;
                        }
                    }
                }
            }
        }
    } else {
        var57 = -0.04898773;
    }
    double var58;
    if (inputs[8] < 2.4968152) {
        if (inputs[2] < 1.6328571) {
            if (inputs[9] < 30.502996) {
                if (inputs[2] < 1.2035714) {
                    var58 = 0.07823194;
                } else {
                    var58 = 0.019666959;
                }
            } else {
                if (inputs[3] < -0.8277281) {
                    var58 = 0.053631663;
                } else {
                    if (inputs[2] < 1.2278571) {
                        var58 = -0.074252576;
                    } else {
                        var58 = -0.01419937;
                    }
                }
            }
        } else {
            if (inputs[14] < 1.1930127) {
                if (inputs[4] < -1.7450612) {
                    var58 = -0.053146858;
                } else {
                    var58 = -0.10151752;
                }
            } else {
                if (inputs[16] < 1.5420665) {
                    if (inputs[17] < -2.7586) {
                        var58 = -0.038993195;
                    } else {
                        var58 = 0.07297912;
                    }
                } else {
                    var58 = -0.052031524;
                }
            }
        }
    } else {
        if (inputs[23] < 51.015) {
            if (inputs[10] < 0.255) {
                var58 = 0.06757379;
            } else {
                if (inputs[23] < 32.1) {
                    if (inputs[8] < 2.5164557) {
                        if (inputs[21] < 17.554108) {
                            var58 = -0.04071446;
                        } else {
                            var58 = 0.05865828;
                        }
                    } else {
                        if (inputs[8] < 2.7247386) {
                            var58 = -0.023470946;
                        } else {
                            var58 = 0.031659376;
                        }
                    }
                } else {
                    var58 = 0.07453546;
                }
            }
        } else {
            var58 = -0.05030503;
        }
    }
    double var59;
    if (inputs[16] < 6.134671) {
        if (inputs[16] < 4.332034) {
            if (inputs[18] < 15.365) {
                if (inputs[17] < -6.5326705) {
                    var59 = -0.042992942;
                } else {
                    if (inputs[16] < 3.502729) {
                        if (inputs[8] < 2.4736843) {
                            var59 = -0.012709458;
                        } else {
                            var59 = 0.018675912;
                        }
                    } else {
                        if (inputs[14] < 0.75832444) {
                            var59 = -0.01069285;
                        } else {
                            var59 = -0.06387567;
                        }
                    }
                }
            } else {
                if (inputs[9] < 26.96215) {
                    var59 = -0.083533324;
                } else {
                    var59 = -0.019561743;
                }
            }
        } else {
            if (inputs[18] < 4.965) {
                var59 = -0.014073954;
            } else {
                if (inputs[21] < 18.639202) {
                    var59 = 0.11287386;
                } else {
                    var59 = 0.028452335;
                }
            }
        }
    } else {
        var59 = -0.04845716;
    }
    double var60;
    if (inputs[13] < -16.35) {
        if (inputs[16] < -4.529412) {
            var60 = -0.01826719;
        } else {
            if (inputs[24] < -23.18662) {
                if (inputs[10] < 2.0375) {
                    var60 = 0.08237164;
                } else {
                    var60 = 0.06414779;
                }
            } else {
                var60 = 0.013878364;
            }
        }
    } else {
        if (inputs[9] < 18.506268) {
            var60 = 0.046018653;
        } else {
            if (inputs[3] < 0.00019193416) {
                if (inputs[13] < -3.225) {
                    if (inputs[17] < 3.7096577) {
                        if (inputs[8] < 2.4525745) {
                            var60 = 0.003299266;
                        } else {
                            var60 = -0.07680621;
                        }
                    } else {
                        var60 = 0.031197589;
                    }
                } else {
                    if (inputs[9] < 27.667595) {
                        if (inputs[10] < 1.4675) {
                            var60 = 0.03676566;
                        } else {
                            var60 = -0.05731443;
                        }
                    } else {
                        if (inputs[4] < -3.210553) {
                            var60 = -0.016893672;
                        } else {
                            var60 = 0.04274361;
                        }
                    }
                }
            } else {
                if (inputs[3] < 0.796546) {
                    if (inputs[13] < 7.48) {
                        if (inputs[12] < -3.385) {
                            var60 = -0.02965962;
                        } else {
                            var60 = -0.10399547;
                        }
                    } else {
                        if (inputs[3] < 0.41807792) {
                            var60 = -0.035544924;
                        } else {
                            var60 = 0.034853805;
                        }
                    }
                } else {
                    if (inputs[18] < 7.01) {
                        if (inputs[13] < -7.38) {
                            var60 = 0.050128546;
                        } else {
                            var60 = -0.0057591544;
                        }
                    } else {
                        var60 = -0.05375753;
                    }
                }
            }
        }
    }
    double var61;
    if (inputs[6] < -2.358174) {
        if (inputs[3] < -0.27667353) {
            if (inputs[16] < -2.569727) {
                var61 = 0.052655615;
            } else {
                if (inputs[15] < 2.423506) {
                    if (inputs[10] < 2.0575) {
                        var61 = -0.063594446;
                    } else {
                        var61 = 0.00901186;
                    }
                } else {
                    if (inputs[16] < 5.4566145) {
                        var61 = 0.06160594;
                    } else {
                        var61 = 0.0056219352;
                    }
                }
            }
        } else {
            if (inputs[21] < 22.099243) {
                if (inputs[4] < -2.6420665) {
                    if (inputs[10] < 0.945) {
                        var61 = 0.06554621;
                    } else {
                        var61 = -0.034631286;
                    }
                } else {
                    if (inputs[7] < -13.473006) {
                        var61 = -0.10588378;
                    } else {
                        if (inputs[14] < 0.7915505) {
                            var61 = -0.08023791;
                        } else {
                            var61 = -0.005908787;
                        }
                    }
                }
            } else {
                var61 = -0.08831949;
            }
        }
    } else {
        if (inputs[15] < 2.647952) {
            if (inputs[9] < 35.4477) {
                if (inputs[16] < 2.5665312) {
                    if (inputs[3] < -0.19728385) {
                        if (inputs[6] < 0.3177864) {
                            var61 = -0.09616098;
                        } else {
                            var61 = -0.009188671;
                        }
                    } else {
                        if (inputs[5] < 1.0) {
                            var61 = -0.00051132863;
                        } else {
                            var61 = 0.06518221;
                        }
                    }
                } else {
                    if (inputs[9] < 24.675793) {
                        var61 = 0.088856995;
                    } else {
                        var61 = 0.013789716;
                    }
                }
            } else {
                if (inputs[16] < -3.1268196) {
                    var61 = 0.012122877;
                } else {
                    var61 = 0.077210285;
                }
            }
        } else {
            if (inputs[17] < 4.7519083) {
                var61 = -0.07048752;
            } else {
                var61 = -0.009503025;
            }
        }
    }
    double var62;
    if (inputs[12] < 22.87) {
        if (inputs[23] < 48.885) {
            if (inputs[18] < 14.62) {
                if (inputs[16] < 5.5290422) {
                    if (inputs[2] < 0.95214283) {
                        var62 = 0.06827509;
                    } else {
                        if (inputs[1] < 70.92806) {
                            var62 = -0.008123565;
                        } else {
                            var62 = 0.038826555;
                        }
                    }
                } else {
                    var62 = -0.052901905;
                }
            } else {
                var62 = 0.06520415;
            }
        } else {
            var62 = -0.054902647;
        }
    } else {
        var62 = 0.039582886;
    }
    double var63;
    if (inputs[4] < -1.6590085) {
        if (inputs[15] < -1.7221996) {
            if (inputs[15] < -1.8750851) {
                if (inputs[16] < -5.819462) {
                    var63 = -0.02881929;
                } else {
                    if (inputs[3] < 0.8231325) {
                        if (inputs[2] < 1.3464285) {
                            var63 = -0.038452413;
                        } else {
                            var63 = 0.02539989;
                        }
                    } else {
                        if (inputs[21] < 20.264345) {
                            var63 = 0.018826429;
                        } else {
                            var63 = 0.09042198;
                        }
                    }
                }
            } else {
                var63 = -0.06513702;
            }
        } else {
            var63 = 0.058596548;
        }
    } else {
        if (inputs[8] < 2.5035799) {
            if (inputs[8] < 2.5004926) {
                if (inputs[15] < 1.617003) {
                    var63 = -0.08480769;
                } else {
                    if (inputs[20] < 18.0) {
                        if (inputs[23] < 6.705) {
                            var63 = -0.027607989;
                        } else {
                            var63 = 0.0263091;
                        }
                    } else {
                        var63 = -0.049857214;
                    }
                }
            } else {
                var63 = -0.09661622;
            }
        } else {
            if (inputs[8] < 2.5406976) {
                if (inputs[10] < 1.45) {
                    var63 = 0.070093445;
                } else {
                    var63 = 0.024652978;
                }
            } else {
                if (inputs[18] < 11.245) {
                    if (inputs[23] < 5.665) {
                        var63 = 0.0050828173;
                    } else {
                        var63 = -0.057958186;
                    }
                } else {
                    var63 = 0.0507265;
                }
            }
        }
    }
    double var64;
    if (inputs[6] < -63.260647) {
        var64 = -0.037628748;
    } else {
        if (inputs[7] < 18.969734) {
            if (inputs[16] < -6.757241) {
                var64 = 0.059196055;
            } else {
                if (inputs[7] < 16.459793) {
                    if (inputs[18] < -4.73) {
                        if (inputs[16] < -4.6393666) {
                            var64 = 0.028484987;
                        } else {
                            var64 = -0.0270835;
                        }
                    } else {
                        if (inputs[4] < -3.1594) {
                            var64 = -0.06169635;
                        } else {
                            var64 = 0.01985332;
                        }
                    }
                } else {
                    var64 = -0.036091413;
                }
            }
        } else {
            if (inputs[1] < 78.39382) {
                if (inputs[2] < 1.4792857) {
                    if (inputs[10] < 1.1025) {
                        var64 = 0.042299934;
                    } else {
                        var64 = 0.08862137;
                    }
                } else {
                    if (inputs[2] < 1.9985714) {
                        var64 = -0.04164197;
                    } else {
                        var64 = 0.06788543;
                    }
                }
            } else {
                var64 = -0.03128343;
            }
        }
    }
    double var65;
    if (inputs[14] < 0.5094648) {
        var65 = -0.048639994;
    } else {
        if (inputs[20] < 12.0) {
            if (inputs[23] < 47.265) {
                if (inputs[20] < 10.0) {
                    if (inputs[12] < 7.46) {
                        if (inputs[14] < 0.61544746) {
                            var65 = -0.056625728;
                        } else {
                            var65 = 0.011961308;
                        }
                    } else {
                        var65 = 0.058002736;
                    }
                } else {
                    if (inputs[9] < 23.131304) {
                        var65 = 0.093661085;
                    } else {
                        if (inputs[2] < 1.4235715) {
                            var65 = 0.06294652;
                        } else {
                            var65 = 0.0076667336;
                        }
                    }
                }
            } else {
                var65 = -0.052871387;
            }
        } else {
            if (inputs[8] < 2.6716866) {
                if (inputs[9] < 48.955067) {
                    if (inputs[9] < 40.519955) {
                        if (inputs[9] < 27.667595) {
                            var65 = -0.0131497225;
                        } else {
                            var65 = 0.017717909;
                        }
                    } else {
                        var65 = -0.059269413;
                    }
                } else {
                    var65 = 0.04441132;
                }
            } else {
                var65 = -0.061999537;
            }
        }
    }
    double var66;
    if (inputs[14] < 1.2650809) {
        if (inputs[9] < 31.110016) {
            if (inputs[8] < 2.5540898) {
                if (inputs[6] < 13.592288) {
                    if (inputs[23] < -26.25) {
                        var66 = 0.06382599;
                    } else {
                        if (inputs[7] < -10.146969) {
                            var66 = -0.029616063;
                        } else {
                            var66 = 0.032402236;
                        }
                    }
                } else {
                    var66 = -0.049312174;
                }
            } else {
                if (inputs[17] < -1.907391) {
                    var66 = -0.0009159407;
                } else {
                    var66 = 0.07680295;
                }
            }
        } else {
            if (inputs[9] < 33.038826) {
                var66 = -0.059417214;
            } else {
                if (inputs[3] < 0.1593122) {
                    if (inputs[2] < 1.3771429) {
                        if (inputs[6] < -29.161388) {
                            var66 = 0.021830773;
                        } else {
                            var66 = -0.033671275;
                        }
                    } else {
                        if (inputs[21] < 18.449862) {
                            var66 = 0.07769653;
                        } else {
                            var66 = 0.017605284;
                        }
                    }
                } else {
                    if (inputs[14] < 0.85838103) {
                        if (inputs[1] < 26.023777) {
                            var66 = 0.046613198;
                        } else {
                            var66 = -0.014231646;
                        }
                    } else {
                        var66 = -0.073081374;
                    }
                }
            }
        }
    } else {
        if (inputs[2] < 2.78) {
            if (inputs[2] < 2.557857) {
                var66 = -0.018445034;
            } else {
                var66 = -0.08351989;
            }
        } else {
            if (inputs[4] < -2.0811305) {
                var66 = 0.05267736;
            } else {
                if (inputs[15] < 1.5602665) {
                    var66 = -0.0622788;
                } else {
                    var66 = 0.022603221;
                }
            }
        }
    }
    double var67;
    if (inputs[14] < 0.6035505) {
        if (inputs[14] < 0.5497865) {
            if (inputs[1] < 69.59125) {
                var67 = -0.024176816;
            } else {
                var67 = 0.026626114;
            }
        } else {
            if (inputs[20] < 10.0) {
                var67 = 0.022555579;
            } else {
                var67 = 0.08466526;
            }
        }
    } else {
        if (inputs[6] < -63.956158) {
            var67 = -0.08702419;
        } else {
            if (inputs[4] < -2.9921925) {
                if (inputs[8] < 2.4677804) {
                    var67 = -0.032951485;
                } else {
                    if (inputs[24] < -58.80726) {
                        var67 = 0.028614054;
                    } else {
                        var67 = 0.097550124;
                    }
                }
            } else {
                if (inputs[17] < -3.131579) {
                    if (inputs[13] < -5.82) {
                        if (inputs[8] < 2.4856231) {
                            var67 = 0.0112431655;
                        } else {
                            var67 = -0.036381643;
                        }
                    } else {
                        var67 = -0.073796324;
                    }
                } else {
                    if (inputs[4] < -1.8869901) {
                        if (inputs[8] < 2.50028) {
                            var67 = 0.06427722;
                        } else {
                            var67 = -0.016910555;
                        }
                    } else {
                        if (inputs[7] < 0.0) {
                            var67 = -0.07674687;
                        } else {
                            var67 = -0.0050720773;
                        }
                    }
                }
            }
        }
    }
    double var68;
    if (inputs[14] < 2.0836296) {
        if (inputs[14] < 1.2093482) {
            if (inputs[14] < 1.0870839) {
                if (inputs[16] < 5.62066) {
                    if (inputs[15] < -2.5208724) {
                        if (inputs[2] < 0.98071426) {
                            var68 = 0.054770242;
                        } else {
                            var68 = -0.033706136;
                        }
                    } else {
                        if (inputs[3] < 0.19802953) {
                            var68 = 0.026837723;
                        } else {
                            var68 = -0.0046957377;
                        }
                    }
                } else {
                    var68 = -0.03939692;
                }
            } else {
                var68 = -0.08298384;
            }
        } else {
            if (inputs[14] < 1.2650809) {
                var68 = 0.06313985;
            } else {
                if (inputs[15] < 1.1427685) {
                    if (inputs[7] < -16.25546) {
                        var68 = 0.033235315;
                    } else {
                        var68 = -0.047008608;
                    }
                } else {
                    if (inputs[14] < 1.4135585) {
                        var68 = -0.012377816;
                    } else {
                        var68 = 0.05861738;
                    }
                }
            }
        }
    } else {
        var68 = -0.044768598;
    }
    double var69;
    if (inputs[9] < 18.594091) {
        var69 = 0.049019333;
    } else {
        if (inputs[8] < 2.1819549) {
            var69 = 0.055431757;
        } else {
            if (inputs[7] < -23.013718) {
                if (inputs[18] < -5.555) {
                    var69 = -0.07269904;
                } else {
                    var69 = 0.02715496;
                }
            } else {
                if (inputs[7] < -20.653982) {
                    var69 = 0.061979573;
                } else {
                    if (inputs[23] < -30.23) {
                        if (inputs[12] < -17.155) {
                            var69 = -0.0063911024;
                        } else {
                            var69 = 0.056729604;
                        }
                    } else {
                        if (inputs[18] < -5.205) {
                            var69 = -0.048231795;
                        } else {
                            var69 = 0.004951735;
                        }
                    }
                }
            }
        }
    }
    double var70;
    if (inputs[15] < -3.0006073) {
        if (inputs[20] < 17.0) {
            var70 = -0.05336729;
        } else {
            var70 = 0.018167816;
        }
    } else {
        if (inputs[10] < 4.9475) {
            if (inputs[12] < 20.735) {
                if (inputs[20] < 14.0) {
                    if (inputs[13] < -0.955) {
                        if (inputs[24] < 47.22727) {
                            var70 = 0.027874755;
                        } else {
                            var70 = -0.044401567;
                        }
                    } else {
                        if (inputs[18] < -1.575) {
                            var70 = 0.0029407577;
                        } else {
                            var70 = 0.066102475;
                        }
                    }
                } else {
                    if (inputs[24] < 60.127644) {
                        if (inputs[15] < 2.1147807) {
                            var70 = 0.011717058;
                        } else {
                            var70 = -0.045668565;
                        }
                    } else {
                        var70 = 0.052484155;
                    }
                }
            } else {
                var70 = -0.027952233;
            }
        } else {
            var70 = -0.032661166;
        }
    }
    double var71;
    if (inputs[8] < 2.1819549) {
        var71 = 0.038812052;
    } else {
        if (inputs[21] < 19.424759) {
            if (inputs[21] < 18.95843) {
                if (inputs[16] < -4.529412) {
                    var71 = -0.057591863;
                } else {
                    if (inputs[3] < -1.6831203) {
                        var71 = -0.05147683;
                    } else {
                        if (inputs[12] < -4.065) {
                            var71 = -0.022751627;
                        } else {
                            var71 = 0.02051306;
                        }
                    }
                }
            } else {
                if (inputs[3] < -0.07619367) {
                    var71 = -0.014841506;
                } else {
                    var71 = -0.102085866;
                }
            }
        } else {
            if (inputs[24] < -59.192844) {
                if (inputs[24] < -77.06876) {
                    var71 = 0.0034198544;
                } else {
                    var71 = -0.060500134;
                }
            } else {
                if (inputs[16] < 1.3293198) {
                    if (inputs[21] < 19.8902) {
                        var71 = 0.070126705;
                    } else {
                        if (inputs[17] < -2.2494836) {
                            var71 = -0.011472701;
                        } else {
                            var71 = 0.05003969;
                        }
                    }
                } else {
                    if (inputs[8] < 2.5029585) {
                        if (inputs[7] < 18.33027) {
                            var71 = -0.06764032;
                        } else {
                            var71 = 0.010717061;
                        }
                    } else {
                        if (inputs[8] < 2.5540898) {
                            var71 = 0.06349316;
                        } else {
                            var71 = -0.0033623471;
                        }
                    }
                }
            }
        }
    }
    double var72;
    if (inputs[12] < 19.03) {
        if (inputs[8] < 2.5841584) {
            if (inputs[10] < 0.32) {
                if (inputs[7] < 11.201743) {
                    var72 = 0.014503733;
                } else {
                    var72 = 0.08702852;
                }
            } else {
                if (inputs[21] < 16.250086) {
                    if (inputs[23] < -17.97) {
                        var72 = 0.029011598;
                    } else {
                        var72 = -0.08304574;
                    }
                } else {
                    if (inputs[4] < -2.8872595) {
                        if (inputs[7] < -21.323767) {
                            var72 = 0.025659721;
                        } else {
                            var72 = -0.046433978;
                        }
                    } else {
                        if (inputs[21] < 20.074284) {
                            var72 = 0.0322107;
                        } else {
                            var72 = -0.0012220218;
                        }
                    }
                }
            }
        } else {
            if (inputs[9] < 30.646248) {
                if (inputs[10] < 0.655) {
                    var72 = 0.04256138;
                } else {
                    var72 = -0.019788044;
                }
            } else {
                var72 = -0.05394293;
            }
        }
    } else {
        if (inputs[10] < 2.6175) {
            var72 = -0.07633795;
        } else {
            var72 = 0.017932292;
        }
    }
    double var73;
    if (inputs[15] < -3.3750665) {
        var73 = -0.047674213;
    } else {
        if (inputs[12] < 8.885) {
            if (inputs[16] < 5.5290422) {
                if (inputs[2] < 1.7892857) {
                    if (inputs[24] < 49.993828) {
                        if (inputs[4] < -2.5398834) {
                            var73 = -0.0079010865;
                        } else {
                            var73 = 0.037493076;
                        }
                    } else {
                        var73 = -0.024011023;
                    }
                } else {
                    if (inputs[1] < 64.21748) {
                        if (inputs[1] < 60.98387) {
                            var73 = -0.022503033;
                        } else {
                            var73 = 0.047714733;
                        }
                    } else {
                        var73 = -0.05529462;
                    }
                }
            } else {
                var73 = -0.074101366;
            }
        } else {
            if (inputs[3] < 0.69257766) {
                if (inputs[10] < 1.38) {
                    if (inputs[13] < 18.38) {
                        var73 = 0.08028509;
                    } else {
                        var73 = 0.0024491632;
                    }
                } else {
                    if (inputs[4] < 1.8997555) {
                        var73 = 0.07628941;
                    } else {
                        if (inputs[7] < 16.923376) {
                            var73 = 0.008845861;
                        } else {
                            var73 = -0.06846946;
                        }
                    }
                }
            } else {
                var73 = -0.044181947;
            }
        }
    }
    double var74;
    if (inputs[3] < 1.8565543) {
        if (inputs[21] < 20.074284) {
            if (inputs[21] < 19.216185) {
                if (inputs[21] < 18.95843) {
                    if (inputs[1] < 37.129726) {
                        if (inputs[14] < 0.84603256) {
                            var74 = -0.001073318;
                        } else {
                            var74 = 0.0668661;
                        }
                    } else {
                        if (inputs[17] < 1.4881119) {
                            var74 = -0.06342604;
                        } else {
                            var74 = 0.011862584;
                        }
                    }
                } else {
                    var74 = -0.06848682;
                }
            } else {
                if (inputs[10] < 1.525) {
                    if (inputs[10] < 0.865) {
                        var74 = 0.027048795;
                    } else {
                        var74 = 0.095073804;
                    }
                } else {
                    if (inputs[3] < -0.04057971) {
                        var74 = 0.044077855;
                    } else {
                        var74 = -0.026219092;
                    }
                }
            }
        } else {
            if (inputs[23] < -15.75) {
                if (inputs[23] < -43.17) {
                    var74 = -0.0130772935;
                } else {
                    var74 = -0.07734101;
                }
            } else {
                if (inputs[20] < 11.0) {
                    if (inputs[6] < -21.316923) {
                        var74 = 0.0067984546;
                    } else {
                        var74 = -0.09233366;
                    }
                } else {
                    if (inputs[1] < 69.5182) {
                        if (inputs[8] < 2.4444444) {
                            var74 = -0.007935181;
                        } else {
                            var74 = 0.064330764;
                        }
                    } else {
                        if (inputs[10] < 1.1525) {
                            var74 = 0.03754831;
                        } else {
                            var74 = -0.06030335;
                        }
                    }
                }
            }
        }
    } else {
        var74 = -0.03702346;
    }
    double var75;
    if (inputs[9] < 27.548391) {
        if (inputs[13] < 10.585) {
            if (inputs[9] < 19.406181) {
                var75 = 0.036871508;
            } else {
                if (inputs[9] < 20.879713) {
                    var75 = -0.06824428;
                } else {
                    if (inputs[14] < 0.66544646) {
                        var75 = -0.06403735;
                    } else {
                        if (inputs[13] < 6.675) {
                            var75 = -0.0050373394;
                        } else {
                            var75 = 0.05293866;
                        }
                    }
                }
            }
        } else {
            var75 = -0.062204774;
        }
    } else {
        if (inputs[17] < 7.064094) {
            if (inputs[16] < 5.1257167) {
                if (inputs[13] < -15.15) {
                    if (inputs[17] < -3.9852426) {
                        var75 = -0.008124933;
                    } else {
                        var75 = 0.075948566;
                    }
                } else {
                    if (inputs[13] < 10.585) {
                        if (inputs[8] < 2.4381444) {
                            var75 = 0.03104432;
                        } else {
                            var75 = -0.012668495;
                        }
                    } else {
                        if (inputs[8] < 2.490196) {
                            var75 = -0.020315416;
                        } else {
                            var75 = 0.05993253;
                        }
                    }
                }
            } else {
                var75 = -0.05171611;
            }
        } else {
            var75 = 0.05322056;
        }
    }
    double var76;
    if (inputs[16] < -6.857122) {
        var76 = 0.063840725;
    } else {
        if (inputs[16] < -5.819462) {
            var76 = -0.057347566;
        } else {
            if (inputs[17] < -5.394068) {
                var76 = 0.052107047;
            } else {
                if (inputs[20] < 4.0) {
                    var76 = -0.037844773;
                } else {
                    if (inputs[7] < 28.382496) {
                        if (inputs[20] < 12.0) {
                            var76 = 0.023781054;
                        } else {
                            var76 = -0.0006841544;
                        }
                    } else {
                        var76 = -0.046854567;
                    }
                }
            }
        }
    }
    double var77;
    if (inputs[8] < 2.1819549) {
        var77 = 0.044559915;
    } else {
        if (inputs[19] < 5.0) {
            if (inputs[19] < 4.0) {
                if (inputs[18] < -5.38) {
                    if (inputs[9] < 34.908962) {
                        if (inputs[3] < 0.81114143) {
                            var77 = -0.06976487;
                        } else {
                            var77 = -0.006682549;
                        }
                    } else {
                        if (inputs[14] < 0.6929307) {
                            var77 = 0.04564029;
                        } else {
                            var77 = -0.017269772;
                        }
                    }
                } else {
                    if (inputs[7] < -23.214403) {
                        var77 = 0.062416133;
                    } else {
                        if (inputs[1] < 33.718754) {
                            var77 = -0.031581778;
                        } else {
                            var77 = 0.008149741;
                        }
                    }
                }
            } else {
                if (inputs[24] < 49.591896) {
                    if (inputs[7] < 10.990605) {
                        if (inputs[18] < -10.12) {
                            var77 = -0.007320083;
                        } else {
                            var77 = -0.098042145;
                        }
                    } else {
                        var77 = 0.063962996;
                    }
                } else {
                    var77 = -0.07669938;
                }
            }
        } else {
            var77 = 0.042944867;
        }
    }
    double var78;
    if (inputs[2] < 0.94714284) {
        var78 = 0.04911021;
    } else {
        if (inputs[20] < 17.0) {
            if (inputs[18] < -12.56) {
                if (inputs[4] < -2.792573) {
                    var78 = 0.010577765;
                } else {
                    var78 = -0.10024175;
                }
            } else {
                if (inputs[2] < 1.2185714) {
                    if (inputs[20] < 5.0) {
                        var78 = 0.016008383;
                    } else {
                        if (inputs[6] < -29.362022) {
                            var78 = -0.02861283;
                        } else {
                            var78 = -0.07266926;
                        }
                    }
                } else {
                    if (inputs[21] < 16.250086) {
                        var78 = -0.037402567;
                    } else {
                        if (inputs[18] < 15.95) {
                            var78 = 0.019657604;
                        } else {
                            var78 = -0.03586766;
                        }
                    }
                }
            }
        } else {
            if (inputs[5] < 1.0) {
                if (inputs[13] < -8.93) {
                    var78 = 0.056734074;
                } else {
                    if (inputs[21] < 18.527784) {
                        var78 = -0.07379077;
                    } else {
                        var78 = 0.0051049185;
                    }
                }
            } else {
                if (inputs[18] < -9.825) {
                    var78 = 0.0018711021;
                } else {
                    if (inputs[18] < 4.6) {
                        var78 = 0.07356491;
                    } else {
                        var78 = 0.010841035;
                    }
                }
            }
        }
    }
    double var79;
    if (inputs[4] < 3.0345144) {
        if (inputs[14] < 0.9640686) {
            if (inputs[10] < 2.2625) {
                if (inputs[4] < -2.8872595) {
                    if (inputs[16] < -5.040171) {
                        var79 = 0.02423184;
                    } else {
                        if (inputs[18] < -6.705) {
                            var79 = -0.09083697;
                        } else {
                            var79 = 0.00688425;
                        }
                    }
                } else {
                    if (inputs[23] < 20.31) {
                        if (inputs[21] < 18.513588) {
                            var79 = 0.006430849;
                        } else {
                            var79 = 0.055917896;
                        }
                    } else {
                        var79 = -0.024202969;
                    }
                }
            } else {
                if (inputs[18] < -0.335) {
                    if (inputs[6] < -21.98774) {
                        var79 = 0.035408318;
                    } else {
                        var79 = 0.094832465;
                    }
                } else {
                    var79 = -0.000771519;
                }
            }
        } else {
            if (inputs[14] < 1.0516493) {
                if (inputs[13] < -0.375) {
                    var79 = -0.0660102;
                } else {
                    var79 = -0.04760085;
                }
            } else {
                if (inputs[20] < 15.0) {
                    var79 = 0.050130695;
                } else {
                    if (inputs[21] < 18.090633) {
                        if (inputs[13] < -0.99) {
                            var79 = 0.050539903;
                        } else {
                            var79 = -0.021335663;
                        }
                    } else {
                        if (inputs[10] < 1.2225) {
                            var79 = 0.009577517;
                        } else {
                            var79 = -0.05508222;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[15] < 3.1116202) {
            if (inputs[3] < -0.61608714) {
                var79 = -0.024459848;
            } else {
                var79 = -0.09290157;
            }
        } else {
            if (inputs[15] < 3.7718) {
                var79 = 0.032396097;
            } else {
                var79 = -0.03714428;
            }
        }
    }
    double var80;
    if (inputs[6] < 0.3177864) {
        if (inputs[20] < 16.0) {
            if (inputs[1] < 73.23786) {
                if (inputs[3] < 0.76225996) {
                    if (inputs[13] < 0.235) {
                        if (inputs[13] < -5.97) {
                            var80 = -0.02615629;
                        } else {
                            var80 = -0.09350975;
                        }
                    } else {
                        if (inputs[13] < 4.155) {
                            var80 = 0.041291647;
                        } else {
                            var80 = -0.025061823;
                        }
                    }
                } else {
                    if (inputs[9] < 36.512947) {
                        if (inputs[4] < -2.6420665) {
                            var80 = 0.08528579;
                        } else {
                            var80 = 0.0069084456;
                        }
                    } else {
                        var80 = -0.02117491;
                    }
                }
            } else {
                if (inputs[7] < 27.542418) {
                    var80 = 0.05023397;
                } else {
                    var80 = -0.0027911144;
                }
            }
        } else {
            if (inputs[12] < 13.825) {
                if (inputs[16] < 3.2122443) {
                    if (inputs[4] < 2.0631578) {
                        if (inputs[23] < -36.945) {
                            var80 = -0.03673123;
                        } else {
                            var80 = 0.02032269;
                        }
                    } else {
                        var80 = 0.09214671;
                    }
                } else {
                    var80 = -0.041007545;
                }
            } else {
                var80 = 0.077752925;
            }
        }
    } else {
        if (inputs[10] < 1.66) {
            if (inputs[9] < 26.59737) {
                var80 = -0.04057828;
            } else {
                if (inputs[2] < 1.4764286) {
                    var80 = -0.0025676847;
                } else {
                    var80 = 0.04007299;
                }
            }
        } else {
            var80 = -0.055353504;
        }
    }
    double var81;
    if (inputs[16] < 6.4996295) {
        if (inputs[9] < 19.406181) {
            if (inputs[8] < 2.4983606) {
                var81 = -0.00047239126;
            } else {
                var81 = 0.07644668;
            }
        } else {
            if (inputs[3] < -0.018309461) {
                if (inputs[17] < 4.8139157) {
                    if (inputs[1] < 63.736034) {
                        if (inputs[16] < -1.9178363) {
                            var81 = -0.003925457;
                        } else {
                            var81 = 0.04685174;
                        }
                    } else {
                        if (inputs[1] < 67.20021) {
                            var81 = -0.08017044;
                        } else {
                            var81 = -0.0014751634;
                        }
                    }
                } else {
                    if (inputs[7] < 17.219347) {
                        var81 = 0.014495217;
                    } else {
                        var81 = 0.06847577;
                    }
                }
            } else {
                if (inputs[18] < 6.42) {
                    if (inputs[8] < 2.5661972) {
                        if (inputs[23] < 4.425) {
                            var81 = -0.000009107224;
                        } else {
                            var81 = 0.06423242;
                        }
                    } else {
                        var81 = -0.051164676;
                    }
                } else {
                    if (inputs[14] < 0.900207) {
                        var81 = -0.08228302;
                    } else {
                        var81 = -0.01727255;
                    }
                }
            }
        }
    } else {
        var81 = -0.074955635;
    }
    double var82;
    if (inputs[2] < 1.7578571) {
        if (inputs[16] < 5.5290422) {
            if (inputs[16] < 4.498615) {
                if (inputs[23] < 9.33) {
                    if (inputs[7] < 12.106855) {
                        if (inputs[21] < 20.12239) {
                            var82 = 0.023163948;
                        } else {
                            var82 = -0.016756836;
                        }
                    } else {
                        if (inputs[3] < 0.06041935) {
                            var82 = 0.05102556;
                        } else {
                            var82 = 0.08139471;
                        }
                    }
                } else {
                    if (inputs[15] < 2.6973875) {
                        if (inputs[6] < -2.358174) {
                            var82 = -0.07282177;
                        } else {
                            var82 = -0.021976912;
                        }
                    } else {
                        var82 = 0.008137687;
                    }
                }
            } else {
                var82 = 0.085595556;
            }
        } else {
            var82 = -0.044581182;
        }
    } else {
        if (inputs[6] < 10.910757) {
            if (inputs[6] < -35.168385) {
                var82 = -0.052836537;
            } else {
                if (inputs[7] < 12.70107) {
                    if (inputs[13] < -4.32) {
                        if (inputs[16] < -2.0384402) {
                            var82 = 0.017054552;
                        } else {
                            var82 = -0.062314562;
                        }
                    } else {
                        if (inputs[2] < 2.7042856) {
                            var82 = 0.0048398757;
                        } else {
                            var82 = 0.07529499;
                        }
                    }
                } else {
                    if (inputs[15] < 2.4260392) {
                        var82 = -0.08020397;
                    } else {
                        var82 = 0.030689297;
                    }
                }
            }
        } else {
            var82 = -0.05975086;
        }
    }
    double var83;
    if (inputs[9] < 27.667595) {
        if (inputs[9] < 25.651636) {
            if (inputs[20] < 12.0) {
                if (inputs[20] < 10.0) {
                    var83 = -0.024998643;
                } else {
                    var83 = 0.052899055;
                }
            } else {
                if (inputs[10] < 2.85) {
                    if (inputs[1] < 62.15934) {
                        if (inputs[14] < 1.102963) {
                            var83 = -0.108688235;
                        } else {
                            var83 = -0.038301244;
                        }
                    } else {
                        var83 = 0.016630327;
                    }
                } else {
                    if (inputs[11] < 0.0) {
                        var83 = 0.04574003;
                    } else {
                        var83 = -0.017173333;
                    }
                }
            }
        } else {
            var83 = -0.05511;
        }
    } else {
        if (inputs[18] < -19.1) {
            var83 = -0.038461205;
        } else {
            if (inputs[10] < 2.01) {
                if (inputs[19] < 2.0) {
                    var83 = 0.048523784;
                } else {
                    if (inputs[9] < 54.036877) {
                        if (inputs[9] < 29.282501) {
                            var83 = 0.02838856;
                        } else {
                            var83 = -0.024644364;
                        }
                    } else {
                        var83 = 0.05101168;
                    }
                }
            } else {
                if (inputs[7] < 19.300243) {
                    if (inputs[7] < 10.280934) {
                        if (inputs[13] < -4.32) {
                            var83 = -0.0024209644;
                        } else {
                            var83 = 0.05624657;
                        }
                    } else {
                        var83 = -0.045908656;
                    }
                } else {
                    var83 = 0.06930658;
                }
            }
        }
    }
    double var84;
    if (inputs[14] < 1.8754882) {
        if (inputs[13] < 6.675) {
            if (inputs[3] < 1.4468069) {
                if (inputs[1] < 30.82347) {
                    if (inputs[14] < 0.8444603) {
                        var84 = -0.06384204;
                    } else {
                        var84 = 0.0023700497;
                    }
                } else {
                    if (inputs[10] < 3.525) {
                        if (inputs[10] < 2.2675) {
                            var84 = -0.0056747464;
                        } else {
                            var84 = 0.034168523;
                        }
                    } else {
                        var84 = -0.04907984;
                    }
                }
            } else {
                if (inputs[6] < -31.092716) {
                    var84 = 0.058553196;
                } else {
                    var84 = -0.027085336;
                }
            }
        } else {
            if (inputs[21] < 20.487743) {
                if (inputs[21] < 17.554108) {
                    var84 = -0.010694691;
                } else {
                    if (inputs[3] < -1.1814915) {
                        var84 = 0.00031648716;
                    } else {
                        if (inputs[17] < 3.3192878) {
                            var84 = 0.07981699;
                        } else {
                            var84 = 0.017359149;
                        }
                    }
                }
            } else {
                if (inputs[3] < -0.4338425) {
                    var84 = 0.027261673;
                } else {
                    var84 = -0.076256186;
                }
            }
        }
    } else {
        var84 = -0.04902789;
    }
    double var85;
    if (inputs[10] < 2.2675) {
        if (inputs[16] < -4.2995014) {
            if (inputs[13] < -7.38) {
                var85 = 0.067818604;
            } else {
                var85 = -0.0073896064;
            }
        } else {
            if (inputs[12] < 11.485) {
                if (inputs[10] < 0.255) {
                    if (inputs[10] < 0.1325) {
                        var85 = -0.033149954;
                    } else {
                        var85 = 0.06813884;
                    }
                } else {
                    if (inputs[15] < 3.0439835) {
                        if (inputs[1] < 30.740921) {
                            var85 = -0.084265545;
                        } else {
                            var85 = -0.027311442;
                        }
                    } else {
                        var85 = 0.036093738;
                    }
                }
            } else {
                if (inputs[13] < 14.475) {
                    var85 = 0.0670871;
                } else {
                    if (inputs[8] < 2.4952154) {
                        var85 = -0.04570235;
                    } else {
                        var85 = 0.016039167;
                    }
                }
            }
        }
    } else {
        if (inputs[9] < 42.81248) {
            if (inputs[10] < 2.535) {
                var85 = 0.075593606;
            } else {
                if (inputs[13] < -18.065) {
                    var85 = -0.018074676;
                } else {
                    if (inputs[2] < 1.6985714) {
                        var85 = 0.053818252;
                    } else {
                        if (inputs[2] < 2.4671428) {
                            var85 = -0.00826728;
                        } else {
                            var85 = 0.030446406;
                        }
                    }
                }
            }
        } else {
            var85 = -0.017218595;
        }
    }
    double var86;
    if (inputs[16] < -6.857122) {
        var86 = 0.03855725;
    } else {
        if (inputs[16] < -5.819462) {
            var86 = -0.059428025;
        } else {
            if (inputs[10] < 4.9475) {
                if (inputs[3] < -1.9224318) {
                    var86 = -0.045135375;
                } else {
                    if (inputs[13] < -5.97) {
                        if (inputs[10] < 0.63) {
                            var86 = -0.019224472;
                        } else {
                            var86 = 0.028654628;
                        }
                    } else {
                        if (inputs[12] < -2.825) {
                            var86 = -0.06869565;
                        } else {
                            var86 = 0.006001783;
                        }
                    }
                }
            } else {
                var86 = -0.045211874;
            }
        }
    }
    double var87;
    if (inputs[20] < 10.0) {
        if (inputs[15] < 3.0270271) {
            if (inputs[2] < 1.0707142) {
                var87 = -0.08404539;
            } else {
                if (inputs[14] < 0.7928059) {
                    if (inputs[8] < 2.502439) {
                        var87 = -0.020872308;
                    } else {
                        var87 = 0.039941728;
                    }
                } else {
                    var87 = -0.06527781;
                }
            }
        } else {
            var87 = 0.045746867;
        }
    } else {
        if (inputs[6] < -59.855896) {
            var87 = -0.039882593;
        } else {
            if (inputs[14] < 0.69918364) {
                if (inputs[8] < 2.4924242) {
                    var87 = 0.069094114;
                } else {
                    if (inputs[8] < 2.5246828) {
                        var87 = -0.008457506;
                    } else {
                        var87 = 0.04379795;
                    }
                }
            } else {
                if (inputs[2] < 1.4471428) {
                    if (inputs[6] < -16.935852) {
                        var87 = 0.012252463;
                    } else {
                        var87 = -0.072856545;
                    }
                } else {
                    if (inputs[18] < -12.56) {
                        if (inputs[23] < -51.615) {
                            var87 = 0.038010567;
                        } else {
                            var87 = -0.07253105;
                        }
                    } else {
                        if (inputs[7] < -16.809072) {
                            var87 = 0.056003965;
                        } else {
                            var87 = 0.014152902;
                        }
                    }
                }
            }
        }
    }
    double var88;
    if (inputs[23] < -62.16) {
        var88 = -0.037542008;
    } else {
        if (inputs[21] < 19.616495) {
            if (inputs[9] < 40.519955) {
                if (inputs[9] < 32.90977) {
                    if (inputs[9] < 19.248732) {
                        var88 = 0.03487976;
                    } else {
                        if (inputs[8] < 2.4758735) {
                            var88 = 0.010418577;
                        } else {
                            var88 = -0.026383724;
                        }
                    }
                } else {
                    if (inputs[21] < 18.391182) {
                        var88 = 0.06375548;
                    } else {
                        var88 = -0.0018852372;
                    }
                }
            } else {
                if (inputs[1] < 67.42437) {
                    var88 = -0.07459133;
                } else {
                    var88 = -0.00007180498;
                }
            }
        } else {
            if (inputs[23] < -40.335) {
                var88 = 0.081013925;
            } else {
                if (inputs[20] < 6.0) {
                    var88 = -0.030827776;
                } else {
                    if (inputs[2] < 0.9671429) {
                        var88 = 0.08061476;
                    } else {
                        if (inputs[8] < 2.5069637) {
                            var88 = -0.003091246;
                        } else {
                            var88 = 0.03763404;
                        }
                    }
                }
            }
        }
    }
    double var89;
    if (inputs[2] < 1.6985714) {
        if (inputs[21] < 15.992029) {
            var89 = -0.030374;
        } else {
            if (inputs[24] < 60.976536) {
                if (inputs[8] < 2.5035799) {
                    if (inputs[20] < 9.0) {
                        var89 = -0.032251135;
                    } else {
                        if (inputs[2] < 1.2035714) {
                            var89 = 0.05690217;
                        } else {
                            var89 = -0.0016151373;
                        }
                    }
                } else {
                    if (inputs[3] < -0.04057971) {
                        if (inputs[10] < 1.2775) {
                            var89 = 0.014456413;
                        } else {
                            var89 = 0.08355087;
                        }
                    } else {
                        if (inputs[4] < -2.792573) {
                            var89 = 0.0335137;
                        } else {
                            var89 = -0.018192548;
                        }
                    }
                }
            } else {
                if (inputs[15] < 3.3835921) {
                    var89 = -0.0725385;
                } else {
                    var89 = 0.024018088;
                }
            }
        }
    } else {
        if (inputs[6] < -34.82493) {
            var89 = -0.08134377;
        } else {
            if (inputs[23] < 39.645) {
                if (inputs[2] < 2.3164287) {
                    if (inputs[10] < 1.38) {
                        var89 = 0.0071366224;
                    } else {
                        if (inputs[4] < -1.9089215) {
                            var89 = -0.008109771;
                        } else {
                            var89 = -0.0823451;
                        }
                    }
                } else {
                    if (inputs[19] < 3.0) {
                        if (inputs[12] < 1.685) {
                            var89 = 0.055834312;
                        } else {
                            var89 = -0.0042495043;
                        }
                    } else {
                        if (inputs[17] < 1.384713) {
                            var89 = -0.044074766;
                        } else {
                            var89 = 0.030712584;
                        }
                    }
                }
            } else {
                var89 = -0.063374065;
            }
        }
    }
    double var90;
    if (inputs[21] < 22.972445) {
        if (inputs[15] < 3.0270271) {
            if (inputs[23] < 5.665) {
                if (inputs[18] < 1.285) {
                    if (inputs[21] < 20.12239) {
                        if (inputs[13] < 0.38) {
                            var90 = -0.0057090367;
                        } else {
                            var90 = 0.027202362;
                        }
                    } else {
                        if (inputs[18] < -12.56) {
                            var90 = -0.094628;
                        } else {
                            var90 = -0.0063471533;
                        }
                    }
                } else {
                    var90 = 0.07008302;
                }
            } else {
                if (inputs[8] < 2.4525745) {
                    if (inputs[21] < 19.065485) {
                        var90 = 0.04397879;
                    } else {
                        var90 = -0.011840856;
                    }
                } else {
                    if (inputs[6] < -31.334112) {
                        var90 = -0.07273418;
                    } else {
                        if (inputs[3] < -0.48359513) {
                            var90 = -0.054734495;
                        } else {
                            var90 = 0.0014366383;
                        }
                    }
                }
            }
        } else {
            if (inputs[7] < 19.642025) {
                var90 = -0.016059259;
            } else {
                var90 = 0.05244207;
            }
        }
    } else {
        if (inputs[12] < -3.015) {
            var90 = 0.07259653;
        } else {
            var90 = -0.0031925242;
        }
    }
    double var91;
    if (inputs[8] < 2.502439) {
        if (inputs[8] < 2.5004926) {
            if (inputs[2] < 1.2114285) {
                if (inputs[17] < -2.972814) {
                    var91 = 0.05385919;
                } else {
                    var91 = -0.010247502;
                }
            } else {
                if (inputs[13] < 14.475) {
                    if (inputs[4] < -1.6590085) {
                        if (inputs[3] < -0.234652) {
                            var91 = 0.067851044;
                        } else {
                            var91 = -0.009250932;
                        }
                    } else {
                        if (inputs[17] < 1.4038112) {
                            var91 = -0.086984344;
                        } else {
                            var91 = -0.0066142725;
                        }
                    }
                } else {
                    var91 = -0.054011215;
                }
            }
        } else {
            var91 = -0.07599974;
        }
    } else {
        if (inputs[15] < -1.7393292) {
            if (inputs[9] < 34.246445) {
                if (inputs[3] < 0.4358175) {
                    var91 = -0.008404617;
                } else {
                    var91 = -0.07320577;
                }
            } else {
                if (inputs[24] < -54.450855) {
                    var91 = 0.050768793;
                } else {
                    var91 = -0.0008115742;
                }
            }
        } else {
            if (inputs[13] < -2.08) {
                if (inputs[9] < 24.696909) {
                    var91 = 0.090798;
                } else {
                    var91 = 0.028977176;
                }
            } else {
                if (inputs[8] < 2.6716866) {
                    if (inputs[23] < 7.5) {
                        var91 = -0.008253371;
                    } else {
                        var91 = 0.05332238;
                    }
                } else {
                    var91 = -0.041713946;
                }
            }
        }
    }
    double var92;
    if (inputs[14] < 0.6929307) {
        if (inputs[1] < 25.119524) {
            var92 = 0.058207154;
        } else {
            if (inputs[1] < 31.394823) {
                var92 = -0.046321895;
            } else {
                if (inputs[11] < 0.0) {
                    var92 = 0.063512474;
                } else {
                    if (inputs[15] < 2.9534643) {
                        if (inputs[17] < 3.7096577) {
                            var92 = 0.015031329;
                        } else {
                            var92 = -0.05394178;
                        }
                    } else {
                        var92 = 0.04904614;
                    }
                }
            }
        }
    } else {
        if (inputs[18] < -14.665) {
            if (inputs[21] < 18.699093) {
                var92 = -0.0018114294;
            } else {
                var92 = -0.075113386;
            }
        } else {
            if (inputs[13] < -15.68) {
                var92 = 0.048703156;
            } else {
                if (inputs[8] < 2.5633333) {
                    if (inputs[8] < 2.527957) {
                        if (inputs[6] < -29.161388) {
                            var92 = 0.019543016;
                        } else {
                            var92 = -0.01830026;
                        }
                    } else {
                        var92 = 0.062987074;
                    }
                } else {
                    if (inputs[6] < -3.152488) {
                        var92 = -0.011105726;
                    } else {
                        var92 = -0.07796569;
                    }
                }
            }
        }
    }
    double var93;
    if (inputs[21] < 15.619108) {
        if (inputs[20] < 16.0) {
            var93 = 0.0073787984;
        } else {
            var93 = 0.07471049;
        }
    } else {
        if (inputs[10] < 4.9475) {
            if (inputs[9] < 55.74809) {
                if (inputs[9] < 46.46898) {
                    if (inputs[20] < 4.0) {
                        var93 = -0.03669292;
                    } else {
                        if (inputs[20] < 5.0) {
                            var93 = 0.048969634;
                        } else {
                            var93 = 0.00332206;
                        }
                    }
                } else {
                    var93 = -0.03867585;
                }
            } else {
                var93 = 0.035593927;
            }
        } else {
            var93 = -0.044451352;
        }
    }
    double var94;
    if (inputs[21] < 21.790148) {
        if (inputs[1] < 30.82347) {
            if (inputs[3] < 0.84939736) {
                if (inputs[13] < 6.14) {
                    var94 = -0.07564198;
                } else {
                    var94 = -0.008308941;
                }
            } else {
                var94 = 0.0054542758;
            }
        } else {
            if (inputs[12] < -11.95) {
                if (inputs[10] < 1.5175) {
                    var94 = 0.061307896;
                } else {
                    if (inputs[15] < -1.661277) {
                        var94 = 0.00186543;
                    } else {
                        var94 = 0.01718719;
                    }
                }
            } else {
                if (inputs[8] < 2.3338983) {
                    var94 = -0.05964493;
                } else {
                    if (inputs[3] < -1.2425932) {
                        if (inputs[21] < 19.30932) {
                            var94 = -0.064941786;
                        } else {
                            var94 = 0.002054662;
                        }
                    } else {
                        if (inputs[21] < 20.538614) {
                            var94 = 0.009110429;
                        } else {
                            var94 = -0.039887093;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[12] < -9.72) {
            var94 = -0.033759017;
        } else {
            if (inputs[6] < -17.456095) {
                var94 = 0.06280101;
            } else {
                var94 = 0.010252581;
            }
        }
    }
    double var95;
    if (inputs[10] < 5.1675) {
        if (inputs[1] < 31.216616) {
            if (inputs[6] < -2.358174) {
                if (inputs[19] < 3.0) {
                    var95 = -0.06261296;
                } else {
                    if (inputs[21] < 18.88153) {
                        var95 = -0.03623452;
                    } else {
                        var95 = 0.009134819;
                    }
                }
            } else {
                if (inputs[18] < -6.49) {
                    var95 = 0.027977033;
                } else {
                    var95 = -0.023375703;
                }
            }
        } else {
            if (inputs[3] < -0.16443706) {
                if (inputs[6] < -22.778442) {
                    if (inputs[4] < 2.5601022) {
                        var95 = -0.016690554;
                    } else {
                        var95 = 0.037372902;
                    }
                } else {
                    if (inputs[8] < 2.5584745) {
                        if (inputs[8] < 2.504451) {
                            var95 = -0.024773099;
                        } else {
                            var95 = 0.019982964;
                        }
                    } else {
                        var95 = -0.06683376;
                    }
                }
            } else {
                if (inputs[3] < -0.005653874) {
                    var95 = 0.06399873;
                } else {
                    if (inputs[12] < -11.95) {
                        if (inputs[14] < 1.0371151) {
                            var95 = -0.0021919706;
                        } else {
                            var95 = 0.06860703;
                        }
                    } else {
                        if (inputs[21] < 17.305426) {
                            var95 = 0.041382343;
                        } else {
                            var95 = -0.014869725;
                        }
                    }
                }
            }
        }
    } else {
        var95 = 0.03493896;
    }
    double var96;
    if (inputs[23] < -62.16) {
        var96 = -0.042156283;
    } else {
        if (inputs[23] < -22.01) {
            if (inputs[14] < 1.1190472) {
                if (inputs[14] < 0.65575767) {
                    var96 = 0.009080177;
                } else {
                    if (inputs[8] < 2.4878378) {
                        var96 = 0.08671242;
                    } else {
                        var96 = 0.020695629;
                    }
                }
            } else {
                var96 = -0.019390168;
            }
        } else {
            if (inputs[23] < -15.75) {
                var96 = -0.052697614;
            } else {
                if (inputs[14] < 1.2158513) {
                    if (inputs[21] < 21.100323) {
                        if (inputs[7] < -21.323767) {
                            var96 = 0.04663184;
                        } else {
                            var96 = -0.0033514786;
                        }
                    } else {
                        if (inputs[3] < 0.106602594) {
                            var96 = -0.007674749;
                        } else {
                            var96 = -0.08373266;
                        }
                    }
                } else {
                    if (inputs[15] < -1.6273421) {
                        var96 = 0.08167289;
                    } else {
                        if (inputs[3] < -0.8018117) {
                            var96 = -0.03943228;
                        } else {
                            var96 = 0.016683547;
                        }
                    }
                }
            }
        }
    }
    double var97;
    if (inputs[10] < 0.1325) {
        var97 = -0.03605628;
    } else {
        if (inputs[13] < 1.105) {
            if (inputs[12] < 0.555) {
                if (inputs[17] < 1.1209586) {
                    if (inputs[15] < -1.177755) {
                        if (inputs[14] < 0.70498997) {
                            var97 = 0.038268536;
                        } else {
                            var97 = -0.0048233797;
                        }
                    } else {
                        var97 = 0.06549478;
                    }
                } else {
                    if (inputs[7] < 20.301311) {
                        if (inputs[17] < 2.6024637) {
                            var97 = -0.08137085;
                        } else {
                            var97 = -0.014935558;
                        }
                    } else {
                        if (inputs[13] < -11.84) {
                            var97 = -0.012731852;
                        } else {
                            var97 = 0.04640843;
                        }
                    }
                }
            } else {
                var97 = 0.066629104;
            }
        } else {
            if (inputs[17] < 1.4038112) {
                if (inputs[24] < -34.028454) {
                    if (inputs[15] < -2.4415324) {
                        if (inputs[15] < -3.172557) {
                            var97 = 0.028586593;
                        } else {
                            var97 = -0.060324434;
                        }
                    } else {
                        var97 = 0.02968645;
                    }
                } else {
                    var97 = -0.093024045;
                }
            } else {
                if (inputs[7] < 16.923376) {
                    if (inputs[17] < 2.622856) {
                        var97 = 0.08059764;
                    } else {
                        if (inputs[4] < 2.4526935) {
                            var97 = -0.009712197;
                        } else {
                            var97 = 0.037441954;
                        }
                    }
                } else {
                    if (inputs[10] < 1.095) {
                        var97 = 0.033881076;
                    } else {
                        var97 = -0.06266809;
                    }
                }
            }
        }
    }
    double var98;
    if (inputs[10] < 1.21) {
        if (inputs[21] < 16.401161) {
            var98 = 0.051745184;
        } else {
            if (inputs[4] < -3.0357554) {
                if (inputs[10] < 0.4575) {
                    var98 = 0.06733103;
                } else {
                    var98 = 0.014623708;
                }
            } else {
                if (inputs[10] < 1.05) {
                    if (inputs[1] < 34.038666) {
                        var98 = -0.056989145;
                    } else {
                        if (inputs[8] < 2.4850543) {
                            var98 = -0.03659298;
                        } else {
                            var98 = 0.020049509;
                        }
                    }
                } else {
                    var98 = 0.059263993;
                }
            }
        }
    } else {
        if (inputs[10] < 2.01) {
            if (inputs[13] < -6.595) {
                var98 = 0.0081793275;
            } else {
                if (inputs[3] < -0.75934255) {
                    var98 = -0.005436531;
                } else {
                    if (inputs[10] < 1.4975) {
                        var98 = -0.058308873;
                    } else {
                        var98 = -0.09480277;
                    }
                }
            }
        } else {
            if (inputs[13] < -3.355) {
                if (inputs[21] < 19.15363) {
                    if (inputs[19] < 3.0) {
                        var98 = 0.04275945;
                    } else {
                        var98 = -0.015199431;
                    }
                } else {
                    var98 = -0.061739475;
                }
            } else {
                if (inputs[12] < 1.685) {
                    var98 = 0.05025013;
                } else {
                    if (inputs[9] < 29.872112) {
                        var98 = -0.03431607;
                    } else {
                        if (inputs[14] < 0.8497934) {
                            var98 = -0.016343128;
                        } else {
                            var98 = 0.06010659;
                        }
                    }
                }
            }
        }
    }
    double var99;
    if (inputs[13] < 6.675) {
        if (inputs[8] < 2.4176931) {
            if (inputs[4] < -1.6590085) {
                if (inputs[1] < 30.740921) {
                    var99 = 0.008461163;
                } else {
                    var99 = 0.07528198;
                }
            } else {
                var99 = -0.018502811;
            }
        } else {
            if (inputs[2] < 3.39) {
                if (inputs[9] < 25.057901) {
                    if (inputs[18] < -4.89) {
                        var99 = -0.04411057;
                    } else {
                        if (inputs[23] < 4.2) {
                            var99 = 0.052268416;
                        } else {
                            var99 = -0.020667989;
                        }
                    }
                } else {
                    if (inputs[3] < -1.6227406) {
                        var99 = 0.02255812;
                    } else {
                        if (inputs[9] < 32.36834) {
                            var99 = -0.058722258;
                        } else {
                            var99 = -0.013718739;
                        }
                    }
                }
            } else {
                var99 = 0.03816944;
            }
        }
    } else {
        if (inputs[2] < 1.1628572) {
            var99 = -0.025062677;
        } else {
            if (inputs[2] < 1.4235715) {
                var99 = 0.058918677;
            } else {
                if (inputs[17] < -2.1781795) {
                    var99 = -0.03088655;
                } else {
                    if (inputs[9] < 39.357887) {
                        if (inputs[4] < 2.2659361) {
                            var99 = 0.03866173;
                        } else {
                            var99 = -0.03691782;
                        }
                    } else {
                        var99 = 0.06314609;
                    }
                }
            }
        }
    }
    double var100;
    if (inputs[14] < 0.5350635) {
        var100 = -0.031369668;
    } else {
        if (inputs[2] < 0.98071426) {
            var100 = 0.06581189;
        } else {
            if (inputs[24] < -47.42504) {
                if (inputs[16] < -6.857122) {
                    var100 = 0.037875652;
                } else {
                    if (inputs[14] < 0.9558383) {
                        if (inputs[18] < -9.235) {
                            var100 = -0.013314377;
                        } else {
                            var100 = -0.08903561;
                        }
                    } else {
                        var100 = 0.0040355707;
                    }
                }
            } else {
                if (inputs[8] < 2.244737) {
                    var100 = -0.046178706;
                } else {
                    if (inputs[8] < 2.4561403) {
                        if (inputs[8] < 2.4362934) {
                            var100 = 0.013479589;
                        } else {
                            var100 = 0.07745897;
                        }
                    } else {
                        if (inputs[8] < 2.4850543) {
                            var100 = -0.04241558;
                        } else {
                            var100 = 0.0075759753;
                        }
                    }
                }
            }
        }
    }
    double var101;
    if (inputs[1] < 68.044624) {
        if (inputs[2] < 2.0564287) {
            if (inputs[21] < 17.880342) {
                if (inputs[8] < 2.4985423) {
                    var101 = 0.012079455;
                } else {
                    var101 = -0.038979705;
                }
            } else {
                if (inputs[20] < 17.0) {
                    if (inputs[3] < 1.5226405) {
                        if (inputs[2] < 1.2928572) {
                            var101 = -0.034392055;
                        } else {
                            var101 = 0.020018417;
                        }
                    } else {
                        var101 = 0.06275764;
                    }
                } else {
                    if (inputs[14] < 0.7803881) {
                        var101 = 0.02457496;
                    } else {
                        var101 = 0.06705214;
                    }
                }
            }
        } else {
            if (inputs[2] < 2.78) {
                if (inputs[9] < 30.351091) {
                    if (inputs[13] < -1.735) {
                        var101 = -0.032294437;
                    } else {
                        var101 = -0.08460532;
                    }
                } else {
                    var101 = 0.0010100037;
                }
            } else {
                if (inputs[3] < 0.28880712) {
                    var101 = 0.03753645;
                } else {
                    var101 = -0.018936839;
                }
            }
        }
    } else {
        if (inputs[20] < 16.0) {
            if (inputs[9] < 29.09266) {
                var101 = 0.019031502;
            } else {
                if (inputs[24] < 68.10501) {
                    if (inputs[10] < 1.0475) {
                        var101 = -0.086945795;
                    } else {
                        var101 = -0.009056021;
                    }
                } else {
                    var101 = 0.02577303;
                }
            }
        } else {
            var101 = -0.080858506;
        }
    }
    double var102;
    if (inputs[17] < 6.9677625) {
        if (inputs[4] < 3.644769) {
            if (inputs[9] < 18.506268) {
                var102 = 0.041374587;
            } else {
                if (inputs[9] < 21.588202) {
                    if (inputs[10] < 1.505) {
                        var102 = -0.011644204;
                    } else {
                        var102 = -0.07603166;
                    }
                } else {
                    if (inputs[9] < 22.123726) {
                        var102 = 0.053419903;
                    } else {
                        if (inputs[6] < -55.599304) {
                            var102 = -0.03261792;
                        } else {
                            var102 = 0.0019169754;
                        }
                    }
                }
            }
        } else {
            var102 = -0.07710319;
        }
    } else {
        var102 = 0.0397188;
    }
    double var103;
    if (inputs[23] < -27.3) {
        if (inputs[14] < 0.88952416) {
            if (inputs[3] < 0.1593122) {
                var103 = 0.010384027;
            } else {
                var103 = 0.06683442;
            }
        } else {
            if (inputs[21] < 18.80265) {
                var103 = 0.055069618;
            } else {
                var103 = -0.047168866;
            }
        }
    } else {
        if (inputs[3] < -0.11280487) {
            if (inputs[3] < -0.27097872) {
                if (inputs[18] < -5.555) {
                    var103 = -0.05426444;
                } else {
                    if (inputs[1] < 63.736034) {
                        if (inputs[16] < -1.7947261) {
                            var103 = -0.001151266;
                        } else {
                            var103 = 0.044338297;
                        }
                    } else {
                        if (inputs[18] < 2.525) {
                            var103 = -0.046905454;
                        } else {
                            var103 = 0.008868822;
                        }
                    }
                }
            } else {
                var103 = 0.07482509;
            }
        } else {
            if (inputs[3] < 0.5072141) {
                if (inputs[3] < 0.1593122) {
                    var103 = -0.010490445;
                } else {
                    var103 = -0.065262206;
                }
            } else {
                if (inputs[23] < 17.25) {
                    if (inputs[10] < 1.735) {
                        if (inputs[10] < 0.655) {
                            var103 = 0.030132197;
                        } else {
                            var103 = -0.036247194;
                        }
                    } else {
                        if (inputs[11] < 0.0) {
                            var103 = -0.0059430846;
                        } else {
                            var103 = 0.091767095;
                        }
                    }
                } else {
                    var103 = -0.049832992;
                }
            }
        }
    }
    double var104;
    if (inputs[21] < 24.010128) {
        if (inputs[12] < -21.52) {
            var104 = 0.037798945;
        } else {
            if (inputs[8] < 2.4850543) {
                if (inputs[8] < 2.4561403) {
                    if (inputs[9] < 20.879713) {
                        var104 = -0.06292528;
                    } else {
                        if (inputs[9] < 34.646156) {
                            var104 = 0.017407937;
                        } else {
                            var104 = -0.039521955;
                        }
                    }
                } else {
                    var104 = -0.067170545;
                }
            } else {
                if (inputs[8] < 2.5004926) {
                    if (inputs[16] < -1.5368812) {
                        if (inputs[17] < -4.91453) {
                            var104 = 0.03252182;
                        } else {
                            var104 = -0.031462133;
                        }
                    } else {
                        if (inputs[8] < 2.496) {
                            var104 = 0.018435894;
                        } else {
                            var104 = 0.100404814;
                        }
                    }
                } else {
                    if (inputs[8] < 2.502439) {
                        var104 = -0.07214482;
                    } else {
                        if (inputs[24] < -25.979107) {
                            var104 = -0.027192015;
                        } else {
                            var104 = 0.009656349;
                        }
                    }
                }
            }
        }
    } else {
        var104 = 0.049583822;
    }
    double var105;
    if (inputs[16] < 5.5290422) {
        if (inputs[16] < -5.819462) {
            var105 = -0.038259894;
        } else {
            if (inputs[12] < -21.28) {
                var105 = 0.03774291;
            } else {
                if (inputs[10] < 0.7525) {
                    if (inputs[19] < 2.0) {
                        var105 = 0.04020603;
                    } else {
                        if (inputs[21] < 19.424759) {
                            var105 = -0.045328088;
                        } else {
                            var105 = -0.0014911456;
                        }
                    }
                } else {
                    if (inputs[8] < 2.5004926) {
                        if (inputs[8] < 2.495549) {
                            var105 = 0.0069248043;
                        } else {
                            var105 = 0.062281046;
                        }
                    } else {
                        if (inputs[9] < 38.94714) {
                            var105 = -0.016178193;
                        } else {
                            var105 = 0.037172016;
                        }
                    }
                }
            }
        }
    } else {
        var105 = -0.047016997;
    }
    double var106;
    if (inputs[14] < 0.5948336) {
        if (inputs[3] < -0.9081138) {
            var106 = 0.068129584;
        } else {
            if (inputs[21] < 19.98746) {
                var106 = -0.023545822;
            } else {
                var106 = 0.031415764;
            }
        }
    } else {
        if (inputs[7] < 27.162584) {
            if (inputs[10] < 1.31) {
                if (inputs[21] < 21.864962) {
                    if (inputs[3] < -0.27097872) {
                        if (inputs[10] < 0.425) {
                            var106 = 0.004912079;
                        } else {
                            var106 = -0.05569851;
                        }
                    } else {
                        if (inputs[18] < 2.835) {
                            var106 = 0.015636288;
                        } else {
                            var106 = -0.026854485;
                        }
                    }
                } else {
                    var106 = -0.07187135;
                }
            } else {
                if (inputs[2] < 1.6985714) {
                    if (inputs[15] < -2.5208724) {
                        var106 = -0.006671671;
                    } else {
                        if (inputs[20] < 12.0) {
                            var106 = 0.074586526;
                        } else {
                            var106 = 0.024902945;
                        }
                    }
                } else {
                    if (inputs[14] < 1.0516493) {
                        var106 = -0.046998464;
                    } else {
                        if (inputs[4] < 2.334938) {
                            var106 = -0.004135017;
                        } else {
                            var106 = 0.04144286;
                        }
                    }
                }
            }
        } else {
            var106 = -0.060270164;
        }
    }
    double var107;
    if (inputs[3] < 0.84939736) {
        if (inputs[1] < 60.820408) {
            if (inputs[1] < 27.044325) {
                if (inputs[3] < 0.00019193416) {
                    var107 = 0.04827513;
                } else {
                    var107 = -0.017182894;
                }
            } else {
                if (inputs[2] < 1.4878571) {
                    if (inputs[4] < -3.1190884) {
                        var107 = -0.024213608;
                    } else {
                        var107 = -0.094942294;
                    }
                } else {
                    if (inputs[24] < -35.06089) {
                        if (inputs[18] < -5.38) {
                            var107 = -0.022795364;
                        } else {
                            var107 = 0.051423635;
                        }
                    } else {
                        if (inputs[18] < -2.14) {
                            var107 = -0.0052794605;
                        } else {
                            var107 = -0.078178324;
                        }
                    }
                }
            }
        } else {
            if (inputs[9] < 24.696909) {
                if (inputs[17] < 4.196629) {
                    var107 = 0.06072287;
                } else {
                    var107 = 0.010452891;
                }
            } else {
                if (inputs[21] < 16.401161) {
                    var107 = 0.044522632;
                } else {
                    if (inputs[18] < 3.11) {
                        if (inputs[16] < 2.9834607) {
                            var107 = -0.008189034;
                        } else {
                            var107 = -0.08296328;
                        }
                    } else {
                        if (inputs[9] < 44.066177) {
                            var107 = -0.015211493;
                        } else {
                            var107 = 0.03947359;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[18] < 9.1) {
            if (inputs[14] < 0.80040574) {
                if (inputs[3] < 1.6624236) {
                    var107 = 0.06676826;
                } else {
                    var107 = 0.0086943945;
                }
            } else {
                if (inputs[24] < -25.234442) {
                    var107 = -0.016332395;
                } else {
                    var107 = 0.038139913;
                }
            }
        } else {
            var107 = -0.04401069;
        }
    }
    double var108;
    if (inputs[17] < 7.064094) {
        if (inputs[8] < 2.3296213) {
            if (inputs[17] < -2.3293035) {
                var108 = 0.012288196;
            } else {
                var108 = -0.07092852;
            }
        } else {
            if (inputs[10] < 0.195) {
                var108 = 0.050987676;
            } else {
                if (inputs[8] < 2.4176931) {
                    if (inputs[20] < 14.0) {
                        var108 = 0.05597722;
                    } else {
                        var108 = 0.004570618;
                    }
                } else {
                    if (inputs[18] < 14.13) {
                        if (inputs[21] < 17.015306) {
                            var108 = -0.027823271;
                        } else {
                            var108 = 0.0053433473;
                        }
                    } else {
                        var108 = -0.03978829;
                    }
                }
            }
        }
    } else {
        var108 = 0.041429304;
    }
    double var109;
    if (inputs[3] < 1.8565543) {
        if (inputs[12] < 11.64) {
            if (inputs[4] < 3.4954956) {
                if (inputs[24] < 55.650032) {
                    if (inputs[3] < 1.5817401) {
                        if (inputs[13] < -16.35) {
                            var109 = 0.027705694;
                        } else {
                            var109 = -0.006571417;
                        }
                    } else {
                        var109 = 0.05038511;
                    }
                } else {
                    var109 = 0.06019255;
                }
            } else {
                var109 = -0.04911409;
            }
        } else {
            if (inputs[20] < 18.0) {
                if (inputs[3] < -0.13150421) {
                    if (inputs[9] < 27.44026) {
                        var109 = -0.011368501;
                    } else {
                        if (inputs[21] < 20.003363) {
                            var109 = 0.024866046;
                        } else {
                            var109 = 0.07623442;
                        }
                    }
                } else {
                    var109 = -0.012351448;
                }
            } else {
                var109 = 0.070486926;
            }
        }
    } else {
        var109 = -0.04839857;
    }
    double var110;
    if (inputs[7] < -20.653982) {
        if (inputs[7] < -25.921698) {
            var110 = -0.022820035;
        } else {
            if (inputs[21] < 19.945456) {
                var110 = 0.08137958;
            } else {
                var110 = 0.02177758;
            }
        }
    } else {
        if (inputs[1] < 31.216616) {
            if (inputs[6] < -41.405205) {
                var110 = -0.012699476;
            } else {
                var110 = -0.08110159;
            }
        } else {
            if (inputs[12] < 4.745) {
                if (inputs[7] < -12.6547575) {
                    var110 = 0.051110204;
                } else {
                    if (inputs[10] < 3.525) {
                        if (inputs[19] < 3.0) {
                            var110 = 0.026366254;
                        } else {
                            var110 = -0.0047462326;
                        }
                    } else {
                        var110 = -0.03928265;
                    }
                }
            } else {
                if (inputs[12] < 11.485) {
                    if (inputs[2] < 1.6985714) {
                        var110 = -0.013876975;
                    } else {
                        var110 = -0.078659706;
                    }
                } else {
                    if (inputs[12] < 19.375) {
                        if (inputs[15] < 2.2436416) {
                            var110 = 0.000010404743;
                        } else {
                            var110 = 0.058285452;
                        }
                    } else {
                        var110 = -0.02523061;
                    }
                }
            }
        }
    }
    double var111;
    if (inputs[23] < -62.16) {
        var111 = -0.059304778;
    } else {
        if (inputs[13] < 17.04) {
            if (inputs[12] < -14.43) {
                if (inputs[9] < 30.197716) {
                    var111 = 0.011449231;
                } else {
                    var111 = 0.052621756;
                }
            } else {
                if (inputs[20] < 21.0) {
                    if (inputs[13] < -11.165) {
                        var111 = -0.0395242;
                    } else {
                        if (inputs[9] < 20.879713) {
                            var111 = -0.03183833;
                        } else {
                            var111 = 0.0074870572;
                        }
                    }
                } else {
                    var111 = -0.043954644;
                }
            }
        } else {
            if (inputs[21] < 20.688679) {
                var111 = 0.06520848;
            } else {
                var111 = -0.005147081;
            }
        }
    }
    double var112;
    if (inputs[16] < 6.134671) {
        if (inputs[13] < 17.885) {
            if (inputs[20] < 10.0) {
                if (inputs[20] < 5.0) {
                    if (inputs[7] < -8.610833) {
                        var112 = 0.041518588;
                    } else {
                        var112 = -0.026950603;
                    }
                } else {
                    if (inputs[19] < 3.0) {
                        var112 = -0.062319607;
                    } else {
                        var112 = -0.014797048;
                    }
                }
            } else {
                if (inputs[6] < -59.855896) {
                    var112 = -0.053109553;
                } else {
                    if (inputs[2] < 1.735) {
                        if (inputs[21] < 22.360289) {
                            var112 = 0.028996937;
                        } else {
                            var112 = -0.02819973;
                        }
                    } else {
                        if (inputs[2] < 2.732143) {
                            var112 = -0.016777018;
                        } else {
                            var112 = 0.022072937;
                        }
                    }
                }
            }
        } else {
            if (inputs[21] < 19.327007) {
                var112 = 0.060953375;
            } else {
                var112 = 0.023109248;
            }
        }
    } else {
        var112 = -0.039851367;
    }
    double var113;
    if (inputs[8] < 2.2323945) {
        var113 = 0.035830718;
    } else {
        if (inputs[14] < 0.75832444) {
            if (inputs[8] < 2.4860628) {
                if (inputs[10] < 0.8275) {
                    var113 = 0.06097068;
                } else {
                    var113 = 0.009953612;
                }
            } else {
                if (inputs[8] < 2.502439) {
                    if (inputs[17] < -1.9386458) {
                        var113 = -0.009653031;
                    } else {
                        var113 = -0.05487963;
                    }
                } else {
                    if (inputs[3] < -1.3822392) {
                        var113 = 0.058345214;
                    } else {
                        if (inputs[2] < 1.2278571) {
                            var113 = -0.027257608;
                        } else {
                            var113 = 0.05206295;
                        }
                    }
                }
            }
        } else {
            if (inputs[13] < 18.715) {
                if (inputs[2] < 2.6385715) {
                    if (inputs[21] < 19.781836) {
                        if (inputs[21] < 18.80265) {
                            var113 = -0.019894643;
                        } else {
                            var113 = -0.07787889;
                        }
                    } else {
                        if (inputs[1] < 68.180214) {
                            var113 = 0.008309211;
                        } else {
                            var113 = -0.045060955;
                        }
                    }
                } else {
                    if (inputs[8] < 2.5062892) {
                        if (inputs[2] < 2.9728572) {
                            var113 = 0.06696988;
                        } else {
                            var113 = 0.013244276;
                        }
                    } else {
                        var113 = -0.030256914;
                    }
                }
            } else {
                var113 = 0.039249036;
            }
        }
    }
    double var114;
    if (inputs[8] < 2.654348) {
        if (inputs[14] < 0.588969) {
            if (inputs[7] < 16.323164) {
                var114 = 0.011237882;
            } else {
                var114 = 0.055256397;
            }
        } else {
            if (inputs[21] < 22.451406) {
                if (inputs[10] < 0.2475) {
                    var114 = 0.041330777;
                } else {
                    if (inputs[7] < 22.278522) {
                        if (inputs[21] < 17.126886) {
                            var114 = -0.035218865;
                        } else {
                            var114 = 0.0029827633;
                        }
                    } else {
                        var114 = -0.047658432;
                    }
                }
            } else {
                if (inputs[9] < 30.375093) {
                    var114 = -0.0067683603;
                } else {
                    var114 = -0.07832181;
                }
            }
        }
    } else {
        if (inputs[20] < 12.0) {
            var114 = 0.05864487;
        } else {
            var114 = -0.00023721893;
        }
    }
    double var115;
    if (inputs[16] < 6.134671) {
        if (inputs[7] < 19.300243) {
            if (inputs[9] < 52.06376) {
                if (inputs[7] < -18.971659) {
                    if (inputs[7] < -24.679111) {
                        var115 = -0.014155015;
                    } else {
                        if (inputs[16] < -4.90678) {
                            var115 = 0.07871884;
                        } else {
                            var115 = 0.010651182;
                        }
                    }
                } else {
                    if (inputs[7] < -16.179045) {
                        var115 = -0.044696968;
                    } else {
                        if (inputs[10] < 1.4825) {
                            var115 = 0.012314709;
                        } else {
                            var115 = -0.014490647;
                        }
                    }
                }
            } else {
                var115 = -0.045556933;
            }
        } else {
            if (inputs[12] < 6.655) {
                if (inputs[10] < 1.505) {
                    var115 = 0.010026202;
                } else {
                    var115 = 0.07893522;
                }
            } else {
                var115 = -0.02568665;
            }
        }
    } else {
        var115 = -0.04670016;
    }
    double var116;
    if (inputs[17] < -5.394068) {
        if (inputs[6] < -19.89891) {
            var116 = -0.00094901456;
        } else {
            var116 = 0.062233917;
        }
    } else {
        if (inputs[23] < -37.68) {
            if (inputs[16] < -3.0618532) {
                var116 = -0.06571848;
            } else {
                var116 = -0.0046964446;
            }
        } else {
            if (inputs[7] < -21.323767) {
                var116 = 0.03365388;
            } else {
                if (inputs[2] < 1.2657143) {
                    if (inputs[6] < -50.30599) {
                        var116 = 0.028592546;
                    } else {
                        if (inputs[17] < 3.5044699) {
                            var116 = -0.083536044;
                        } else {
                            var116 = -0.018109685;
                        }
                    }
                } else {
                    if (inputs[14] < 0.9453626) {
                        if (inputs[21] < 18.391182) {
                            var116 = -0.0012167334;
                        } else {
                            var116 = 0.038821153;
                        }
                    } else {
                        if (inputs[9] < 38.94714) {
                            var116 = -0.015395476;
                        } else {
                            var116 = 0.03161585;
                        }
                    }
                }
            }
        }
    }
    double var117;
    if (inputs[17] < 7.9225073) {
        if (inputs[16] < 5.62066) {
            if (inputs[18] < 12.945) {
                if (inputs[12] < 16.13) {
                    if (inputs[24] < -47.42504) {
                        if (inputs[9] < 44.681404) {
                            var117 = -0.030097205;
                        } else {
                            var117 = 0.02522426;
                        }
                    } else {
                        if (inputs[9] < 42.81248) {
                            var117 = 0.011438797;
                        } else {
                            var117 = -0.036439788;
                        }
                    }
                } else {
                    var117 = 0.046806328;
                }
            } else {
                if (inputs[8] < 2.4585493) {
                    var117 = 0.0076870522;
                } else {
                    var117 = -0.049215868;
                }
            }
        } else {
            var117 = -0.055766445;
        }
    } else {
        var117 = 0.0399645;
    }
    double var118;
    if (inputs[1] < 26.495476) {
        if (inputs[3] < 0.5199615) {
            var118 = 0.06441444;
        } else {
            var118 = 0.0039639203;
        }
    } else {
        if (inputs[16] < 5.5290422) {
            if (inputs[2] < 1.5721428) {
                if (inputs[9] < 29.282501) {
                    if (inputs[9] < 27.548391) {
                        if (inputs[20] < 12.0) {
                            var118 = 0.03885045;
                        } else {
                            var118 = -0.016765986;
                        }
                    } else {
                        var118 = 0.07609387;
                    }
                } else {
                    if (inputs[12] < 8.405) {
                        if (inputs[10] < 1.1225) {
                            var118 = -0.027950218;
                        } else {
                            var118 = 0.034915153;
                        }
                    } else {
                        var118 = -0.05577852;
                    }
                }
            } else {
                if (inputs[14] < 1.0516493) {
                    if (inputs[17] < 1.384713) {
                        if (inputs[17] < -1.8398358) {
                            var118 = -0.06027991;
                        } else {
                            var118 = 0.03373442;
                        }
                    } else {
                        var118 = -0.068345286;
                    }
                } else {
                    if (inputs[14] < 1.0888963) {
                        var118 = 0.046525724;
                    } else {
                        if (inputs[14] < 1.2116929) {
                            var118 = -0.060314555;
                        } else {
                            var118 = 0.006115076;
                        }
                    }
                }
            }
        } else {
            if (inputs[13] < 7.715) {
                var118 = -0.05508561;
            } else {
                var118 = -0.01906988;
            }
        }
    }
    double var119;
    if (inputs[8] < 2.460452) {
        if (inputs[20] < 9.0) {
            var119 = -0.03300013;
        } else {
            if (inputs[14] < 1.5110586) {
                if (inputs[19] < 3.0) {
                    if (inputs[18] < -0.72) {
                        var119 = 0.008500764;
                    } else {
                        if (inputs[24] < 25.790947) {
                            var119 = 0.08238384;
                        } else {
                            var119 = 0.03716551;
                        }
                    }
                } else {
                    if (inputs[21] < 20.074284) {
                        var119 = 0.03409133;
                    } else {
                        var119 = -0.01907619;
                    }
                }
            } else {
                var119 = -0.022444978;
            }
        }
    } else {
        if (inputs[9] < 22.63069) {
            if (inputs[10] < 1.4975) {
                var119 = 0.048833746;
            } else {
                var119 = -0.0073492005;
            }
        } else {
            if (inputs[8] < 2.4850543) {
                var119 = -0.072026655;
            } else {
                if (inputs[9] < 34.246445) {
                    if (inputs[8] < 2.654348) {
                        if (inputs[3] < 0.535828) {
                            var119 = -0.05215239;
                        } else {
                            var119 = -0.0085337665;
                        }
                    } else {
                        var119 = 0.023784349;
                    }
                } else {
                    if (inputs[7] < -23.786545) {
                        var119 = -0.040456027;
                    } else {
                        if (inputs[10] < 2.01) {
                            var119 = 0.0033848977;
                        } else {
                            var119 = 0.042872403;
                        }
                    }
                }
            }
        }
    }
    double var120;
    if (inputs[10] < 3.13) {
        if (inputs[8] < 2.6027713) {
            if (inputs[9] < 54.98018) {
                if (inputs[9] < 39.93322) {
                    if (inputs[15] < 2.9534643) {
                        if (inputs[13] < 3.865) {
                            var120 = 0.011044505;
                        } else {
                            var120 = -0.030891595;
                        }
                    } else {
                        var120 = 0.07422348;
                    }
                } else {
                    if (inputs[21] < 19.692392) {
                        var120 = -0.081344925;
                    } else {
                        var120 = -0.012165879;
                    }
                }
            } else {
                var120 = 0.04089373;
            }
        } else {
            if (inputs[3] < -0.22793856) {
                var120 = 0.0037281602;
            } else {
                var120 = -0.072802946;
            }
        }
    } else {
        if (inputs[14] < 0.97779757) {
            if (inputs[8] < 2.4992125) {
                var120 = 0.07559137;
            } else {
                var120 = 0.0044415654;
            }
        } else {
            if (inputs[8] < 2.50028) {
                var120 = -0.040352445;
            } else {
                var120 = 0.03488727;
            }
        }
    }
    double var121;
    if (inputs[13] < -16.35) {
        if (inputs[21] < 21.111582) {
            if (inputs[21] < 18.090633) {
                var121 = 0.010069187;
            } else {
                var121 = 0.060068548;
            }
        } else {
            var121 = -0.014020793;
        }
    } else {
        if (inputs[13] < -11.84) {
            var121 = -0.040942065;
        } else {
            if (inputs[16] < -4.758772) {
                if (inputs[20] < 14.0) {
                    var121 = -0.06734246;
                } else {
                    var121 = 0.011964877;
                }
            } else {
                if (inputs[8] < 2.3338983) {
                    if (inputs[16] < -2.3130887) {
                        var121 = 0.016225087;
                    } else {
                        var121 = -0.0684249;
                    }
                } else {
                    if (inputs[23] < 52.365) {
                        if (inputs[23] < 34.92) {
                            var121 = 0.008356108;
                        } else {
                            var121 = 0.06534335;
                        }
                    } else {
                        var121 = -0.033635337;
                    }
                }
            }
        }
    }
    double var122;
    if (inputs[16] < -3.9608386) {
        if (inputs[1] < 29.539452) {
            if (inputs[19] < 3.0) {
                var122 = -0.041709896;
            } else {
                if (inputs[21] < 19.185604) {
                    var122 = -0.008252131;
                } else {
                    var122 = 0.03470646;
                }
            }
        } else {
            var122 = -0.052914802;
        }
    } else {
        if (inputs[10] < 2.2675) {
            if (inputs[10] < 1.8325) {
                if (inputs[8] < 2.3928058) {
                    if (inputs[8] < 2.3296213) {
                        var122 = -0.0043694237;
                    } else {
                        var122 = 0.061943024;
                    }
                } else {
                    if (inputs[6] < 14.126063) {
                        if (inputs[19] < 2.0) {
                            var122 = 0.035584558;
                        } else {
                            var122 = -0.020107513;
                        }
                    } else {
                        var122 = 0.04973497;
                    }
                }
            } else {
                var122 = -0.03958158;
            }
        } else {
            if (inputs[1] < 35.795807) {
                var122 = 0.058030665;
            } else {
                if (inputs[8] < 2.5004926) {
                    if (inputs[3] < 0.19802953) {
                        var122 = 0.056345854;
                    } else {
                        var122 = 0.0036045166;
                    }
                } else {
                    if (inputs[18] < 7.24) {
                        var122 = -0.04935337;
                    } else {
                        var122 = 0.028727576;
                    }
                }
            }
        }
    }
    double var123;
    if (inputs[14] < 1.8754882) {
        if (inputs[17] < -3.210673) {
            if (inputs[2] < 1.435) {
                if (inputs[19] < 3.0) {
                    var123 = -0.016243726;
                } else {
                    if (inputs[7] < -20.471956) {
                        var123 = 0.06747319;
                    } else {
                        var123 = 0.00094444246;
                    }
                }
            } else {
                if (inputs[13] < -5.82) {
                    var123 = -0.008590515;
                } else {
                    var123 = -0.074231945;
                }
            }
        } else {
            if (inputs[2] < 0.9892857) {
                var123 = -0.027700601;
            } else {
                if (inputs[7] < 23.387367) {
                    if (inputs[21] < 21.790148) {
                        if (inputs[12] < 11.485) {
                            var123 = -0.0034735508;
                        } else {
                            var123 = 0.029753342;
                        }
                    } else {
                        if (inputs[16] < 1.9395342) {
                            var123 = 0.063441105;
                        } else {
                            var123 = 0.021643968;
                        }
                    }
                } else {
                    if (inputs[7] < 26.124598) {
                        var123 = 0.06183124;
                    } else {
                        var123 = 0.020032553;
                    }
                }
            }
        }
    } else {
        var123 = -0.04304454;
    }
    double var124;
    if (inputs[3] < -1.9224318) {
        var124 = -0.053683255;
    } else {
        if (inputs[23] < -60.33) {
            var124 = -0.041589342;
        } else {
            if (inputs[8] < 2.460452) {
                if (inputs[2] < 1.5157143) {
                    if (inputs[14] < 0.6845886) {
                        var124 = 0.019070951;
                    } else {
                        if (inputs[21] < 19.616495) {
                            var124 = 0.041985415;
                        } else {
                            var124 = 0.08142598;
                        }
                    }
                } else {
                    if (inputs[6] < -25.815626) {
                        var124 = -0.05956434;
                    } else {
                        if (inputs[3] < -0.27667353) {
                            var124 = 0.05751594;
                        } else {
                            var124 = -0.015667746;
                        }
                    }
                }
            } else {
                if (inputs[8] < 2.4850543) {
                    var124 = -0.04234542;
                } else {
                    if (inputs[18] < 17.42) {
                        if (inputs[13] < 12.035) {
                            var124 = 0.0006782584;
                        } else {
                            var124 = 0.03793492;
                        }
                    } else {
                        var124 = -0.04061942;
                    }
                }
            }
        }
    }
    double var125;
    if (inputs[9] < 27.667595) {
        if (inputs[9] < 26.452703) {
            if (inputs[13] < 2.045) {
                if (inputs[3] < -0.16443706) {
                    var125 = -0.017833367;
                } else {
                    if (inputs[7] < -7.1595545) {
                        var125 = -0.0061388207;
                    } else {
                        var125 = 0.051219624;
                    }
                }
            } else {
                if (inputs[16] < 3.2650025) {
                    if (inputs[9] < 21.883224) {
                        var125 = -0.0217775;
                    } else {
                        var125 = -0.06874161;
                    }
                } else {
                    var125 = 0.0107019795;
                }
            }
        } else {
            var125 = -0.0674686;
        }
    } else {
        if (inputs[13] < -7.38) {
            if (inputs[8] < 2.4878378) {
                var125 = 0.056018252;
            } else {
                if (inputs[2] < 1.4335715) {
                    var125 = -0.0155712;
                } else {
                    var125 = 0.030476255;
                }
            }
        } else {
            if (inputs[10] < 3.58) {
                if (inputs[14] < 0.73148984) {
                    if (inputs[16] < -1.9178363) {
                        var125 = -0.018072985;
                    } else {
                        if (inputs[2] < 1.1535715) {
                            var125 = 0.006234711;
                        } else {
                            var125 = 0.072825335;
                        }
                    }
                } else {
                    if (inputs[21] < 20.792809) {
                        if (inputs[9] < 35.83771) {
                            var125 = -0.0661663;
                        } else {
                            var125 = -0.0055346224;
                        }
                    } else {
                        var125 = 0.019368643;
                    }
                }
            } else {
                var125 = 0.04193407;
            }
        }
    }
    double var126;
    if (inputs[12] < -14.43) {
        if (inputs[18] < -21.18) {
            var126 = -0.016750272;
        } else {
            if (inputs[3] < 0.6473339) {
                var126 = 0.0085021965;
            } else {
                var126 = 0.04817134;
            }
        }
    } else {
        if (inputs[12] < -7.145) {
            if (inputs[23] < -25.68) {
                var126 = 0.00017576177;
            } else {
                if (inputs[7] < -2.8651555) {
                    var126 = -0.09068105;
                } else {
                    var126 = -0.023594761;
                }
            }
        } else {
            if (inputs[23] < 27.12) {
                if (inputs[23] < 17.25) {
                    if (inputs[9] < 23.660772) {
                        if (inputs[14] < 1.1276487) {
                            var126 = 0.0023818472;
                        } else {
                            var126 = 0.055318657;
                        }
                    } else {
                        if (inputs[6] < 1.182681) {
                            var126 = -0.009500408;
                        } else {
                            var126 = -0.05242478;
                        }
                    }
                } else {
                    var126 = -0.058896806;
                }
            } else {
                if (inputs[23] < 41.37) {
                    var126 = 0.060040317;
                } else {
                    if (inputs[17] < 6.447005) {
                        var126 = -0.044555113;
                    } else {
                        var126 = 0.046483606;
                    }
                }
            }
        }
    }
    double var127;
    if (inputs[17] < 6.9677625) {
        if (inputs[1] < 36.89342) {
            if (inputs[20] < 17.0) {
                if (inputs[1] < 31.394823) {
                    if (inputs[1] < 26.495476) {
                        if (inputs[15] < -2.9173968) {
                            var127 = -0.023442466;
                        } else {
                            var127 = 0.03719227;
                        }
                    } else {
                        if (inputs[14] < 0.8117286) {
                            var127 = -0.07882725;
                        } else {
                            var127 = 0.0129324235;
                        }
                    }
                } else {
                    if (inputs[12] < -4.85) {
                        var127 = -0.0036467712;
                    } else {
                        var127 = 0.048301708;
                    }
                }
            } else {
                if (inputs[10] < 2.3525) {
                    var127 = 0.016432788;
                } else {
                    var127 = 0.078284636;
                }
            }
        } else {
            if (inputs[16] < -1.3890125) {
                var127 = -0.060564358;
            } else {
                if (inputs[3] < 1.3632554) {
                    if (inputs[16] < 5.220605) {
                        if (inputs[14] < 0.73342574) {
                            var127 = 0.032226622;
                        } else {
                            var127 = -0.005002064;
                        }
                    } else {
                        var127 = -0.039863314;
                    }
                } else {
                    var127 = -0.053889144;
                }
            }
        }
    } else {
        var127 = 0.04045916;
    }
    double var128;
    if (inputs[9] < 48.757206) {
        if (inputs[20] < 14.0) {
            if (inputs[8] < 2.6966667) {
                if (inputs[3] < 0.8231325) {
                    if (inputs[17] < -3.4356437) {
                        var128 = -0.0473279;
                    } else {
                        if (inputs[1] < 34.28709) {
                            var128 = 0.042395633;
                        } else {
                            var128 = 0.000006419456;
                        }
                    }
                } else {
                    if (inputs[10] < 1.4125) {
                        var128 = 0.017796261;
                    } else {
                        var128 = 0.0612763;
                    }
                }
            } else {
                var128 = 0.06366322;
            }
        } else {
            if (inputs[1] < 69.24428) {
                if (inputs[24] < 46.0802) {
                    if (inputs[6] < -36.24363) {
                        var128 = -0.037013814;
                    } else {
                        if (inputs[6] < -30.142841) {
                            var128 = 0.047371034;
                        } else {
                            var128 = -0.0054177255;
                        }
                    }
                } else {
                    var128 = 0.055338368;
                }
            } else {
                var128 = -0.05156927;
            }
        }
    } else {
        if (inputs[20] < 14.0) {
            var128 = -0.07656202;
        } else {
            var128 = 0.016970243;
        }
    }
    double var129;
    if (inputs[9] < 19.683298) {
        if (inputs[19] < 3.0) {
            var129 = 0.0570483;
        } else {
            var129 = 0.005157433;
        }
    } else {
        if (inputs[2] < 1.53) {
            if (inputs[6] < -50.573925) {
                if (inputs[23] < 4.995) {
                    var129 = -0.020220721;
                } else {
                    var129 = 0.04978106;
                }
            } else {
                if (inputs[1] < 26.023777) {
                    var129 = 0.026123622;
                } else {
                    if (inputs[10] < 2.2625) {
                        if (inputs[13] < 8.965) {
                            var129 = -0.062370364;
                        } else {
                            var129 = 0.0095221065;
                        }
                    } else {
                        var129 = -0.0046215225;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.21) {
                if (inputs[6] < -13.268932) {
                    var129 = -0.0067911847;
                } else {
                    if (inputs[20] < 16.0) {
                        var129 = 0.083741404;
                    } else {
                        var129 = 0.022122392;
                    }
                }
            } else {
                if (inputs[6] < 0.3177864) {
                    if (inputs[10] < 1.7025) {
                        var129 = -0.054706898;
                    } else {
                        if (inputs[21] < 18.741793) {
                            var129 = 0.03628357;
                        } else {
                            var129 = -0.008087213;
                        }
                    }
                } else {
                    var129 = -0.053781636;
                }
            }
        }
    }
    double var130;
    if (inputs[6] < -35.493023) {
        if (inputs[3] < 1.5549939) {
            if (inputs[2] < 1.4957143) {
                if (inputs[8] < 2.460452) {
                    var130 = 0.026088139;
                } else {
                    if (inputs[14] < 0.6691673) {
                        var130 = -0.07357607;
                    } else {
                        var130 = -0.01118705;
                    }
                }
            } else {
                var130 = -0.08550036;
            }
        } else {
            var130 = 0.014027404;
        }
    } else {
        if (inputs[13] < -16.88) {
            var130 = 0.04642291;
        } else {
            if (inputs[6] < -31.441412) {
                var130 = 0.052210756;
            } else {
                if (inputs[7] < -21.323767) {
                    if (inputs[8] < 2.4322581) {
                        var130 = 0.07179239;
                    } else {
                        var130 = -0.0041699344;
                    }
                } else {
                    if (inputs[10] < 2.3825) {
                        if (inputs[10] < 1.81) {
                            var130 = -0.009167705;
                        } else {
                            var130 = -0.06374204;
                        }
                    } else {
                        if (inputs[16] < 3.2650025) {
                            var130 = -0.0059508807;
                        } else {
                            var130 = 0.04204073;
                        }
                    }
                }
            }
        }
    }
    double var131;
    if (inputs[10] < 2.2675) {
        if (inputs[17] < -5.394068) {
            var131 = 0.03833849;
        } else {
            if (inputs[6] < -32.103245) {
                if (inputs[9] < 35.295513) {
                    if (inputs[10] < 0.755) {
                        var131 = -0.002315669;
                    } else {
                        var131 = 0.055703934;
                    }
                } else {
                    var131 = -0.038294874;
                }
            } else {
                if (inputs[7] < -23.214403) {
                    var131 = 0.031248726;
                } else {
                    if (inputs[17] < 1.8754717) {
                        if (inputs[10] < 0.4625) {
                            var131 = -0.0009872093;
                        } else {
                            var131 = -0.06342561;
                        }
                    } else {
                        if (inputs[17] < 2.6598606) {
                            var131 = 0.048113257;
                        } else {
                            var131 = -0.020348782;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[18] < 4.115) {
            if (inputs[4] < 1.943829) {
                if (inputs[1] < 35.795807) {
                    if (inputs[1] < 32.503735) {
                        var131 = 0.0050437427;
                    } else {
                        var131 = 0.06337286;
                    }
                } else {
                    var131 = -0.01916586;
                }
            } else {
                var131 = 0.06288333;
            }
        } else {
            if (inputs[8] < 2.5093834) {
                var131 = -0.051989235;
            } else {
                var131 = 0.037531078;
            }
        }
    }
    double var132;
    if (inputs[9] < 34.646156) {
        if (inputs[8] < 2.3726027) {
            if (inputs[9] < 28.278357) {
                var132 = -0.0045717056;
            } else {
                var132 = 0.06641308;
            }
        } else {
            if (inputs[9] < 29.282501) {
                if (inputs[2] < 1.1892858) {
                    var132 = 0.040957507;
                } else {
                    if (inputs[11] < 1.0) {
                        if (inputs[15] < -1.7221996) {
                            var132 = -0.02964756;
                        } else {
                            var132 = 0.03178976;
                        }
                    } else {
                        if (inputs[20] < 13.0) {
                            var132 = 0.014819946;
                        } else {
                            var132 = -0.05472163;
                        }
                    }
                }
            } else {
                if (inputs[2] < 1.5064286) {
                    var132 = -0.053759646;
                } else {
                    if (inputs[21] < 19.24022) {
                        var132 = -0.027896984;
                    } else {
                        var132 = 0.0290014;
                    }
                }
            }
        }
    } else {
        if (inputs[8] < 2.4487178) {
            var132 = -0.018208664;
        } else {
            if (inputs[3] < -0.75934255) {
                if (inputs[2] < 1.3421428) {
                    var132 = 0.024808869;
                } else {
                    var132 = 0.07384013;
                }
            } else {
                if (inputs[12] < -4.85) {
                    var132 = -0.013262854;
                } else {
                    if (inputs[12] < 4.46) {
                        var132 = 0.0510547;
                    } else {
                        var132 = -0.01143038;
                    }
                }
            }
        }
    }
    double var133;
    if (inputs[23] < 52.365) {
        if (inputs[14] < 0.6929307) {
            if (inputs[9] < 26.546764) {
                var133 = -0.011978858;
            } else {
                if (inputs[1] < 33.258396) {
                    var133 = 0.003275479;
                } else {
                    if (inputs[2] < 1.0278572) {
                        var133 = 0.023570077;
                    } else {
                        var133 = 0.06799302;
                    }
                }
            }
        } else {
            if (inputs[3] < 0.10010364) {
                if (inputs[6] < 0.0) {
                    if (inputs[3] < -1.2690969) {
                        var133 = -0.0150675075;
                    } else {
                        if (inputs[23] < 8.58) {
                            var133 = 0.025315389;
                        } else {
                            var133 = 0.06518867;
                        }
                    }
                } else {
                    if (inputs[10] < 1.78) {
                        if (inputs[24] < 22.995955) {
                            var133 = -0.006807197;
                        } else {
                            var133 = 0.021641633;
                        }
                    } else {
                        var133 = -0.049440853;
                    }
                }
            } else {
                if (inputs[4] < 2.6114955) {
                    if (inputs[16] < -3.1990533) {
                        if (inputs[16] < -4.6686416) {
                            var133 = 0.014573079;
                        } else {
                            var133 = -0.064534746;
                        }
                    } else {
                        if (inputs[15] < -1.5846363) {
                            var133 = 0.05673052;
                        } else {
                            var133 = -0.017838866;
                        }
                    }
                } else {
                    var133 = -0.061024442;
                }
            }
        }
    } else {
        var133 = -0.052985284;
    }
    double var134;
    if (inputs[1] < 22.409466) {
        var134 = -0.042132925;
    } else {
        if (inputs[2] < 1.2635714) {
            if (inputs[10] < 0.8075) {
                if (inputs[10] < 0.5125) {
                    var134 = -0.014261461;
                } else {
                    var134 = 0.049795777;
                }
            } else {
                if (inputs[2] < 0.96428573) {
                    var134 = 0.010854353;
                } else {
                    if (inputs[19] < 3.0) {
                        var134 = -0.07229202;
                    } else {
                        var134 = -0.008756082;
                    }
                }
            }
        } else {
            if (inputs[9] < 55.74809) {
                if (inputs[14] < 0.87582004) {
                    if (inputs[21] < 18.425285) {
                        if (inputs[9] < 30.822323) {
                            var134 = -0.029279092;
                        } else {
                            var134 = 0.030848246;
                        }
                    } else {
                        if (inputs[20] < 13.0) {
                            var134 = 0.021373447;
                        } else {
                            var134 = 0.07210256;
                        }
                    }
                } else {
                    if (inputs[10] < 2.2625) {
                        if (inputs[2] < 1.9007143) {
                            var134 = -0.041786507;
                        } else {
                            var134 = -0.0016364934;
                        }
                    } else {
                        if (inputs[14] < 1.3339728) {
                            var134 = 0.037746668;
                        } else {
                            var134 = -0.0044728057;
                        }
                    }
                }
            } else {
                var134 = 0.05570266;
            }
        }
    }
    double var135;
    if (inputs[14] < 1.8754882) {
        if (inputs[17] < 4.8139157) {
            if (inputs[23] < 25.83) {
                if (inputs[10] < 0.7525) {
                    if (inputs[7] < -19.664974) {
                        var135 = 0.022148464;
                    } else {
                        if (inputs[20] < 11.0) {
                            var135 = 0.0032248457;
                        } else {
                            var135 = -0.055778984;
                        }
                    }
                } else {
                    if (inputs[14] < 1.009293) {
                        if (inputs[8] < 2.536817) {
                            var135 = 0.035608944;
                        } else {
                            var135 = -0.0050304965;
                        }
                    } else {
                        if (inputs[10] < 1.5175) {
                            var135 = 0.0334222;
                        } else {
                            var135 = -0.017173465;
                        }
                    }
                }
            } else {
                if (inputs[14] < 1.102963) {
                    var135 = -0.059686616;
                } else {
                    var135 = -0.004431508;
                }
            }
        } else {
            if (inputs[16] < 5.5290422) {
                var135 = 0.04856719;
            } else {
                var135 = -0.0043181195;
            }
        }
    } else {
        var135 = -0.057670325;
    }
    double var136;
    if (inputs[13] < -12.83) {
        if (inputs[24] < -38.34907) {
            var136 = -0.009066354;
        } else {
            if (inputs[3] < 0.052936934) {
                var136 = -0.014594891;
            } else {
                var136 = 0.062423896;
            }
        }
    } else {
        if (inputs[3] < 0.19802953) {
            if (inputs[19] < 4.0) {
                if (inputs[19] < 3.0) {
                    if (inputs[3] < -0.17853628) {
                        if (inputs[21] < 19.216185) {
                            var136 = -0.039469875;
                        } else {
                            var136 = 0.013124885;
                        }
                    } else {
                        var136 = 0.0376305;
                    }
                } else {
                    if (inputs[21] < 18.143412) {
                        var136 = 0.0750003;
                    } else {
                        if (inputs[21] < 20.730059) {
                            var136 = -0.014888698;
                        } else {
                            var136 = 0.04438265;
                        }
                    }
                }
            } else {
                var136 = -0.023645768;
            }
        } else {
            if (inputs[10] < 2.2625) {
                if (inputs[10] < 1.33) {
                    if (inputs[6] < -34.82493) {
                        var136 = 0.027653612;
                    } else {
                        if (inputs[16] < -2.5300546) {
                            var136 = -0.06286827;
                        } else {
                            var136 = -0.01556214;
                        }
                    }
                } else {
                    var136 = -0.071139984;
                }
            } else {
                var136 = 0.012239591;
            }
        }
    }
    double var137;
    if (inputs[6] < -59.855896) {
        var137 = -0.03751842;
    } else {
        if (inputs[10] < 0.3675) {
            if (inputs[3] < 0.73104346) {
                if (inputs[21] < 19.411325) {
                    var137 = -0.022436762;
                } else {
                    var137 = 0.026228484;
                }
            } else {
                var137 = 0.0740672;
            }
        } else {
            if (inputs[10] < 0.525) {
                var137 = -0.04311946;
            } else {
                if (inputs[10] < 0.8275) {
                    if (inputs[2] < 1.2764286) {
                        var137 = 0.06833069;
                    } else {
                        var137 = 0.0023276801;
                    }
                } else {
                    if (inputs[10] < 1.59) {
                        if (inputs[8] < 2.4444444) {
                            var137 = -0.06734358;
                        } else {
                            var137 = -0.009754745;
                        }
                    } else {
                        if (inputs[10] < 4.9475) {
                            var137 = 0.014385707;
                        } else {
                            var137 = -0.026470942;
                        }
                    }
                }
            }
        }
    }
    double var138;
    if (inputs[3] < -1.1115547) {
        if (inputs[17] < 4.7519083) {
            if (inputs[17] < 2.122406) {
                var138 = 0.026517054;
            } else {
                var138 = -0.028498277;
            }
        } else {
            var138 = 0.061223462;
        }
    } else {
        if (inputs[18] < 16.505) {
            if (inputs[14] < 0.99066293) {
                if (inputs[21] < 16.864527) {
                    var138 = -0.02345298;
                } else {
                    if (inputs[2] < 1.2185714) {
                        if (inputs[2] < 0.96428573) {
                            var138 = 0.036967594;
                        } else {
                            var138 = -0.020357825;
                        }
                    } else {
                        if (inputs[23] < -30.36) {
                            var138 = -0.003947697;
                        } else {
                            var138 = 0.036699373;
                        }
                    }
                }
            } else {
                if (inputs[17] < -2.295612) {
                    if (inputs[12] < -11.95) {
                        var138 = -0.0033233564;
                    } else {
                        var138 = -0.07489001;
                    }
                } else {
                    if (inputs[7] < 5.2455683) {
                        var138 = 0.040253602;
                    } else {
                        if (inputs[18] < 1.285) {
                            var138 = -0.05925642;
                        } else {
                            var138 = 0.01568421;
                        }
                    }
                }
            }
        } else {
            var138 = -0.0385821;
        }
    }
    double var139;
    if (inputs[6] < -55.599304) {
        if (inputs[23] < -8.43) {
            var139 = -0.058233663;
        } else {
            var139 = 0.0033408548;
        }
    } else {
        if (inputs[6] < -50.30599) {
            var139 = 0.053344034;
        } else {
            if (inputs[1] < 68.044624) {
                if (inputs[24] < 48.717697) {
                    if (inputs[2] < 1.12) {
                        var139 = 0.054729074;
                    } else {
                        if (inputs[17] < -5.217149) {
                            var139 = -0.038799807;
                        } else {
                            var139 = 0.0031702581;
                        }
                    }
                } else {
                    var139 = 0.04320163;
                }
            } else {
                if (inputs[21] < 21.689503) {
                    if (inputs[17] < 3.5044699) {
                        var139 = -0.04169214;
                    } else {
                        if (inputs[24] < 48.12682) {
                            var139 = 0.045922738;
                        } else {
                            var139 = -0.012091367;
                        }
                    }
                } else {
                    var139 = -0.059179127;
                }
            }
        }
    }
    double var140;
    if (inputs[6] < 0.3177864) {
        if (inputs[17] < -3.8382225) {
            if (inputs[3] < 0.9618968) {
                if (inputs[3] < 0.28880712) {
                    var140 = 0.027633153;
                } else {
                    var140 = -0.020737061;
                }
            } else {
                if (inputs[17] < -5.3619866) {
                    var140 = 0.017430289;
                } else {
                    var140 = 0.07531433;
                }
            }
        } else {
            if (inputs[1] < 61.282856) {
                if (inputs[24] < -56.50228) {
                    var140 = 0.03352661;
                } else {
                    if (inputs[20] < 16.0) {
                        if (inputs[12] < -9.605) {
                            var140 = 0.005515347;
                        } else {
                            var140 = -0.062413327;
                        }
                    } else {
                        if (inputs[4] < -1.9237132) {
                            var140 = 0.03603979;
                        } else {
                            var140 = -0.033429276;
                        }
                    }
                }
            } else {
                if (inputs[1] < 68.044624) {
                    if (inputs[20] < 15.0) {
                        var140 = 0.005570473;
                    } else {
                        if (inputs[6] < -16.327755) {
                            var140 = 0.022289637;
                        } else {
                            var140 = 0.06559875;
                        }
                    }
                } else {
                    if (inputs[24] < 68.10501) {
                        if (inputs[20] < 14.0) {
                            var140 = 0.0049705165;
                        } else {
                            var140 = -0.048385426;
                        }
                    } else {
                        var140 = 0.034588628;
                    }
                }
            }
        }
    } else {
        if (inputs[9] < 29.872112) {
            if (inputs[6] < 14.560352) {
                var140 = -0.020677296;
            } else {
                var140 = -0.067516424;
            }
        } else {
            var140 = 0.012101976;
        }
    }
    double var141;
    if (inputs[10] < 0.19) {
        var141 = 0.03437445;
    } else {
        if (inputs[3] < 0.106602594) {
            if (inputs[9] < 40.926243) {
                if (inputs[3] < -0.17853628) {
                    if (inputs[9] < 28.453474) {
                        if (inputs[6] < -21.316923) {
                            var141 = 0.016917167;
                        } else {
                            var141 = -0.029652784;
                        }
                    } else {
                        if (inputs[21] < 18.182224) {
                            var141 = 0.06096737;
                        } else {
                            var141 = 0.0021648228;
                        }
                    }
                } else {
                    var141 = 0.047340356;
                }
            } else {
                if (inputs[12] < 11.64) {
                    var141 = -0.04597097;
                } else {
                    var141 = 0.019140014;
                }
            }
        } else {
            if (inputs[1] < 69.46455) {
                if (inputs[21] < 16.957743) {
                    var141 = -0.056629848;
                } else {
                    if (inputs[7] < -24.679111) {
                        var141 = -0.035684764;
                    } else {
                        if (inputs[16] < -4.2995014) {
                            var141 = 0.04843296;
                        } else {
                            var141 = -0.0011242083;
                        }
                    }
                }
            } else {
                var141 = -0.06802223;
            }
        }
    }
    double var142;
    if (inputs[3] < 0.535828) {
        if (inputs[14] < 0.5948336) {
            if (inputs[10] < 0.8075) {
                var142 = 0.054893777;
            } else {
                var142 = -0.004641901;
            }
        } else {
            if (inputs[10] < 0.7525) {
                if (inputs[8] < 2.4578314) {
                    var142 = 0.030983932;
                } else {
                    if (inputs[2] < 1.5621428) {
                        var142 = -0.09535711;
                    } else {
                        var142 = -0.03960887;
                    }
                }
            } else {
                if (inputs[1] < 68.044624) {
                    if (inputs[21] < 19.185604) {
                        if (inputs[14] < 1.0516493) {
                            var142 = -0.05577728;
                        } else {
                            var142 = 0.010404736;
                        }
                    } else {
                        if (inputs[21] < 20.003363) {
                            var142 = 0.0700255;
                        } else {
                            var142 = 0.014712332;
                        }
                    }
                } else {
                    if (inputs[20] < 13.0) {
                        var142 = 0.0101792645;
                    } else {
                        var142 = -0.06792052;
                    }
                }
            }
        }
    } else {
        if (inputs[20] < 17.0) {
            if (inputs[14] < 0.7851298) {
                if (inputs[14] < 0.6691673) {
                    var142 = 0.010867871;
                } else {
                    var142 = 0.05420403;
                }
            } else {
                if (inputs[7] < -7.1595545) {
                    var142 = -0.044326175;
                } else {
                    var142 = 0.016590873;
                }
            }
        } else {
            if (inputs[10] < 2.0575) {
                var142 = 0.062319975;
            } else {
                var142 = 0.0021569866;
            }
        }
    }
    double var143;
    if (inputs[21] < 18.824001) {
        if (inputs[12] < 14.5) {
            if (inputs[21] < 18.527784) {
                if (inputs[9] < 26.005053) {
                    if (inputs[2] < 2.4271429) {
                        var143 = -0.031489752;
                    } else {
                        var143 = 0.03566429;
                    }
                } else {
                    if (inputs[3] < 0.1593122) {
                        if (inputs[21] < 17.527739) {
                            var143 = 0.06565246;
                        } else {
                            var143 = 0.014092257;
                        }
                    } else {
                        var143 = 0.007245533;
                    }
                }
            } else {
                var143 = 0.052190177;
            }
        } else {
            var143 = -0.020448606;
        }
    } else {
        if (inputs[21] < 19.25849) {
            var143 = -0.053208314;
        } else {
            if (inputs[21] < 24.010128) {
                if (inputs[21] < 19.738056) {
                    if (inputs[10] < 1.505) {
                        var143 = 0.049814787;
                    } else {
                        var143 = -0.01172097;
                    }
                } else {
                    if (inputs[23] < -16.155) {
                        if (inputs[3] < 0.4305812) {
                            var143 = -0.06758777;
                        } else {
                            var143 = -0.0013278441;
                        }
                    } else {
                        if (inputs[18] < 6.695) {
                            var143 = 0.0145214535;
                        } else {
                            var143 = -0.029327707;
                        }
                    }
                }
            } else {
                var143 = 0.04135197;
            }
        }
    }
    double var144;
    if (inputs[12] < 13.39) {
        if (inputs[7] < 18.969734) {
            if (inputs[16] < 4.43169) {
                if (inputs[12] < 9.895) {
                    if (inputs[13] < 7.025) {
                        if (inputs[21] < 22.86778) {
                            var144 = -0.0092415735;
                        } else {
                            var144 = 0.04455601;
                        }
                    } else {
                        var144 = 0.04193743;
                    }
                } else {
                    var144 = -0.044892274;
                }
            } else {
                var144 = -0.053597353;
            }
        } else {
            if (inputs[10] < 1.0725) {
                var144 = -0.018618625;
            } else {
                if (inputs[3] < -0.034633074) {
                    var144 = 0.068284996;
                } else {
                    var144 = 0.01610346;
                }
            }
        }
    } else {
        if (inputs[3] < -0.72686684) {
            var144 = 0.0464664;
        } else {
            var144 = -0.0038515062;
        }
    }
    double var145;
    if (inputs[16] < 1.3293198) {
        if (inputs[4] < 1.3996278) {
            if (inputs[14] < 0.89516526) {
                if (inputs[2] < 1.53) {
                    if (inputs[12] < -2.455) {
                        if (inputs[2] < 1.1628572) {
                            var145 = 0.02711448;
                        } else {
                            var145 = -0.054534208;
                        }
                    } else {
                        if (inputs[15] < -2.717707) {
                            var145 = -0.00045406635;
                        } else {
                            var145 = 0.07038832;
                        }
                    }
                } else {
                    var145 = 0.060129777;
                }
            } else {
                if (inputs[8] < 2.5062892) {
                    if (inputs[6] < -26.356808) {
                        var145 = -0.04019023;
                    } else {
                        if (inputs[21] < 18.95843) {
                            var145 = 0.035670344;
                        } else {
                            var145 = 0.0028203954;
                        }
                    }
                } else {
                    var145 = -0.045497928;
                }
            }
        } else {
            var145 = 0.055623583;
        }
    } else {
        if (inputs[16] < 2.0789235) {
            var145 = -0.059750486;
        } else {
            if (inputs[8] < 2.4725184) {
                if (inputs[21] < 19.424759) {
                    var145 = 0.04666026;
                } else {
                    var145 = -0.018203676;
                }
            } else {
                if (inputs[8] < 2.502439) {
                    var145 = -0.044542577;
                } else {
                    if (inputs[8] < 2.5540898) {
                        var145 = 0.026687924;
                    } else {
                        var145 = -0.02486818;
                    }
                }
            }
        }
    }
    double var146;
    if (inputs[21] < 15.708616) {
        if (inputs[23] < -7.77) {
            var146 = 0.06648181;
        } else {
            var146 = -0.001682548;
        }
    } else {
        if (inputs[18] < -12.315) {
            if (inputs[14] < 0.87582004) {
                var146 = 0.0002455917;
            } else {
                var146 = -0.06591464;
            }
        } else {
            if (inputs[10] < 0.385) {
                if (inputs[9] < 30.887844) {
                    var146 = 0.0040710666;
                } else {
                    var146 = 0.05272675;
                }
            } else {
                if (inputs[16] < 5.5290422) {
                    if (inputs[16] < 2.9005866) {
                        if (inputs[8] < 2.5164557) {
                            var146 = 0.0063609174;
                        } else {
                            var146 = -0.028206037;
                        }
                    } else {
                        if (inputs[14] < 0.97009444) {
                            var146 = 0.01441212;
                        } else {
                            var146 = 0.054811586;
                        }
                    }
                } else {
                    var146 = -0.030067496;
                }
            }
        }
    }
    double var147;
    if (inputs[18] < -24.575) {
        var147 = -0.04513401;
    } else {
        if (inputs[4] < -3.210553) {
            if (inputs[16] < -5.2976775) {
                var147 = 0.0068775946;
            } else {
                var147 = -0.045549218;
            }
        } else {
            if (inputs[15] < -2.2227693) {
                if (inputs[5] < 1.0) {
                    var147 = 0.016901497;
                } else {
                    var147 = 0.06520069;
                }
            } else {
                if (inputs[1] < 31.216616) {
                    var147 = -0.036654864;
                } else {
                    if (inputs[23] < -30.99) {
                        var147 = 0.055698663;
                    } else {
                        if (inputs[17] < -2.3293035) {
                            var147 = -0.030859174;
                        } else {
                            var147 = 0.0075766286;
                        }
                    }
                }
            }
        }
    }
    double var148;
    if (inputs[14] < 0.5094648) {
        var148 = -0.0338096;
    } else {
        if (inputs[7] < 27.162584) {
            if (inputs[7] < 18.586319) {
                if (inputs[24] < 36.44634) {
                    if (inputs[1] < 61.282856) {
                        if (inputs[17] < -0.6618812) {
                            var148 = 0.0037068876;
                        } else {
                            var148 = -0.049396772;
                        }
                    } else {
                        if (inputs[24] < 31.803577) {
                            var148 = 0.023243593;
                        } else {
                            var148 = 0.045821592;
                        }
                    }
                } else {
                    if (inputs[19] < 4.0) {
                        var148 = -0.05317923;
                    } else {
                        var148 = 0.014245985;
                    }
                }
            } else {
                if (inputs[2] < 1.5064286) {
                    var148 = 0.05182754;
                } else {
                    var148 = -0.0000035849241;
                }
            }
        } else {
            var148 = -0.032513253;
        }
    }
    double var149;
    if (inputs[6] < -3.152488) {
        if (inputs[18] < -12.315) {
            var149 = -0.037275743;
        } else {
            if (inputs[13] < -5.445) {
                if (inputs[23] < 25.065) {
                    if (inputs[17] < -3.079028) {
                        var149 = 0.049299948;
                    } else {
                        var149 = 0.012606267;
                    }
                } else {
                    var149 = -0.022634648;
                }
            } else {
                if (inputs[21] < 21.602522) {
                    if (inputs[17] < 2.0634475) {
                        if (inputs[20] < 13.0) {
                            var149 = -0.009792403;
                        } else {
                            var149 = -0.073706046;
                        }
                    } else {
                        if (inputs[1] < 68.96999) {
                            var149 = 0.038338993;
                        } else {
                            var149 = -0.032799415;
                        }
                    }
                } else {
                    var149 = 0.030682096;
                }
            }
        }
    } else {
        if (inputs[15] < 2.647952) {
            if (inputs[20] < 10.0) {
                var149 = -0.015439835;
            } else {
                if (inputs[1] < 65.03897) {
                    if (inputs[7] < -16.417265) {
                        if (inputs[12] < -2.075) {
                            var149 = 0.07102872;
                        } else {
                            var149 = 0.025532674;
                        }
                    } else {
                        if (inputs[15] < 1.3450232) {
                            var149 = -0.016494049;
                        } else {
                            var149 = 0.034037698;
                        }
                    }
                } else {
                    var149 = 0.060921837;
                }
            }
        } else {
            var149 = -0.027858097;
        }
    }
    double var150;
    if (inputs[7] < -25.921698) {
        var150 = -0.03147419;
    } else {
        if (inputs[4] < -2.8205757) {
            if (inputs[6] < -15.428504) {
                if (inputs[9] < 35.4477) {
                    var150 = 0.02843596;
                } else {
                    var150 = -0.040157653;
                }
            } else {
                var150 = 0.06039173;
            }
        } else {
            if (inputs[18] < -18.205) {
                var150 = -0.042368557;
            } else {
                if (inputs[12] < -16.295) {
                    var150 = 0.05364723;
                } else {
                    if (inputs[17] < 4.8139157) {
                        if (inputs[17] < 4.061261) {
                            var150 = -0.0027473907;
                        } else {
                            var150 = -0.06248137;
                        }
                    } else {
                        if (inputs[23] < 25.83) {
                            var150 = -0.009154517;
                        } else {
                            var150 = 0.040365957;
                        }
                    }
                }
            }
        }
    }
    double var151;
    if (inputs[16] < 6.134671) {
        if (inputs[16] < 4.7308807) {
            if (inputs[8] < 2.3338983) {
                var151 = -0.023372205;
            } else {
                if (inputs[9] < 18.506268) {
                    var151 = 0.051889136;
                } else {
                    if (inputs[18] < 2.43) {
                        if (inputs[17] < -4.0888677) {
                            var151 = -0.011476739;
                        } else {
                            var151 = 0.021004874;
                        }
                    } else {
                        if (inputs[16] < 2.664405) {
                            var151 = -0.039037216;
                        } else {
                            var151 = 0.011979636;
                        }
                    }
                }
            }
        } else {
            var151 = 0.038863696;
        }
    } else {
        var151 = -0.027628236;
    }
    double var152;
    if (inputs[6] < -41.950672) {
        if (inputs[2] < 1.2392857) {
            if (inputs[4] < -3.181065) {
                var152 = -0.042156193;
            } else {
                var152 = 0.03769664;
            }
        } else {
            var152 = -0.0559801;
        }
    } else {
        if (inputs[6] < -32.103245) {
            if (inputs[6] < -35.493023) {
                var152 = 0.0111748865;
            } else {
                var152 = 0.06208434;
            }
        } else {
            if (inputs[4] < -2.9921925) {
                if (inputs[14] < 0.6541387) {
                    var152 = 0.070084296;
                } else {
                    var152 = 0.002006087;
                }
            } else {
                if (inputs[2] < 1.2535714) {
                    var152 = -0.043336973;
                } else {
                    if (inputs[13] < 0.38) {
                        if (inputs[10] < 2.865) {
                            var152 = -0.02930203;
                        } else {
                            var152 = 0.018799732;
                        }
                    } else {
                        if (inputs[13] < 7.92) {
                            var152 = 0.029872367;
                        } else {
                            var152 = -0.0016569861;
                        }
                    }
                }
            }
        }
    }
    double var153;
    if (inputs[14] < 0.5548752) {
        var153 = -0.02918176;
    } else {
        if (inputs[6] < 17.470045) {
            if (inputs[13] < -5.97) {
                if (inputs[8] < 2.3369863) {
                    var153 = 0.061592624;
                } else {
                    if (inputs[8] < 2.4289618) {
                        var153 = -0.03365603;
                    } else {
                        if (inputs[21] < 21.644508) {
                            var153 = 0.030083384;
                        } else {
                            var153 = -0.016201774;
                        }
                    }
                }
            } else {
                if (inputs[13] < -3.225) {
                    var153 = -0.045916785;
                } else {
                    if (inputs[10] < 2.6175) {
                        if (inputs[10] < 1.19) {
                            var153 = 0.019162843;
                        } else {
                            var153 = -0.022292424;
                        }
                    } else {
                        if (inputs[9] < 29.76932) {
                            var153 = 0.0059332233;
                        } else {
                            var153 = 0.042676013;
                        }
                    }
                }
            }
        } else {
            var153 = -0.029166296;
        }
    }
    double var154;
    if (inputs[6] < -50.573925) {
        if (inputs[21] < 18.609169) {
            var154 = -0.010207487;
        } else {
            if (inputs[1] < 35.50532) {
                var154 = 0.054228894;
            } else {
                var154 = 0.020687874;
            }
        }
    } else {
        if (inputs[10] < 4.4775) {
            if (inputs[17] < 2.6598606) {
                if (inputs[17] < 2.0634475) {
                    if (inputs[12] < -14.43) {
                        var154 = 0.036992174;
                    } else {
                        if (inputs[13] < -3.05) {
                            var154 = -0.027370129;
                        } else {
                            var154 = 0.0019079242;
                        }
                    }
                } else {
                    var154 = 0.037716072;
                }
            } else {
                if (inputs[2] < 1.6985714) {
                    if (inputs[9] < 29.09266) {
                        var154 = 0.036399376;
                    } else {
                        var154 = -0.039506733;
                    }
                } else {
                    var154 = -0.05503446;
                }
            }
        } else {
            var154 = -0.046160374;
        }
    }
    double var155;
    if (inputs[16] < 1.976524) {
        if (inputs[7] < -25.921698) {
            var155 = -0.03051662;
        } else {
            if (inputs[12] < 13.345) {
                if (inputs[12] < 1.99) {
                    if (inputs[12] < -2.245) {
                        if (inputs[17] < -5.394068) {
                            var155 = 0.034145437;
                        } else {
                            var155 = 0.002047627;
                        }
                    } else {
                        var155 = 0.06277282;
                    }
                } else {
                    if (inputs[6] < -0.9878631) {
                        var155 = -0.0009521587;
                    } else {
                        var155 = -0.051021006;
                    }
                }
            } else {
                var155 = 0.04743033;
            }
        }
    } else {
        if (inputs[24] < 57.068672) {
            if (inputs[7] < 15.2785225) {
                if (inputs[14] < 0.9737791) {
                    var155 = -0.010485902;
                } else {
                    var155 = 0.010769749;
                }
            } else {
                if (inputs[3] < -0.91312706) {
                    var155 = -0.019074071;
                } else {
                    var155 = -0.07118329;
                }
            }
        } else {
            if (inputs[6] < -20.507849) {
                var155 = 0.038431283;
            } else {
                var155 = -0.01574959;
            }
        }
    }
    double var156;
    if (inputs[17] < 6.9677625) {
        if (inputs[23] < -22.01) {
            if (inputs[21] < 19.843641) {
                if (inputs[7] < -13.713003) {
                    var156 = 0.05675617;
                } else {
                    var156 = 0.015611632;
                }
            } else {
                if (inputs[6] < -2.358174) {
                    var156 = -0.026680665;
                } else {
                    var156 = 0.026797256;
                }
            }
        } else {
            if (inputs[12] < 6.655) {
                if (inputs[4] < 3.3128204) {
                    if (inputs[15] < 2.4824743) {
                        if (inputs[3] < 1.1929622) {
                            var156 = 0.006919521;
                        } else {
                            var156 = -0.031154023;
                        }
                    } else {
                        var156 = 0.048544183;
                    }
                } else {
                    var156 = -0.037575312;
                }
            } else {
                if (inputs[14] < 0.73342574) {
                    var156 = 0.0048544225;
                } else {
                    if (inputs[13] < 13.025) {
                        var156 = -0.06812628;
                    } else {
                        var156 = -0.013685548;
                    }
                }
            }
        }
    } else {
        var156 = 0.04002633;
    }
    double var157;
    if (inputs[6] < -3.152488) {
        if (inputs[13] < -1.29) {
            if (inputs[13] < -4.78) {
                if (inputs[10] < 0.945) {
                    var157 = 0.027551096;
                } else {
                    if (inputs[6] < -43.20845) {
                        var157 = 0.01228169;
                    } else {
                        if (inputs[7] < -6.7801075) {
                            var157 = -0.07729848;
                        } else {
                            var157 = -0.009325579;
                        }
                    }
                }
            } else {
                var157 = -0.06488414;
            }
        } else {
            if (inputs[7] < 19.642025) {
                if (inputs[14] < 0.6638563) {
                    var157 = -0.029348347;
                } else {
                    if (inputs[6] < -20.507849) {
                        if (inputs[14] < 0.89516526) {
                            var157 = 0.06768425;
                        } else {
                            var157 = 0.02390709;
                        }
                    } else {
                        var157 = -0.0025062962;
                    }
                }
            } else {
                var157 = -0.03164545;
            }
        }
    } else {
        if (inputs[3] < 0.4051877) {
            if (inputs[10] < 1.19) {
                if (inputs[2] < 1.4535714) {
                    var157 = -0.001676865;
                } else {
                    var157 = 0.05197327;
                }
            } else {
                if (inputs[13] < 7.92) {
                    if (inputs[2] < 1.7214285) {
                        var157 = 0.03429048;
                    } else {
                        var157 = -0.019843694;
                    }
                } else {
                    var157 = -0.044774678;
                }
            }
        } else {
            if (inputs[5] < 1.0) {
                if (inputs[20] < 12.0) {
                    var157 = 0.042240683;
                } else {
                    var157 = 0.0027631419;
                }
            } else {
                var157 = 0.064043194;
            }
        }
    }
    double var158;
    if (inputs[10] < 0.125) {
        var158 = -0.038954947;
    } else {
        if (inputs[7] < 19.951187) {
            if (inputs[19] < 2.0) {
                if (inputs[10] < 1.11) {
                    var158 = 0.010161022;
                } else {
                    var158 = -0.05091985;
                }
            } else {
                if (inputs[21] < 21.524632) {
                    if (inputs[21] < 20.699636) {
                        if (inputs[1] < 65.33371) {
                            var158 = -0.0020938471;
                        } else {
                            var158 = 0.034276634;
                        }
                    } else {
                        var158 = -0.03885259;
                    }
                } else {
                    if (inputs[6] < -27.927595) {
                        var158 = 0.05056562;
                    } else {
                        var158 = 0.009715014;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.885) {
                if (inputs[10] < 0.8075) {
                    var158 = 0.03500953;
                } else {
                    var158 = -0.021128917;
                }
            } else {
                var158 = 0.053550497;
            }
        }
    }
    double var159;
    if (inputs[6] < -14.363215) {
        if (inputs[13] < -8.41) {
            if (inputs[12] < -12.355) {
                if (inputs[21] < 20.030624) {
                    var159 = 0.019699238;
                } else {
                    var159 = -0.028562007;
                }
            } else {
                var159 = 0.05051905;
            }
        } else {
            if (inputs[21] < 21.524632) {
                if (inputs[8] < 2.4939435) {
                    if (inputs[6] < -30.142841) {
                        var159 = -0.07377278;
                    } else {
                        var159 = -0.04326166;
                    }
                } else {
                    if (inputs[3] < 0.28234375) {
                        if (inputs[17] < 2.5496182) {
                            var159 = 0.021402638;
                        } else {
                            var159 = -0.019861557;
                        }
                    } else {
                        var159 = -0.05874568;
                    }
                }
            } else {
                var159 = 0.02560255;
            }
        }
    } else {
        if (inputs[6] < -5.9325104) {
            var159 = 0.04879608;
        } else {
            if (inputs[1] < 28.797646) {
                var159 = -0.026198683;
            } else {
                if (inputs[10] < 3.2075) {
                    if (inputs[16] < -1.7947261) {
                        var159 = -0.01942831;
                    } else {
                        if (inputs[17] < 2.2461965) {
                            var159 = 0.03918769;
                        } else {
                            var159 = -0.007424306;
                        }
                    }
                } else {
                    var159 = 0.039687123;
                }
            }
        }
    }
    double var160;
    if (inputs[2] < 1.2635714) {
        if (inputs[6] < -39.6866) {
            if (inputs[3] < -0.24402282) {
                var160 = 0.033705913;
            } else {
                var160 = -0.0073170527;
            }
        } else {
            if (inputs[13] < 9.14) {
                if (inputs[9] < 34.475655) {
                    var160 = -0.078866325;
                } else {
                    var160 = -0.01902351;
                }
            } else {
                var160 = 0.004396221;
            }
        }
    } else {
        if (inputs[14] < 0.74342716) {
            if (inputs[13] < 1.105) {
                var160 = 0.059268326;
            } else {
                var160 = 0.008411962;
            }
        } else {
            if (inputs[14] < 0.8117286) {
                var160 = -0.05037198;
            } else {
                if (inputs[8] < 2.6716866) {
                    if (inputs[6] < 0.3177864) {
                        if (inputs[18] < 1.285) {
                            var160 = 0.009166818;
                        } else {
                            var160 = 0.030835073;
                        }
                    } else {
                        var160 = -0.014035896;
                    }
                } else {
                    var160 = -0.030204976;
                }
            }
        }
    }
    double var161;
    if (inputs[20] < 17.0) {
        if (inputs[14] < 1.3503293) {
            if (inputs[4] < -2.872818) {
                if (inputs[24] < -55.081978) {
                    var161 = 0.011756275;
                } else {
                    var161 = -0.072878525;
                }
            } else {
                if (inputs[12] < 14.955) {
                    if (inputs[3] < 0.94071513) {
                        if (inputs[2] < 1.7892857) {
                            var161 = 0.027893407;
                        } else {
                            var161 = -0.009863643;
                        }
                    } else {
                        if (inputs[3] < 1.4468069) {
                            var161 = -0.041354097;
                        } else {
                            var161 = 0.017653236;
                        }
                    }
                } else {
                    var161 = -0.026526365;
                }
            }
        } else {
            if (inputs[1] < 59.171814) {
                var161 = -0.068465985;
            } else {
                var161 = -0.0047000693;
            }
        }
    } else {
        if (inputs[7] < -16.75377) {
            var161 = 0.04821908;
        } else {
            if (inputs[23] < -14.21) {
                var161 = -0.030256914;
            } else {
                if (inputs[7] < 4.263343) {
                    var161 = 0.055860166;
                } else {
                    if (inputs[8] < 2.5021157) {
                        var161 = -0.020809436;
                    } else {
                        var161 = 0.016988121;
                    }
                }
            }
        }
    }
    double var162;
    if (inputs[15] < -1.7221996) {
        if (inputs[15] < -1.9393787) {
            if (inputs[17] < -2.7076077) {
                if (inputs[18] < -19.1) {
                    var162 = -0.041955967;
                } else {
                    if (inputs[16] < -4.758772) {
                        if (inputs[16] < -6.3154984) {
                            var162 = 0.027062198;
                        } else {
                            var162 = -0.029443605;
                        }
                    } else {
                        if (inputs[1] < 29.539452) {
                            var162 = 0.05811928;
                        } else {
                            var162 = 0.011253862;
                        }
                    }
                }
            } else {
                var162 = -0.041361865;
            }
        } else {
            var162 = -0.058573805;
        }
    } else {
        if (inputs[4] < -1.8701564) {
            var162 = 0.08056051;
        } else {
            if (inputs[21] < 19.216185) {
                if (inputs[8] < 2.5035799) {
                    if (inputs[10] < 2.0325) {
                        var162 = -0.052543323;
                    } else {
                        var162 = 0.015263498;
                    }
                } else {
                    if (inputs[8] < 2.5661972) {
                        var162 = 0.051596854;
                    } else {
                        var162 = -0.014305403;
                    }
                }
            } else {
                if (inputs[10] < 1.4675) {
                    if (inputs[9] < 30.437923) {
                        var162 = 0.065602496;
                    } else {
                        var162 = 0.00014446917;
                    }
                } else {
                    if (inputs[13] < 7.245) {
                        if (inputs[7] < 16.923376) {
                            var162 = -0.013576539;
                        } else {
                            var162 = 0.044382058;
                        }
                    } else {
                        var162 = -0.045699745;
                    }
                }
            }
        }
    }
    double var163;
    if (inputs[10] < 0.655) {
        if (inputs[19] < 2.0) {
            var163 = 0.049998563;
        } else {
            if (inputs[3] < 0.535828) {
                if (inputs[23] < 1.2) {
                    var163 = -0.039336774;
                } else {
                    var163 = 0.022492452;
                }
            } else {
                var163 = 0.033247765;
            }
        }
    } else {
        if (inputs[1] < 68.044624) {
            if (inputs[21] < 17.825682) {
                if (inputs[2] < 2.557857) {
                    if (inputs[8] < 2.4985423) {
                        var163 = -0.014256517;
                    } else {
                        var163 = -0.052210614;
                    }
                } else {
                    var163 = 0.010925832;
                }
            } else {
                if (inputs[6] < -27.927595) {
                    if (inputs[6] < -43.20845) {
                        var163 = 0.018390125;
                    } else {
                        var163 = -0.052369695;
                    }
                } else {
                    if (inputs[21] < 19.738056) {
                        if (inputs[23] < -3.135) {
                            var163 = 0.019953229;
                        } else {
                            var163 = 0.060679294;
                        }
                    } else {
                        if (inputs[13] < -4.45) {
                            var163 = -0.011190858;
                        } else {
                            var163 = 0.021779373;
                        }
                    }
                }
            }
        } else {
            if (inputs[23] < 13.39) {
                var163 = 0.0015797402;
            } else {
                if (inputs[9] < 37.46728) {
                    var163 = -0.07311308;
                } else {
                    var163 = -0.012727305;
                }
            }
        }
    }
    double var164;
    if (inputs[7] < -25.683517) {
        var164 = -0.035764404;
    } else {
        if (inputs[9] < 55.74809) {
            if (inputs[6] < -32.103245) {
                if (inputs[6] < -35.493023) {
                    if (inputs[3] < 1.5549939) {
                        if (inputs[2] < 1.4957143) {
                            var164 = 0.0022821093;
                        } else {
                            var164 = -0.055033367;
                        }
                    } else {
                        var164 = 0.043014992;
                    }
                } else {
                    var164 = 0.079421796;
                }
            } else {
                if (inputs[3] < 1.2750442) {
                    if (inputs[4] < -3.0357554) {
                        var164 = 0.043314923;
                    } else {
                        if (inputs[14] < 1.4340266) {
                            var164 = -0.013242263;
                        } else {
                            var164 = 0.024377761;
                        }
                    }
                } else {
                    var164 = -0.05784997;
                }
            }
        } else {
            var164 = 0.043204598;
        }
    }
    double var165;
    if (inputs[6] < 0.9116595) {
        if (inputs[6] < -4.5796494) {
            if (inputs[3] < -1.5471767) {
                var165 = 0.02884282;
            } else {
                if (inputs[8] < 2.4628713) {
                    if (inputs[23] < 11.79) {
                        if (inputs[10] < 2.0375) {
                            var165 = -0.022320312;
                        } else {
                            var165 = 0.016801616;
                        }
                    } else {
                        var165 = 0.058611855;
                    }
                } else {
                    if (inputs[8] < 2.5032318) {
                        if (inputs[10] < 1.605) {
                            var165 = -0.011643769;
                        } else {
                            var165 = -0.06113991;
                        }
                    } else {
                        if (inputs[13] < -13.405) {
                            var165 = 0.051025998;
                        } else {
                            var165 = -0.019327918;
                        }
                    }
                }
            }
        } else {
            if (inputs[3] < -0.27097872) {
                if (inputs[8] < 2.5093834) {
                    var165 = -0.019241745;
                } else {
                    var165 = 0.028743165;
                }
            } else {
                if (inputs[7] < -15.776913) {
                    var165 = 0.062112015;
                } else {
                    if (inputs[18] < 1.78) {
                        var165 = -0.0020910683;
                    } else {
                        var165 = 0.04827607;
                    }
                }
            }
        }
    } else {
        if (inputs[8] < 2.4375) {
            var165 = -0.051287945;
        } else {
            if (inputs[10] < 1.3375) {
                var165 = 0.042378444;
            } else {
                var165 = -0.037674565;
            }
        }
    }
    double var166;
    if (inputs[5] < 1.0) {
        if (inputs[20] < 10.0) {
            if (inputs[15] < 2.6973875) {
                if (inputs[8] < 2.5093834) {
                    var166 = -0.06616904;
                } else {
                    var166 = -0.007793256;
                }
            } else {
                var166 = 0.019962262;
            }
        } else {
            if (inputs[13] < -16.35) {
                var166 = 0.041576322;
            } else {
                if (inputs[20] < 12.0) {
                    if (inputs[9] < 25.651636) {
                        var166 = 0.050849773;
                    } else {
                        var166 = 0.009366603;
                    }
                } else {
                    if (inputs[3] < 0.95593303) {
                        if (inputs[9] < 26.005053) {
                            var166 = -0.029372105;
                        } else {
                            var166 = 0.015509811;
                        }
                    } else {
                        var166 = -0.045099374;
                    }
                }
            }
        }
    } else {
        if (inputs[9] < 25.057901) {
            var166 = 0.052183606;
        } else {
            if (inputs[18] < 11.245) {
                if (inputs[3] < 0.535828) {
                    if (inputs[1] < 36.89342) {
                        var166 = 0.00871825;
                    } else {
                        var166 = -0.05195931;
                    }
                } else {
                    var166 = 0.029424392;
                }
            } else {
                var166 = 0.043860752;
            }
        }
    }
    double var167;
    if (inputs[12] < 18.24) {
        if (inputs[7] < 19.951187) {
            if (inputs[16] < 3.502729) {
                if (inputs[14] < 1.3022003) {
                    if (inputs[2] < 1.9821428) {
                        if (inputs[12] < -5.165) {
                            var167 = -0.010483969;
                        } else {
                            var167 = 0.019040149;
                        }
                    } else {
                        var167 = 0.03504441;
                    }
                } else {
                    if (inputs[18] < -5.74) {
                        var167 = -0.045496807;
                    } else {
                        if (inputs[20] < 17.0) {
                            var167 = -0.026988504;
                        } else {
                            var167 = 0.033039887;
                        }
                    }
                }
            } else {
                if (inputs[12] < 4.97) {
                    var167 = -0.059314158;
                } else {
                    var167 = -0.010254315;
                }
            }
        } else {
            if (inputs[10] < 1.9925) {
                if (inputs[24] < 60.127644) {
                    var167 = -0.018360382;
                } else {
                    var167 = 0.033112545;
                }
            } else {
                var167 = 0.048004396;
            }
        }
    } else {
        var167 = -0.025473204;
    }
    double var168;
    if (inputs[12] < -4.85) {
        if (inputs[6] < -29.362022) {
            if (inputs[4] < -2.8872595) {
                var168 = -0.04560514;
            } else {
                if (inputs[18] < 0.08) {
                    var168 = 0.045639683;
                } else {
                    var168 = 0.01547122;
                }
            }
        } else {
            if (inputs[9] < 27.083637) {
                var168 = -0.05074232;
            } else {
                if (inputs[1] < 35.795807) {
                    var168 = 0.012413149;
                } else {
                    var168 = -0.031399738;
                }
            }
        }
    } else {
        if (inputs[13] < -2.365) {
            var168 = 0.04138069;
        } else {
            if (inputs[2] < 1.09) {
                if (inputs[21] < 19.981684) {
                    var168 = -0.0015671494;
                } else {
                    var168 = -0.050565604;
                }
            } else {
                if (inputs[14] < 0.7068707) {
                    var168 = 0.044886656;
                } else {
                    if (inputs[2] < 2.732143) {
                        if (inputs[2] < 2.0564287) {
                            var168 = 0.0018155408;
                        } else {
                            var168 = -0.04202627;
                        }
                    } else {
                        var168 = 0.035278875;
                    }
                }
            }
        }
    }
    double var169;
    if (inputs[9] < 20.744072) {
        if (inputs[13] < -1.735) {
            var169 = -0.003530967;
        } else {
            var169 = -0.04747954;
        }
    } else {
        if (inputs[21] < 16.68018) {
            if (inputs[8] < 2.4992125) {
                var169 = 0.053736255;
            } else {
                var169 = 0.01860714;
            }
        } else {
            if (inputs[3] < 0.8231325) {
                if (inputs[18] < 11.665) {
                    if (inputs[2] < 1.0657142) {
                        var169 = -0.05222019;
                    } else {
                        if (inputs[17] < 2.5496182) {
                            var169 = 0.005377728;
                        } else {
                            var169 = -0.023674399;
                        }
                    }
                } else {
                    if (inputs[2] < 1.7664286) {
                        var169 = 0.04369832;
                    } else {
                        var169 = -0.004895666;
                    }
                }
            } else {
                if (inputs[19] < 3.0) {
                    if (inputs[9] < 27.912676) {
                        var169 = 0.058503684;
                    } else {
                        var169 = 0.025983622;
                    }
                } else {
                    if (inputs[4] < -2.792573) {
                        var169 = 0.033177752;
                    } else {
                        var169 = -0.030245401;
                    }
                }
            }
        }
    }
    double var170;
    if (inputs[10] < 1.525) {
        if (inputs[3] < -0.005653874) {
            if (inputs[21] < 19.039087) {
                if (inputs[20] < 11.0) {
                    var170 = 0.030932302;
                } else {
                    var170 = -0.021402387;
                }
            } else {
                if (inputs[2] < 1.445) {
                    var170 = 0.0075587244;
                } else {
                    var170 = 0.06560565;
                }
            }
        } else {
            if (inputs[12] < -5.46) {
                var170 = 0.02036509;
            } else {
                if (inputs[15] < 1.6541096) {
                    var170 = -0.04263056;
                } else {
                    var170 = 0.010985304;
                }
            }
        }
    } else {
        if (inputs[20] < 17.0) {
            if (inputs[23] < -24.365) {
                var170 = -0.059151884;
            } else {
                if (inputs[21] < 20.538614) {
                    if (inputs[18] < 8.43) {
                        if (inputs[24] < 30.816559) {
                            var170 = 0.0007793061;
                        } else {
                            var170 = 0.05467595;
                        }
                    } else {
                        var170 = -0.04040065;
                    }
                } else {
                    var170 = -0.06281404;
                }
            }
        } else {
            if (inputs[10] < 3.6475) {
                if (inputs[12] < 0.54) {
                    var170 = -0.016084084;
                } else {
                    var170 = 0.023032337;
                }
            } else {
                var170 = 0.04719864;
            }
        }
    }
    double var171;
    if (inputs[3] < 1.7389678) {
        if (inputs[2] < 0.95214283) {
            var171 = 0.029972663;
        } else {
            if (inputs[9] < 30.502996) {
                if (inputs[24] < 52.189053) {
                    if (inputs[16] < 1.4330133) {
                        if (inputs[24] < -27.795753) {
                            var171 = -0.0029206555;
                        } else {
                            var171 = 0.028434739;
                        }
                    } else {
                        if (inputs[3] < -0.9396294) {
                            var171 = -0.049489148;
                        } else {
                            var171 = -0.007904892;
                        }
                    }
                } else {
                    var171 = 0.038260255;
                }
            } else {
                if (inputs[2] < 1.3928572) {
                    if (inputs[14] < 0.68276983) {
                        var171 = -0.013457807;
                    } else {
                        var171 = -0.07290628;
                    }
                } else {
                    if (inputs[17] < 4.8336635) {
                        if (inputs[7] < -11.63682) {
                            var171 = 0.018464854;
                        } else {
                            var171 = -0.04717442;
                        }
                    } else {
                        var171 = 0.04680218;
                    }
                }
            }
        }
    } else {
        var171 = 0.030554978;
    }
    double var172;
    if (inputs[21] < 18.95843) {
        if (inputs[2] < 1.0578572) {
            var172 = 0.0450395;
        } else {
            if (inputs[16] < -3.1990533) {
                var172 = -0.022937313;
            } else {
                if (inputs[16] < -1.9178363) {
                    var172 = 0.05505978;
                } else {
                    if (inputs[23] < 16.45) {
                        if (inputs[9] < 26.59737) {
                            var172 = -0.032009795;
                        } else {
                            var172 = 0.008728436;
                        }
                    } else {
                        var172 = 0.01767348;
                    }
                }
            }
        }
    } else {
        if (inputs[21] < 19.27728) {
            var172 = -0.052848723;
        } else {
            if (inputs[17] < 3.7096577) {
                if (inputs[23] < -30.36) {
                    if (inputs[2] < 1.4264286) {
                        var172 = 0.003913539;
                    } else {
                        var172 = -0.04867151;
                    }
                } else {
                    if (inputs[9] < 37.46728) {
                        if (inputs[3] < -0.5177981) {
                            var172 = -0.029055895;
                        } else {
                            var172 = 0.012912775;
                        }
                    } else {
                        var172 = 0.04532813;
                    }
                }
            } else {
                if (inputs[17] < 5.380597) {
                    var172 = -0.054850463;
                } else {
                    var172 = -0.0037175398;
                }
            }
        }
    }
    double var173;
    if (inputs[7] < 9.748975) {
        if (inputs[7] < 1.2061857) {
            if (inputs[6] < -3.152488) {
                if (inputs[6] < -41.405205) {
                    if (inputs[15] < -2.6312056) {
                        var173 = -0.015450692;
                    } else {
                        var173 = 0.04554264;
                    }
                } else {
                    if (inputs[2] < 1.5064286) {
                        var173 = -0.06091427;
                    } else {
                        if (inputs[2] < 2.1321428) {
                            var173 = 0.026064243;
                        } else {
                            var173 = -0.03528681;
                        }
                    }
                }
            } else {
                if (inputs[14] < 0.6691673) {
                    var173 = 0.059213772;
                } else {
                    if (inputs[8] < 2.50028) {
                        if (inputs[2] < 1.9107143) {
                            var173 = -0.0026902123;
                        } else {
                            var173 = 0.0682287;
                        }
                    } else {
                        var173 = -0.0275106;
                    }
                }
            }
        } else {
            var173 = 0.034721997;
        }
    } else {
        if (inputs[8] < 2.502439) {
            if (inputs[14] < 0.6585674) {
                var173 = 0.014716139;
            } else {
                if (inputs[3] < 0.41807792) {
                    if (inputs[7] < 20.95334) {
                        var173 = -0.086531915;
                    } else {
                        var173 = -0.022894261;
                    }
                } else {
                    var173 = -0.0051452303;
                }
            }
        } else {
            if (inputs[8] < 2.5540898) {
                var173 = 0.032447007;
            } else {
                if (inputs[10] < 1.11) {
                    var173 = -0.036188602;
                } else {
                    var173 = 0.019615727;
                }
            }
        }
    }
    double var174;
    if (inputs[9] < 19.406181) {
        var174 = 0.028207421;
    } else {
        if (inputs[9] < 27.667595) {
            if (inputs[24] < -32.92462) {
                if (inputs[9] < 23.953922) {
                    var174 = -0.016496526;
                } else {
                    var174 = -0.06418147;
                }
            } else {
                if (inputs[16] < 1.3293198) {
                    if (inputs[7] < -2.8651555) {
                        var174 = 0.00296305;
                    } else {
                        var174 = 0.043576512;
                    }
                } else {
                    if (inputs[15] < 2.1454859) {
                        var174 = -0.06126612;
                    } else {
                        var174 = 0.01098372;
                    }
                }
            }
        } else {
            if (inputs[9] < 30.646248) {
                if (inputs[24] < -32.92462) {
                    var174 = 0.058786795;
                } else {
                    var174 = 0.00579457;
                }
            } else {
                if (inputs[8] < 2.61204) {
                    if (inputs[21] < 18.182224) {
                        if (inputs[14] < 0.7599112) {
                            var174 = -0.019670315;
                        } else {
                            var174 = 0.060789276;
                        }
                    } else {
                        if (inputs[14] < 0.5948336) {
                            var174 = 0.03933363;
                        } else {
                            var174 = -0.01422679;
                        }
                    }
                } else {
                    var174 = -0.030970002;
                }
            }
        }
    }
    double var175;
    if (inputs[21] < 14.675635) {
        var175 = -0.040130425;
    } else {
        if (inputs[10] < 0.315) {
            if (inputs[2] < 1.5028571) {
                var175 = -0.041723263;
            } else {
                var175 = 0.010214636;
            }
        } else {
            if (inputs[10] < 3.0125) {
                if (inputs[21] < 20.44132) {
                    if (inputs[21] < 19.216185) {
                        if (inputs[17] < -1.8844386) {
                            var175 = 0.028933583;
                        } else {
                            var175 = -0.008620059;
                        }
                    } else {
                        if (inputs[8] < 2.5028737) {
                            var175 = 0.04969282;
                        } else {
                            var175 = 0.00017102162;
                        }
                    }
                } else {
                    if (inputs[14] < 0.9579682) {
                        if (inputs[20] < 15.0) {
                            var175 = -0.002933356;
                        } else {
                            var175 = 0.041728638;
                        }
                    } else {
                        var175 = -0.040315222;
                    }
                }
            } else {
                if (inputs[6] < -14.363215) {
                    var175 = -0.03053765;
                } else {
                    if (inputs[14] < 1.0634068) {
                        var175 = -0.014464053;
                    } else {
                        var175 = 0.03642932;
                    }
                }
            }
        }
    }
    double var176;
    if (inputs[3] < -0.005653874) {
        if (inputs[3] < -0.5177981) {
            if (inputs[4] < -1.8869901) {
                if (inputs[24] < -50.71229) {
                    var176 = -0.0015931912;
                } else {
                    var176 = 0.04997401;
                }
            } else {
                if (inputs[14] < 0.7286123) {
                    var176 = 0.023176929;
                } else {
                    if (inputs[8] < 2.4983606) {
                        var176 = -0.04222018;
                    } else {
                        var176 = -0.0046361624;
                    }
                }
            }
        } else {
            if (inputs[14] < 0.7093192) {
                var176 = 0.006565826;
            } else {
                if (inputs[6] < -15.428504) {
                    var176 = 0.06455545;
                } else {
                    var176 = 0.03368337;
                }
            }
        }
    } else {
        if (inputs[12] < 9.795) {
            if (inputs[6] < -39.019794) {
                if (inputs[9] < 28.116417) {
                    var176 = 0.016797695;
                } else {
                    var176 = -0.049766924;
                }
            } else {
                if (inputs[13] < -13.465) {
                    var176 = 0.04066788;
                } else {
                    if (inputs[15] < -2.1662493) {
                        var176 = 0.038130067;
                    } else {
                        if (inputs[7] < -7.1595545) {
                            var176 = -0.05685723;
                        } else {
                            var176 = -0.0016709258;
                        }
                    }
                }
            }
        } else {
            var176 = -0.04868801;
        }
    }
    double var177;
    if (inputs[14] < 0.5948336) {
        if (inputs[3] < -0.13150421) {
            var177 = 0.042299673;
        } else {
            var177 = -0.0055416776;
        }
    } else {
        if (inputs[3] < -0.5177981) {
            if (inputs[13] < 17.885) {
                if (inputs[9] < 25.651636) {
                    var177 = 0.001185789;
                } else {
                    if (inputs[2] < 1.7014285) {
                        var177 = -0.05931958;
                    } else {
                        var177 = -0.010788198;
                    }
                }
            } else {
                var177 = 0.030260695;
            }
        } else {
            if (inputs[9] < 19.406181) {
                var177 = 0.0445526;
            } else {
                if (inputs[8] < 2.4968152) {
                    if (inputs[19] < 3.0) {
                        if (inputs[1] < 33.210888) {
                            var177 = -0.03321592;
                        } else {
                            var177 = 0.018324144;
                        }
                    } else {
                        if (inputs[4] < -2.3903956) {
                            var177 = 0.0031344101;
                        } else {
                            var177 = -0.0698759;
                        }
                    }
                } else {
                    if (inputs[21] < 17.69725) {
                        var177 = -0.021319734;
                    } else {
                        if (inputs[8] < 2.5004926) {
                            var177 = 0.051486906;
                        } else {
                            var177 = 0.010430391;
                        }
                    }
                }
            }
        }
    }
    double var178;
    if (inputs[14] < 0.5548752) {
        var178 = -0.020415025;
    } else {
        if (inputs[14] < 0.6929307) {
            if (inputs[6] < -20.647436) {
                var178 = 0.0042073037;
            } else {
                if (inputs[13] < 1.175) {
                    var178 = 0.059899144;
                } else {
                    var178 = 0.04595154;
                }
            }
        } else {
            if (inputs[23] < -24.365) {
                if (inputs[21] < 19.128492) {
                    var178 = 0.010070508;
                } else {
                    var178 = -0.0380948;
                }
            } else {
                if (inputs[13] < -15.495) {
                    var178 = 0.051079907;
                } else {
                    if (inputs[10] < 2.2675) {
                        if (inputs[20] < 15.0) {
                            var178 = 0.014721251;
                        } else {
                            var178 = -0.022193475;
                        }
                    } else {
                        if (inputs[9] < 29.76932) {
                            var178 = 0.008673615;
                        } else {
                            var178 = 0.04136751;
                        }
                    }
                }
            }
        }
    }
    double var179;
    if (inputs[20] < 10.0) {
        if (inputs[10] < 2.0275) {
            if (inputs[15] < -2.6942267) {
                var179 = 0.002281866;
            } else {
                if (inputs[14] < 0.70156413) {
                    var179 = -0.06336419;
                } else {
                    var179 = -0.01628873;
                }
            }
        } else {
            var179 = 0.021187214;
        }
    } else {
        if (inputs[17] < 4.7224197) {
            if (inputs[10] < 3.955) {
                if (inputs[6] < -32.103245) {
                    if (inputs[8] < 2.4758735) {
                        var179 = -0.009625778;
                    } else {
                        if (inputs[17] < -2.3293035) {
                            var179 = 0.022522679;
                        } else {
                            var179 = 0.06381652;
                        }
                    }
                } else {
                    if (inputs[13] < 12.43) {
                        if (inputs[14] < 0.8117286) {
                            var179 = -0.042368155;
                        } else {
                            var179 = -0.00016974821;
                        }
                    } else {
                        var179 = 0.03153842;
                    }
                }
            } else {
                var179 = -0.034510236;
            }
        } else {
            if (inputs[8] < 2.5031645) {
                var179 = 0.0122138485;
            } else {
                var179 = 0.059424363;
            }
        }
    }
    double var180;
    if (inputs[3] < 1.2750442) {
        if (inputs[3] < 0.84939736) {
            if (inputs[16] < 4.1048) {
                if (inputs[9] < 42.092125) {
                    if (inputs[1] < 67.63618) {
                        if (inputs[7] < 16.323164) {
                            var180 = -0.0085452115;
                        } else {
                            var180 = 0.03115049;
                        }
                    } else {
                        var180 = -0.043321237;
                    }
                } else {
                    var180 = 0.021977179;
                }
            } else {
                if (inputs[16] < 5.62066) {
                    var180 = 0.036392946;
                } else {
                    var180 = -0.00815577;
                }
            }
        } else {
            if (inputs[9] < 25.889418) {
                var180 = 0.05201978;
            } else {
                var180 = 0.0051286686;
            }
        }
    } else {
        if (inputs[4] < -2.199282) {
            if (inputs[9] < 32.36834) {
                var180 = 0.024552634;
            } else {
                var180 = -0.008147639;
            }
        } else {
            var180 = -0.04304979;
        }
    }
    double var181;
    if (inputs[17] < -3.8382225) {
        if (inputs[10] < 1.0375) {
            var181 = 0.034177285;
        } else {
            if (inputs[16] < -4.456395) {
                var181 = -0.035243306;
            } else {
                var181 = 0.030041005;
            }
        }
    } else {
        if (inputs[7] < 18.713493) {
            if (inputs[24] < 48.248295) {
                if (inputs[14] < 1.3503293) {
                    if (inputs[15] < -1.7221996) {
                        if (inputs[7] < -12.6547575) {
                            var181 = -0.000056742545;
                        } else {
                            var181 = -0.049525924;
                        }
                    } else {
                        if (inputs[12] < 8.61) {
                            var181 = 0.009667876;
                        } else {
                            var181 = 0.04539038;
                        }
                    }
                } else {
                    if (inputs[14] < 1.6734459) {
                        var181 = -0.06655628;
                    } else {
                        var181 = -0.014835321;
                    }
                }
            } else {
                var181 = -0.04858934;
            }
        } else {
            if (inputs[10] < 1.9925) {
                if (inputs[15] < 3.1116202) {
                    if (inputs[20] < 11.0) {
                        var181 = -0.037109833;
                    } else {
                        var181 = -0.0036118873;
                    }
                } else {
                    var181 = 0.035808723;
                }
            } else {
                var181 = 0.041126207;
            }
        }
    }
    double var182;
    if (inputs[17] < -5.394068) {
        if (inputs[23] < -27.78) {
            var182 = 0.0482578;
        } else {
            var182 = 0.0036181516;
        }
    } else {
        if (inputs[13] < 6.675) {
            if (inputs[1] < 30.82347) {
                var182 = -0.04498231;
            } else {
                if (inputs[7] < -12.6547575) {
                    var182 = 0.03924355;
                } else {
                    if (inputs[10] < 3.46) {
                        if (inputs[8] < 2.5029585) {
                            var182 = -0.019479835;
                        } else {
                            var182 = 0.013246459;
                        }
                    } else {
                        var182 = -0.05038462;
                    }
                }
            }
        } else {
            if (inputs[19] < 3.0) {
                if (inputs[10] < 1.3625) {
                    var182 = 0.020568233;
                } else {
                    var182 = -0.029663786;
                }
            } else {
                if (inputs[2] < 1.6728572) {
                    if (inputs[3] < -0.4211998) {
                        var182 = 0.07102675;
                    } else {
                        var182 = 0.012868669;
                    }
                } else {
                    var182 = 0.002631129;
                }
            }
        }
    }
    double var183;
    if (inputs[2] < 0.94714284) {
        var183 = 0.03500242;
    } else {
        if (inputs[14] < 1.2093482) {
            if (inputs[14] < 1.0870839) {
                if (inputs[24] < 63.078743) {
                    if (inputs[18] < -18.235) {
                        var183 = -0.028082991;
                    } else {
                        if (inputs[23] < -27.3) {
                            var183 = 0.03358216;
                        } else {
                            var183 = 0.0010755218;
                        }
                    }
                } else {
                    var183 = -0.037457928;
                }
            } else {
                var183 = -0.04378682;
            }
        } else {
            if (inputs[14] < 1.3022003) {
                var183 = 0.044714913;
            } else {
                if (inputs[16] < -2.3393698) {
                    var183 = -0.03657362;
                } else {
                    if (inputs[17] < 2.6598606) {
                        var183 = 0.042970255;
                    } else {
                        var183 = -0.014611849;
                    }
                }
            }
        }
    }
    double var184;
    if (inputs[18] < -20.79) {
        var184 = -0.05154905;
    } else {
        if (inputs[20] < 21.0) {
            if (inputs[17] < -5.394068) {
                var184 = 0.03359542;
            } else {
                if (inputs[10] < 2.2675) {
                    if (inputs[7] < 26.953512) {
                        if (inputs[18] < 15.365) {
                            var184 = -0.0051718056;
                        } else {
                            var184 = -0.049238015;
                        }
                    } else {
                        var184 = 0.03029704;
                    }
                } else {
                    if (inputs[2] < 2.195) {
                        if (inputs[9] < 28.03674) {
                            var184 = 0.01624412;
                        } else {
                            var184 = 0.053158987;
                        }
                    } else {
                        var184 = -0.0032878965;
                    }
                }
            }
        } else {
            var184 = -0.033327915;
        }
    }
    double var185;
    if (inputs[1] < 31.216616) {
        if (inputs[12] < 1.445) {
            if (inputs[21] < 20.400381) {
                var185 = -0.07872818;
            } else {
                var185 = 0.008328089;
            }
        } else {
            var185 = 0.01303015;
        }
    } else {
        if (inputs[17] < -3.8382225) {
            var185 = 0.036942873;
        } else {
            if (inputs[3] < 1.2889482) {
                if (inputs[9] < 30.351091) {
                    if (inputs[10] < 0.655) {
                        var185 = 0.02276832;
                    } else {
                        if (inputs[19] < 3.0) {
                            var185 = 0.0010834894;
                        } else {
                            var185 = -0.03741978;
                        }
                    }
                } else {
                    if (inputs[10] < 0.755) {
                        var185 = -0.016688747;
                    } else {
                        if (inputs[15] < 2.8823528) {
                            var185 = 0.04034761;
                        } else {
                            var185 = -0.014065044;
                        }
                    }
                }
            } else {
                var185 = -0.02666879;
            }
        }
    }
    double var186;
    if (inputs[21] < 16.68018) {
        if (inputs[3] < -0.44777) {
            var186 = 0.050403908;
        } else {
            var186 = 0.005215929;
        }
    } else {
        if (inputs[2] < 1.2635714) {
            if (inputs[1] < 26.193537) {
                var186 = 0.01613678;
            } else {
                if (inputs[3] < -0.09276572) {
                    if (inputs[14] < 0.5948336) {
                        var186 = 0.0086669205;
                    } else {
                        var186 = -0.032574423;
                    }
                } else {
                    var186 = -0.05075341;
                }
            }
        } else {
            if (inputs[2] < 1.3721429) {
                var186 = 0.037029885;
            } else {
                if (inputs[13] < 17.885) {
                    if (inputs[13] < -16.35) {
                        var186 = 0.024004584;
                    } else {
                        if (inputs[21] < 20.557327) {
                            var186 = -0.004165649;
                        } else {
                            var186 = -0.040653367;
                        }
                    }
                } else {
                    var186 = 0.032916337;
                }
            }
        }
    }
    double var187;
    if (inputs[3] < 1.2750442) {
        if (inputs[2] < 2.732143) {
            if (inputs[3] < 0.535828) {
                if (inputs[3] < 0.28234375) {
                    if (inputs[14] < 0.73148984) {
                        if (inputs[23] < 7.5) {
                            var187 = 0.0021893394;
                        } else {
                            var187 = 0.03926637;
                        }
                    } else {
                        if (inputs[10] < 0.5625) {
                            var187 = -0.03680332;
                        } else {
                            var187 = 0.0029667916;
                        }
                    }
                } else {
                    var187 = -0.03578861;
                }
            } else {
                if (inputs[21] < 18.95843) {
                    var187 = 0.05303651;
                } else {
                    if (inputs[1] < 36.753212) {
                        var187 = -0.01193639;
                    } else {
                        var187 = 0.0264046;
                    }
                }
            }
        } else {
            if (inputs[13] < -0.375) {
                var187 = 0.005051607;
            } else {
                var187 = 0.053421713;
            }
        }
    } else {
        if (inputs[10] < 2.3075) {
            if (inputs[21] < 19.843641) {
                var187 = 0.03129982;
            } else {
                var187 = -0.020723324;
            }
        } else {
            var187 = -0.045860726;
        }
    }
    double var188;
    if (inputs[23] < 39.645) {
        if (inputs[14] < 1.2116929) {
            if (inputs[8] < 2.4736843) {
                if (inputs[14] < 0.870025) {
                    if (inputs[1] < 34.926216) {
                        var188 = -0.021430558;
                    } else {
                        var188 = 0.02107916;
                    }
                } else {
                    var188 = -0.04364809;
                }
            } else {
                if (inputs[9] < 29.282501) {
                    if (inputs[10] < 1.725) {
                        if (inputs[19] < 3.0) {
                            var188 = 0.020940892;
                        } else {
                            var188 = 0.06265295;
                        }
                    } else {
                        var188 = -0.008108104;
                    }
                } else {
                    if (inputs[9] < 34.125217) {
                        var188 = -0.052586038;
                    } else {
                        if (inputs[13] < -0.955) {
                            var188 = -0.006681256;
                        } else {
                            var188 = 0.02878992;
                        }
                    }
                }
            }
        } else {
            if (inputs[14] < 1.3022003) {
                var188 = 0.055600867;
            } else {
                if (inputs[14] < 1.5624589) {
                    var188 = -0.013805994;
                } else {
                    if (inputs[6] < -8.969337) {
                        var188 = 0.048091844;
                    } else {
                        var188 = 0.0062234155;
                    }
                }
            }
        }
    } else {
        if (inputs[8] < 2.5035799) {
            var188 = -0.052441757;
        } else {
            var188 = 0.017133487;
        }
    }
    double var189;
    if (inputs[12] < -14.43) {
        if (inputs[9] < 27.083637) {
            var189 = -0.00815232;
        } else {
            var189 = 0.04056194;
        }
    } else {
        if (inputs[17] < 6.9677625) {
            if (inputs[8] < 2.4289618) {
                if (inputs[15] < -2.0530612) {
                    var189 = 0.010972668;
                } else {
                    if (inputs[15] < 1.6541096) {
                        var189 = -0.07832217;
                    } else {
                        var189 = -0.018131247;
                    }
                }
            } else {
                if (inputs[8] < 2.460452) {
                    var189 = 0.03757157;
                } else {
                    if (inputs[8] < 2.4916067) {
                        var189 = -0.050754897;
                    } else {
                        if (inputs[21] < 17.630383) {
                            var189 = -0.027246185;
                        } else {
                            var189 = 0.007469635;
                        }
                    }
                }
            }
        } else {
            var189 = 0.03135063;
        }
    }
    double var190;
    if (inputs[16] < 5.5290422) {
        if (inputs[1] < 26.495476) {
            if (inputs[6] < -18.223389) {
                var190 = 0.006247097;
            } else {
                var190 = 0.04551315;
            }
        } else {
            if (inputs[15] < -2.9554014) {
                var190 = -0.036883708;
            } else {
                if (inputs[6] < 10.910757) {
                    if (inputs[6] < -2.358174) {
                        if (inputs[21] < 17.730051) {
                            var190 = 0.027995808;
                        } else {
                            var190 = -0.011327699;
                        }
                    } else {
                        if (inputs[14] < 1.3503293) {
                            var190 = 0.029380474;
                        } else {
                            var190 = -0.012598997;
                        }
                    }
                } else {
                    var190 = -0.021029547;
                }
            }
        }
    } else {
        var190 = -0.035302773;
    }
    double var191;
    if (inputs[6] < -65.73123) {
        var191 = -0.03973024;
    } else {
        if (inputs[18] < 17.42) {
            if (inputs[14] < 0.870025) {
                if (inputs[17] < -5.394068) {
                    var191 = 0.048229914;
                } else {
                    if (inputs[14] < 0.80040574) {
                        if (inputs[23] < 6.705) {
                            var191 = -0.017258463;
                        } else {
                            var191 = 0.022154324;
                        }
                    } else {
                        var191 = 0.034495745;
                    }
                }
            } else {
                if (inputs[16] < -3.1990533) {
                    if (inputs[14] < 1.1930127) {
                        var191 = -0.057927344;
                    } else {
                        var191 = -0.012495564;
                    }
                } else {
                    if (inputs[1] < 35.268757) {
                        var191 = 0.040789798;
                    } else {
                        if (inputs[17] < 3.512051) {
                            var191 = -0.016951872;
                        } else {
                            var191 = 0.027823567;
                        }
                    }
                }
            }
        } else {
            var191 = -0.030539952;
        }
    }
    double var192;
    if (inputs[7] < -25.683517) {
        var192 = -0.031713113;
    } else {
        if (inputs[7] < -20.653982) {
            var192 = 0.025307626;
        } else {
            if (inputs[19] < 4.0) {
                if (inputs[16] < 4.2940245) {
                    if (inputs[12] < 1.685) {
                        if (inputs[1] < 36.89342) {
                            var192 = 0.019031193;
                        } else {
                            var192 = -0.008564914;
                        }
                    } else {
                        if (inputs[9] < 22.123726) {
                            var192 = 0.02929201;
                        } else {
                            var192 = -0.037952166;
                        }
                    }
                } else {
                    if (inputs[12] < 3.525) {
                        var192 = -0.0052591376;
                    } else {
                        var192 = 0.055378143;
                    }
                }
            } else {
                if (inputs[10] < 1.505) {
                    var192 = 0.0029348028;
                } else {
                    var192 = -0.040219557;
                }
            }
        }
    }
    double var193;
    if (inputs[7] < -18.971659) {
        if (inputs[15] < -3.2757838) {
            var193 = -0.019920684;
        } else {
            if (inputs[3] < -0.11844581) {
                var193 = 0.056180608;
            } else {
                var193 = 0.020121057;
            }
        }
    } else {
        if (inputs[16] < -3.0618532) {
            if (inputs[3] < 0.8231325) {
                var193 = -0.075734094;
            } else {
                var193 = 0.0038257674;
            }
        } else {
            if (inputs[6] < -29.362022) {
                if (inputs[16] < 3.6681921) {
                    if (inputs[19] < 3.0) {
                        var193 = 0.055970218;
                    } else {
                        var193 = 0.0033979446;
                    }
                } else {
                    var193 = -0.009371619;
                }
            } else {
                if (inputs[15] < 2.647952) {
                    if (inputs[9] < 35.515194) {
                        if (inputs[7] < -9.013856) {
                            var193 = -0.028089227;
                        } else {
                            var193 = 0.0061588027;
                        }
                    } else {
                        var193 = 0.03496606;
                    }
                } else {
                    if (inputs[15] < 3.0439835) {
                        var193 = -0.0590192;
                    } else {
                        var193 = 0.002905026;
                    }
                }
            }
        }
    }
    double var194;
    if (inputs[17] < -5.9814453) {
        var194 = -0.028244192;
    } else {
        if (inputs[9] < 34.475655) {
            if (inputs[3] < 0.8231325) {
                if (inputs[4] < -2.550636) {
                    var194 = -0.0491533;
                } else {
                    if (inputs[24] < -35.06089) {
                        var194 = 0.037448853;
                    } else {
                        if (inputs[16] < -1.0353744) {
                            var194 = -0.055284448;
                        } else {
                            var194 = -0.00519792;
                        }
                    }
                }
            } else {
                if (inputs[12] < -12.05) {
                    var194 = 0.048336443;
                } else {
                    if (inputs[16] < -1.9178363) {
                        var194 = 0.021220746;
                    } else {
                        var194 = -0.018726306;
                    }
                }
            }
        } else {
            if (inputs[10] < 1.9925) {
                if (inputs[3] < 0.1593122) {
                    if (inputs[13] < 2.53) {
                        var194 = -0.005794852;
                    } else {
                        var194 = 0.036016256;
                    }
                } else {
                    var194 = -0.05225062;
                }
            } else {
                if (inputs[10] < 3.0125) {
                    var194 = 0.07095533;
                } else {
                    var194 = -0.0015844908;
                }
            }
        }
    }
    double var195;
    if (inputs[1] < 77.22701) {
        if (inputs[15] < 3.1509268) {
            if (inputs[13] < 8.88) {
                if (inputs[13] < 6.675) {
                    if (inputs[24] < 45.802517) {
                        if (inputs[13] < 2.045) {
                            var195 = 0.004120999;
                        } else {
                            var195 = -0.029727925;
                        }
                    } else {
                        var195 = 0.026160777;
                    }
                } else {
                    var195 = 0.041532025;
                }
            } else {
                if (inputs[6] < 0.3177864) {
                    if (inputs[6] < -14.363215) {
                        var195 = -0.022033297;
                    } else {
                        var195 = 0.026201854;
                    }
                } else {
                    var195 = -0.05148646;
                }
            }
        } else {
            var195 = -0.0403639;
        }
    } else {
        var195 = 0.030092984;
    }
    double var196;
    if (inputs[10] < 1.685) {
        if (inputs[9] < 36.512947) {
            if (inputs[14] < 0.9453626) {
                if (inputs[10] < 1.1025) {
                    if (inputs[9] < 25.348158) {
                        var196 = 0.03986294;
                    } else {
                        var196 = 0.0054399525;
                    }
                } else {
                    var196 = 0.048676845;
                }
            } else {
                if (inputs[3] < 0.4051877) {
                    var196 = -0.014697285;
                } else {
                    var196 = 0.01876891;
                }
            }
        } else {
            if (inputs[20] < 11.0) {
                var196 = -0.04009282;
            } else {
                if (inputs[21] < 19.656258) {
                    var196 = -0.017329654;
                } else {
                    var196 = 0.043111704;
                }
            }
        }
    } else {
        if (inputs[6] < -33.545036) {
            var196 = -0.040944178;
        } else {
            if (inputs[19] < 3.0) {
                if (inputs[3] < -0.018309461) {
                    var196 = -0.009895867;
                } else {
                    var196 = 0.041981805;
                }
            } else {
                if (inputs[14] < 0.9228259) {
                    var196 = 0.011230732;
                } else {
                    var196 = -0.03441701;
                }
            }
        }
    }
    double var197;
    if (inputs[1] < 63.875416) {
        if (inputs[23] < -3.495) {
            if (inputs[4] < -3.6396563) {
                var197 = 0.027722213;
            } else {
                if (inputs[10] < 2.9375) {
                    if (inputs[6] < -32.626118) {
                        var197 = -0.0017703706;
                    } else {
                        if (inputs[6] < -3.152488) {
                            var197 = -0.06532727;
                        } else {
                            var197 = -0.018964717;
                        }
                    }
                } else {
                    var197 = 0.0153351985;
                }
            }
        } else {
            if (inputs[12] < -8.61) {
                var197 = -0.016124388;
            } else {
                if (inputs[13] < 1.25) {
                    if (inputs[14] < 0.99149543) {
                        var197 = 0.027916607;
                    } else {
                        var197 = 0.066314444;
                    }
                } else {
                    var197 = 0.00059917005;
                }
            }
        }
    } else {
        if (inputs[23] < 7.5) {
            if (inputs[2] < 1.5585715) {
                var197 = -0.019657444;
            } else {
                var197 = -0.06252528;
            }
        } else {
            if (inputs[24] < 43.21675) {
                var197 = -0.03112709;
            } else {
                if (inputs[12] < 8.885) {
                    if (inputs[2] < 1.3571428) {
                        var197 = -0.018697796;
                    } else {
                        var197 = 0.0070743905;
                    }
                } else {
                    var197 = 0.03275258;
                }
            }
        }
    }
    double var198;
    if (inputs[1] < 37.129726) {
        if (inputs[14] < 0.7682478) {
            if (inputs[10] < 1.295) {
                var198 = -0.026745195;
            } else {
                var198 = 0.013980761;
            }
        } else {
            if (inputs[8] < 2.4942086) {
                if (inputs[6] < -3.9755354) {
                    var198 = -0.008064338;
                } else {
                    var198 = 0.034336306;
                }
            } else {
                if (inputs[8] < 2.5083334) {
                    var198 = 0.068261355;
                } else {
                    var198 = 0.017359834;
                }
            }
        }
    } else {
        if (inputs[21] < 16.274656) {
            var198 = -0.03059427;
        } else {
            if (inputs[13] < 18.38) {
                if (inputs[12] < 8.885) {
                    if (inputs[6] < -33.545036) {
                        var198 = 0.020088973;
                    } else {
                        if (inputs[23] < 18.45) {
                            var198 = -0.026453454;
                        } else {
                            var198 = 0.020248817;
                        }
                    }
                } else {
                    if (inputs[9] < 29.09266) {
                        var198 = 0.046722513;
                    } else {
                        var198 = 0.010394892;
                    }
                }
            } else {
                var198 = -0.03126105;
            }
        }
    }
    double var199;
    if (inputs[18] < -20.79) {
        var199 = -0.029249407;
    } else {
        if (inputs[2] < 0.94714284) {
            var199 = 0.033727612;
        } else {
            if (inputs[10] < 2.475) {
                if (inputs[18] < 1.665) {
                    if (inputs[24] < -35.554955) {
                        if (inputs[24] < -44.052036) {
                            var199 = -0.020299492;
                        } else {
                            var199 = 0.031117769;
                        }
                    } else {
                        if (inputs[3] < -0.37495586) {
                            var199 = -0.01621546;
                        } else {
                            var199 = -0.06235585;
                        }
                    }
                } else {
                    if (inputs[18] < 13.215) {
                        if (inputs[17] < 3.3575156) {
                            var199 = 0.0032106976;
                        } else {
                            var199 = 0.044779077;
                        }
                    } else {
                        var199 = -0.021134173;
                    }
                }
            } else {
                if (inputs[18] < 3.245) {
                    if (inputs[13] < 2.045) {
                        if (inputs[24] < -25.979107) {
                            var199 = 0.026925707;
                        } else {
                            var199 = 0.061297815;
                        }
                    } else {
                        var199 = 0.00049586484;
                    }
                } else {
                    var199 = -0.018883241;
                }
            }
        }
    }
    double var200;
    if (inputs[24] < -32.12054) {
        if (inputs[14] < 0.900207) {
            if (inputs[3] < 1.6006042) {
                if (inputs[1] < 31.125147) {
                    if (inputs[1] < 25.699049) {
                        var200 = 0.02617755;
                    } else {
                        var200 = -0.025672654;
                    }
                } else {
                    var200 = 0.04308132;
                }
            } else {
                var200 = 0.055742428;
            }
        } else {
            if (inputs[10] < 1.5175) {
                var200 = 0.028776394;
            } else {
                var200 = -0.027432177;
            }
        }
    } else {
        if (inputs[18] < -3.775) {
            var200 = -0.029517727;
        } else {
            if (inputs[21] < 18.95843) {
                if (inputs[6] < -30.142841) {
                    var200 = 0.04790844;
                } else {
                    if (inputs[13] < 0.38) {
                        var200 = -0.018210007;
                    } else {
                        if (inputs[1] < 63.736034) {
                            var200 = 0.044982266;
                        } else {
                            var200 = -0.002205091;
                        }
                    }
                }
            } else {
                if (inputs[20] < 8.0) {
                    var200 = -0.03676378;
                } else {
                    if (inputs[10] < 1.505) {
                        if (inputs[10] < 0.73) {
                            var200 = -0.01369391;
                        } else {
                            var200 = 0.041587133;
                        }
                    } else {
                        if (inputs[18] < 3.675) {
                            var200 = 0.0128309;
                        } else {
                            var200 = -0.032953117;
                        }
                    }
                }
            }
        }
    }
    double var201;
    if (inputs[18] < -20.79) {
        var201 = -0.043586403;
    } else {
        if (inputs[21] < 19.24022) {
            if (inputs[7] < 10.280934) {
                if (inputs[7] < 2.8597767) {
                    if (inputs[16] < -4.079233) {
                        var201 = -0.035315998;
                    } else {
                        if (inputs[16] < -2.549456) {
                            var201 = 0.031946365;
                        } else {
                            var201 = -0.021869853;
                        }
                    }
                } else {
                    var201 = 0.052857183;
                }
            } else {
                if (inputs[7] < 19.951187) {
                    var201 = -0.04523062;
                } else {
                    var201 = -0.007815149;
                }
            }
        } else {
            if (inputs[13] < 1.9) {
                if (inputs[20] < 11.0) {
                    var201 = -0.006951482;
                } else {
                    if (inputs[13] < -3.355) {
                        if (inputs[14] < 1.0304013) {
                            var201 = 0.04285417;
                        } else {
                            var201 = -0.0072811544;
                        }
                    } else {
                        var201 = 0.053953364;
                    }
                }
            } else {
                if (inputs[21] < 20.030624) {
                    var201 = 0.019535404;
                } else {
                    if (inputs[16] < 3.1214225) {
                        var201 = -0.053435747;
                    } else {
                        var201 = 0.0155766085;
                    }
                }
            }
        }
    }
    double var202;
    if (inputs[2] < 0.96428573) {
        var202 = 0.03076166;
    } else {
        if (inputs[6] < -59.855896) {
            var202 = -0.031800333;
        } else {
            if (inputs[6] < -50.573925) {
                var202 = 0.035334382;
            } else {
                if (inputs[16] < -2.8160467) {
                    if (inputs[8] < 2.503896) {
                        if (inputs[13] < -8.095) {
                            var202 = 0.023511594;
                        } else {
                            var202 = -0.025181968;
                        }
                    } else {
                        var202 = -0.04584229;
                    }
                } else {
                    if (inputs[10] < 1.19) {
                        if (inputs[12] < 11.485) {
                            var202 = 0.009529653;
                        } else {
                            var202 = 0.053870197;
                        }
                    } else {
                        if (inputs[4] < -1.8869901) {
                            var202 = 0.028962655;
                        } else {
                            var202 = -0.010069243;
                        }
                    }
                }
            }
        }
    }
    double var203;
    if (inputs[18] < -12.56) {
        if (inputs[6] < -14.196849) {
            var203 = -0.03974959;
        } else {
            var203 = 0.0015474301;
        }
    } else {
        if (inputs[6] < 21.11371) {
            if (inputs[7] < -24.802465) {
                var203 = 0.039119847;
            } else {
                if (inputs[8] < 2.495549) {
                    if (inputs[9] < 33.99573) {
                        if (inputs[9] < 28.561193) {
                            var203 = -0.008431119;
                        } else {
                            var203 = 0.037311576;
                        }
                    } else {
                        var203 = -0.03738118;
                    }
                } else {
                    if (inputs[8] < 2.5004926) {
                        var203 = 0.039584167;
                    } else {
                        if (inputs[6] < -29.362022) {
                            var203 = 0.02540285;
                        } else {
                            var203 = -0.0069566616;
                        }
                    }
                }
            }
        } else {
            var203 = -0.024124777;
        }
    }
    double var204;
    if (inputs[12] < 19.375) {
        if (inputs[12] < 15.07) {
            if (inputs[8] < 2.2323945) {
                var204 = 0.03032808;
            } else {
                if (inputs[6] < 6.9063735) {
                    if (inputs[9] < 24.675793) {
                        if (inputs[8] < 2.4992125) {
                            var204 = -0.012064177;
                        } else {
                            var204 = 0.032118782;
                        }
                    } else {
                        if (inputs[2] < 2.7042856) {
                            var204 = -0.018038085;
                        } else {
                            var204 = 0.022363653;
                        }
                    }
                } else {
                    if (inputs[3] < 0.06041935) {
                        var204 = 0.040651754;
                    } else {
                        var204 = -0.0031692567;
                    }
                }
            }
        } else {
            var204 = 0.03693504;
        }
    } else {
        var204 = -0.026946671;
    }
    double var205;
    if (inputs[18] < 17.42) {
        if (inputs[21] < 17.89761) {
            if (inputs[8] < 2.4939435) {
                var205 = 0.033964567;
            } else {
                if (inputs[20] < 13.0) {
                    var205 = 0.031000776;
                } else {
                    var205 = -0.024691032;
                }
            }
        } else {
            if (inputs[1] < 35.795807) {
                if (inputs[18] < -12.56) {
                    var205 = -0.022128057;
                } else {
                    if (inputs[2] < 1.2278571) {
                        var205 = -0.022378605;
                    } else {
                        if (inputs[24] < -48.674213) {
                            var205 = 0.020076515;
                        } else {
                            var205 = 0.056950826;
                        }
                    }
                }
            } else {
                if (inputs[21] < 19.24022) {
                    if (inputs[3] < -0.29775542) {
                        var205 = -0.067047276;
                    } else {
                        var205 = -0.020047165;
                    }
                } else {
                    if (inputs[7] < 9.992777) {
                        var205 = -0.031834487;
                    } else {
                        if (inputs[16] < 3.2650025) {
                            var205 = 0.03040508;
                        } else {
                            var205 = -0.010652029;
                        }
                    }
                }
            }
        }
    } else {
        var205 = -0.036673393;
    }
    double var206;
    if (inputs[2] < 2.78) {
        if (inputs[9] < 55.74809) {
            if (inputs[24] < 49.703682) {
                if (inputs[15] < 2.187871) {
                    if (inputs[10] < 1.19) {
                        if (inputs[3] < 0.796546) {
                            var206 = -0.008965355;
                        } else {
                            var206 = 0.03371414;
                        }
                    } else {
                        if (inputs[1] < 63.18165) {
                            var206 = -0.007329425;
                        } else {
                            var206 = -0.04757248;
                        }
                    }
                } else {
                    var206 = 0.022716437;
                }
            } else {
                if (inputs[14] < 0.62250423) {
                    var206 = -0.0178178;
                } else {
                    var206 = -0.045106173;
                }
            }
        } else {
            var206 = 0.025017759;
        }
    } else {
        if (inputs[6] < -6.8828635) {
            var206 = 0.041951016;
        } else {
            var206 = 0.009771005;
        }
    }
    double var207;
    if (inputs[7] < 28.382496) {
        if (inputs[10] < 0.19) {
            var207 = 0.034515448;
        } else {
            if (inputs[21] < 15.992029) {
                var207 = -0.031134399;
            } else {
                if (inputs[8] < 2.5723076) {
                    if (inputs[2] < 2.732143) {
                        if (inputs[14] < 0.5948336) {
                            var207 = 0.030730678;
                        } else {
                            var207 = 0.0009743454;
                        }
                    } else {
                        if (inputs[3] < -0.04057971) {
                            var207 = 0.05609911;
                        } else {
                            var207 = 0.015325628;
                        }
                    }
                } else {
                    if (inputs[8] < 2.654348) {
                        var207 = -0.05292832;
                    } else {
                        var207 = 0.010322097;
                    }
                }
            }
        }
    } else {
        var207 = -0.03205074;
    }
    double var208;
    if (inputs[2] < 2.9728572) {
        if (inputs[6] < -65.73123) {
            var208 = -0.02626921;
        } else {
            if (inputs[1] < 26.495476) {
                var208 = 0.034155115;
            } else {
                if (inputs[17] < -1.9386458) {
                    if (inputs[20] < 18.0) {
                        if (inputs[21] < 19.001408) {
                            var208 = 0.005809222;
                        } else {
                            var208 = -0.044820197;
                        }
                    } else {
                        var208 = 0.03808373;
                    }
                } else {
                    if (inputs[20] < 18.0) {
                        if (inputs[16] < 1.3293198) {
                            var208 = 0.041573163;
                        } else {
                            var208 = 0.008761701;
                        }
                    } else {
                        var208 = -0.024253108;
                    }
                }
            }
        }
    } else {
        var208 = -0.030838266;
    }
    double var209;
    if (inputs[14] < 1.4340266) {
        if (inputs[21] < 22.099243) {
            if (inputs[3] < 1.6006042) {
                if (inputs[4] < 3.369159) {
                    if (inputs[6] < -55.599304) {
                        var209 = -0.05097615;
                    } else {
                        if (inputs[14] < 1.0921121) {
                            var209 = -0.0016398388;
                        } else {
                            var209 = -0.033030752;
                        }
                    }
                } else {
                    if (inputs[14] < 0.6585674) {
                        var209 = 0.017187905;
                    } else {
                        var209 = 0.025668645;
                    }
                }
            } else {
                var209 = 0.03499637;
            }
        } else {
            var209 = -0.030581828;
        }
    } else {
        if (inputs[17] < 1.1980937) {
            var209 = -0.008379712;
        } else {
            var209 = 0.038194597;
        }
    }
    double var210;
    if (inputs[16] < 6.2990365) {
        if (inputs[21] < 22.972445) {
            if (inputs[20] < 12.0) {
                if (inputs[8] < 2.5446622) {
                    if (inputs[3] < 1.1718025) {
                        if (inputs[4] < 2.6114955) {
                            var210 = -0.031303074;
                        } else {
                            var210 = 0.018704856;
                        }
                    } else {
                        var210 = 0.04213518;
                    }
                } else {
                    var210 = 0.04105043;
                }
            } else {
                if (inputs[3] < -1.1184866) {
                    if (inputs[14] < 1.0409759) {
                        var210 = 0.03783046;
                    } else {
                        var210 = -0.016514294;
                    }
                } else {
                    if (inputs[2] < 3.1442857) {
                        if (inputs[2] < 2.195) {
                            var210 = -0.012935274;
                        } else {
                            var210 = -0.046462588;
                        }
                    } else {
                        var210 = 0.023041414;
                    }
                }
            }
        } else {
            var210 = 0.03363894;
        }
    } else {
        var210 = -0.036564596;
    }
    double var211;
    if (inputs[9] < 55.74809) {
        if (inputs[1] < 36.326664) {
            if (inputs[7] < -13.9633875) {
                if (inputs[4] < -3.0357554) {
                    if (inputs[7] < -23.013718) {
                        var211 = -0.005433795;
                    } else {
                        var211 = 0.052118596;
                    }
                } else {
                    if (inputs[6] < -2.358174) {
                        var211 = -0.043616705;
                    } else {
                        var211 = 0.005974668;
                    }
                }
            } else {
                var211 = 0.029356796;
            }
        } else {
            if (inputs[18] < -4.73) {
                var211 = -0.044922132;
            } else {
                if (inputs[9] < 34.908962) {
                    if (inputs[21] < 20.890009) {
                        if (inputs[7] < 10.666371) {
                            var211 = 0.016440075;
                        } else {
                            var211 = -0.015162899;
                        }
                    } else {
                        var211 = 0.026292376;
                    }
                } else {
                    if (inputs[20] < 13.0) {
                        var211 = -0.04276385;
                    } else {
                        var211 = -0.007292947;
                    }
                }
            }
        }
    } else {
        var211 = 0.027924359;
    }
    double var212;
    if (inputs[8] < 2.4578314) {
        if (inputs[7] < -4.394179) {
            if (inputs[17] < -3.806888) {
                var212 = 0.021805773;
            } else {
                var212 = -0.025149012;
            }
        } else {
            if (inputs[2] < 1.9007143) {
                var212 = 0.013329008;
            } else {
                var212 = 0.059082225;
            }
        }
    } else {
        if (inputs[3] < 1.2750442) {
            if (inputs[6] < -54.69902) {
                var212 = -0.03764924;
            } else {
                if (inputs[3] < 0.84939736) {
                    if (inputs[1] < 31.125147) {
                        var212 = -0.030467449;
                    } else {
                        if (inputs[24] < -36.201096) {
                            var212 = 0.030719634;
                        } else {
                            var212 = -0.0038301176;
                        }
                    }
                } else {
                    var212 = 0.035973366;
                }
            }
        } else {
            var212 = -0.035203774;
        }
    }
    double var213;
    if (inputs[7] < -20.653982) {
        if (inputs[9] < 38.229794) {
            var213 = 0.0041719787;
        } else {
            var213 = 0.0510554;
        }
    } else {
        if (inputs[6] < -29.362022) {
            if (inputs[6] < -35.493023) {
                if (inputs[14] < 0.74342716) {
                    if (inputs[20] < 10.0) {
                        var213 = -0.0012216865;
                    } else {
                        var213 = 0.039787725;
                    }
                } else {
                    var213 = -0.030940615;
                }
            } else {
                var213 = 0.04194282;
            }
        } else {
            if (inputs[3] < 1.2750442) {
                if (inputs[15] < -2.303562) {
                    var213 = 0.029120564;
                } else {
                    if (inputs[4] < -1.9720739) {
                        var213 = -0.05429729;
                    } else {
                        if (inputs[9] < 24.102951) {
                            var213 = 0.023230132;
                        } else {
                            var213 = -0.01438734;
                        }
                    }
                }
            } else {
                var213 = -0.049853485;
            }
        }
    }
    double var214;
    if (inputs[12] < 1.645) {
        if (inputs[12] < 0.54) {
            if (inputs[8] < 2.402556) {
                if (inputs[10] < 1.4825) {
                    var214 = 0.039475314;
                } else {
                    var214 = 0.0024391224;
                }
            } else {
                if (inputs[8] < 2.4850543) {
                    var214 = -0.031235335;
                } else {
                    if (inputs[21] < 18.264791) {
                        var214 = -0.015291951;
                    } else {
                        if (inputs[3] < 1.1750138) {
                            var214 = 0.0022690622;
                        } else {
                            var214 = 0.040243905;
                        }
                    }
                }
            }
        } else {
            var214 = 0.03932089;
        }
    } else {
        if (inputs[9] < 36.297005) {
            if (inputs[3] < -0.27097872) {
                if (inputs[9] < 25.651636) {
                    var214 = -0.014224633;
                } else {
                    var214 = -0.05860561;
                }
            } else {
                if (inputs[6] < -14.363215) {
                    var214 = -0.034638803;
                } else {
                    var214 = 0.023716563;
                }
            }
        } else {
            if (inputs[3] < -0.5083069) {
                var214 = 0.033319056;
            } else {
                var214 = -0.020026993;
            }
        }
    }
    double var215;
    if (inputs[10] < 0.755) {
        if (inputs[3] < 0.69257766) {
            if (inputs[24] < 27.695694) {
                var215 = -0.05623441;
            } else {
                var215 = 0.0053137257;
            }
        } else {
            var215 = 0.009165484;
        }
    } else {
        if (inputs[8] < 2.668493) {
            if (inputs[10] < 1.19) {
                if (inputs[2] < 1.5785714) {
                    var215 = -0.0018493314;
                } else {
                    var215 = 0.042833596;
                }
            } else {
                if (inputs[21] < 21.111582) {
                    if (inputs[23] < 29.685) {
                        if (inputs[19] < 4.0) {
                            var215 = 0.011375303;
                        } else {
                            var215 = -0.024145393;
                        }
                    } else {
                        var215 = -0.022381172;
                    }
                } else {
                    var215 = -0.028605025;
                }
            }
        } else {
            var215 = 0.031206561;
        }
    }
    double var216;
    if (inputs[24] < -47.42504) {
        if (inputs[9] < 34.125217) {
            var216 = -0.046595868;
        } else {
            if (inputs[8] < 2.4973752) {
                var216 = -0.027206453;
            } else {
                var216 = 0.02745906;
            }
        }
    } else {
        if (inputs[9] < 45.721573) {
            if (inputs[6] < -32.103245) {
                if (inputs[6] < -37.702194) {
                    if (inputs[12] < -8.09) {
                        var216 = 0.03407228;
                    } else {
                        var216 = -0.014913552;
                    }
                } else {
                    var216 = 0.042392697;
                }
            } else {
                if (inputs[3] < 0.19802953) {
                    if (inputs[3] < -0.16443706) {
                        if (inputs[21] < 20.111471) {
                            var216 = -0.014390948;
                        } else {
                            var216 = 0.02750568;
                        }
                    } else {
                        var216 = 0.0475029;
                    }
                } else {
                    if (inputs[6] < -3.9755354) {
                        var216 = -0.049506795;
                    } else {
                        if (inputs[9] < 23.660772) {
                            var216 = 0.026374375;
                        } else {
                            var216 = -0.020713856;
                        }
                    }
                }
            }
        } else {
            var216 = -0.02333937;
        }
    }
    double var217;
    if (inputs[16] < -5.0933933) {
        var217 = -0.025948236;
    } else {
        if (inputs[10] < 2.2675) {
            if (inputs[18] < 1.46) {
                if (inputs[16] < 1.1102768) {
                    if (inputs[14] < 0.7803881) {
                        var217 = -0.027654057;
                    } else {
                        if (inputs[9] < 24.870266) {
                            var217 = -0.025341056;
                        } else {
                            var217 = 0.030016169;
                        }
                    }
                } else {
                    var217 = -0.046056654;
                }
            } else {
                if (inputs[9] < 28.116417) {
                    var217 = 0.032600366;
                } else {
                    if (inputs[9] < 40.83275) {
                        var217 = -0.027266497;
                    } else {
                        var217 = 0.026659355;
                    }
                }
            }
        } else {
            if (inputs[16] < -1.767999) {
                var217 = 0.036563564;
            } else {
                if (inputs[9] < 32.857857) {
                    if (inputs[10] < 3.4925) {
                        var217 = 0.011197789;
                    } else {
                        var217 = -0.03603222;
                    }
                } else {
                    var217 = 0.031467706;
                }
            }
        }
    }
    double var218;
    if (inputs[20] < 4.0) {
        var218 = -0.034573466;
    } else {
        if (inputs[6] < -32.626118) {
            if (inputs[10] < 2.685) {
                if (inputs[6] < -36.984165) {
                    if (inputs[9] < 35.4477) {
                        var218 = 0.02522928;
                    } else {
                        var218 = -0.0067318548;
                    }
                } else {
                    var218 = 0.049346894;
                }
            } else {
                var218 = -0.014390256;
            }
        } else {
            if (inputs[20] < 15.0) {
                if (inputs[9] < 34.646156) {
                    if (inputs[21] < 20.003363) {
                        var218 = -0.014036472;
                    } else {
                        var218 = -0.06139407;
                    }
                } else {
                    var218 = 0.00507309;
                }
            } else {
                if (inputs[10] < 0.4625) {
                    var218 = 0.042612802;
                } else {
                    if (inputs[13] < 10.7) {
                        if (inputs[24] < 47.539116) {
                            var218 = -0.018421458;
                        } else {
                            var218 = 0.020728406;
                        }
                    } else {
                        var218 = 0.028144438;
                    }
                }
            }
        }
    }
    double var219;
    if (inputs[13] < -16.35) {
        if (inputs[20] < 13.0) {
            var219 = -0.008197369;
        } else {
            var219 = 0.041289173;
        }
    } else {
        if (inputs[12] < -8.61) {
            if (inputs[3] < 0.7862127) {
                var219 = -0.049796995;
            } else {
                var219 = -0.001561988;
            }
        } else {
            if (inputs[8] < 2.5004926) {
                if (inputs[13] < -5.445) {
                    var219 = 0.050467514;
                } else {
                    if (inputs[24] < 46.83002) {
                        if (inputs[10] < 2.07) {
                            var219 = -0.021917213;
                        } else {
                            var219 = 0.015119009;
                        }
                    } else {
                        var219 = 0.024195116;
                    }
                }
            } else {
                if (inputs[13] < -2.77) {
                    var219 = -0.0328091;
                } else {
                    if (inputs[24] < 52.189053) {
                        if (inputs[2] < 1.8114285) {
                            var219 = 0.021334657;
                        } else {
                            var219 = -0.017814044;
                        }
                    } else {
                        var219 = -0.032548305;
                    }
                }
            }
        }
    }
    double var220;
    if (inputs[18] < 17.42) {
        if (inputs[20] < 15.0) {
            if (inputs[12] < 1.01) {
                if (inputs[10] < 1.3375) {
                    if (inputs[19] < 3.0) {
                        var220 = -0.04993472;
                    } else {
                        var220 = -0.0008847984;
                    }
                } else {
                    if (inputs[16] < -2.0970223) {
                        var220 = -0.005852749;
                    } else {
                        var220 = 0.045814205;
                    }
                }
            } else {
                if (inputs[14] < 0.70156413) {
                    var220 = 0.0121625615;
                } else {
                    if (inputs[12] < 8.93) {
                        var220 = 0.05488051;
                    } else {
                        var220 = 0.024118254;
                    }
                }
            }
        } else {
            if (inputs[9] < 20.579927) {
                var220 = -0.049718253;
            } else {
                if (inputs[8] < 2.4878378) {
                    if (inputs[3] < -0.234652) {
                        var220 = 0.037776936;
                    } else {
                        var220 = -0.008471554;
                    }
                } else {
                    if (inputs[20] < 18.0) {
                        if (inputs[14] < 1.1276487) {
                            var220 = 0.030495424;
                        } else {
                            var220 = -0.020513467;
                        }
                    } else {
                        var220 = -0.042434756;
                    }
                }
            }
        }
    } else {
        var220 = -0.030910281;
    }
    double var221;
    if (inputs[12] < 16.705) {
        if (inputs[9] < 19.683298) {
            var221 = 0.025763879;
        } else {
            if (inputs[7] < 18.586319) {
                if (inputs[8] < 2.5661972) {
                    if (inputs[17] < 4.0363727) {
                        if (inputs[3] < 1.0302223) {
                            var221 = 0.0016412338;
                        } else {
                            var221 = -0.021564633;
                        }
                    } else {
                        var221 = -0.044623367;
                    }
                } else {
                    if (inputs[17] < -1.4025668) {
                        var221 = -0.01896064;
                    } else {
                        var221 = -0.056346077;
                    }
                }
            } else {
                if (inputs[1] < 69.5182) {
                    var221 = 0.04161437;
                } else {
                    var221 = -0.0113263065;
                }
            }
        }
    } else {
        if (inputs[3] < -0.75934255) {
            var221 = 0.042510096;
        } else {
            var221 = -0.0010754443;
        }
    }
    double var222;
    if (inputs[17] < 6.9677625) {
        if (inputs[1] < 74.59002) {
            if (inputs[14] < 1.6734459) {
                if (inputs[14] < 1.4453136) {
                    if (inputs[21] < 17.1775) {
                        if (inputs[10] < 0.815) {
                            var222 = 0.016480168;
                        } else {
                            var222 = -0.03473305;
                        }
                    } else {
                        if (inputs[10] < 0.3525) {
                            var222 = -0.021743067;
                        } else {
                            var222 = 0.011254674;
                        }
                    }
                } else {
                    var222 = -0.03544614;
                }
            } else {
                var222 = 0.030568754;
            }
        } else {
            var222 = -0.029662145;
        }
    } else {
        var222 = 0.030461675;
    }
    double var223;
    if (inputs[16] < -5.819462) {
        var223 = -0.026484475;
    } else {
        if (inputs[13] < -2.365) {
            if (inputs[12] < -4.85) {
                if (inputs[17] < -2.4848874) {
                    if (inputs[16] < -3.7433846) {
                        var223 = 0.0013635753;
                    } else {
                        var223 = 0.03159671;
                    }
                } else {
                    if (inputs[23] < 18.45) {
                        var223 = -0.041463964;
                    } else {
                        var223 = 0.015156915;
                    }
                }
            } else {
                var223 = 0.039653134;
            }
        } else {
            if (inputs[2] < 1.09) {
                var223 = -0.037751522;
            } else {
                if (inputs[8] < 2.4304206) {
                    var223 = -0.022493826;
                } else {
                    if (inputs[8] < 2.50028) {
                        if (inputs[14] < 0.97779757) {
                            var223 = 0.050305955;
                        } else {
                            var223 = 0.014590493;
                        }
                    } else {
                        if (inputs[8] < 2.5246828) {
                            var223 = -0.034049686;
                        } else {
                            var223 = 0.009584866;
                        }
                    }
                }
            }
        }
    }
    double var224;
    if (inputs[21] < 18.779856) {
        if (inputs[20] < 5.0) {
            var224 = 0.045302257;
        } else {
            if (inputs[13] < 7.715) {
                if (inputs[3] < 0.052936934) {
                    if (inputs[3] < -0.8732041) {
                        var224 = 0.0058374056;
                    } else {
                        var224 = 0.051141977;
                    }
                } else {
                    if (inputs[16] < -1.8456687) {
                        var224 = 0.021159595;
                    } else {
                        var224 = -0.035175707;
                    }
                }
            } else {
                var224 = -0.028234486;
            }
        }
    } else {
        if (inputs[21] < 19.24022) {
            var224 = -0.056459926;
        } else {
            if (inputs[3] < -1.6227406) {
                var224 = 0.038920123;
            } else {
                if (inputs[6] < -52.23459) {
                    var224 = 0.025950834;
                } else {
                    if (inputs[2] < 1.2392857) {
                        var224 = -0.04186373;
                    } else {
                        if (inputs[24] < 52.531895) {
                            var224 = -0.010525706;
                        } else {
                            var224 = 0.02683819;
                        }
                    }
                }
            }
        }
    }
    double var225;
    if (inputs[6] < -51.03597) {
        if (inputs[15] < -2.5482912) {
            var225 = -0.007789219;
        } else {
            var225 = 0.033868615;
        }
    } else {
        if (inputs[17] < -4.5978775) {
            var225 = -0.028096296;
        } else {
            if (inputs[20] < 10.0) {
                if (inputs[10] < 1.3375) {
                    var225 = -0.05073788;
                } else {
                    var225 = 0.0029022126;
                }
            } else {
                if (inputs[8] < 2.5841584) {
                    if (inputs[16] < -3.3336759) {
                        var225 = 0.029637033;
                    } else {
                        if (inputs[21] < 20.176733) {
                            var225 = 0.0011862268;
                        } else {
                            var225 = -0.025257725;
                        }
                    }
                } else {
                    var225 = 0.027206574;
                }
            }
        }
    }
    double var226;
    if (inputs[17] < -5.394068) {
        var226 = 0.037651073;
    } else {
        if (inputs[6] < 10.910757) {
            if (inputs[17] < -2.84417) {
                if (inputs[8] < 2.3963253) {
                    var226 = 0.04672313;
                } else {
                    if (inputs[3] < 0.84939736) {
                        var226 = -0.009789708;
                    } else {
                        var226 = 0.029214738;
                    }
                }
            } else {
                if (inputs[13] < 13.07) {
                    if (inputs[3] < -0.5177981) {
                        if (inputs[17] < 3.512051) {
                            var226 = -0.038644508;
                        } else {
                            var226 = -0.004948425;
                        }
                    } else {
                        if (inputs[3] < -0.24402282) {
                            var226 = 0.04214119;
                        } else {
                            var226 = -0.009941571;
                        }
                    }
                } else {
                    if (inputs[3] < -0.72686684) {
                        var226 = 0.042765796;
                    } else {
                        var226 = -0.010675415;
                    }
                }
            }
        } else {
            var226 = -0.02574091;
        }
    }
    double var227;
    if (inputs[18] < -12.56) {
        if (inputs[7] < -12.202692) {
            var227 = -0.026266007;
        } else {
            var227 = 0.0058120675;
        }
    } else {
        if (inputs[12] < -14.43) {
            var227 = 0.040408667;
        } else {
            if (inputs[12] < -4.85) {
                if (inputs[13] < -6.595) {
                    if (inputs[17] < -2.84417) {
                        var227 = 0.033754583;
                    } else {
                        var227 = -0.02183548;
                    }
                } else {
                    var227 = -0.0420725;
                }
            } else {
                if (inputs[13] < -3.675) {
                    var227 = 0.055230558;
                } else {
                    if (inputs[7] < -22.04852) {
                        var227 = 0.031324547;
                    } else {
                        if (inputs[17] < -2.45) {
                            var227 = -0.041173972;
                        } else {
                            var227 = 0.0058397367;
                        }
                    }
                }
            }
        }
    }
    double var228;
    if (inputs[20] < 5.0) {
        if (inputs[2] < 1.0985714) {
            var228 = -0.0031505849;
        } else {
            var228 = 0.03941052;
        }
    } else {
        if (inputs[6] < -53.761097) {
            var228 = -0.032826655;
        } else {
            if (inputs[13] < -16.35) {
                var228 = 0.028114174;
            } else {
                if (inputs[10] < 2.2675) {
                    if (inputs[3] < -0.005653874) {
                        if (inputs[9] < 30.502996) {
                            var228 = 0.01931662;
                        } else {
                            var228 = -0.012557773;
                        }
                    } else {
                        if (inputs[6] < -32.103245) {
                            var228 = 0.01585636;
                        } else {
                            var228 = -0.03808626;
                        }
                    }
                } else {
                    if (inputs[3] < -0.09276572) {
                        var228 = -0.007782001;
                    } else {
                        if (inputs[10] < 3.0125) {
                            var228 = 0.057602063;
                        } else {
                            var228 = 0.0022175778;
                        }
                    }
                }
            }
        }
    }
    double var229;
    if (inputs[18] < 17.42) {
        if (inputs[8] < 2.4850543) {
            if (inputs[1] < 64.21748) {
                if (inputs[1] < 31.216616) {
                    var229 = -0.014523387;
                } else {
                    if (inputs[17] < -2.84417) {
                        var229 = 0.046051126;
                    } else {
                        var229 = 0.002547665;
                    }
                }
            } else {
                var229 = -0.02943047;
            }
        } else {
            if (inputs[13] < 12.43) {
                if (inputs[13] < 7.715) {
                    if (inputs[13] < 0.0) {
                        if (inputs[9] < 24.675793) {
                            var229 = 0.032502852;
                        } else {
                            var229 = -0.0015680552;
                        }
                    } else {
                        if (inputs[18] < 1.665) {
                            var229 = 0.044421956;
                        } else {
                            var229 = 0.011583582;
                        }
                    }
                } else {
                    var229 = -0.027425613;
                }
            } else {
                var229 = 0.04655491;
            }
        }
    } else {
        var229 = -0.01998537;
    }
    double var230;
    if (inputs[19] < 5.0) {
        if (inputs[10] < 1.5175) {
            if (inputs[17] < 3.512051) {
                if (inputs[23] < 20.31) {
                    if (inputs[21] < 21.111582) {
                        if (inputs[1] < 30.82347) {
                            var230 = -0.014235311;
                        } else {
                            var230 = 0.023383344;
                        }
                    } else {
                        var230 = -0.017713381;
                    }
                } else {
                    var230 = -0.035330396;
                }
            } else {
                if (inputs[9] < 30.69265) {
                    var230 = 0.06326306;
                } else {
                    var230 = 0.0110307885;
                }
            }
        } else {
            if (inputs[18] < 8.43) {
                if (inputs[14] < 1.2093482) {
                    if (inputs[9] < 27.667595) {
                        var230 = -0.03206307;
                    } else {
                        if (inputs[20] < 13.0) {
                            var230 = 0.024519293;
                        } else {
                            var230 = -0.024048744;
                        }
                    }
                } else {
                    var230 = 0.02605964;
                }
            } else {
                var230 = -0.03837644;
            }
        }
    } else {
        var230 = 0.039784342;
    }
    double var231;
    if (inputs[6] < -54.69902) {
        var231 = -0.021537166;
    } else {
        if (inputs[9] < 55.74809) {
            if (inputs[3] < 1.2750442) {
                if (inputs[13] < -15.83) {
                    var231 = 0.04015907;
                } else {
                    if (inputs[10] < 2.1725) {
                        if (inputs[10] < 1.725) {
                            var231 = 0.003401536;
                        } else {
                            var231 = -0.037905928;
                        }
                    } else {
                        if (inputs[2] < 1.7214285) {
                            var231 = 0.046513144;
                        } else {
                            var231 = 0.011229047;
                        }
                    }
                }
            } else {
                if (inputs[7] < -9.592173) {
                    var231 = 0.0017795231;
                } else {
                    var231 = -0.03827608;
                }
            }
        } else {
            var231 = 0.046329815;
        }
    }
    double var232;
    if (inputs[14] < 0.9395015) {
        if (inputs[3] < 0.718797) {
            if (inputs[12] < 2.525) {
                if (inputs[19] < 3.0) {
                    var232 = -0.016714025;
                } else {
                    var232 = 0.019807575;
                }
            } else {
                if (inputs[9] < 34.646156) {
                    var232 = 0.002858838;
                } else {
                    var232 = 0.05428821;
                }
            }
        } else {
            if (inputs[9] < 33.038826) {
                var232 = 0.006137805;
            } else {
                var232 = -0.034965914;
            }
        }
    } else {
        if (inputs[20] < 17.0) {
            if (inputs[21] < 21.111582) {
                if (inputs[21] < 19.593027) {
                    if (inputs[14] < 1.1190472) {
                        var232 = -0.005372577;
                    } else {
                        var232 = -0.048756834;
                    }
                } else {
                    var232 = 0.02379017;
                }
            } else {
                var232 = -0.056054395;
            }
        } else {
            if (inputs[9] < 30.01205) {
                var232 = -0.012422243;
            } else {
                var232 = 0.026964096;
            }
        }
    }
    double var233;
    if (inputs[10] < 1.21) {
        if (inputs[2] < 1.4957143) {
            if (inputs[23] < -4.89) {
                var233 = -0.024024336;
            } else {
                if (inputs[8] < 2.50028) {
                    var233 = 0.043175787;
                } else {
                    var233 = -0.013811617;
                }
            }
        } else {
            if (inputs[2] < 1.7892857) {
                var233 = 0.05656114;
            } else {
                if (inputs[21] < 19.24022) {
                    var233 = -0.011238248;
                } else {
                    var233 = 0.03336012;
                }
            }
        }
    } else {
        if (inputs[16] < -5.0933933) {
            var233 = -0.035385776;
        } else {
            if (inputs[7] < -12.705485) {
                if (inputs[7] < -18.032585) {
                    var233 = 0.0013856564;
                } else {
                    var233 = 0.03706469;
                }
            } else {
                if (inputs[2] < 2.9728572) {
                    if (inputs[2] < 1.9285715) {
                        if (inputs[8] < 2.4942086) {
                            var233 = -0.038712583;
                        } else {
                            var233 = 0.0075005293;
                        }
                    } else {
                        var233 = 0.017942192;
                    }
                } else {
                    var233 = -0.039289966;
                }
            }
        }
    }
    double var234;
    if (inputs[9] < 48.442818) {
        if (inputs[21] < 17.730051) {
            if (inputs[7] < 15.716133) {
                if (inputs[1] < 37.426617) {
                    var234 = 0.028550617;
                } else {
                    var234 = -0.015130441;
                }
            } else {
                var234 = 0.048720233;
            }
        } else {
            if (inputs[8] < 2.4968152) {
                if (inputs[23] < -3.135) {
                    var234 = -0.03600929;
                } else {
                    if (inputs[15] < 1.4073203) {
                        var234 = 0.022041235;
                    } else {
                        var234 = -0.025972078;
                    }
                }
            } else {
                if (inputs[10] < 0.7075) {
                    var234 = -0.017252363;
                } else {
                    if (inputs[12] < -9.945) {
                        var234 = 0.05129241;
                    } else {
                        if (inputs[12] < 0.125) {
                            var234 = -0.026357783;
                        } else {
                            var234 = 0.026770122;
                        }
                    }
                }
            }
        }
    } else {
        var234 = -0.022487143;
    }
    double var235;
    if (inputs[2] < 0.96428573) {
        var235 = 0.034322694;
    } else {
        if (inputs[2] < 1.0657142) {
            var235 = -0.035535924;
        } else {
            if (inputs[9] < 27.667595) {
                if (inputs[15] < -1.715213) {
                    var235 = -0.035513416;
                } else {
                    if (inputs[10] < 0.845) {
                        var235 = 0.030936606;
                    } else {
                        if (inputs[7] < 11.585609) {
                            var235 = 0.0036448545;
                        } else {
                            var235 = -0.036072977;
                        }
                    }
                }
            } else {
                if (inputs[23] < -7.77) {
                    if (inputs[3] < 0.95593303) {
                        if (inputs[3] < 0.14538299) {
                            var235 = 0.0082188025;
                        } else {
                            var235 = 0.06334505;
                        }
                    } else {
                        var235 = -0.0009923866;
                    }
                } else {
                    if (inputs[13] < 7.025) {
                        if (inputs[8] < 2.5149052) {
                            var235 = 0.0022835268;
                        } else {
                            var235 = -0.034803767;
                        }
                    } else {
                        var235 = 0.020174194;
                    }
                }
            }
        }
    }
    double var236;
    if (inputs[16] < 6.258998) {
        if (inputs[8] < 2.4578314) {
            if (inputs[16] < 2.4337265) {
                if (inputs[7] < -20.892792) {
                    var236 = 0.032487523;
                } else {
                    if (inputs[3] < 0.87841815) {
                        var236 = -0.029454963;
                    } else {
                        var236 = 0.022133075;
                    }
                }
            } else {
                var236 = 0.037290934;
            }
        } else {
            if (inputs[21] < 21.100323) {
                if (inputs[8] < 2.489796) {
                    var236 = -0.032093227;
                } else {
                    if (inputs[6] < -35.493023) {
                        var236 = -0.013373789;
                    } else {
                        if (inputs[9] < 35.515194) {
                            var236 = 0.0026617022;
                        } else {
                            var236 = 0.034482732;
                        }
                    }
                }
            } else {
                if (inputs[6] < -24.184532) {
                    var236 = -0.0036844593;
                } else {
                    var236 = -0.044304684;
                }
            }
        }
    } else {
        var236 = -0.032978036;
    }
    double var237;
    if (inputs[3] < 1.7389678) {
        if (inputs[3] < 0.00019193416) {
            if (inputs[7] < 26.336468) {
                if (inputs[13] < -11.265) {
                    var237 = -0.028170481;
                } else {
                    if (inputs[19] < 4.0) {
                        if (inputs[23] < 6.705) {
                            var237 = 0.0035093664;
                        } else {
                            var237 = 0.031253416;
                        }
                    } else {
                        var237 = -0.025217667;
                    }
                }
            } else {
                var237 = 0.03866123;
            }
        } else {
            if (inputs[13] < -12.83) {
                var237 = 0.0152555145;
            } else {
                if (inputs[19] < 4.0) {
                    if (inputs[9] < 34.76162) {
                        if (inputs[9] < 23.44496) {
                            var237 = -0.030007934;
                        } else {
                            var237 = -0.057054054;
                        }
                    } else {
                        var237 = -0.010012253;
                    }
                } else {
                    var237 = 0.013374862;
                }
            }
        }
    } else {
        var237 = 0.024983201;
    }
    double var238;
    if (inputs[16] < 5.62066) {
        if (inputs[17] < 4.8139157) {
            if (inputs[1] < 69.5182) {
                if (inputs[1] < 66.95797) {
                    if (inputs[6] < -19.270708) {
                        if (inputs[9] < 35.4477) {
                            var238 = 0.027705316;
                        } else {
                            var238 = -0.01478312;
                        }
                    } else {
                        if (inputs[23] < 9.49) {
                            var238 = 0.0036100328;
                        } else {
                            var238 = -0.046311006;
                        }
                    }
                } else {
                    var238 = 0.041753948;
                }
            } else {
                var238 = -0.021473018;
            }
        } else {
            var238 = 0.03180153;
        }
    } else {
        var238 = -0.022126494;
    }
    double var239;
    if (inputs[23] < 42.67) {
        if (inputs[2] < 1.3721429) {
            if (inputs[14] < 0.6845886) {
                if (inputs[13] < 2.53) {
                    var239 = -0.012995775;
                } else {
                    var239 = 0.02328456;
                }
            } else {
                if (inputs[7] < -3.9323542) {
                    var239 = 0.021957653;
                } else {
                    var239 = 0.0594326;
                }
            }
        } else {
            if (inputs[1] < 69.5182) {
                if (inputs[8] < 2.5661972) {
                    if (inputs[16] < -0.8394834) {
                        if (inputs[14] < 1.3022003) {
                            var239 = 0.0063472544;
                        } else {
                            var239 = -0.033897072;
                        }
                    } else {
                        if (inputs[23] < 12.495) {
                            var239 = 0.033273056;
                        } else {
                            var239 = -0.0036700228;
                        }
                    }
                } else {
                    var239 = -0.027211327;
                }
            } else {
                var239 = -0.034987528;
            }
        }
    } else {
        var239 = -0.025444929;
    }
    double var240;
    if (inputs[20] < 21.0) {
        if (inputs[10] < 3.955) {
            if (inputs[9] < 19.248732) {
                var240 = 0.03466242;
            } else {
                if (inputs[8] < 2.4561403) {
                    if (inputs[19] < 3.0) {
                        if (inputs[10] < 1.2225) {
                            var240 = 0.054835398;
                        } else {
                            var240 = 0.01736196;
                        }
                    } else {
                        var240 = -0.00873507;
                    }
                } else {
                    if (inputs[24] < 67.31584) {
                        if (inputs[18] < 3.675) {
                            var240 = 0.0043774513;
                        } else {
                            var240 = -0.02902056;
                        }
                    } else {
                        var240 = 0.028373487;
                    }
                }
            }
        } else {
            var240 = -0.022605339;
        }
    } else {
        var240 = -0.029928137;
    }
    double var241;
    if (inputs[20] < 17.0) {
        if (inputs[14] < 0.9640686) {
            if (inputs[2] < 1.1878572) {
                if (inputs[17] < 3.2921152) {
                    var241 = -0.028326042;
                } else {
                    var241 = 0.0103374915;
                }
            } else {
                if (inputs[14] < 0.69918364) {
                    var241 = 0.047976676;
                } else {
                    if (inputs[21] < 17.684254) {
                        var241 = -0.029395778;
                    } else {
                        if (inputs[14] < 0.8555737) {
                            var241 = 0.006414514;
                        } else {
                            var241 = 0.04714485;
                        }
                    }
                }
            }
        } else {
            if (inputs[19] < 3.0) {
                if (inputs[14] < 1.2650809) {
                    var241 = 0.013356814;
                } else {
                    var241 = -0.02842158;
                }
            } else {
                var241 = -0.05168709;
            }
        }
    } else {
        if (inputs[20] < 21.0) {
            if (inputs[24] < -27.924051) {
                var241 = 0.0024866585;
            } else {
                var241 = 0.04043745;
            }
        } else {
            var241 = -0.018080987;
        }
    }
    double var242;
    if (inputs[12] < -0.89) {
        if (inputs[4] < -2.9921925) {
            var242 = 0.031998854;
        } else {
            if (inputs[7] < 19.951187) {
                if (inputs[20] < 11.0) {
                    var242 = -0.051455237;
                } else {
                    if (inputs[8] < 2.453416) {
                        var242 = 0.016135057;
                    } else {
                        if (inputs[2] < 1.8742857) {
                            var242 = 0.00636488;
                        } else {
                            var242 = -0.046169613;
                        }
                    }
                }
            } else {
                var242 = 0.023945397;
            }
        }
    } else {
        if (inputs[7] < -13.114293) {
            if (inputs[6] < -0.9878631) {
                var242 = -0.015796645;
            } else {
                var242 = -0.058711603;
            }
        } else {
            if (inputs[8] < 2.4487178) {
                var242 = -0.03460505;
            } else {
                if (inputs[7] < 20.12257) {
                    if (inputs[16] < 1.9395342) {
                        var242 = 0.040323768;
                    } else {
                        var242 = 0.00820062;
                    }
                } else {
                    var242 = -0.026073761;
                }
            }
        }
    }
    double var243;
    if (inputs[16] < 5.5290422) {
        if (inputs[16] < 4.3683667) {
            if (inputs[1] < 63.736034) {
                if (inputs[16] < 1.000377) {
                    if (inputs[23] < -46.635) {
                        var243 = 0.025766572;
                    } else {
                        if (inputs[10] < 0.425) {
                            var243 = 0.023689091;
                        } else {
                            var243 = -0.009473666;
                        }
                    }
                } else {
                    var243 = 0.034522753;
                }
            } else {
                if (inputs[9] < 34.388138) {
                    if (inputs[8] < 2.502439) {
                        var243 = -0.04475879;
                    } else {
                        var243 = -0.0035315456;
                    }
                } else {
                    var243 = 0.008292231;
                }
            }
        } else {
            var243 = 0.032833263;
        }
    } else {
        var243 = -0.023494134;
    }
    double var244;
    if (inputs[9] < 24.696909) {
        if (inputs[4] < -2.3628435) {
            var244 = 0.03674109;
        } else {
            if (inputs[17] < 1.4038112) {
                if (inputs[12] < -5.165) {
                    var244 = 0.011246479;
                } else {
                    var244 = -0.035926677;
                }
            } else {
                var244 = 0.02080933;
            }
        }
    } else {
        if (inputs[17] < 6.9677625) {
            if (inputs[12] < 9.895) {
                if (inputs[12] < 2.525) {
                    if (inputs[23] < -6.14) {
                        if (inputs[6] < -36.984165) {
                            var244 = -0.015360059;
                        } else {
                            var244 = 0.017447192;
                        }
                    } else {
                        if (inputs[4] < 2.030157) {
                            var244 = -0.04418384;
                        } else {
                            var244 = -0.012502027;
                        }
                    }
                } else {
                    var244 = 0.016036384;
                }
            } else {
                if (inputs[13] < 16.345) {
                    var244 = -0.060380246;
                } else {
                    var244 = -0.015644327;
                }
            }
        } else {
            var244 = 0.025153829;
        }
    }
    double var245;
    if (inputs[2] < 0.94714284) {
        var245 = 0.0386404;
    } else {
        if (inputs[17] < -6.5326705) {
            var245 = -0.028011514;
        } else {
            if (inputs[24] < -36.201096) {
                if (inputs[23] < -4.725) {
                    if (inputs[10] < 0.7525) {
                        var245 = -0.024110898;
                    } else {
                        if (inputs[15] < -2.5373693) {
                            var245 = 0.0028139364;
                        } else {
                            var245 = 0.04804215;
                        }
                    }
                } else {
                    var245 = 0.050002642;
                }
            } else {
                if (inputs[17] < -2.5856314) {
                    var245 = -0.051684342;
                } else {
                    if (inputs[15] < 2.9960687) {
                        if (inputs[23] < 23.08) {
                            var245 = 0.0047835303;
                        } else {
                            var245 = 0.024878373;
                        }
                    } else {
                        var245 = -0.016946219;
                    }
                }
            }
        }
    }
    double var246;
    if (inputs[24] < -62.856155) {
        var246 = 0.026576268;
    } else {
        if (inputs[2] < 3.1442857) {
            if (inputs[2] < 2.1321428) {
                if (inputs[13] < -16.35) {
                    var246 = 0.024772331;
                } else {
                    if (inputs[23] < -14.21) {
                        var246 = -0.027420808;
                    } else {
                        if (inputs[16] < -1.3890125) {
                            var246 = 0.019660905;
                        } else {
                            var246 = -0.00737495;
                        }
                    }
                }
            } else {
                if (inputs[17] < -1.3204769) {
                    var246 = -0.06348897;
                } else {
                    var246 = -0.01151994;
                }
            }
        } else {
            var246 = 0.023498686;
        }
    }
    double var247;
    if (inputs[18] < 2.275) {
        if (inputs[3] < -1.499064) {
            var247 = 0.043249324;
        } else {
            if (inputs[3] < -0.91312706) {
                var247 = -0.027053684;
            } else {
                if (inputs[2] < 2.732143) {
                    if (inputs[21] < 18.425285) {
                        if (inputs[14] < 0.8254565) {
                            var247 = -0.04494873;
                        } else {
                            var247 = -0.0016484295;
                        }
                    } else {
                        if (inputs[14] < 1.069266) {
                            var247 = 0.019366277;
                        } else {
                            var247 = -0.017329028;
                        }
                    }
                } else {
                    var247 = 0.027679307;
                }
            }
        }
    } else {
        if (inputs[6] < 0.3177864) {
            if (inputs[13] < 7.33) {
                if (inputs[6] < -31.092716) {
                    var247 = -0.017258022;
                } else {
                    var247 = 0.015478008;
                }
            } else {
                var247 = -0.03299079;
            }
        } else {
            var247 = -0.054515466;
        }
    }
    double var248;
    if (inputs[17] < 5.2687583) {
        if (inputs[16] < -5.2976775) {
            var248 = -0.037820045;
        } else {
            if (inputs[10] < 0.7525) {
                if (inputs[9] < 31.764803) {
                    if (inputs[14] < 0.7716132) {
                        var248 = 0.017236842;
                    } else {
                        var248 = -0.014616331;
                    }
                } else {
                    var248 = -0.04031236;
                }
            } else {
                if (inputs[7] < 10.666371) {
                    if (inputs[17] < 1.2523888) {
                        if (inputs[9] < 24.870266) {
                            var248 = -0.019359525;
                        } else {
                            var248 = 0.01947295;
                        }
                    } else {
                        var248 = 0.047435068;
                    }
                } else {
                    if (inputs[21] < 19.25849) {
                        var248 = -0.038693268;
                    } else {
                        var248 = 0.014795115;
                    }
                }
            }
        }
    } else {
        if (inputs[14] < 0.7286123) {
            var248 = 0.04906414;
        } else {
            var248 = 0.009038417;
        }
    }
    double var249;
    if (inputs[8] < 2.5164557) {
        if (inputs[8] < 2.502439) {
            if (inputs[15] < -2.9173968) {
                var249 = -0.031449378;
            } else {
                if (inputs[4] < -1.6590085) {
                    if (inputs[2] < 1.9357142) {
                        if (inputs[3] < 0.4305812) {
                            var249 = -0.01302969;
                        } else {
                            var249 = 0.015379165;
                        }
                    } else {
                        var249 = 0.044419456;
                    }
                } else {
                    if (inputs[12] < 8.235) {
                        if (inputs[16] < 2.2328188) {
                            var249 = -0.058437046;
                        } else {
                            var249 = -0.000960929;
                        }
                    } else {
                        if (inputs[10] < 1.505) {
                            var249 = 0.0471484;
                        } else {
                            var249 = -0.00073170674;
                        }
                    }
                }
            }
        } else {
            var249 = 0.03461275;
        }
    } else {
        if (inputs[3] < -0.22793856) {
            if (inputs[21] < 20.086943) {
                var249 = -0.05259869;
            } else {
                var249 = -0.015041452;
            }
        } else {
            if (inputs[6] < -26.829597) {
                var249 = -0.021462934;
            } else {
                var249 = 0.016277634;
            }
        }
    }
    double var250;
    if (inputs[18] < -12.56) {
        if (inputs[16] < -3.7433846) {
            var250 = -0.035469405;
        } else {
            var250 = 0.008401446;
        }
    } else {
        if (inputs[13] < 1.635) {
            if (inputs[20] < 10.0) {
                var250 = -0.0154069625;
            } else {
                if (inputs[21] < 19.593027) {
                    if (inputs[24] < -26.621178) {
                        var250 = -0.02449861;
                    } else {
                        var250 = 0.022678476;
                    }
                } else {
                    if (inputs[21] < 21.864962) {
                        if (inputs[3] < 0.73104346) {
                            var250 = 0.032079525;
                        } else {
                            var250 = 0.059199475;
                        }
                    } else {
                        var250 = 0.011814343;
                    }
                }
            }
        } else {
            if (inputs[9] < 37.809982) {
                if (inputs[3] < -0.83883953) {
                    var250 = -0.042054545;
                } else {
                    if (inputs[12] < 8.405) {
                        var250 = -0.01967084;
                    } else {
                        var250 = 0.014570461;
                    }
                }
            } else {
                var250 = 0.02465066;
            }
        }
    }
    double var251;
    var251 = sigmoid(var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29 + var30 + var31 + var32 + var33 + var34 + var35 + var36 + var37 + var38 + var39 + var40 + var41 + var42 + var43 + var44 + var45 + var46 + var47 + var48 + var49 + var50 + var51 + var52 + var53 + var54 + var55 + var56 + var57 + var58 + var59 + var60 + var61 + var62 + var63 + var64 + var65 + var66 + var67 + var68 + var69 + var70 + var71 + var72 + var73 + var74 + var75 + var76 + var77 + var78 + var79 + var80 + var81 + var82 + var83 + var84 + var85 + var86 + var87 + var88 + var89 + var90 + var91 + var92 + var93 + var94 + var95 + var96 + var97 + var98 + var99 + var100 + var101 + var102 + var103 + var104 + var105 + var106 + var107 + var108 + var109 + var110 + var111 + var112 + var113 + var114 + var115 + var116 + var117 + var118 + var119 + var120 + var121 + var122 + var123 + var124 + var125 + var126 + var127 + var128 + var129 + var130 + var131 + var132 + var133 + var134 + var135 + var136 + var137 + var138 + var139 + var140 + var141 + var142 + var143 + var144 + var145 + var146 + var147 + var148 + var149 + var150 + var151 + var152 + var153 + var154 + var155 + var156 + var157 + var158 + var159 + var160 + var161 + var162 + var163 + var164 + var165 + var166 + var167 + var168 + var169 + var170 + var171 + var172 + var173 + var174 + var175 + var176 + var177 + var178 + var179 + var180 + var181 + var182 + var183 + var184 + var185 + var186 + var187 + var188 + var189 + var190 + var191 + var192 + var193 + var194 + var195 + var196 + var197 + var198 + var199 + var200 + var201 + var202 + var203 + var204 + var205 + var206 + var207 + var208 + var209 + var210 + var211 + var212 + var213 + var214 + var215 + var216 + var217 + var218 + var219 + var220 + var221 + var222 + var223 + var224 + var225 + var226 + var227 + var228 + var229 + var230 + var231 + var232 + var233 + var234 + var235 + var236 + var237 + var238 + var239 + var240 + var241 + var242 + var243 + var244 + var245 + var246 + var247 + var248 + var249 + var250);
    memcpy(output, (double[]){1.0 - var251, var251}, 2 * sizeof(double));
}


// --- Fonction Wrapper pour une utilisation simple dans MQL5 ---
// Retourne la probabilité de la classe 'Gagnant' (classe 1)
double XGBoost_Predict(const double &inputs[])
{
   double prediction[2]; // Sortie pour la classe 0 et la classe 1
   xgboost_score(inputs, prediction);
   return prediction[1]; // Retourne la probabilité de la classe 1 (Gagnant)
}
