//+------------------------------------------------------------------+
//|   XGBoost Predictor for MQL5
//+------------------------------------------------------------------+
#property strict

const double BEST_THRESHOLD = 0.480000;

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
    if (inputs[9] < 5.8975) {
        if (inputs[16] < 0.1459248) {
            if (inputs[24] < 13.900714) {
                if (inputs[24] < -20.471956) {
                    var0 = 0.06332078;
                } else {
                    if (inputs[13] < 1784.88) {
                        if (inputs[10] < 0.79) {
                            var0 = -0.088299125;
                        } else {
                            var0 = -0.01231021;
                        }
                    } else {
                        if (inputs[9] < 2.4575) {
                            var0 = 0.07159394;
                        } else {
                            if (inputs[3] < 1862.555) {
                                var0 = 0.033599533;
                            } else {
                                var0 = -0.041799977;
                            }
                        }
                    }
                }
            } else {
                var0 = 0.10139426;
            }
        } else {
            if (inputs[20] < 0.28234375) {
                var0 = 0.00043476353;
            } else {
                var0 = -0.1005059;
            }
        }
    } else {
        if (inputs[20] < -1.1184866) {
            var0 = 0.053269133;
        } else {
            if (inputs[2] < 3.0264285) {
                if (inputs[25] < 2.9828446) {
                    var0 = -0.13298893;
                } else {
                    if (inputs[13] < 1784.88) {
                        var0 = -0.07590772;
                    } else {
                        var0 = 0.014637472;
                    }
                }
            } else {
                var0 = 0.026950374;
            }
        }
    }
    double var1;
    if (inputs[15] < -0.71115154) {
        var1 = 0.06625319;
    } else {
        if (inputs[16] < -0.30206767) {
            var1 = -0.07360472;
        } else {
            if (inputs[24] < -19.664974) {
                if (inputs[24] < -24.57918) {
                    var1 = 0.0048953705;
                } else {
                    var1 = 0.1037081;
                }
            } else {
                if (inputs[15] < 0.3481818) {
                    if (inputs[25] < 2.595003) {
                        if (inputs[15] < -0.26) {
                            var1 = -0.015801411;
                        } else {
                            var1 = -0.09576477;
                        }
                    } else {
                        if (inputs[25] < 3.1514523) {
                            var1 = 0.054616243;
                        } else {
                            var1 = -0.058765728;
                        }
                    }
                } else {
                    if (inputs[18] < 2.2016084) {
                        if (inputs[1] < 72.61344) {
                            if (inputs[20] < -0.19728385) {
                                var1 = 0.036559634;
                            } else {
                                var1 = 0.084741354;
                            }
                        } else {
                            var1 = -0.0038937652;
                        }
                    } else {
                        var1 = -0.043381564;
                    }
                }
            }
        }
    }
    double var2;
    if (inputs[16] < 0.051766917) {
        if (inputs[25] < 3.3337195) {
            if (inputs[19] < 1.124791) {
                var2 = 0.09556136;
            } else {
                if (inputs[14] < -1.185) {
                    var2 = 0.08521215;
                } else {
                    if (inputs[13] < 1844.63) {
                        if (inputs[15] < -0.33557576) {
                            var2 = -0.0002888136;
                        } else {
                            var2 = -0.06471504;
                        }
                    } else {
                        if (inputs[11] < 0.36) {
                            var2 = -0.0018766875;
                        } else {
                            var2 = 0.067858264;
                        }
                    }
                }
            }
        } else {
            if (inputs[25] < 3.7410789) {
                var2 = -0.0880293;
            } else {
                var2 = -0.0017041913;
            }
        }
    } else {
        if (inputs[20] < 0.106602594) {
            if (inputs[2] < 1.7664286) {
                if (inputs[6] < 1826.915) {
                    if (inputs[14] < 0.764) {
                        var2 = -0.019318087;
                    } else {
                        var2 = 0.024884779;
                    }
                } else {
                    var2 = 0.058855426;
                }
            } else {
                var2 = -0.06076491;
            }
        } else {
            if (inputs[14] < 0.844) {
                var2 = -0.11709664;
            } else {
                var2 = -0.038092017;
            }
        }
    }
    double var3;
    if (inputs[10] < 5.0575) {
        if (inputs[20] < -0.034633074) {
            if (inputs[14] < 0.755) {
                if (inputs[3] < 1826.565) {
                    if (inputs[10] < 0.74) {
                        var3 = -0.07185857;
                    } else {
                        if (inputs[19] < 1.4192966) {
                            var3 = 0.055342413;
                        } else {
                            var3 = -0.0141898235;
                        }
                    }
                } else {
                    if (inputs[8] < 1907.39) {
                        var3 = 0.088286765;
                    } else {
                        var3 = -0.008825731;
                    }
                }
            } else {
                if (inputs[2] < 1.5621428) {
                    var3 = 0.07819492;
                } else {
                    var3 = 0.0005204621;
                }
            }
        } else {
            if (inputs[10] < 2.055) {
                if (inputs[16] < 0.14074436) {
                    if (inputs[24] < -7.1595545) {
                        if (inputs[19] < 1.4563731) {
                            var3 = 0.027110264;
                        } else {
                            var3 = -0.061141804;
                        }
                    } else {
                        var3 = 0.061718754;
                    }
                } else {
                    var3 = -0.077534094;
                }
            } else {
                if (inputs[20] < 0.98526) {
                    var3 = -0.12547213;
                } else {
                    var3 = -0.050535467;
                }
            }
        }
    } else {
        var3 = 0.0717886;
    }
    double var4;
    if (inputs[18] < 1.2363172) {
        if (inputs[21] < 3.1594846) {
            if (inputs[10] < 2.075) {
                if (inputs[10] < 0.8925) {
                    var4 = -0.019117374;
                } else {
                    var4 = 0.07247889;
                }
            } else {
                var4 = -0.07045321;
            }
        } else {
            var4 = -0.100158505;
        }
    } else {
        if (inputs[17] < 1.2256917) {
            if (inputs[2] < 1.2928572) {
                var4 = -0.009305691;
            } else {
                if (inputs[24] < -1.714551) {
                    var4 = 0.1164113;
                } else {
                    var4 = 0.04796531;
                }
            }
        } else {
            if (inputs[2] < 1.4335715) {
                if (inputs[24] < 3.8379583) {
                    var4 = 0.013332513;
                } else {
                    var4 = 0.06553711;
                }
            } else {
                if (inputs[18] < 1.7805179) {
                    if (inputs[19] < 1.4670558) {
                        var4 = -0.014659461;
                    } else {
                        var4 = -0.094788745;
                    }
                } else {
                    if (inputs[9] < 4.935) {
                        var4 = 0.046341956;
                    } else {
                        if (inputs[2] < 2.7042856) {
                            var4 = -0.07410571;
                        } else {
                            var4 = 0.02804086;
                        }
                    }
                }
            }
        }
    }
    double var5;
    if (inputs[23] < 10.910757) {
        if (inputs[6] < 1785.24) {
            if (inputs[20] < 0.00019193416) {
                if (inputs[17] < 1.1144038) {
                    var5 = -0.043237023;
                } else {
                    if (inputs[17] < 1.4078722) {
                        var5 = 0.07037015;
                    } else {
                        var5 = 0.0069737956;
                    }
                }
            } else {
                if (inputs[23] < -24.184532) {
                    if (inputs[9] < 3.935) {
                        var5 = 0.022137882;
                    } else {
                        var5 = -0.051944084;
                    }
                } else {
                    var5 = -0.09729789;
                }
            }
        } else {
            if (inputs[2] < 2.6121428) {
                if (inputs[16] < 0.12332331) {
                    if (inputs[17] < 1.6396024) {
                        if (inputs[17] < 1.2763165) {
                            if (inputs[23] < -36.984165) {
                                var5 = 0.0027801178;
                            } else {
                                var5 = 0.058818605;
                            }
                        } else {
                            var5 = -0.024825938;
                        }
                    } else {
                        var5 = 0.080981635;
                    }
                } else {
                    if (inputs[20] < -0.24402282) {
                        var5 = 0.023295745;
                    } else {
                        var5 = -0.08824244;
                    }
                }
            } else {
                var5 = 0.078284204;
            }
        }
    } else {
        if (inputs[14] < -0.578) {
            var5 = -0.004743935;
        } else {
            var5 = -0.09786584;
        }
    }
    double var6;
    if (inputs[16] < -0.14364661) {
        if (inputs[19] < 1.4164727) {
            var6 = -0.085620984;
        } else {
            if (inputs[24] < -20.721348) {
                var6 = 0.01999736;
            } else {
                if (inputs[16] < -0.239203) {
                    var6 = -0.07826508;
                } else {
                    var6 = 0.0010996964;
                }
            }
        }
    } else {
        if (inputs[16] < -0.0798797) {
            var6 = 0.064767115;
        } else {
            if (inputs[14] < 0.641) {
                if (inputs[10] < 1.105) {
                    if (inputs[10] < 0.5) {
                        var6 = -0.032217447;
                    } else {
                        var6 = 0.053386647;
                    }
                } else {
                    if (inputs[9] < 6.0375) {
                        var6 = -0.092512384;
                    } else {
                        var6 = -0.022306804;
                    }
                }
            } else {
                if (inputs[23] < 0.3177864) {
                    if (inputs[1] < 69.59125) {
                        if (inputs[15] < 0.3608485) {
                            var6 = 0.014674324;
                        } else {
                            var6 = 0.09104061;
                        }
                    } else {
                        if (inputs[16] < 0.19874436) {
                            var6 = 0.037473846;
                        } else {
                            var6 = -0.05162258;
                        }
                    }
                } else {
                    var6 = -0.046105128;
                }
            }
        }
    }
    double var7;
    if (inputs[20] < 0.08772628) {
        if (inputs[13] < 1665.19) {
            var7 = 0.08240743;
        } else {
            if (inputs[21] < -2.4886897) {
                var7 = -0.02985879;
            } else {
                if (inputs[20] < -0.15729868) {
                    if (inputs[5] < 1776.4525) {
                        var7 = -0.024327101;
                    } else {
                        if (inputs[13] < 1924.9) {
                            if (inputs[21] < 2.5932102) {
                                var7 = 0.020683486;
                            } else {
                                var7 = 0.08876675;
                            }
                        } else {
                            var7 = -0.012743411;
                        }
                    }
                } else {
                    var7 = 0.084048934;
                }
            }
        }
    } else {
        if (inputs[20] < 0.535828) {
            var7 = -0.059787985;
        } else {
            if (inputs[16] < -0.25378194) {
                var7 = -0.055580705;
            } else {
                if (inputs[21] < -2.6752014) {
                    var7 = 0.057700843;
                } else {
                    if (inputs[15] < 0.39175758) {
                        if (inputs[25] < 2.244549) {
                            var7 = -0.0020607575;
                        } else {
                            var7 = -0.07635475;
                        }
                    } else {
                        var7 = 0.041503835;
                    }
                }
            }
        }
    }
    double var8;
    if (inputs[1] < 30.82347) {
        if (inputs[9] < 4.63) {
            var8 = -0.091569215;
        } else {
            if (inputs[14] < -0.768) {
                if (inputs[9] < 6.8425) {
                    var8 = -0.007468012;
                } else {
                    var8 = -0.08520465;
                }
            } else {
                var8 = 0.06244125;
            }
        }
    } else {
        if (inputs[25] < 1.9213322) {
            if (inputs[3] < 1847.795) {
                var8 = -0.07717006;
            } else {
                var8 = 0.038104985;
            }
        } else {
            if (inputs[1] < 69.5182) {
                if (inputs[15] < 0.3481818) {
                    if (inputs[1] < 35.268757) {
                        if (inputs[15] < -0.4398788) {
                            var8 = 0.09516798;
                        } else {
                            var8 = 0.024552599;
                        }
                    } else {
                        if (inputs[23] < -16.935852) {
                            var8 = 0.0323323;
                        } else {
                            var8 = -0.029787565;
                        }
                    }
                } else {
                    if (inputs[13] < 1827.23) {
                        var8 = 0.11510837;
                    } else {
                        var8 = 0.040406827;
                    }
                }
            } else {
                if (inputs[20] < -0.3163457) {
                    var8 = 0.03868889;
                } else {
                    var8 = -0.060579613;
                }
            }
        }
    }
    double var9;
    if (inputs[16] < -0.16803007) {
        if (inputs[15] < -0.3089697) {
            if (inputs[17] < 1.2208292) {
                var9 = 0.055483576;
            } else {
                if (inputs[14] < -1.034) {
                    var9 = 0.0044257944;
                } else {
                    var9 = -0.06960897;
                }
            }
        } else {
            var9 = -0.084210895;
        }
    } else {
        if (inputs[24] < -19.664974) {
            var9 = 0.095380306;
        } else {
            if (inputs[18] < 1.8450803) {
                if (inputs[11] < 0.38) {
                    if (inputs[18] < 1.5035175) {
                        if (inputs[19] < 1.6401807) {
                            var9 = -0.104481384;
                        } else {
                            var9 = -0.023559736;
                        }
                    } else {
                        var9 = 0.021451382;
                    }
                } else {
                    if (inputs[24] < -9.013856) {
                        var9 = -0.032440696;
                    } else {
                        if (inputs[16] < 0.035654135) {
                            var9 = 0.08678493;
                        } else {
                            if (inputs[16] < 0.15496993) {
                                var9 = -0.035214048;
                            } else {
                                var9 = 0.052790478;
                            }
                        }
                    }
                }
            } else {
                if (inputs[25] < 2.8523908) {
                    if (inputs[18] < 2.2016084) {
                        var9 = 0.10093742;
                    } else {
                        var9 = 0.013914714;
                    }
                } else {
                    var9 = -0.01703067;
                }
            }
        }
    }
    double var10;
    if (inputs[23] < -63.956158) {
        var10 = -0.059216313;
    } else {
        if (inputs[16] < -0.0798797) {
            if (inputs[16] < -0.16803007) {
                if (inputs[10] < 0.73) {
                    var10 = -0.04743274;
                } else {
                    if (inputs[17] < 1.9122196) {
                        if (inputs[15] < -0.44751516) {
                            var10 = 0.074955665;
                        } else {
                            var10 = 0.005162499;
                        }
                    } else {
                        var10 = -0.02469998;
                    }
                }
            } else {
                if (inputs[24] < -17.95461) {
                    var10 = 0.09818702;
                } else {
                    var10 = 0.044993855;
                }
            }
        } else {
            if (inputs[20] < 1.3632554) {
                if (inputs[21] < 2.334938) {
                    if (inputs[18] < 1.8724273) {
                        if (inputs[20] < -0.27097872) {
                            var10 = -0.111582845;
                        } else {
                            var10 = -0.011771422;
                        }
                    } else {
                        var10 = 0.012927349;
                    }
                } else {
                    if (inputs[21] < 3.4954956) {
                        if (inputs[16] < 0.26023307) {
                            if (inputs[20] < -0.4953674) {
                                var10 = 0.04884093;
                            } else {
                                var10 = -0.029570118;
                            }
                        } else {
                            var10 = 0.09008709;
                        }
                    } else {
                        var10 = -0.03394857;
                    }
                }
            } else {
                var10 = -0.06929906;
            }
        }
    }
    double var11;
    if (inputs[13] < 1854.9) {
        if (inputs[25] < 1.8914771) {
            var11 = -0.07433436;
        } else {
            if (inputs[1] < 71.11597) {
                if (inputs[13] < 1820.89) {
                    if (inputs[13] < 1779.85) {
                        if (inputs[15] < -0.53818184) {
                            var11 = -0.052899305;
                        } else {
                            if (inputs[24] < -18.783993) {
                                var11 = 0.07005914;
                            } else {
                                var11 = -0.010656263;
                            }
                        }
                    } else {
                        var11 = 0.06641218;
                    }
                } else {
                    var11 = -0.054462012;
                }
            } else {
                var11 = -0.051315367;
            }
        }
    } else {
        if (inputs[11] < 0.29) {
            if (inputs[2] < 2.6385715) {
                var11 = -0.04202592;
            } else {
                var11 = 0.0022532134;
            }
        } else {
            if (inputs[18] < 1.3279924) {
                var11 = -0.007690413;
            } else {
                if (inputs[24] < -11.548525) {
                    var11 = 0.10447433;
                } else {
                    if (inputs[3] < 1909.53) {
                        var11 = 0.07950513;
                    } else {
                        var11 = 0.00016206125;
                    }
                }
            }
        }
    }
    double var12;
    if (inputs[23] < 10.910757) {
        if (inputs[9] < 6.58) {
            if (inputs[14] < 0.967) {
                if (inputs[2] < 0.96428573) {
                    var12 = 0.06075799;
                } else {
                    if (inputs[11] < 0.26) {
                        var12 = 0.046459835;
                    } else {
                        if (inputs[18] < 1.2647218) {
                            if (inputs[11] < 0.39) {
                                var12 = -0.031856526;
                            } else {
                                var12 = 0.031410478;
                            }
                        } else {
                            if (inputs[18] < 1.8571904) {
                                var12 = -0.060976077;
                            } else {
                                var12 = 0.0101788305;
                            }
                        }
                    }
                }
            } else {
                var12 = 0.054512165;
            }
        } else {
            if (inputs[19] < 1.7180334) {
                var12 = -0.09928667;
            } else {
                if (inputs[17] < 2.2184463) {
                    if (inputs[16] < 0.16081955) {
                        var12 = -0.015372397;
                    } else {
                        var12 = 0.060918625;
                    }
                } else {
                    var12 = -0.06039128;
                }
            }
        }
    } else {
        var12 = -0.05517376;
    }
    double var13;
    if (inputs[18] < 1.1976143) {
        if (inputs[9] < 5.695) {
            if (inputs[9] < 3.4) {
                var13 = -0.041130897;
            } else {
                var13 = 0.031813823;
            }
        } else {
            var13 = -0.08643789;
        }
    } else {
        if (inputs[24] < -25.921698) {
            var13 = -0.047994982;
        } else {
            if (inputs[24] < -21.323767) {
                var13 = 0.077325016;
            } else {
                if (inputs[24] < -14.232029) {
                    var13 = -0.039287206;
                } else {
                    if (inputs[10] < 5.0575) {
                        if (inputs[16] < 0.15496993) {
                            if (inputs[25] < 1.8914771) {
                                var13 = -0.033059202;
                            } else {
                                var13 = 0.043055244;
                            }
                        } else {
                            if (inputs[17] < 1.2800875) {
                                var13 = 0.02252937;
                            } else {
                                var13 = -0.06762787;
                            }
                        }
                    } else {
                        var13 = 0.05445193;
                    }
                }
            }
        }
    }
    double var14;
    if (inputs[14] < 0.55) {
        if (inputs[21] < -1.6925602) {
            if (inputs[23] < -23.573027) {
                if (inputs[13] < 1731.27) {
                    if (inputs[19] < 1.4192966) {
                        var14 = 0.048453655;
                    } else {
                        var14 = -0.036541138;
                    }
                } else {
                    var14 = -0.06748896;
                }
            } else {
                if (inputs[15] < -0.57878786) {
                    var14 = 0.058829837;
                } else {
                    if (inputs[14] < -0.849) {
                        var14 = -0.041404355;
                    } else {
                        if (inputs[14] < -0.685) {
                            var14 = 0.087482296;
                        } else {
                            var14 = -0.009549465;
                        }
                    }
                }
            }
        } else {
            var14 = -0.06524294;
        }
    } else {
        if (inputs[17] < 0.9943239) {
            var14 = 0.08689855;
        } else {
            if (inputs[16] < 0.12596993) {
                if (inputs[10] < 1.365) {
                    var14 = 0.08152798;
                } else {
                    var14 = -0.010090603;
                }
            } else {
                if (inputs[18] < 1.6732076) {
                    var14 = -0.056043424;
                } else {
                    var14 = 0.032881606;
                }
            }
        }
    }
    double var15;
    if (inputs[20] < -0.11280487) {
        if (inputs[2] < 1.7892857) {
            if (inputs[16] < 0.16592482) {
                if (inputs[16] < 0.035654135) {
                    if (inputs[1] < 32.738472) {
                        var15 = 0.0043842536;
                    } else {
                        var15 = 0.10227701;
                    }
                } else {
                    var15 = -0.012975639;
                }
            } else {
                var15 = 0.08735037;
            }
        } else {
            if (inputs[20] < -1.1543432) {
                var15 = -0.06988097;
            } else {
                if (inputs[10] < 1.865) {
                    var15 = 0.05631854;
                } else {
                    var15 = -0.016254395;
                }
            }
        }
    } else {
        if (inputs[18] < 1.4647648) {
            if (inputs[21] < -2.6420665) {
                var15 = -0.019849446;
            } else {
                if (inputs[14] < 0.55) {
                    var15 = -0.09604579;
                } else {
                    var15 = -0.039095525;
                }
            }
        } else {
            if (inputs[10] < 1.265) {
                if (inputs[24] < -4.394179) {
                    var15 = 0.0055842153;
                } else {
                    var15 = 0.06391893;
                }
            } else {
                if (inputs[10] < 3.7225) {
                    var15 = -0.053276435;
                } else {
                    var15 = 0.012863151;
                }
            }
        }
    }
    double var16;
    if (inputs[23] < 10.910757) {
        if (inputs[11] < 0.21) {
            if (inputs[9] < 11.365) {
                var16 = 0.07203559;
            } else {
                var16 = 0.011185835;
            }
        } else {
            if (inputs[9] < 6.58) {
                if (inputs[25] < 1.8914771) {
                    var16 = -0.049497016;
                } else {
                    if (inputs[21] < -2.872818) {
                        if (inputs[18] < 1.3383362) {
                            var16 = 0.031558182;
                        } else {
                            var16 = -0.0922361;
                        }
                    } else {
                        if (inputs[16] < 0.12332331) {
                            if (inputs[18] < 1.3326819) {
                                var16 = 0.0046084663;
                            } else {
                                var16 = 0.0751337;
                            }
                        } else {
                            if (inputs[20] < -0.07619367) {
                                var16 = 0.032313045;
                            } else {
                                var16 = -0.06959097;
                            }
                        }
                    }
                }
            } else {
                if (inputs[24] < -14.443391) {
                    var16 = 0.0033800919;
                } else {
                    var16 = -0.07349151;
                }
            }
        }
    } else {
        var16 = -0.045763034;
    }
    double var17;
    if (inputs[17] < 1.1380615) {
        if (inputs[14] < 0.608) {
            if (inputs[9] < 4.725) {
                if (inputs[2] < 1.36) {
                    var17 = -0.05353541;
                } else {
                    var17 = 0.0038542398;
                }
            } else {
                var17 = 0.04807531;
            }
        } else {
            var17 = 0.0712821;
        }
    } else {
        if (inputs[16] < -0.041323308) {
            if (inputs[1] < 34.038666) {
                if (inputs[24] < -23.626337) {
                    var17 = 0.033985797;
                } else {
                    if (inputs[10] < 1.885) {
                        var17 = 0.006628604;
                    } else {
                        var17 = -0.067149;
                    }
                }
            } else {
                if (inputs[21] < -1.9440994) {
                    var17 = 0.05506429;
                } else {
                    var17 = 0.06543625;
                }
            }
        } else {
            if (inputs[5] < 1818.8975) {
                if (inputs[3] < 1766.65) {
                    if (inputs[20] < -0.3163457) {
                        var17 = 0.024385013;
                    } else {
                        var17 = -0.06871987;
                    }
                } else {
                    var17 = 0.06132309;
                }
            } else {
                if (inputs[16] < 0.22166166) {
                    var17 = -0.10024224;
                } else {
                    var17 = 0.0014386377;
                }
            }
        }
    }
    double var18;
    if (inputs[20] < 0.28880712) {
        if (inputs[13] < 1725.03) {
            if (inputs[2] < 1.4878571) {
                var18 = 0.022207638;
            } else {
                var18 = 0.091572866;
            }
        } else {
            if (inputs[13] < 1854.9) {
                if (inputs[11] < 0.4) {
                    if (inputs[17] < 1.3070486) {
                        var18 = -0.09423736;
                    } else {
                        var18 = -0.017023183;
                    }
                } else {
                    var18 = 0.025114449;
                }
            } else {
                if (inputs[13] < 1909.43) {
                    var18 = 0.07293376;
                } else {
                    if (inputs[19] < 1.6699505) {
                        var18 = -0.029910713;
                    } else {
                        var18 = 0.019400205;
                    }
                }
            }
        }
    } else {
        if (inputs[11] < 0.34) {
            if (inputs[11] < 0.23) {
                var18 = -0.01733932;
            } else {
                var18 = -0.09040927;
            }
        } else {
            if (inputs[16] < 0.05710526) {
                if (inputs[10] < 1.645) {
                    var18 = 0.055138603;
                } else {
                    var18 = -0.011490564;
                }
            } else {
                var18 = -0.051376436;
            }
        }
    }
    double var19;
    if (inputs[15] < -0.24606061) {
        if (inputs[20] < -0.37495586) {
            if (inputs[2] < 1.5585715) {
                var19 = 0.011751953;
            } else {
                var19 = 0.1145221;
            }
        } else {
            if (inputs[8] < 1713.85) {
                var19 = -0.06678204;
            } else {
                if (inputs[3] < 1819.18) {
                    var19 = 0.070352085;
                } else {
                    if (inputs[10] < 2.705) {
                        var19 = -0.03089491;
                    } else {
                        var19 = 0.043982763;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 61.282856) {
            if (inputs[11] < 0.4) {
                var19 = -0.09973778;
            } else {
                var19 = -0.006582925;
            }
        } else {
            if (inputs[15] < 0.50357574) {
                if (inputs[15] < 0.30430302) {
                    var19 = 0.026750363;
                } else {
                    if (inputs[17] < 1.037709) {
                        var19 = 0.030264141;
                    } else {
                        if (inputs[23] < -20.647436) {
                            var19 = -0.029940989;
                        } else {
                            var19 = -0.09729718;
                        }
                    }
                }
            } else {
                if (inputs[15] < 0.6335152) {
                    var19 = 0.07501976;
                } else {
                    var19 = 0.00009880813;
                }
            }
        }
    }
    double var20;
    if (inputs[5] < 1775.075) {
        if (inputs[20] < 1.163589) {
            if (inputs[17] < 1.2615768) {
                if (inputs[23] < -41.405205) {
                    var20 = 0.022269368;
                } else {
                    var20 = -0.08571625;
                }
            } else {
                if (inputs[2] < 2.1121428) {
                    if (inputs[18] < 1.4690953) {
                        var20 = 0.037577845;
                    } else {
                        var20 = -0.043257058;
                    }
                } else {
                    var20 = 0.061240356;
                }
            }
        } else {
            var20 = -0.0864538;
        }
    } else {
        if (inputs[3] < 1974.84) {
            if (inputs[4] < 1941.65) {
                if (inputs[4] < 1896.98) {
                    if (inputs[20] < -1.0853318) {
                        var20 = 0.077499695;
                    } else {
                        if (inputs[20] < 0.6788122) {
                            if (inputs[13] < 1812.22) {
                                var20 = 0.017114386;
                            } else {
                                var20 = -0.04059404;
                            }
                        } else {
                            if (inputs[15] < -0.2869091) {
                                var20 = 0.08809156;
                            } else {
                                var20 = 0.013995071;
                            }
                        }
                    }
                } else {
                    if (inputs[23] < 1.9315468) {
                        var20 = -0.054240268;
                    } else {
                        var20 = 0.03043248;
                    }
                }
            } else {
                var20 = 0.08513294;
            }
        } else {
            var20 = -0.044405576;
        }
    }
    double var21;
    if (inputs[17] < 1.2666112) {
        if (inputs[2] < 2.1121428) {
            if (inputs[18] < 1.4568651) {
                if (inputs[24] < 18.859705) {
                    if (inputs[24] < -13.781551) {
                        var21 = 0.038173098;
                    } else {
                        if (inputs[1] < 62.81552) {
                            var21 = -0.04841507;
                        } else {
                            var21 = 0.018916441;
                        }
                    }
                } else {
                    var21 = 0.059460927;
                }
            } else {
                var21 = 0.07333563;
            }
        } else {
            var21 = -0.057540786;
        }
    } else {
        if (inputs[25] < 3.1514523) {
            if (inputs[14] < -1.064) {
                if (inputs[1] < 32.420887) {
                    var21 = 0.0063209794;
                } else {
                    var21 = 0.07156222;
                }
            } else {
                if (inputs[24] < 1.2061857) {
                    var21 = -0.06289671;
                } else {
                    if (inputs[16] < 0.05710526) {
                        var21 = 0.04709162;
                    } else {
                        if (inputs[2] < 1.9985714) {
                            var21 = -0.046634834;
                        } else {
                            var21 = 0.017026646;
                        }
                    }
                }
            }
        } else {
            if (inputs[17] < 1.6697018) {
                var21 = -0.010576569;
            } else {
                var21 = -0.09388825;
            }
        }
    }
    double var22;
    if (inputs[14] < -1.168) {
        if (inputs[25] < 2.6288812) {
            var22 = 0.07686538;
        } else {
            var22 = 0.012315306;
        }
    } else {
        if (inputs[8] < 1667.8) {
            var22 = 0.036944047;
        } else {
            if (inputs[8] < 1713.85) {
                var22 = -0.06251774;
            } else {
                if (inputs[2] < 1.8114285) {
                    if (inputs[2] < 1.3) {
                        if (inputs[12] < 1823.81) {
                            var22 = -0.00010880714;
                        } else {
                            var22 = -0.07344343;
                        }
                    } else {
                        if (inputs[5] < 1811.095) {
                            var22 = -0.024786545;
                        } else {
                            if (inputs[18] < 1.4373323) {
                                var22 = 0.09152729;
                            } else {
                                var22 = 0.027387565;
                            }
                        }
                    }
                } else {
                    if (inputs[2] < 2.78) {
                        if (inputs[17] < 1.2110755) {
                            var22 = -0.008915685;
                        } else {
                            var22 = -0.08168434;
                        }
                    } else {
                        var22 = 0.028949434;
                    }
                }
            }
        }
    }
    double var23;
    if (inputs[16] < -0.239203) {
        if (inputs[15] < -0.65) {
            var23 = 0.009922954;
        } else {
            var23 = -0.059221122;
        }
    } else {
        if (inputs[10] < 4.7325) {
            if (inputs[25] < 4.034082) {
                if (inputs[25] < 3.3075356) {
                    if (inputs[16] < 0.26023307) {
                        if (inputs[2] < 2.0564287) {
                            if (inputs[25] < 2.471551) {
                                var23 = 0.04194228;
                            } else {
                                var23 = -0.00959805;
                            }
                        } else {
                            if (inputs[15] < 0.2930303) {
                                var23 = -0.07081415;
                            } else {
                                var23 = -0.005094597;
                            }
                        }
                    } else {
                        var23 = 0.06074411;
                    }
                } else {
                    if (inputs[9] < 3.715) {
                        var23 = -0.018873477;
                    } else {
                        var23 = -0.08467837;
                    }
                }
            } else {
                var23 = 0.0545893;
            }
        } else {
            var23 = 0.05905282;
        }
    }
    double var24;
    if (inputs[3] < 1826.565) {
        if (inputs[10] < 0.3275) {
            var24 = -0.08599645;
        } else {
            if (inputs[19] < 1.4670558) {
                if (inputs[14] < -0.653) {
                    var24 = 0.057642493;
                } else {
                    var24 = -0.00913719;
                }
            } else {
                if (inputs[18] < 1.5945748) {
                    var24 = -0.06450334;
                } else {
                    if (inputs[11] < 0.3) {
                        var24 = -0.017552765;
                    } else {
                        var24 = 0.032159194;
                    }
                }
            }
        }
    } else {
        if (inputs[10] < 0.19) {
            var24 = 0.06905196;
        } else {
            if (inputs[1] < 32.738472) {
                var24 = -0.036673237;
            } else {
                if (inputs[1] < 36.89342) {
                    var24 = 0.08235344;
                } else {
                    if (inputs[6] < 1924.28) {
                        if (inputs[20] < -0.018309461) {
                            var24 = 0.063421205;
                        } else {
                            var24 = -0.00444528;
                        }
                    } else {
                        var24 = -0.043494213;
                    }
                }
            }
        }
    }
    double var25;
    if (inputs[16] < -0.25378194) {
        if (inputs[11] < 0.24) {
            var25 = 0.007813606;
        } else {
            var25 = -0.087633215;
        }
    } else {
        if (inputs[1] < 26.193537) {
            var25 = 0.058755025;
        } else {
            if (inputs[1] < 30.003166) {
                var25 = -0.07694024;
            } else {
                if (inputs[25] < 1.8258449) {
                    var25 = -0.032817397;
                } else {
                    if (inputs[15] < 0.6335152) {
                        if (inputs[19] < 1.6359477) {
                            if (inputs[23] < -32.626118) {
                                var25 = 0.036111027;
                            } else {
                                var25 = -0.012110125;
                            }
                        } else {
                            if (inputs[21] < 2.4080606) {
                                var25 = 0.08281089;
                            } else {
                                var25 = 0.019794382;
                            }
                        }
                    } else {
                        var25 = -0.041007616;
                    }
                }
            }
        }
    }
    double var26;
    if (inputs[10] < 2.23) {
        if (inputs[1] < 71.80589) {
            if (inputs[16] < 0.12332331) {
                if (inputs[3] < 1929.265) {
                    if (inputs[14] < 0.755) {
                        if (inputs[21] < -1.8869901) {
                            if (inputs[9] < 3.17) {
                                var26 = -0.024218034;
                            } else {
                                var26 = 0.036906064;
                            }
                        } else {
                            var26 = -0.05712231;
                        }
                    } else {
                        var26 = 0.060109593;
                    }
                } else {
                    var26 = 0.071790904;
                }
            } else {
                if (inputs[9] < 3.715) {
                    var26 = -0.058628123;
                } else {
                    var26 = 0.013437233;
                }
            }
        } else {
            var26 = 0.0627747;
        }
    } else {
        if (inputs[19] < 1.3897288) {
            var26 = -0.07778469;
        } else {
            if (inputs[8] < 1737.38) {
                var26 = -0.059881344;
            } else {
                if (inputs[5] < 1837.4675) {
                    var26 = 0.03830692;
                } else {
                    var26 = -0.017991014;
                }
            }
        }
    }
    double var27;
    if (inputs[23] < 19.42722) {
        if (inputs[18] < 3.397783) {
            if (inputs[8] < 1946.14) {
                if (inputs[1] < 23.451927) {
                    var27 = 0.058951285;
                } else {
                    if (inputs[18] < 1.0505737) {
                        var27 = 0.045420915;
                    } else {
                        if (inputs[18] < 1.1976143) {
                            var27 = -0.05549319;
                        } else {
                            if (inputs[10] < 1.16) {
                                var27 = 0.020034835;
                            } else {
                                var27 = -0.018455898;
                            }
                        }
                    }
                }
            } else {
                var27 = 0.068931565;
            }
        } else {
            var27 = -0.05250537;
        }
    } else {
        var27 = -0.05987361;
    }
    double var28;
    if (inputs[20] < 0.84939736) {
        if (inputs[23] < -54.118874) {
            var28 = -0.06059818;
        } else {
            if (inputs[18] < 1.1529632) {
                if (inputs[20] < -0.75934255) {
                    var28 = 0.076162726;
                } else {
                    var28 = 0.038298033;
                }
            } else {
                if (inputs[18] < 1.2593713) {
                    var28 = -0.071050614;
                } else {
                    if (inputs[21] < -2.872818) {
                        var28 = -0.050465476;
                    } else {
                        if (inputs[25] < 1.8732743) {
                            var28 = -0.041575514;
                        } else {
                            if (inputs[1] < 74.50789) {
                                var28 = 0.033307344;
                            } else {
                                var28 = -0.03445738;
                            }
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[16] < 0.064518794) {
            if (inputs[10] < 2.4975) {
                if (inputs[15] < -0.37333333) {
                    var28 = 0.10614353;
                } else {
                    var28 = 0.040648982;
                }
            } else {
                var28 = 0.004340496;
            }
        } else {
            var28 = -0.03073346;
        }
    }
    double var29;
    if (inputs[23] < -63.956158) {
        var29 = -0.050530277;
    } else {
        if (inputs[23] < 10.910757) {
            if (inputs[8] < 1942.16) {
                if (inputs[24] < -24.57918) {
                    var29 = 0.054648783;
                } else {
                    if (inputs[2] < 1.0378572) {
                        var29 = 0.045500398;
                    } else {
                        if (inputs[25] < 3.3829618) {
                            if (inputs[25] < 3.021015) {
                                var29 = -0.008682344;
                            } else {
                                var29 = 0.065885305;
                            }
                        } else {
                            var29 = -0.07505811;
                        }
                    }
                }
            } else {
                var29 = 0.061223395;
            }
        } else {
            var29 = -0.03805257;
        }
    }
    double var30;
    if (inputs[16] < -0.2875188) {
        var30 = -0.042332157;
    } else {
        if (inputs[19] < 1.65015) {
            if (inputs[2] < 1.7892857) {
                if (inputs[15] < -0.3961212) {
                    var30 = -0.043742727;
                } else {
                    if (inputs[8] < 1846.2) {
                        if (inputs[13] < 1808.35) {
                            if (inputs[2] < 1.2021428) {
                                var30 = 0.0411702;
                            } else {
                                var30 = -0.013677067;
                            }
                        } else {
                            var30 = -0.049678244;
                        }
                    } else {
                        var30 = 0.057153054;
                    }
                }
            } else {
                var30 = -0.09214673;
            }
        } else {
            if (inputs[21] < -2.3217247) {
                var30 = 0.07200477;
            } else {
                if (inputs[20] < 0.11182756) {
                    if (inputs[18] < 1.9862227) {
                        var30 = 0.054948427;
                    } else {
                        var30 = 0.0056211185;
                    }
                } else {
                    if (inputs[18] < 2.0697653) {
                        var30 = -0.047198977;
                    } else {
                        var30 = 0.017596383;
                    }
                }
            }
        }
    }
    double var31;
    if (inputs[15] < 0.39478788) {
        if (inputs[15] < 0.30430302) {
            if (inputs[24] < -20.653982) {
                if (inputs[24] < -26.2384) {
                    var31 = -0.010040382;
                } else {
                    var31 = 0.06169525;
                }
            } else {
                if (inputs[1] < 34.348347) {
                    if (inputs[6] < 1838.545) {
                        var31 = 0.00007155197;
                    } else {
                        var31 = -0.0970419;
                    }
                } else {
                    if (inputs[21] < -1.9237132) {
                        var31 = 0.04773036;
                    } else {
                        if (inputs[1] < 62.338776) {
                            var31 = -0.04798129;
                        } else {
                            var31 = 0.024036579;
                        }
                    }
                }
            }
        } else {
            var31 = -0.06514224;
        }
    } else {
        if (inputs[15] < 0.44054544) {
            var31 = 0.096437946;
        } else {
            if (inputs[19] < 2.7001708) {
                if (inputs[19] < 1.658906) {
                    var31 = 0.036276735;
                } else {
                    var31 = -0.037340384;
                }
            } else {
                var31 = 0.060450066;
            }
        }
    }
    double var32;
    if (inputs[10] < 0.35) {
        if (inputs[25] < 2.8755717) {
            var32 = -0.0049614147;
        } else {
            var32 = -0.08600878;
        }
    } else {
        if (inputs[9] < 3.22) {
            if (inputs[9] < 1.5625) {
                var32 = 0.024636166;
            } else {
                if (inputs[24] < 6.9411893) {
                    var32 = 0.09556248;
                } else {
                    var32 = 0.044090673;
                }
            }
        } else {
            if (inputs[14] < -0.563) {
                if (inputs[15] < -0.35945454) {
                    if (inputs[19] < 2.144363) {
                        if (inputs[15] < -0.4562424) {
                            var32 = 0.042869665;
                        } else {
                            var32 = -0.011761822;
                        }
                    } else {
                        var32 = -0.03216274;
                    }
                } else {
                    var32 = -0.06775487;
                }
            } else {
                if (inputs[20] < 0.33301044) {
                    if (inputs[20] < -0.5601386) {
                        if (inputs[2] < 1.6878572) {
                            var32 = 0.051375207;
                        } else {
                            var32 = -0.00058079255;
                        }
                    } else {
                        var32 = -0.03521209;
                    }
                } else {
                    var32 = 0.05871476;
                }
            }
        }
    }
    double var33;
    if (inputs[2] < 2.78) {
        if (inputs[17] < 1.4805945) {
            if (inputs[3] < 1935.66) {
                if (inputs[23] < -27.055882) {
                    if (inputs[16] < -0.14654887) {
                        var33 = -0.02293903;
                    } else {
                        if (inputs[18] < 1.2195721) {
                            var33 = 0.016864417;
                        } else {
                            var33 = 0.07794442;
                        }
                    }
                } else {
                    if (inputs[17] < 1.2264322) {
                        if (inputs[16] < 0.18212782) {
                            if (inputs[1] < 35.50532) {
                                var33 = 0.018854178;
                            } else {
                                var33 = -0.04985365;
                            }
                        } else {
                            var33 = 0.041943587;
                        }
                    } else {
                        var33 = -0.06035812;
                    }
                }
            } else {
                var33 = 0.064749256;
            }
        } else {
            if (inputs[15] < 0.3608485) {
                if (inputs[23] < -26.149652) {
                    var33 = -0.010546518;
                } else {
                    var33 = -0.06711372;
                }
            } else {
                var33 = 0.005887858;
            }
        }
    } else {
        if (inputs[5] < 1912.105) {
            var33 = 0.06555418;
        } else {
            var33 = 0.0080346195;
        }
    }
    double var34;
    if (inputs[23] < -35.493023) {
        if (inputs[14] < -0.763) {
            var34 = -0.08652517;
        } else {
            if (inputs[10] < 1.155) {
                var34 = 0.022713127;
            } else {
                var34 = -0.035286244;
            }
        }
    } else {
        if (inputs[23] < 0.9116595) {
            if (inputs[1] < 68.180214) {
                if (inputs[16] < 0.18212782) {
                    if (inputs[14] < -1.185) {
                        var34 = 0.0705893;
                    } else {
                        if (inputs[21] < -3.0357554) {
                            var34 = 0.058593843;
                        } else {
                            if (inputs[17] < 1.4250249) {
                                var34 = -0.046444535;
                            } else {
                                var34 = 0.026039174;
                            }
                        }
                    }
                } else {
                    var34 = 0.07595277;
                }
            } else {
                if (inputs[2] < 1.3678571) {
                    var34 = 0.01777867;
                } else {
                    var34 = -0.05870249;
                }
            }
        } else {
            if (inputs[19] < 1.9896966) {
                var34 = 0.0056261607;
            } else {
                var34 = -0.07887246;
            }
        }
    }
    double var35;
    if (inputs[16] < -0.32093233) {
        var35 = -0.05492703;
    } else {
        if (inputs[23] < -50.30599) {
            if (inputs[18] < 1.3279924) {
                var35 = 0.057992164;
            } else {
                var35 = 0.0094103;
            }
        } else {
            if (inputs[18] < 1.4196408) {
                if (inputs[20] < -0.9081138) {
                    var35 = 0.019217096;
                } else {
                    if (inputs[1] < 63.24308) {
                        if (inputs[10] < 1.0075) {
                            var35 = 0.007079952;
                        } else {
                            var35 = -0.060410984;
                        }
                    } else {
                        var35 = -0.09166683;
                    }
                }
            } else {
                if (inputs[17] < 1.1489543) {
                    var35 = 0.047389366;
                } else {
                    if (inputs[10] < 4.7325) {
                        if (inputs[10] < 0.48) {
                            var35 = 0.04115467;
                        } else {
                            if (inputs[11] < 0.29) {
                                var35 = -0.066895686;
                            } else {
                                var35 = -0.01046302;
                            }
                        }
                    } else {
                        var35 = 0.047515016;
                    }
                }
            }
        }
    }
    double var36;
    if (inputs[15] < -0.5891515) {
        if (inputs[6] < 1858.99) {
            var36 = 0.013557641;
        } else {
            var36 = 0.08633585;
        }
    } else {
        if (inputs[1] < 32.738472) {
            if (inputs[14] < -0.816) {
                var36 = -0.090607956;
            } else {
                var36 = -0.008060471;
            }
        } else {
            if (inputs[25] < 2.7594762) {
                if (inputs[3] < 1840.35) {
                    if (inputs[5] < 1707.6025) {
                        var36 = 0.023943877;
                    } else {
                        if (inputs[13] < 1779.85) {
                            var36 = -0.1092502;
                        } else {
                            var36 = -0.009242435;
                        }
                    }
                } else {
                    if (inputs[8] < 1907.39) {
                        var36 = 0.07265209;
                    } else {
                        var36 = -0.012084244;
                    }
                }
            } else {
                if (inputs[23] < -19.73212) {
                    if (inputs[19] < 1.3179533) {
                        var36 = 0.09669124;
                    } else {
                        var36 = 0.02690219;
                    }
                } else {
                    if (inputs[2] < 1.5042857) {
                        var36 = -0.045219857;
                    } else {
                        var36 = 0.03890953;
                    }
                }
            }
        }
    }
    double var37;
    if (inputs[24] < -25.683517) {
        var37 = -0.06795611;
    } else {
        if (inputs[18] < 1.568082) {
            if (inputs[11] < 0.41) {
                if (inputs[24] < -14.232029) {
                    var37 = 0.016825097;
                } else {
                    if (inputs[14] < 0.506) {
                        var37 = -0.09469267;
                    } else {
                        if (inputs[17] < 1.1335008) {
                            var37 = 0.011969648;
                        } else {
                            var37 = -0.046363004;
                        }
                    }
                }
            } else {
                if (inputs[5] < 1842.8375) {
                    if (inputs[10] < 1.17) {
                        var37 = -0.03953895;
                    } else {
                        var37 = 0.014948202;
                    }
                } else {
                    var37 = 0.046986803;
                }
            }
        } else {
            if (inputs[20] < 0.9618968) {
                if (inputs[24] < -14.232029) {
                    var37 = -0.037614334;
                } else {
                    if (inputs[24] < 7.3783484) {
                        var37 = 0.060049597;
                    } else {
                        if (inputs[1] < 67.20021) {
                            var37 = -0.03877961;
                        } else {
                            var37 = 0.028124915;
                        }
                    }
                }
            } else {
                var37 = 0.061821464;
            }
        }
    }
    double var38;
    if (inputs[2] < 1.6985714) {
        if (inputs[25] < 4.034082) {
            if (inputs[25] < 3.3016887) {
                if (inputs[16] < 0.10293985) {
                    if (inputs[24] < 3.8379583) {
                        if (inputs[15] < -0.4562424) {
                            var38 = 0.057026725;
                        } else {
                            if (inputs[16] < -0.14364661) {
                                var38 = -0.03050605;
                            } else {
                                var38 = 0.02216387;
                            }
                        }
                    } else {
                        var38 = 0.08048899;
                    }
                } else {
                    var38 = -0.013926457;
                }
            } else {
                if (inputs[3] < 1830.97) {
                    var38 = -0.07328374;
                } else {
                    var38 = 0.010440581;
                }
            }
        } else {
            var38 = 0.06750241;
        }
    } else {
        if (inputs[19] < 1.6401807) {
            var38 = -0.05959032;
        } else {
            if (inputs[18] < 3.5044434) {
                if (inputs[15] < 0.48466668) {
                    if (inputs[9] < 6.12) {
                        if (inputs[18] < 1.7805179) {
                            var38 = -0.014072209;
                        } else {
                            var38 = -0.054729104;
                        }
                    } else {
                        var38 = 0.02199443;
                    }
                } else {
                    var38 = 0.05561066;
                }
            } else {
                var38 = -0.060651008;
            }
        }
    }
    double var39;
    if (inputs[25] < 2.6467662) {
        if (inputs[11] < 0.29) {
            var39 = -0.043463428;
        } else {
            if (inputs[18] < 1.9109424) {
                if (inputs[10] < 1.355) {
                    if (inputs[25] < 2.2714326) {
                        var39 = 0.038654793;
                    } else {
                        var39 = -0.035054624;
                    }
                } else {
                    var39 = -0.044538185;
                }
            } else {
                var39 = 0.056044903;
            }
        }
    } else {
        if (inputs[23] < 3.5438905) {
            if (inputs[19] < 2.595103) {
                if (inputs[10] < 2.855) {
                    if (inputs[20] < 0.84939736) {
                        if (inputs[18] < 1.3219777) {
                            if (inputs[14] < 0.527) {
                                var39 = 0.016613789;
                            } else {
                                var39 = 0.058851544;
                            }
                        } else {
                            var39 = -0.011792436;
                        }
                    } else {
                        var39 = 0.07153926;
                    }
                } else {
                    var39 = -0.03225648;
                }
            } else {
                var39 = 0.07729131;
            }
        } else {
            var39 = -0.025804492;
        }
    }
    double var40;
    if (inputs[19] < 1.1199208) {
        var40 = 0.04179023;
    } else {
        if (inputs[21] < -2.2671845) {
            if (inputs[19] < 1.3167433) {
                var40 = -0.04316299;
            } else {
                if (inputs[25] < 3.262794) {
                    if (inputs[16] < -0.18431579) {
                        var40 = 0.02019563;
                    } else {
                        var40 = 0.083073236;
                    }
                } else {
                    var40 = -0.010698895;
                }
            }
        } else {
            if (inputs[15] < 0.37248486) {
                if (inputs[25] < 2.1488645) {
                    if (inputs[13] < 1846.3) {
                        var40 = -0.05360579;
                    } else {
                        var40 = 0.026973197;
                    }
                } else {
                    var40 = -0.074850045;
                }
            } else {
                if (inputs[2] < 1.405) {
                    var40 = 0.048461463;
                } else {
                    if (inputs[23] < -23.777779) {
                        var40 = 0.01995482;
                    } else {
                        if (inputs[20] < -0.19728385) {
                            var40 = -0.07071021;
                        } else {
                            var40 = 0.0029007578;
                        }
                    }
                }
            }
        }
    }
    double var41;
    if (inputs[14] < 0.93) {
        if (inputs[24] < -19.664974) {
            if (inputs[16] < -0.16878195) {
                var41 = -0.006859715;
            } else {
                var41 = 0.07015368;
            }
        } else {
            if (inputs[20] < 0.796546) {
                if (inputs[1] < 61.282856) {
                    if (inputs[14] < -0.752) {
                        var41 = -0.015876427;
                    } else {
                        var41 = -0.085477374;
                    }
                } else {
                    if (inputs[17] < 1.037709) {
                        var41 = 0.036909424;
                    } else {
                        if (inputs[23] < -20.507849) {
                            var41 = -0.008695681;
                        } else {
                            var41 = -0.06228883;
                        }
                    }
                }
            } else {
                if (inputs[19] < 1.8369683) {
                    var41 = -0.016997352;
                } else {
                    var41 = 0.07350308;
                }
            }
        }
    } else {
        if (inputs[17] < 1.6942372) {
            var41 = 0.070410065;
        } else {
            var41 = 0.004279727;
        }
    }
    double var42;
    if (inputs[9] < 1.64) {
        var42 = -0.04752081;
    } else {
        if (inputs[17] < 2.5590653) {
            if (inputs[14] < 1.153) {
                if (inputs[24] < 25.151962) {
                    if (inputs[19] < 2.0286694) {
                        if (inputs[19] < 1.8369683) {
                            if (inputs[2] < 1.6985714) {
                                var42 = 0.022047458;
                            } else {
                                var42 = -0.024448263;
                            }
                        } else {
                            var42 = 0.077911034;
                        }
                    } else {
                        if (inputs[20] < 0.10010364) {
                            var42 = 0.023483666;
                        } else {
                            var42 = -0.044917587;
                        }
                    }
                } else {
                    var42 = -0.049535125;
                }
            } else {
                var42 = 0.07454219;
            }
        } else {
            var42 = -0.032179054;
        }
    }
    double var43;
    if (inputs[21] < -3.7546778) {
        var43 = 0.0652863;
    } else {
        if (inputs[24] < -21.277676) {
            if (inputs[9] < 5.5325) {
                var43 = 0.066078745;
            } else {
                var43 = -0.006041659;
            }
        } else {
            if (inputs[1] < 31.216616) {
                var43 = -0.054392394;
            } else {
                if (inputs[14] < -0.822) {
                    var43 = 0.037574828;
                } else {
                    if (inputs[1] < 61.282856) {
                        if (inputs[11] < 0.4) {
                            var43 = -0.079958856;
                        } else {
                            var43 = 0.021157976;
                        }
                    } else {
                        if (inputs[1] < 63.736034) {
                            var43 = 0.06398004;
                        } else {
                            if (inputs[21] < 2.334938) {
                                var43 = -0.06403266;
                            } else {
                                var43 = 0.0122504635;
                            }
                        }
                    }
                }
            }
        }
    }
    double var44;
    if (inputs[17] < 0.86311066) {
        var44 = -0.055804174;
    } else {
        if (inputs[18] < 2.5222814) {
            if (inputs[1] < 26.023777) {
                var44 = 0.06136564;
            } else {
                if (inputs[20] < 0.025593309) {
                    if (inputs[18] < 1.1484094) {
                        var44 = 0.06530166;
                    } else {
                        if (inputs[19] < 1.6359477) {
                            if (inputs[3] < 1787.64) {
                                var44 = 0.0034798929;
                            } else {
                                var44 = -0.05341636;
                            }
                        } else {
                            if (inputs[19] < 1.9153448) {
                                var44 = 0.07450345;
                            } else {
                                var44 = -0.014037136;
                            }
                        }
                    }
                } else {
                    if (inputs[10] < 1.515) {
                        if (inputs[16] < 0.05800752) {
                            var44 = 0.024790931;
                        } else {
                            var44 = -0.05495978;
                        }
                    } else {
                        var44 = -0.056970134;
                    }
                }
            }
        } else {
            if (inputs[18] < 3.397783) {
                var44 = 0.076220624;
            } else {
                var44 = 0.0053271577;
            }
        }
    }
    double var45;
    if (inputs[10] < 0.155) {
        var45 = -0.05452292;
    } else {
        if (inputs[17] < 2.5874202) {
            if (inputs[11] < 0.23) {
                if (inputs[6] < 1834.63) {
                    var45 = 0.07974454;
                } else {
                    var45 = 0.017809011;
                }
            } else {
                if (inputs[19] < 2.144363) {
                    if (inputs[19] < 1.8027071) {
                        if (inputs[24] < -19.812208) {
                            var45 = 0.038888995;
                        } else {
                            if (inputs[1] < 32.738472) {
                                var45 = -0.048279036;
                            } else {
                                var45 = 0.0054110507;
                            }
                        }
                    } else {
                        var45 = 0.050848484;
                    }
                } else {
                    var45 = -0.048716724;
                }
            }
        } else {
            var45 = -0.04221404;
        }
    }
    double var46;
    if (inputs[11] < 0.45) {
        if (inputs[20] < -0.72686684) {
            if (inputs[19] < 1.3802438) {
                var46 = -0.017162597;
            } else {
                if (inputs[19] < 1.8987217) {
                    var46 = 0.07267813;
                } else {
                    var46 = -0.0040630763;
                }
            }
        } else {
            if (inputs[21] < -3.593429) {
                var46 = 0.04744085;
            } else {
                if (inputs[6] < 1745.985) {
                    if (inputs[25] < 2.946502) {
                        var46 = -0.014018618;
                    } else {
                        var46 = -0.08451066;
                    }
                } else {
                    if (inputs[10] < 0.32) {
                        var46 = 0.045151588;
                    } else {
                        if (inputs[11] < 0.37) {
                            if (inputs[11] < 0.21) {
                                var46 = 0.017089147;
                            } else {
                                var46 = -0.055707105;
                            }
                        } else {
                            if (inputs[25] < 2.4323606) {
                                var46 = 0.059301272;
                            } else {
                                var46 = 0.0061361124;
                            }
                        }
                    }
                }
            }
        }
    } else {
        var46 = -0.052969314;
    }
    double var47;
    if (inputs[25] < 1.8732743) {
        if (inputs[13] < 1846.3) {
            var47 = -0.07377043;
        } else {
            var47 = 0.007602057;
        }
    } else {
        if (inputs[25] < 3.3337195) {
            if (inputs[25] < 2.6467662) {
                if (inputs[25] < 2.471551) {
                    if (inputs[17] < 1.1192747) {
                        var47 = 0.048058297;
                    } else {
                        if (inputs[14] < 0.764) {
                            var47 = -0.02413928;
                        } else {
                            var47 = 0.030272871;
                        }
                    }
                } else {
                    var47 = -0.04525121;
                }
            } else {
                if (inputs[20] < -0.88841057) {
                    var47 = 0.077530876;
                } else {
                    if (inputs[25] < 2.8523908) {
                        var47 = 0.052253097;
                    } else {
                        if (inputs[23] < -17.973543) {
                            var47 = -0.04069397;
                        } else {
                            var47 = 0.03577008;
                        }
                    }
                }
            }
        } else {
            if (inputs[1] < 27.044325) {
                var47 = 0.026144529;
            } else {
                if (inputs[24] < 18.859705) {
                    var47 = -0.066908956;
                } else {
                    var47 = 0.0016479633;
                }
            }
        }
    }
    double var48;
    if (inputs[16] < 0.2694436) {
        if (inputs[9] < 5.325) {
            if (inputs[16] < 0.14074436) {
                if (inputs[20] < -0.47922477) {
                    if (inputs[17] < 1.1588719) {
                        var48 = -0.050097257;
                    } else {
                        var48 = 0.0014202446;
                    }
                } else {
                    if (inputs[3] < 1763.92) {
                        var48 = -0.0020429734;
                    } else {
                        if (inputs[9] < 2.95) {
                            var48 = 0.088930726;
                        } else {
                            if (inputs[16] < -0.1495188) {
                                var48 = 0.07339552;
                            } else {
                                var48 = 0.009710411;
                            }
                        }
                    }
                }
            } else {
                var48 = -0.047790375;
            }
        } else {
            if (inputs[20] < -0.8732041) {
                var48 = 0.015528219;
            } else {
                if (inputs[2] < 1.435) {
                    var48 = 0.0070405323;
                } else {
                    if (inputs[9] < 7.84) {
                        var48 = -0.10623743;
                    } else {
                        var48 = -0.033873774;
                    }
                }
            }
        }
    } else {
        if (inputs[3] < 1847.285) {
            var48 = 0.06803564;
        } else {
            var48 = 0.0043023657;
        }
    }
    double var49;
    if (inputs[18] < 1.6337148) {
        if (inputs[17] < 1.2962098) {
            if (inputs[13] < 1818.98) {
                if (inputs[11] < 0.39) {
                    var49 = 0.023423085;
                } else {
                    var49 = 0.06896572;
                }
            } else {
                if (inputs[18] < 1.3142484) {
                    var49 = -0.029728549;
                } else {
                    var49 = 0.05157937;
                }
            }
        } else {
            if (inputs[19] < 1.4042293) {
                var49 = 0.012772955;
            } else {
                var49 = -0.054335408;
            }
        }
    } else {
        if (inputs[17] < 1.2355338) {
            var49 = -0.055372346;
        } else {
            if (inputs[17] < 1.7418909) {
                if (inputs[2] < 2.382857) {
                    var49 = 0.0013885513;
                } else {
                    var49 = 0.05378418;
                }
            } else {
                if (inputs[23] < -18.51324) {
                    var49 = -0.051075447;
                } else {
                    if (inputs[13] < 1820.89) {
                        var49 = 0.024168806;
                    } else {
                        var49 = -0.015955256;
                    }
                }
            }
        }
    }
    double var50;
    if (inputs[9] < 10.2775) {
        if (inputs[14] < -1.185) {
            var50 = 0.06422755;
        } else {
            if (inputs[11] < 0.27) {
                if (inputs[10] < 1.16) {
                    var50 = 0.09344345;
                } else {
                    var50 = -0.014898976;
                }
            } else {
                if (inputs[17] < 1.535552) {
                    if (inputs[18] < 1.3113737) {
                        if (inputs[10] < 1.535) {
                            if (inputs[19] < 1.2894278) {
                                var50 = -0.0693518;
                            } else {
                                var50 = -0.02287913;
                            }
                        } else {
                            var50 = 0.027297875;
                        }
                    } else {
                        if (inputs[4] < 1814.075) {
                            if (inputs[20] < 0.06041935) {
                                var50 = -0.04254463;
                            } else {
                                var50 = 0.032794993;
                            }
                        } else {
                            if (inputs[2] < 1.36) {
                                var50 = 0.0064462265;
                            } else {
                                var50 = 0.083343156;
                            }
                        }
                    }
                } else {
                    if (inputs[14] < 1.074) {
                        var50 = -0.064350374;
                    } else {
                        var50 = -0.005975306;
                    }
                }
            }
        }
    } else {
        var50 = -0.030913573;
    }
    double var51;
    if (inputs[13] < 1667.96) {
        var51 = 0.049646042;
    } else {
        if (inputs[8] < 1710.51) {
            var51 = -0.063513614;
        } else {
            if (inputs[4] < 1727.25) {
                var51 = 0.057141647;
            } else {
                if (inputs[23] < -14.929883) {
                    if (inputs[21] < 2.765644) {
                        if (inputs[20] < 0.84939736) {
                            if (inputs[11] < 0.4) {
                                var51 = -0.10235488;
                            } else {
                                var51 = -0.059625555;
                            }
                        } else {
                            var51 = 0.002967529;
                        }
                    } else {
                        var51 = 0.03471531;
                    }
                } else {
                    if (inputs[15] < 0.30321214) {
                        if (inputs[22] < 1.0) {
                            if (inputs[15] < -0.3649697) {
                                var51 = -0.03993983;
                            } else {
                                var51 = 0.027594877;
                            }
                        } else {
                            var51 = 0.055181466;
                        }
                    } else {
                        if (inputs[13] < 1852.78) {
                            var51 = -0.06912267;
                        } else {
                            var51 = 0.00041719846;
                        }
                    }
                }
            }
        }
    }
    double var52;
    if (inputs[20] < -1.7698505) {
        var52 = -0.05282716;
    } else {
        if (inputs[15] < -0.3987879) {
            if (inputs[2] < 1.235) {
                var52 = -0.081657365;
            } else {
                if (inputs[24] < -12.202692) {
                    if (inputs[18] < 1.8130751) {
                        var52 = 0.043233596;
                    } else {
                        var52 = -0.0089697065;
                    }
                } else {
                    var52 = -0.049456622;
                }
            }
        } else {
            if (inputs[9] < 8.15) {
                if (inputs[20] < 0.11182756) {
                    if (inputs[20] < -0.14312634) {
                        if (inputs[25] < 2.9921925) {
                            if (inputs[16] < 0.0073533836) {
                                var52 = 0.024067732;
                            } else {
                                var52 = -0.04236572;
                            }
                        } else {
                            var52 = 0.043999616;
                        }
                    } else {
                        var52 = 0.06913784;
                    }
                } else {
                    if (inputs[25] < 2.8523908) {
                        if (inputs[9] < 3.2575) {
                            var52 = 0.04496918;
                        } else {
                            var52 = -0.010101662;
                        }
                    } else {
                        var52 = -0.04185101;
                    }
                }
            } else {
                var52 = -0.04506397;
            }
        }
    }
    double var53;
    if (inputs[19] < 4.343226) {
        if (inputs[10] < 0.335) {
            if (inputs[11] < 0.37) {
                var53 = 0.0058404016;
            } else {
                var53 = -0.060309622;
            }
        } else {
            if (inputs[10] < 1.03) {
                if (inputs[9] < 3.64) {
                    if (inputs[17] < 1.2005765) {
                        var53 = -0.03494072;
                    } else {
                        var53 = 0.05120171;
                    }
                } else {
                    var53 = 0.067615904;
                }
            } else {
                if (inputs[2] < 1.2021428) {
                    if (inputs[25] < 3.7014925) {
                        var53 = -0.0003302167;
                    } else {
                        var53 = 0.07106004;
                    }
                } else {
                    if (inputs[19] < 1.3578346) {
                        var53 = -0.050491303;
                    } else {
                        if (inputs[3] < 1798.5) {
                            var53 = -0.025694516;
                        } else {
                            if (inputs[17] < 1.7418909) {
                                var53 = 0.05348599;
                            } else {
                                var53 = -0.012338965;
                            }
                        }
                    }
                }
            }
        }
    } else {
        var53 = -0.041517645;
    }
    double var54;
    if (inputs[17] < 0.9647051) {
        if (inputs[16] < 0.042789474) {
            var54 = -0.06893695;
        } else {
            var54 = -0.00596746;
        }
    } else {
        if (inputs[10] < 2.215) {
            if (inputs[9] < 4.885) {
                if (inputs[15] < 0.43066666) {
                    if (inputs[13] < 1891.79) {
                        if (inputs[16] < -0.11656391) {
                            var54 = -0.04599782;
                        } else {
                            if (inputs[11] < 0.4) {
                                var54 = 0.055767134;
                            } else {
                                var54 = 0.007487261;
                            }
                        }
                    } else {
                        var54 = 0.07733316;
                    }
                } else {
                    var54 = -0.048187837;
                }
            } else {
                if (inputs[2] < 1.7578571) {
                    var54 = 0.0963239;
                } else {
                    var54 = 0.015904564;
                }
            }
        } else {
            if (inputs[2] < 2.4271429) {
                if (inputs[11] < 0.37) {
                    var54 = -0.056170113;
                } else {
                    var54 = 0.0062829875;
                }
            } else {
                var54 = 0.021760203;
            }
        }
    }
    double var55;
    if (inputs[23] < 10.910757) {
        if (inputs[23] < -5.579464) {
            if (inputs[21] < -3.1464338) {
                var55 = -0.03535272;
            } else {
                if (inputs[15] < 0.4578788) {
                    if (inputs[13] < 1813.96) {
                        if (inputs[23] < -39.6866) {
                            var55 = 0.064021245;
                        } else {
                            if (inputs[14] < -0.594) {
                                var55 = -0.014962542;
                            } else {
                                var55 = 0.04922872;
                            }
                        }
                    } else {
                        if (inputs[5] < 1861.49) {
                            var55 = -0.04390112;
                        } else {
                            var55 = 0.005844571;
                        }
                    }
                } else {
                    var55 = -0.029312711;
                }
            }
        } else {
            if (inputs[19] < 1.5902618) {
                if (inputs[19] < 1.3074727) {
                    var55 = 0.032584146;
                } else {
                    var55 = -0.037001904;
                }
            } else {
                if (inputs[19] < 2.0664175) {
                    var55 = 0.073559195;
                } else {
                    var55 = 0.015327498;
                }
            }
        }
    } else {
        var55 = -0.033364378;
    }
    double var56;
    if (inputs[1] < 74.73677) {
        if (inputs[13] < 1908.8) {
            if (inputs[13] < 1850.37) {
                if (inputs[16] < -0.15118045) {
                    if (inputs[9] < 6.19) {
                        var56 = -0.04713911;
                    } else {
                        var56 = 0.015937205;
                    }
                } else {
                    if (inputs[16] < -0.077203006) {
                        var56 = 0.07302917;
                    } else {
                        if (inputs[17] < 1.0089718) {
                            var56 = 0.037400417;
                        } else {
                            if (inputs[2] < 1.9507142) {
                                var56 = -0.033831682;
                            } else {
                                var56 = 0.038198717;
                            }
                        }
                    }
                }
            } else {
                if (inputs[10] < 1.185) {
                    var56 = 0.08180379;
                } else {
                    var56 = 0.014270568;
                }
            }
        } else {
            if (inputs[19] < 1.4735361) {
                var56 = -0.070768684;
            } else {
                if (inputs[19] < 1.9896966) {
                    var56 = 0.03853005;
                } else {
                    var56 = -0.01895099;
                }
            }
        }
    } else {
        var56 = -0.048017874;
    }
    double var57;
    if (inputs[17] < 0.87206423) {
        var57 = -0.039417528;
    } else {
        if (inputs[25] < 2.3162615) {
            if (inputs[5] < 1827.1575) {
                var57 = -0.043217905;
            } else {
                if (inputs[13] < 1909.65) {
                    var57 = 0.052936394;
                } else {
                    var57 = -0.029043552;
                }
            }
        } else {
            if (inputs[14] < -0.869) {
                if (inputs[21] < -3.1190884) {
                    var57 = -0.039736807;
                } else {
                    var57 = 0.0044703083;
                }
            } else {
                if (inputs[14] < -0.685) {
                    var57 = 0.051490236;
                } else {
                    if (inputs[15] < 0.3798788) {
                        if (inputs[15] < 0.27848485) {
                            if (inputs[14] < -0.536) {
                                var57 = -0.022566453;
                            } else {
                                var57 = 0.04514277;
                            }
                        } else {
                            var57 = -0.04853425;
                        }
                    } else {
                        if (inputs[23] < -22.89667) {
                            var57 = 0.07830381;
                        } else {
                            if (inputs[13] < 1868.56) {
                                var57 = -0.013064316;
                            } else {
                                var57 = 0.026555134;
                            }
                        }
                    }
                }
            }
        }
    }
    double var58;
    if (inputs[23] < -27.055882) {
        if (inputs[16] < -0.08324812) {
            if (inputs[14] < -0.768) {
                var58 = 0.019268347;
            } else {
                var58 = 0.06996345;
            }
        } else {
            if (inputs[21] < 2.5411365) {
                var58 = -0.041997954;
            } else {
                var58 = 0.02897343;
            }
        }
    } else {
        if (inputs[25] < 2.0689654) {
            if (inputs[24] < 4.263343) {
                var58 = -0.01694602;
            } else {
                var58 = -0.05979228;
            }
        } else {
            if (inputs[25] < 3.571873) {
                if (inputs[8] < 1838.82) {
                    if (inputs[13] < 1779.34) {
                        var58 = 0.0004879568;
                    } else {
                        var58 = 0.07144642;
                    }
                } else {
                    if (inputs[19] < 2.0491755) {
                        var58 = 0.015582625;
                    } else {
                        var58 = -0.049317855;
                    }
                }
            } else {
                var58 = -0.042302813;
            }
        }
    }
    double var59;
    if (inputs[13] < 1850.02) {
        if (inputs[19] < 2.9131658) {
            if (inputs[19] < 1.8027071) {
                if (inputs[2] < 1.4685714) {
                    if (inputs[2] < 1.0985714) {
                        var59 = -0.040966716;
                    } else {
                        if (inputs[11] < 0.41) {
                            var59 = -0.009582233;
                        } else {
                            var59 = 0.048715495;
                        }
                    }
                } else {
                    var59 = -0.05235031;
                }
            } else {
                if (inputs[1] < 38.79846) {
                    var59 = -0.0014208573;
                } else {
                    var59 = 0.059556484;
                }
            }
        } else {
            var59 = -0.059278812;
        }
    } else {
        if (inputs[10] < 3.645) {
            if (inputs[9] < 2.93) {
                var59 = 0.044506118;
            } else {
                if (inputs[14] < -0.755) {
                    var59 = 0.025952512;
                } else {
                    if (inputs[18] < 1.4293709) {
                        var59 = -0.073341474;
                    } else {
                        var59 = 0.00487493;
                    }
                }
            }
        } else {
            var59 = 0.057276957;
        }
    }
    double var60;
    if (inputs[23] < -55.599304) {
        var60 = -0.039741814;
    } else {
        if (inputs[13] < 1658.85) {
            var60 = 0.06134876;
        } else {
            if (inputs[18] < 3.5044434) {
                if (inputs[13] < 1698.54) {
                    var60 = -0.04341093;
                } else {
                    if (inputs[1] < 26.495476) {
                        var60 = 0.05420007;
                    } else {
                        if (inputs[21] < -2.4596684) {
                            if (inputs[23] < -5.150817) {
                                var60 = -0.06355179;
                            } else {
                                var60 = 0.01409777;
                            }
                        } else {
                            if (inputs[21] < -1.6925602) {
                                var60 = 0.052229453;
                            } else {
                                var60 = 0.009851576;
                            }
                        }
                    }
                }
            } else {
                var60 = -0.051035255;
            }
        }
    }
    double var61;
    if (inputs[14] < 1.058) {
        if (inputs[21] < -2.3217247) {
            if (inputs[11] < 0.23) {
                var61 = 0.05121219;
            } else {
                if (inputs[16] < -0.16878195) {
                    if (inputs[17] < 1.1853675) {
                        var61 = 0.0037979053;
                    } else {
                        var61 = -0.050457448;
                    }
                } else {
                    if (inputs[15] < -0.41248485) {
                        var61 = -0.010383307;
                    } else {
                        var61 = 0.042595897;
                    }
                }
            }
        } else {
            if (inputs[15] < 0.3481818) {
                if (inputs[13] < 1771.47) {
                    var61 = -0.07393828;
                } else {
                    if (inputs[10] < 1.685) {
                        var61 = -0.0419292;
                    } else {
                        var61 = 0.0033284517;
                    }
                }
            } else {
                if (inputs[16] < 0.19218796) {
                    var61 = 0.03319694;
                } else {
                    var61 = -0.031937703;
                }
            }
        }
    } else {
        var61 = 0.038402967;
    }
    double var62;
    if (inputs[17] < 0.8197219) {
        var62 = -0.04545508;
    } else {
        if (inputs[19] < 1.1199208) {
            var62 = 0.058005705;
        } else {
            if (inputs[21] < -3.593429) {
                var62 = 0.051099874;
            } else {
                if (inputs[23] < -36.490715) {
                    if (inputs[19] < 1.4670558) {
                        var62 = -0.0047489614;
                    } else {
                        var62 = -0.094386645;
                    }
                } else {
                    if (inputs[1] < 32.795147) {
                        if (inputs[24] < -21.323767) {
                            var62 = -0.0022321858;
                        } else {
                            var62 = -0.06020316;
                        }
                    } else {
                        if (inputs[1] < 36.326664) {
                            var62 = 0.06456825;
                        } else {
                            if (inputs[18] < 1.1529632) {
                                var62 = 0.054291427;
                            } else {
                                var62 = 0.00010225462;
                            }
                        }
                    }
                }
            }
        }
    }
    double var63;
    if (inputs[5] < 1913.09) {
        if (inputs[23] < -55.599304) {
            var63 = -0.035584394;
        } else {
            if (inputs[15] < -0.25133333) {
                if (inputs[15] < -0.40339395) {
                    if (inputs[20] < 0.9618968) {
                        var63 = -0.015302646;
                    } else {
                        var63 = 0.046810023;
                    }
                } else {
                    var63 = 0.07082379;
                }
            } else {
                if (inputs[9] < 7.13) {
                    if (inputs[11] < 0.36) {
                        var63 = -0.049344465;
                    } else {
                        if (inputs[2] < 1.2928572) {
                            var63 = 0.03342217;
                        } else {
                            var63 = -0.024973063;
                        }
                    }
                } else {
                    var63 = 0.039965432;
                }
            }
        }
    } else {
        if (inputs[9] < 3.3) {
            var63 = 0.019526707;
        } else {
            if (inputs[10] < 2.3575) {
                var63 = -0.05803716;
            } else {
                var63 = -0.012264725;
            }
        }
    }
    double var64;
    if (inputs[5] < 1707.6025) {
        if (inputs[20] < -0.4211998) {
            var64 = 0.07451104;
        } else {
            var64 = 0.0019495956;
        }
    } else {
        if (inputs[3] < 1752.67) {
            var64 = -0.045370426;
        } else {
            if (inputs[21] < -2.9117208) {
                if (inputs[1] < 26.495476) {
                    var64 = 0.0030231923;
                } else {
                    var64 = -0.059254896;
                }
            } else {
                if (inputs[15] < -0.46545455) {
                    var64 = 0.0437543;
                } else {
                    if (inputs[14] < 0.55) {
                        if (inputs[2] < 1.5521429) {
                            var64 = -0.0635833;
                        } else {
                            var64 = -0.0010957076;
                        }
                    } else {
                        if (inputs[14] < 0.696) {
                            var64 = 0.06784356;
                        } else {
                            if (inputs[1] < 65.86206) {
                                var64 = -0.043687325;
                            } else {
                                var64 = 0.014604467;
                            }
                        }
                    }
                }
            }
        }
    }
    double var65;
    if (inputs[16] < 0.12944362) {
        if (inputs[15] < 0.3798788) {
            if (inputs[3] < 1666.325) {
                var65 = 0.051292513;
            } else {
                if (inputs[23] < -23.573027) {
                    if (inputs[15] < -0.29527274) {
                        if (inputs[21] < -2.8556485) {
                            var65 = -0.0480268;
                        } else {
                            var65 = 0.04084441;
                        }
                    } else {
                        var65 = -0.07281212;
                    }
                } else {
                    if (inputs[1] < 27.044325) {
                        var65 = 0.06338352;
                    } else {
                        if (inputs[24] < -8.892423) {
                            if (inputs[20] < -0.234652) {
                                var65 = 0.011694643;
                            } else {
                                var65 = -0.042329285;
                            }
                        } else {
                            var65 = 0.03597698;
                        }
                    }
                }
            }
        } else {
            var65 = 0.055029526;
        }
    } else {
        if (inputs[9] < 3.7975) {
            var65 = -0.05381281;
        } else {
            if (inputs[20] < -0.8018117) {
                var65 = 0.02757243;
            } else {
                var65 = -0.020590333;
            }
        }
    }
    double var66;
    if (inputs[15] < -0.71115154) {
        var66 = 0.05984091;
    } else {
        if (inputs[2] < 1.7892857) {
            if (inputs[5] < 1669.84) {
                var66 = -0.043977514;
            } else {
                if (inputs[25] < 2.2597165) {
                    var66 = 0.08370306;
                } else {
                    if (inputs[21] < -3.5357788) {
                        var66 = 0.05915904;
                    } else {
                        if (inputs[15] < 0.37369698) {
                            if (inputs[13] < 1816.5) {
                                var66 = 0.005326979;
                            } else {
                                var66 = -0.03330039;
                            }
                        } else {
                            if (inputs[23] < -11.251019) {
                                var66 = 0.06489501;
                            } else {
                                var66 = 0.012510597;
                            }
                        }
                    }
                }
            }
        } else {
            if (inputs[4] < 1807.21) {
                if (inputs[14] < 0.764) {
                    var66 = -0.01984417;
                } else {
                    var66 = 0.026328446;
                }
            } else {
                if (inputs[19] < 1.7848358) {
                    var66 = -0.0014503445;
                } else {
                    if (inputs[14] < 0.636) {
                        var66 = -0.09751246;
                    } else {
                        var66 = -0.041824535;
                    }
                }
            }
        }
    }
    double var67;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < -0.08642857) {
            if (inputs[1] < 30.82347) {
                if (inputs[15] < -0.47266668) {
                    var67 = 0.012653734;
                } else {
                    var67 = -0.035363816;
                }
            } else {
                if (inputs[24] < -12.509911) {
                    var67 = 0.06303639;
                } else {
                    var67 = 0.008035845;
                }
            }
        } else {
            if (inputs[15] < 0.3481818) {
                if (inputs[23] < -8.68148) {
                    if (inputs[20] < -0.034633074) {
                        var67 = 0.0030303954;
                    } else {
                        var67 = -0.05935117;
                    }
                } else {
                    var67 = -0.07729654;
                }
            } else {
                if (inputs[2] < 1.4471428) {
                    var67 = 0.028889436;
                } else {
                    var67 = -0.032289166;
                }
            }
        }
    } else {
        if (inputs[21] < 2.9352078) {
            var67 = 0.053632703;
        } else {
            var67 = -0.00010014838;
        }
    }
    double var68;
    if (inputs[10] < 2.4975) {
        if (inputs[13] < 1682.78) {
            var68 = 0.041492585;
        } else {
            if (inputs[14] < -0.915) {
                var68 = 0.036252253;
            } else {
                if (inputs[16] < -0.16803007) {
                    var68 = -0.045073;
                } else {
                    if (inputs[18] < 1.568082) {
                        if (inputs[16] < -0.08324812) {
                            var68 = 0.025650376;
                        } else {
                            if (inputs[2] < 1.2635714) {
                                var68 = -0.053618062;
                            } else {
                                var68 = -0.0029439211;
                            }
                        }
                    } else {
                        if (inputs[2] < 2.0564287) {
                            var68 = 0.050312568;
                        } else {
                            var68 = 0.004502536;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[17] < 2.102351) {
            if (inputs[18] < 1.5694613) {
                var68 = -0.034145176;
            } else {
                var68 = 0.015154061;
            }
        } else {
            var68 = -0.051525995;
        }
    }
    double var69;
    if (inputs[19] < 1.2318324) {
        if (inputs[14] < -0.638) {
            var69 = 0.07260519;
        } else {
            if (inputs[1] < 68.180214) {
                var69 = -0.01358013;
            } else {
                var69 = 0.037083976;
            }
        }
    } else {
        if (inputs[19] < 1.5801452) {
            if (inputs[17] < 1.2055439) {
                var69 = 0.0216725;
            } else {
                if (inputs[20] < 0.007195763) {
                    var69 = -0.07094438;
                } else {
                    var69 = -0.006368137;
                }
            }
        } else {
            if (inputs[25] < 3.2322023) {
                if (inputs[23] < -14.363215) {
                    if (inputs[15] < -0.29527274) {
                        var69 = 0.023164203;
                    } else {
                        var69 = -0.031307083;
                    }
                } else {
                    if (inputs[2] < 2.0564287) {
                        var69 = 0.08960762;
                    } else {
                        if (inputs[18] < 2.4188137) {
                            var69 = -0.013774283;
                        } else {
                            var69 = 0.061969128;
                        }
                    }
                }
            } else {
                if (inputs[23] < -20.507849) {
                    var69 = 0.031981517;
                } else {
                    var69 = -0.049245;
                }
            }
        }
    }
    double var70;
    if (inputs[19] < 2.0921564) {
        if (inputs[18] < 1.7805179) {
            if (inputs[15] < -0.3961212) {
                var70 = -0.03581219;
            } else {
                if (inputs[15] < -0.31369698) {
                    var70 = 0.057801846;
                } else {
                    if (inputs[16] < -0.11656391) {
                        var70 = -0.035582703;
                    } else {
                        if (inputs[15] < 0.17339393) {
                            var70 = 0.06780113;
                        } else {
                            if (inputs[14] < 0.742) {
                                var70 = -0.0144886635;
                            } else {
                                var70 = 0.031433348;
                            }
                        }
                    }
                }
            }
        } else {
            if (inputs[10] < 1.5275) {
                var70 = 0.07573874;
            } else {
                var70 = 0.011534928;
            }
        }
    } else {
        if (inputs[20] < -0.61608714) {
            var70 = -0.048839077;
        } else {
            if (inputs[15] < 0.48466668) {
                if (inputs[2] < 2.78) {
                    var70 = -0.060759135;
                } else {
                    var70 = 0.012191707;
                }
            } else {
                var70 = 0.04348825;
            }
        }
    }
    double var71;
    if (inputs[25] < 4.2767625) {
        if (inputs[16] < -0.29300752) {
            var71 = -0.042471178;
        } else {
            if (inputs[16] < -0.20752631) {
                var71 = 0.058236673;
            } else {
                if (inputs[17] < 2.0461183) {
                    if (inputs[23] < 0.3177864) {
                        if (inputs[24] < -16.129517) {
                            var71 = -0.044131253;
                        } else {
                            if (inputs[1] < 64.21748) {
                                var71 = 0.030517843;
                            } else {
                                var71 = -0.016966298;
                            }
                        }
                    } else {
                        var71 = -0.04894033;
                    }
                } else {
                    var71 = 0.033067778;
                }
            }
        }
    } else {
        var71 = 0.040345054;
    }
    double var72;
    if (inputs[12] < 1664.07) {
        var72 = 0.040134445;
    } else {
        if (inputs[1] < 30.82347) {
            if (inputs[23] < -2.358174) {
                var72 = -0.047179457;
            } else {
                var72 = 0.010549844;
            }
        } else {
            if (inputs[1] < 32.96693) {
                var72 = 0.048467036;
            } else {
                if (inputs[6] < 1931.85) {
                    if (inputs[16] < -0.11422557) {
                        var72 = -0.0493229;
                    } else {
                        if (inputs[23] < -6.3145747) {
                            if (inputs[23] < -37.702194) {
                                var72 = -0.015985359;
                            } else {
                                var72 = 0.038546927;
                            }
                        } else {
                            if (inputs[16] < 0.18212782) {
                                var72 = -0.0474941;
                            } else {
                                var72 = 0.026077693;
                            }
                        }
                    }
                } else {
                    var72 = 0.03229024;
                }
            }
        }
    }
    double var73;
    if (inputs[11] < 0.36) {
        if (inputs[20] < 0.06041935) {
            if (inputs[2] < 1.3928572) {
                var73 = -0.041163124;
            } else {
                if (inputs[2] < 1.7664286) {
                    var73 = 0.055927273;
                } else {
                    if (inputs[10] < 1.6525) {
                        var73 = -0.048560645;
                    } else {
                        var73 = 0.030022029;
                    }
                }
            }
        } else {
            if (inputs[23] < -3.9755354) {
                var73 = -0.07722253;
            } else {
                var73 = -0.017183311;
            }
        }
    } else {
        if (inputs[15] < 0.37109092) {
            if (inputs[16] < -0.077203006) {
                if (inputs[1] < 30.481112) {
                    var73 = -0.00882019;
                } else {
                    var73 = 0.056393515;
                }
            } else {
                if (inputs[19] < 1.222446) {
                    var73 = -0.0014353145;
                } else {
                    var73 = -0.068693444;
                }
            }
        } else {
            var73 = 0.054279417;
        }
    }
    double var74;
    if (inputs[16] < 0.19874436) {
        if (inputs[15] < 0.41733333) {
            if (inputs[15] < 0.3429091) {
                if (inputs[11] < 0.44) {
                    if (inputs[14] < 0.55) {
                        if (inputs[19] < 1.2350031) {
                            var74 = -0.04917366;
                        } else {
                            if (inputs[9] < 3.2575) {
                                var74 = 0.05597056;
                            } else {
                                var74 = 0.002019923;
                            }
                        }
                    } else {
                        var74 = 0.044981815;
                    }
                } else {
                    var74 = -0.036158785;
                }
            } else {
                var74 = 0.06841936;
            }
        } else {
            var74 = -0.01727664;
        }
    } else {
        if (inputs[16] < 0.2641203) {
            var74 = -0.059140336;
        } else {
            if (inputs[6] < 1834.63) {
                var74 = 0.031218017;
            } else {
                var74 = -0.035621744;
            }
        }
    }
    double var75;
    if (inputs[20] < -1.7409832) {
        var75 = -0.03884487;
    } else {
        if (inputs[23] < -3.9755354) {
            if (inputs[23] < -19.73212) {
                if (inputs[21] < -2.872818) {
                    var75 = -0.030942315;
                } else {
                    if (inputs[21] < -2.2695177) {
                        var75 = 0.061123233;
                    } else {
                        if (inputs[14] < 0.641) {
                            var75 = -0.024181144;
                        } else {
                            if (inputs[9] < 4.3075) {
                                var75 = 0.07126217;
                            } else {
                                var75 = -0.008778242;
                            }
                        }
                    }
                }
            } else {
                var75 = -0.05798032;
            }
        } else {
            if (inputs[19] < 2.5699441) {
                if (inputs[2] < 1.8114285) {
                    if (inputs[25] < 2.8473969) {
                        var75 = 0.056261156;
                    } else {
                        if (inputs[15] < 0.2620606) {
                            var75 = 0.0243259;
                        } else {
                            var75 = -0.02978509;
                        }
                    }
                } else {
                    var75 = -0.026299512;
                }
            } else {
                var75 = 0.04715513;
            }
        }
    }
    double var76;
    if (inputs[8] < 1972.19) {
        if (inputs[4] < 1941.65) {
            if (inputs[10] < 0.6925) {
                if (inputs[14] < 0.661) {
                    if (inputs[16] < -0.11656391) {
                        var76 = -0.02112527;
                    } else {
                        var76 = 0.028645419;
                    }
                } else {
                    var76 = -0.060267217;
                }
            } else {
                if (inputs[10] < 1.03) {
                    var76 = 0.05622609;
                } else {
                    if (inputs[9] < 5.75) {
                        if (inputs[10] < 1.575) {
                            var76 = -0.011131583;
                        } else {
                            if (inputs[20] < 0.00019193416) {
                                var76 = 0.07339736;
                            } else {
                                var76 = 0.009434677;
                            }
                        }
                    } else {
                        if (inputs[4] < 1781.35) {
                            var76 = -0.050564162;
                        } else {
                            if (inputs[11] < 0.27) {
                                var76 = -0.026669675;
                            } else {
                                var76 = 0.043385547;
                            }
                        }
                    }
                }
            }
        } else {
            var76 = 0.06636432;
        }
    } else {
        var76 = -0.038451843;
    }
    double var77;
    if (inputs[15] < -0.71115154) {
        var77 = 0.05273779;
    } else {
        if (inputs[9] < 5.8975) {
            if (inputs[9] < 4.745) {
                if (inputs[2] < 1.3721429) {
                    if (inputs[5] < 1818.8975) {
                        var77 = -0.003630688;
                    } else {
                        var77 = -0.06653164;
                    }
                } else {
                    if (inputs[24] < 15.376207) {
                        if (inputs[5] < 1827.1575) {
                            var77 = -0.0017957608;
                        } else {
                            if (inputs[18] < 1.4720819) {
                                var77 = 0.071421966;
                            } else {
                                var77 = 0.009833477;
                            }
                        }
                    } else {
                        var77 = -0.027181739;
                    }
                }
            } else {
                if (inputs[18] < 1.4247512) {
                    var77 = 0.0077753807;
                } else {
                    var77 = 0.059122898;
                }
            }
        } else {
            if (inputs[25] < 2.8755717) {
                var77 = -0.056808725;
            } else {
                if (inputs[10] < 3.27) {
                    var77 = -0.020257536;
                } else {
                    var77 = 0.01815439;
                }
            }
        }
    }
    double var78;
    if (inputs[25] < 4.115349) {
        if (inputs[18] < 1.0786825) {
            var78 = -0.03239406;
        } else {
            if (inputs[23] < -45.13154) {
                if (inputs[2] < 1.2314286) {
                    var78 = 0.054539155;
                } else {
                    var78 = 0.018810898;
                }
            } else {
                if (inputs[2] < 1.2635714) {
                    var78 = -0.04150262;
                } else {
                    if (inputs[16] < -0.18129323) {
                        if (inputs[10] < 1.9575) {
                            var78 = -0.04282984;
                        } else {
                            var78 = -0.010123154;
                        }
                    } else {
                        if (inputs[19] < 1.8369683) {
                            if (inputs[2] < 1.6878572) {
                                var78 = 0.034252543;
                            } else {
                                var78 = -0.04225454;
                            }
                        } else {
                            if (inputs[10] < 1.105) {
                                var78 = 0.07906449;
                            } else {
                                var78 = 0.02077156;
                            }
                        }
                    }
                }
            }
        }
    } else {
        var78 = 0.05724037;
    }
    double var79;
    if (inputs[23] < -55.599304) {
        var79 = -0.038188305;
    } else {
        if (inputs[23] < -29.362022) {
            if (inputs[13] < 1681.44) {
                var79 = 0.061598625;
            } else {
                if (inputs[17] < 1.1380615) {
                    var79 = 0.041952204;
                } else {
                    var79 = -0.01409832;
                }
            }
        } else {
            if (inputs[21] < 2.9888563) {
                if (inputs[25] < 2.0785584) {
                    if (inputs[20] < -0.19728385) {
                        var79 = -0.052269083;
                    } else {
                        var79 = 0.0015902377;
                    }
                } else {
                    if (inputs[20] < 0.54795927) {
                        if (inputs[15] < 0.20787878) {
                            if (inputs[16] < -0.20408271) {
                                var79 = 0.043979596;
                            } else {
                                var79 = -0.025911482;
                            }
                        } else {
                            var79 = 0.06926041;
                        }
                    } else {
                        var79 = -0.020190166;
                    }
                }
            } else {
                var79 = -0.04049805;
            }
        }
    }
    double var80;
    if (inputs[5] < 1957.9825) {
        if (inputs[10] < 5.7875) {
            if (inputs[19] < 1.1154667) {
                var80 = 0.047362275;
            } else {
                if (inputs[11] < 0.43) {
                    if (inputs[13] < 1911.13) {
                        if (inputs[19] < 1.8027071) {
                            if (inputs[19] < 1.450696) {
                                var80 = 0.022390036;
                            } else {
                                var80 = -0.027092988;
                            }
                        } else {
                            if (inputs[16] < -0.19068421) {
                                var80 = -0.003102211;
                            } else {
                                var80 = 0.049186893;
                            }
                        }
                    } else {
                        var80 = -0.03777178;
                    }
                } else {
                    var80 = -0.05063128;
                }
            }
        } else {
            var80 = 0.05543681;
        }
    } else {
        var80 = -0.04415955;
    }
    double var81;
    if (inputs[21] < 3.4123142) {
        if (inputs[15] < -0.3987879) {
            if (inputs[9] < 7.84) {
                if (inputs[14] < -0.805) {
                    var81 = -0.049204677;
                } else {
                    var81 = -0.0041710446;
                }
            } else {
                var81 = 0.022222208;
            }
        } else {
            if (inputs[1] < 63.736034) {
                if (inputs[10] < 0.575) {
                    var81 = 0.07508493;
                } else {
                    if (inputs[11] < 0.37) {
                        var81 = -0.012125639;
                    } else {
                        var81 = 0.0452941;
                    }
                }
            } else {
                if (inputs[2] < 1.7664286) {
                    if (inputs[20] < -0.88841057) {
                        var81 = 0.04969778;
                    } else {
                        var81 = -0.017754497;
                    }
                } else {
                    var81 = -0.050884426;
                }
            }
        }
    } else {
        var81 = -0.05928205;
    }
    double var82;
    if (inputs[6] < 1954.48) {
        if (inputs[17] < 1.9498061) {
            if (inputs[18] < 1.568082) {
                if (inputs[15] < 0.3798788) {
                    if (inputs[9] < 5.75) {
                        if (inputs[9] < 4.725) {
                            if (inputs[2] < 1.4685714) {
                                var82 = -0.0028092396;
                            } else {
                                var82 = -0.053930376;
                            }
                        } else {
                            var82 = 0.04595912;
                        }
                    } else {
                        var82 = -0.069000416;
                    }
                } else {
                    var82 = 0.044872772;
                }
            } else {
                if (inputs[22] < 1.0) {
                    if (inputs[10] < 0.79) {
                        var82 = 0.0026361912;
                    } else {
                        var82 = 0.08640236;
                    }
                } else {
                    var82 = 0.0041219355;
                }
            }
        } else {
            if (inputs[20] < -0.4211998) {
                var82 = 0.0050891335;
            } else {
                var82 = -0.06336916;
            }
        }
    } else {
        var82 = -0.0574852;
    }
    double var83;
    if (inputs[8] < 1972.19) {
        if (inputs[4] < 1935.9) {
            if (inputs[15] < -0.55) {
                var83 = -0.045153007;
            } else {
                if (inputs[1] < 26.74845) {
                    var83 = 0.06251028;
                } else {
                    if (inputs[14] < -0.844) {
                        var83 = -0.051224332;
                    } else {
                        if (inputs[14] < -0.695) {
                            var83 = 0.053913545;
                        } else {
                            if (inputs[10] < 0.3275) {
                                var83 = -0.04320268;
                            } else {
                                var83 = 0.006895987;
                            }
                        }
                    }
                }
            }
        } else {
            var83 = 0.047786243;
        }
    } else {
        var83 = -0.041610286;
    }
    double var84;
    if (inputs[17] < 2.2747958) {
        if (inputs[16] < -0.20752631) {
            if (inputs[19] < 2.2575169) {
                var84 = 0.06384877;
            } else {
                var84 = 0.010008374;
            }
        } else {
            if (inputs[1] < 30.740921) {
                var84 = -0.04910885;
            } else {
                if (inputs[16] < 0.2694436) {
                    if (inputs[17] < 0.96067894) {
                        var84 = -0.037127133;
                    } else {
                        if (inputs[4] < 1924.325) {
                            if (inputs[16] < -0.041323308) {
                                var84 = 0.044764407;
                            } else {
                                var84 = 0.005897183;
                            }
                        } else {
                            var84 = -0.039120913;
                        }
                    }
                } else {
                    var84 = 0.043332536;
                }
            }
        }
    } else {
        var84 = -0.027919723;
    }
    double var85;
    if (inputs[20] < -1.6100832) {
        var85 = -0.044444047;
    } else {
        if (inputs[23] < -3.9755354) {
            if (inputs[23] < -16.599993) {
                if (inputs[10] < 0.67) {
                    if (inputs[2] < 1.3678571) {
                        var85 = -0.01577265;
                    } else {
                        var85 = -0.046915494;
                    }
                } else {
                    if (inputs[25] < 2.2597165) {
                        var85 = 0.06214868;
                    } else {
                        if (inputs[18] < 1.5333036) {
                            if (inputs[15] < -0.18915151) {
                                var85 = -0.0049579917;
                            } else {
                                var85 = 0.039942477;
                            }
                        } else {
                            var85 = -0.035544164;
                        }
                    }
                }
            } else {
                var85 = -0.054509446;
            }
        } else {
            if (inputs[21] < 2.4526935) {
                if (inputs[23] < 0.9116595) {
                    if (inputs[20] < 0.22477308) {
                        var85 = 0.034410387;
                    } else {
                        var85 = 0.08223685;
                    }
                } else {
                    var85 = 0.0034112625;
                }
            } else {
                var85 = -0.021018237;
            }
        }
    }
    double var86;
    if (inputs[16] < 0.16592482) {
        if (inputs[20] < -1.1419783) {
            if (inputs[23] < -3.9755354) {
                var86 = -0.008107727;
            } else {
                var86 = -0.08254786;
            }
        } else {
            if (inputs[10] < 0.56) {
                if (inputs[9] < 2.695) {
                    var86 = 0.00047397666;
                } else {
                    var86 = 0.057033118;
                }
            } else {
                if (inputs[20] < -0.5083069) {
                    var86 = 0.02817608;
                } else {
                    if (inputs[20] < 1.3350888) {
                        if (inputs[3] < 1763.92) {
                            var86 = -0.07519984;
                        } else {
                            if (inputs[24] < -12.202692) {
                                var86 = -0.048776504;
                            } else {
                                var86 = 0.013821984;
                            }
                        }
                    } else {
                        var86 = 0.017657233;
                    }
                }
            }
        }
    } else {
        if (inputs[1] < 74.50789) {
            if (inputs[24] < 19.300243) {
                var86 = 0.016673533;
            } else {
                var86 = 0.06509166;
            }
        } else {
            var86 = -0.03584662;
        }
    }
    double var87;
    if (inputs[19] < 1.65015) {
        if (inputs[21] < -2.872818) {
            var87 = -0.05101666;
        } else {
            if (inputs[9] < 5.12) {
                if (inputs[16] < 0.0073533836) {
                    var87 = 0.03792588;
                } else {
                    if (inputs[17] < 1.2178605) {
                        var87 = 0.02529677;
                    } else {
                        var87 = -0.02470638;
                    }
                }
            } else {
                var87 = -0.030782614;
            }
        }
    } else {
        if (inputs[9] < 6.11) {
            if (inputs[11] < 0.34) {
                if (inputs[18] < 2.0877118) {
                    var87 = -0.041125175;
                } else {
                    var87 = 0.030365981;
                }
            } else {
                var87 = 0.030877363;
            }
        } else {
            if (inputs[18] < 2.063856) {
                var87 = 0.068705834;
            } else {
                if (inputs[8] < 1866.04) {
                    var87 = 0.041252524;
                } else {
                    var87 = -0.013695568;
                }
            }
        }
    }
    double var88;
    if (inputs[2] < 0.96428573) {
        var88 = 0.047746927;
    } else {
        if (inputs[16] < 0.014992481) {
            if (inputs[15] < -0.18448485) {
                if (inputs[19] < 1.3690054) {
                    var88 = -0.02917717;
                } else {
                    if (inputs[23] < -43.20845) {
                        var88 = 0.06707995;
                    } else {
                        if (inputs[14] < -0.763) {
                            if (inputs[13] < 1844.63) {
                                var88 = -0.0060003977;
                            } else {
                                var88 = 0.04983599;
                            }
                        } else {
                            var88 = -0.043414418;
                        }
                    }
                }
            } else {
                var88 = 0.049355753;
            }
        } else {
            if (inputs[23] < -35.493023) {
                var88 = -0.05337059;
            } else {
                if (inputs[14] < 0.641) {
                    var88 = -0.03041873;
                } else {
                    if (inputs[14] < 0.759) {
                        var88 = 0.04853295;
                    } else {
                        if (inputs[19] < 1.65015) {
                            var88 = -0.032097656;
                        } else {
                            var88 = 0.024403995;
                        }
                    }
                }
            }
        }
    }
    double var89;
    if (inputs[24] < 25.151962) {
        if (inputs[13] < 1805.83) {
            if (inputs[25] < 3.1700976) {
                if (inputs[2] < 1.3507143) {
                    var89 = 0.07612921;
                } else {
                    if (inputs[20] < 0.33301044) {
                        var89 = 0.04413836;
                    } else {
                        var89 = -0.025618603;
                    }
                }
            } else {
                var89 = -0.017598528;
            }
        } else {
            if (inputs[6] < 1870.87) {
                if (inputs[10] < 0.71) {
                    var89 = -0.008914164;
                } else {
                    var89 = -0.053752877;
                }
            } else {
                if (inputs[24] < 15.588893) {
                    if (inputs[15] < -0.5858182) {
                        var89 = 0.03581392;
                    } else {
                        if (inputs[6] < 1931.85) {
                            var89 = -0.047156125;
                        } else {
                            var89 = 0.001643722;
                        }
                    }
                } else {
                    var89 = 0.04031539;
                }
            }
        }
    } else {
        var89 = -0.04861585;
    }
    double var90;
    if (inputs[25] < 4.115349) {
        if (inputs[10] < 2.105) {
            if (inputs[1] < 71.80589) {
                if (inputs[24] < 13.6656685) {
                    if (inputs[24] < -8.256524) {
                        if (inputs[19] < 1.4164727) {
                            var90 = -0.039355323;
                        } else {
                            if (inputs[20] < -0.09276572) {
                                var90 = 0.04159084;
                            } else {
                                var90 = -0.016848061;
                            }
                        }
                    } else {
                        if (inputs[25] < 2.0918984) {
                            var90 = 0.056594655;
                        } else {
                            var90 = 0.009688697;
                        }
                    }
                } else {
                    if (inputs[9] < 3.025) {
                        var90 = 0.0067657093;
                    } else {
                        var90 = -0.05959238;
                    }
                }
            } else {
                var90 = 0.04993267;
            }
        } else {
            if (inputs[2] < 2.3585715) {
                if (inputs[10] < 2.9375) {
                    var90 = -0.08368134;
                } else {
                    var90 = -0.027786274;
                }
            } else {
                if (inputs[3] < 1864.75) {
                    var90 = 0.054258678;
                } else {
                    var90 = -0.034575842;
                }
            }
        }
    } else {
        var90 = 0.04650597;
    }
    double var91;
    if (inputs[2] < 0.96428573) {
        var91 = 0.035916008;
    } else {
        if (inputs[20] < 1.0724006) {
            if (inputs[18] < 3.1273727) {
                if (inputs[2] < 2.732143) {
                    if (inputs[18] < 1.7450455) {
                        if (inputs[5] < 1910.0225) {
                            if (inputs[21] < -2.8556485) {
                                var91 = -0.01902682;
                            } else {
                                var91 = 0.027342387;
                            }
                        } else {
                            var91 = -0.026947718;
                        }
                    } else {
                        if (inputs[10] < 1.0075) {
                            var91 = -0.014801663;
                        } else {
                            var91 = -0.046563536;
                        }
                    }
                } else {
                    var91 = 0.05371594;
                }
            } else {
                var91 = -0.03418439;
            }
        } else {
            if (inputs[18] < 1.59889) {
                var91 = -0.054676708;
            } else {
                var91 = -0.0026168176;
            }
        }
    }
    double var92;
    if (inputs[16] < -0.32093233) {
        var92 = -0.044870634;
    } else {
        if (inputs[1] < 26.023777) {
            var92 = 0.05469614;
        } else {
            if (inputs[1] < 31.394823) {
                var92 = -0.036435325;
            } else {
                if (inputs[16] < -0.12616542) {
                    var92 = 0.03994655;
                } else {
                    if (inputs[14] < 0.813) {
                        if (inputs[9] < 2.86) {
                            var92 = -0.04645718;
                        } else {
                            if (inputs[14] < 0.621) {
                                var92 = 0.019015526;
                            } else {
                                var92 = -0.042781357;
                            }
                        }
                    } else {
                        if (inputs[16] < 0.12944362) {
                            var92 = 0.04487782;
                        } else {
                            if (inputs[2] < 1.9985714) {
                                var92 = -0.038745105;
                            } else {
                                var92 = 0.034067508;
                            }
                        }
                    }
                }
            }
        }
    }
    double var93;
    if (inputs[21] < -2.2965488) {
        if (inputs[19] < 1.3652738) {
            var93 = -0.006308975;
        } else {
            if (inputs[24] < -16.417265) {
                if (inputs[15] < -0.54242426) {
                    var93 = 0.010219856;
                } else {
                    var93 = 0.07347845;
                }
            } else {
                var93 = 0.008544011;
            }
        }
    } else {
        if (inputs[13] < 1911.85) {
            if (inputs[4] < 1668.655) {
                var93 = -0.04022896;
            } else {
                if (inputs[11] < 0.38) {
                    if (inputs[23] < -7.982278) {
                        if (inputs[20] < -0.22793856) {
                            var93 = 0.027060999;
                        } else {
                            var93 = 0.014299775;
                        }
                    } else {
                        var93 = -0.038385533;
                    }
                } else {
                    if (inputs[10] < 0.765) {
                        var93 = -0.007393196;
                    } else {
                        var93 = 0.051593803;
                    }
                }
            }
        } else {
            if (inputs[15] < 0.39478788) {
                var93 = -0.022968343;
            } else {
                var93 = -0.072114505;
            }
        }
    }
    double var94;
    if (inputs[18] < 1.0505737) {
        var94 = 0.033839352;
    } else {
        if (inputs[16] < -0.32093233) {
            var94 = -0.039807275;
        } else {
            if (inputs[6] < 1940.265) {
                if (inputs[11] < 0.44) {
                    if (inputs[3] < 1662.8) {
                        var94 = 0.03794472;
                    } else {
                        if (inputs[18] < 2.2988102) {
                            if (inputs[18] < 1.9561083) {
                                var94 = -0.006458834;
                            } else {
                                var94 = 0.04273382;
                            }
                        } else {
                            var94 = -0.040624056;
                        }
                    }
                } else {
                    var94 = -0.046191253;
                }
            } else {
                var94 = 0.035056166;
            }
        }
    }
    double var95;
    if (inputs[16] < 0.2694436) {
        if (inputs[6] < 1773.21) {
            if (inputs[17] < 1.075472) {
                var95 = -0.02612083;
            } else {
                if (inputs[2] < 1.3721429) {
                    var95 = 0.049306735;
                } else {
                    if (inputs[2] < 1.9864286) {
                        var95 = -0.034103118;
                    } else {
                        var95 = 0.043835614;
                    }
                }
            }
        } else {
            if (inputs[6] < 1933.575) {
                if (inputs[20] < -1.2484047) {
                    var95 = -0.06431438;
                } else {
                    if (inputs[17] < 1.0965656) {
                        var95 = 0.0166445;
                    } else {
                        if (inputs[20] < -0.07619367) {
                            var95 = 0.015627941;
                        } else {
                            if (inputs[20] < 0.86715806) {
                                var95 = -0.07811879;
                            } else {
                                var95 = -0.025917549;
                            }
                        }
                    }
                }
            } else {
                var95 = 0.013043143;
            }
        }
    } else {
        var95 = 0.036122352;
    }
    double var96;
    if (inputs[18] < 1.0505737) {
        var96 = 0.035000343;
    } else {
        if (inputs[19] < 1.3897288) {
            if (inputs[20] < -0.5177981) {
                var96 = -0.08290732;
            } else {
                if (inputs[20] < 0.86715806) {
                    var96 = -0.02737933;
                } else {
                    var96 = 0.020917792;
                }
            }
        } else {
            if (inputs[16] < -0.31618798) {
                var96 = -0.02215814;
            } else {
                if (inputs[24] < -18.783993) {
                    var96 = 0.061733127;
                } else {
                    if (inputs[18] < 1.5035175) {
                        if (inputs[8] < 1839.08) {
                            var96 = -0.052611947;
                        } else {
                            var96 = 0.011399613;
                        }
                    } else {
                        if (inputs[10] < 0.48) {
                            var96 = 0.045359142;
                        } else {
                            if (inputs[20] < 0.035118297) {
                                var96 = 0.026288794;
                            } else {
                                var96 = -0.015855791;
                            }
                        }
                    }
                }
            }
        }
    }
    double var97;
    if (inputs[1] < 69.681725) {
        if (inputs[17] < 0.83912814) {
            var97 = -0.04428331;
        } else {
            if (inputs[24] < -25.921698) {
                var97 = -0.038718432;
            } else {
                if (inputs[2] < 1.7292857) {
                    if (inputs[10] < 0.9675) {
                        if (inputs[21] < -2.550636) {
                            var97 = 0.018247101;
                        } else {
                            var97 = 0.0739204;
                        }
                    } else {
                        if (inputs[15] < -0.29218182) {
                            var97 = 0.037348885;
                        } else {
                            var97 = -0.026318623;
                        }
                    }
                } else {
                    if (inputs[2] < 2.67) {
                        if (inputs[24] < -5.6186476) {
                            var97 = -0.05300656;
                        } else {
                            var97 = -0.004479275;
                        }
                    } else {
                        if (inputs[20] < 0.28880712) {
                            var97 = 0.06256743;
                        } else {
                            var97 = -0.012893997;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[20] < -0.07619367) {
            var97 = -0.000024920706;
        } else {
            var97 = -0.06003085;
        }
    }
    double var98;
    if (inputs[17] < 1.1192747) {
        if (inputs[23] < -40.748318) {
            var98 = 0.019404262;
        } else {
            if (inputs[17] < 0.98597366) {
                var98 = -0.008431302;
            } else {
                var98 = -0.07913688;
            }
        }
    } else {
        if (inputs[20] < -0.09276572) {
            if (inputs[18] < 1.8656926) {
                if (inputs[21] < 2.5301204) {
                    var98 = 0.01607251;
                } else {
                    var98 = 0.07387835;
                }
            } else {
                var98 = -0.0099423565;
            }
        } else {
            if (inputs[23] < -36.984165) {
                var98 = -0.04692623;
            } else {
                if (inputs[12] < 1782.13) {
                    var98 = -0.033162937;
                } else {
                    if (inputs[20] < 0.49242997) {
                        var98 = -0.020659227;
                    } else {
                        if (inputs[5] < 1909.48) {
                            var98 = 0.07258006;
                        } else {
                            var98 = -0.008102749;
                        }
                    }
                }
            }
        }
    }
    double var99;
    if (inputs[24] < 25.472149) {
        if (inputs[20] < -0.16443706) {
            if (inputs[10] < 0.465) {
                var99 = -0.04423182;
            } else {
                if (inputs[18] < 1.2435127) {
                    var99 = -0.03150617;
                } else {
                    if (inputs[18] < 1.5157641) {
                        var99 = 0.06299034;
                    } else {
                        if (inputs[10] < 2.455) {
                            var99 = -0.012025161;
                        } else {
                            var99 = 0.031541307;
                        }
                    }
                }
            }
        } else {
            if (inputs[20] < 0.106602594) {
                var99 = 0.06062238;
            } else {
                if (inputs[9] < 7.84) {
                    if (inputs[10] < 1.16) {
                        if (inputs[17] < 1.38704) {
                            var99 = 0.005092463;
                        } else {
                            var99 = 0.06160838;
                        }
                    } else {
                        if (inputs[2] < 1.3507143) {
                            var99 = 0.019975506;
                        } else {
                            var99 = -0.07100883;
                        }
                    }
                } else {
                    var99 = 0.05230646;
                }
            }
        }
    } else {
        var99 = -0.033553086;
    }
    double var100;
    if (inputs[24] < 18.969734) {
        if (inputs[9] < 1.6825) {
            var100 = -0.06882849;
        } else {
            if (inputs[14] < -0.906) {
                if (inputs[17] < 1.9682418) {
                    var100 = 0.050037753;
                } else {
                    var100 = -0.004458094;
                }
            } else {
                if (inputs[2] < 2.0564287) {
                    if (inputs[25] < 2.518391) {
                        if (inputs[16] < -0.044586465) {
                            var100 = 0.063874625;
                        } else {
                            var100 = 0.0008522154;
                        }
                    } else {
                        if (inputs[10] < 1.245) {
                            var100 = -0.038280573;
                        } else {
                            var100 = 0.012896182;
                        }
                    }
                } else {
                    var100 = -0.049112875;
                }
            }
        }
    } else {
        if (inputs[24] < 25.472149) {
            var100 = 0.059945647;
        } else {
            var100 = -0.008557046;
        }
    }
    double var101;
    if (inputs[1] < 68.044624) {
        if (inputs[23] < 10.910757) {
            if (inputs[14] < 0.641) {
                if (inputs[20] < 1.5039043) {
                    if (inputs[2] < 1.2928572) {
                        var101 = -0.047073755;
                    } else {
                        if (inputs[2] < 2.0564287) {
                            if (inputs[17] < 1.3576244) {
                                var101 = 0.044059765;
                            } else {
                                var101 = -0.013344308;
                            }
                        } else {
                            var101 = -0.027647747;
                        }
                    }
                } else {
                    var101 = 0.04577887;
                }
            } else {
                if (inputs[2] < 1.9107143) {
                    var101 = 0.024652451;
                } else {
                    var101 = 0.065502286;
                }
            }
        } else {
            var101 = -0.03848923;
        }
    } else {
        if (inputs[11] < 0.31) {
            var101 = -0.054497443;
        } else {
            if (inputs[2] < 1.1414286) {
                var101 = -0.038038436;
            } else {
                var101 = 0.011829462;
            }
        }
    }
    double var102;
    if (inputs[11] < 0.17) {
        var102 = 0.04030166;
    } else {
        if (inputs[21] < 3.1594846) {
            if (inputs[21] < 2.5301204) {
                if (inputs[13] < 1940.95) {
                    if (inputs[20] < -0.95399433) {
                        var102 = -0.044923313;
                    } else {
                        if (inputs[23] < -19.270708) {
                            if (inputs[17] < 1.2774255) {
                                var102 = -0.022386832;
                            } else {
                                var102 = 0.04049422;
                            }
                        } else {
                            if (inputs[17] < 1.2178605) {
                                var102 = 0.016285233;
                            } else {
                                var102 = -0.042052638;
                            }
                        }
                    }
                } else {
                    var102 = 0.030783681;
                }
            } else {
                var102 = 0.031130055;
            }
        } else {
            var102 = -0.047509946;
        }
    }
    double var103;
    if (inputs[16] < -0.21651128) {
        if (inputs[25] < 3.3829618) {
            var103 = 0.04639257;
        } else {
            var103 = 0.0004902491;
        }
    } else {
        if (inputs[25] < 2.792573) {
            if (inputs[20] < -0.11280487) {
                if (inputs[23] < -3.152488) {
                    var103 = -0.029304951;
                } else {
                    var103 = 0.01959963;
                }
            } else {
                if (inputs[20] < 0.69257766) {
                    var103 = -0.09454273;
                } else {
                    var103 = -0.0066624815;
                }
            }
        } else {
            if (inputs[6] < 1709.76) {
                var103 = -0.036082137;
            } else {
                if (inputs[23] < 0.0) {
                    if (inputs[15] < 0.32775757) {
                        var103 = 0.022147678;
                    } else {
                        var103 = 0.0677129;
                    }
                } else {
                    var103 = -0.008118302;
                }
            }
        }
    }
    double var104;
    if (inputs[17] < 0.9489573) {
        if (inputs[25] < 3.021015) {
            var104 = -0.05418143;
        } else {
            var104 = -0.0146071585;
        }
    } else {
        if (inputs[23] < -45.13154) {
            var104 = 0.03170144;
        } else {
            if (inputs[17] < 2.0461183) {
                if (inputs[24] < 20.301311) {
                    if (inputs[15] < 0.30321214) {
                        if (inputs[20] < 1.1309487) {
                            if (inputs[1] < 31.467228) {
                                var104 = -0.02158817;
                            } else {
                                var104 = 0.025213737;
                            }
                        } else {
                            var104 = -0.03706241;
                        }
                    } else {
                        var104 = -0.041723903;
                    }
                } else {
                    var104 = 0.036405876;
                }
            } else {
                if (inputs[23] < -14.196849) {
                    var104 = -0.008946664;
                } else {
                    var104 = 0.05664671;
                }
            }
        }
    }
    double var105;
    if (inputs[10] < 1.74) {
        if (inputs[15] < 0.54818183) {
            if (inputs[15] < -0.29218182) {
                if (inputs[15] < -0.3961212) {
                    if (inputs[21] < -2.6482213) {
                        var105 = -0.014833706;
                    } else {
                        var105 = 0.03299463;
                    }
                } else {
                    var105 = 0.062374014;
                }
            } else {
                if (inputs[17] < 1.1853675) {
                    var105 = -0.035313368;
                } else {
                    if (inputs[18] < 1.4373323) {
                        var105 = 0.029549563;
                    } else {
                        var105 = -0.022936003;
                    }
                }
            }
        } else {
            var105 = 0.06400715;
        }
    } else {
        if (inputs[19] < 1.3578346) {
            var105 = -0.054212242;
        } else {
            if (inputs[15] < -0.55) {
                var105 = -0.052289944;
            } else {
                if (inputs[15] < -0.25133333) {
                    var105 = 0.057144444;
                } else {
                    if (inputs[16] < 0.22166166) {
                        var105 = -0.038492262;
                    } else {
                        var105 = 0.01065528;
                    }
                }
            }
        }
    }
    double var106;
    if (inputs[15] < 0.41733333) {
        if (inputs[19] < 1.8369683) {
            if (inputs[19] < 1.4670558) {
                if (inputs[2] < 1.2021428) {
                    var106 = 0.036135443;
                } else {
                    if (inputs[17] < 1.2416344) {
                        var106 = 0.019026428;
                    } else {
                        var106 = -0.045805402;
                    }
                }
            } else {
                if (inputs[3] < 1802.865) {
                    var106 = -0.075160965;
                } else {
                    var106 = -0.017675083;
                }
            }
        } else {
            if (inputs[19] < 2.3010995) {
                var106 = 0.04723572;
            } else {
                if (inputs[20] < -0.09276572) {
                    var106 = 0.044386264;
                } else {
                    var106 = -0.054558825;
                }
            }
        }
    } else {
        if (inputs[10] < 1.2175) {
            var106 = -0.009424523;
        } else {
            var106 = -0.050475698;
        }
    }
    double var107;
    if (inputs[14] < -0.563) {
        if (inputs[15] < -0.31369698) {
            if (inputs[16] < -0.09418045) {
                if (inputs[16] < -0.17314285) {
                    if (inputs[6] < 1826.915) {
                        var107 = -0.030577106;
                    } else {
                        var107 = 0.020069074;
                    }
                } else {
                    var107 = 0.05267176;
                }
            } else {
                var107 = -0.04295063;
            }
        } else {
            var107 = -0.04132149;
        }
    } else {
        if (inputs[16] < -0.051210526) {
            var107 = 0.05660201;
        } else {
            if (inputs[18] < 1.2593713) {
                var107 = -0.02772732;
            } else {
                if (inputs[10] < 1.185) {
                    var107 = 0.04305343;
                } else {
                    if (inputs[2] < 1.6328571) {
                        var107 = 0.03425584;
                    } else {
                        var107 = -0.02274092;
                    }
                }
            }
        }
    }
    double var108;
    if (inputs[17] < 0.9245842) {
        var108 = 0.03617849;
    } else {
        if (inputs[25] < 2.3657753) {
            if (inputs[8] < 1856.42) {
                if (inputs[9] < 3.455) {
                    var108 = -0.005567929;
                } else {
                    var108 = -0.07366184;
                }
            } else {
                var108 = 0.025511986;
            }
        } else {
            if (inputs[18] < 1.1427113) {
                var108 = -0.030914718;
            } else {
                if (inputs[25] < 2.8523908) {
                    if (inputs[22] < 1.0) {
                        var108 = 0.01944665;
                    } else {
                        var108 = 0.07504133;
                    }
                } else {
                    if (inputs[16] < -0.12382707) {
                        if (inputs[18] < 1.5851072) {
                            var108 = 0.057537355;
                        } else {
                            var108 = 0.012995239;
                        }
                    } else {
                        if (inputs[23] < -3.152488) {
                            var108 = 0.009080793;
                        } else {
                            var108 = -0.05476591;
                        }
                    }
                }
            }
        }
    }
    double var109;
    if (inputs[23] < -35.493023) {
        if (inputs[18] < 1.4196408) {
            var109 = 0.01148264;
        } else {
            var109 = -0.045872174;
        }
    } else {
        if (inputs[25] < 3.021015) {
            if (inputs[24] < -14.111691) {
                var109 = -0.03128718;
            } else {
                if (inputs[1] < 36.326664) {
                    var109 = 0.050065454;
                } else {
                    if (inputs[20] < -0.92651445) {
                        var109 = -0.030056275;
                    } else {
                        if (inputs[20] < 0.106602594) {
                            var109 = 0.04076923;
                        } else {
                            var109 = -0.0015827557;
                        }
                    }
                }
            }
        } else {
            if (inputs[25] < 3.3829618) {
                var109 = 0.06618888;
            } else {
                if (inputs[8] < 1824.01) {
                    var109 = -0.017616773;
                } else {
                    var109 = 0.053905863;
                }
            }
        }
    }
    double var110;
    if (inputs[19] < 1.222446) {
        if (inputs[20] < -0.34501442) {
            var110 = -0.0014769811;
        } else {
            var110 = 0.06454166;
        }
    } else {
        if (inputs[10] < 0.85) {
            if (inputs[1] < 66.95797) {
                if (inputs[21] < -2.3903956) {
                    var110 = -0.018071324;
                } else {
                    var110 = -0.07483393;
                }
            } else {
                var110 = 0.028669031;
            }
        } else {
            if (inputs[1] < 69.5182) {
                if (inputs[1] < 34.081207) {
                    if (inputs[24] < -20.653982) {
                        var110 = 0.022406328;
                    } else {
                        var110 = -0.040398613;
                    }
                } else {
                    if (inputs[13] < 1835.06) {
                        var110 = 0.07261457;
                    } else {
                        var110 = 0.009942497;
                    }
                }
            } else {
                var110 = -0.027261587;
            }
        }
    }
    double var111;
    if (inputs[21] < -3.3407135) {
        var111 = -0.04267355;
    } else {
        if (inputs[15] < -0.71115154) {
            var111 = 0.053593647;
        } else {
            if (inputs[19] < 2.110528) {
                if (inputs[19] < 1.65015) {
                    if (inputs[25] < 3.2769408) {
                        if (inputs[25] < 2.4260485) {
                            if (inputs[16] < -0.044586465) {
                                var111 = 0.04855554;
                            } else {
                                var111 = -0.0076083266;
                            }
                        } else {
                            if (inputs[13] < 1808.35) {
                                var111 = 0.005358096;
                            } else {
                                var111 = -0.07083748;
                            }
                        }
                    } else {
                        var111 = 0.032956988;
                    }
                } else {
                    if (inputs[9] < 4.68) {
                        var111 = 0.02572564;
                    } else {
                        var111 = 0.06933634;
                    }
                }
            } else {
                if (inputs[15] < 0.4050303) {
                    var111 = -0.06060888;
                } else {
                    var111 = 0.0062860674;
                }
            }
        }
    }
    double var112;
    if (inputs[9] < 1.4575) {
        var112 = -0.03817307;
    } else {
        if (inputs[24] < 25.472149) {
            if (inputs[2] < 1.6985714) {
                if (inputs[2] < 1.2535714) {
                    if (inputs[10] < 1.3125) {
                        var112 = -0.03569653;
                    } else {
                        var112 = 0.02927131;
                    }
                } else {
                    if (inputs[19] < 1.3897288) {
                        var112 = 0.010113588;
                    } else {
                        if (inputs[1] < 34.17677) {
                            var112 = 0.03159059;
                        } else {
                            var112 = 0.086499214;
                        }
                    }
                }
            } else {
                if (inputs[19] < 1.8369683) {
                    var112 = -0.03222109;
                } else {
                    if (inputs[15] < 0.2930303) {
                        if (inputs[21] < -2.3217247) {
                            var112 = 0.01870768;
                        } else {
                            var112 = -0.042470865;
                        }
                    } else {
                        var112 = 0.04086825;
                    }
                }
            }
        } else {
            var112 = -0.038765207;
        }
    }
    double var113;
    if (inputs[16] < 0.2694436) {
        if (inputs[16] < 0.19218796) {
            if (inputs[17] < 1.0672319) {
                if (inputs[10] < 1.0075) {
                    var113 = 0.002791163;
                } else {
                    var113 = -0.040153895;
                }
            } else {
                if (inputs[17] < 1.2208292) {
                    var113 = 0.047707397;
                } else {
                    if (inputs[6] < 1931.85) {
                        if (inputs[13] < 1730.38) {
                            var113 = 0.023326343;
                        } else {
                            if (inputs[25] < 2.6826775) {
                                var113 = -0.04080463;
                            } else {
                                var113 = 0.0140912235;
                            }
                        }
                    } else {
                        var113 = 0.041199416;
                    }
                }
            }
        } else {
            var113 = -0.049388666;
        }
    } else {
        var113 = 0.030465415;
    }
    double var114;
    if (inputs[18] < 1.6337148) {
        if (inputs[24] < 22.278522) {
            if (inputs[15] < 0.36539394) {
                if (inputs[19] < 1.1290221) {
                    var114 = 0.035549175;
                } else {
                    if (inputs[24] < -18.488583) {
                        var114 = 0.030002017;
                    } else {
                        if (inputs[9] < 4.725) {
                            if (inputs[21] < -2.00622) {
                                var114 = -0.06332802;
                            } else {
                                var114 = 0.00066960626;
                            }
                        } else {
                            var114 = 0.013334454;
                        }
                    }
                }
            } else {
                var114 = 0.050180808;
            }
        } else {
            var114 = -0.019383429;
        }
    } else {
        if (inputs[25] < 3.2850122) {
            if (inputs[14] < -1.185) {
                var114 = 0.046897914;
            } else {
                if (inputs[1] < 58.76526) {
                    var114 = -0.060474962;
                } else {
                    if (inputs[1] < 64.69049) {
                        var114 = 0.04375746;
                    } else {
                        var114 = -0.027648445;
                    }
                }
            }
        } else {
            var114 = -0.056152984;
        }
    }
    double var115;
    if (inputs[24] < 25.151962) {
        if (inputs[24] < 19.951187) {
            if (inputs[15] < -0.32460606) {
                if (inputs[24] < -25.683517) {
                    var115 = -0.029518053;
                } else {
                    if (inputs[24] < -20.653982) {
                        var115 = 0.074725434;
                    } else {
                        if (inputs[6] < 1813.735) {
                            var115 = 0.025112849;
                        } else {
                            var115 = -0.015972832;
                        }
                    }
                }
            } else {
                if (inputs[17] < 0.9943239) {
                    var115 = 0.025913754;
                } else {
                    if (inputs[9] < 4.47) {
                        if (inputs[14] < 0.813) {
                            var115 = -0.037521627;
                        } else {
                            var115 = 0.02783929;
                        }
                    } else {
                        if (inputs[16] < 0.106548876) {
                            var115 = -0.08241918;
                        } else {
                            var115 = -0.036961522;
                        }
                    }
                }
            }
        } else {
            var115 = 0.043475747;
        }
    } else {
        var115 = -0.048677;
    }
    double var116;
    if (inputs[25] < 1.6705577) {
        var116 = -0.047862217;
    } else {
        if (inputs[11] < 0.44) {
            if (inputs[16] < -0.16803007) {
                if (inputs[21] < -2.8395061) {
                    if (inputs[9] < 6.0675) {
                        var116 = -0.020601017;
                    } else {
                        var116 = 0.03469662;
                    }
                } else {
                    var116 = -0.0620072;
                }
            } else {
                if (inputs[14] < -0.638) {
                    if (inputs[24] < -17.368395) {
                        var116 = 0.056951433;
                    } else {
                        var116 = 0.02438786;
                    }
                } else {
                    if (inputs[14] < 0.452) {
                        var116 = -0.04062789;
                    } else {
                        if (inputs[19] < 1.3074727) {
                            var116 = 0.03907123;
                        } else {
                            if (inputs[23] < -8.969337) {
                                var116 = -0.0314039;
                            } else {
                                var116 = 0.019256696;
                            }
                        }
                    }
                }
            }
        } else {
            var116 = -0.04177664;
        }
    }
    double var117;
    if (inputs[5] < 1852.1875) {
        if (inputs[16] < 0.2694436) {
            if (inputs[16] < 0.15609023) {
                if (inputs[14] < -0.991) {
                    var117 = 0.049591567;
                } else {
                    if (inputs[25] < 2.3247232) {
                        var117 = -0.034348615;
                    } else {
                        if (inputs[21] < -2.6752014) {
                            var117 = -0.01294349;
                        } else {
                            var117 = 0.042893335;
                        }
                    }
                }
            } else {
                var117 = -0.050813638;
            }
        } else {
            var117 = 0.060209986;
        }
    } else {
        if (inputs[15] < -0.54242426) {
            var117 = 0.023963813;
        } else {
            if (inputs[6] < 1931.85) {
                if (inputs[14] < 0.514) {
                    var117 = -0.09116441;
                } else {
                    var117 = -0.014116663;
                }
            } else {
                var117 = 0.0059942366;
            }
        }
    }
    double var118;
    if (inputs[15] < -0.6342424) {
        var118 = 0.045265663;
    } else {
        if (inputs[25] < 3.8263185) {
            if (inputs[24] < -20.653982) {
                var118 = 0.039093178;
            } else {
                if (inputs[15] < -0.33327273) {
                    var118 = -0.038923588;
                } else {
                    if (inputs[17] < 0.9873723) {
                        var118 = 0.04288486;
                    } else {
                        if (inputs[23] < -32.103245) {
                            var118 = 0.02771459;
                        } else {
                            if (inputs[2] < 2.78) {
                                var118 = -0.027454002;
                            } else {
                                var118 = 0.030936321;
                            }
                        }
                    }
                }
            }
        } else {
            var118 = -0.04092615;
        }
    }
    double var119;
    if (inputs[18] < 2.2016084) {
        if (inputs[19] < 1.8369683) {
            if (inputs[11] < 0.36) {
                if (inputs[25] < 3.0107527) {
                    var119 = -0.05124401;
                } else {
                    var119 = 0.008472598;
                }
            } else {
                if (inputs[20] < 0.7862127) {
                    if (inputs[19] < 1.3448958) {
                        if (inputs[25] < 2.518391) {
                            var119 = 0.04242672;
                        } else {
                            var119 = -0.015163206;
                        }
                    } else {
                        var119 = -0.03525516;
                    }
                } else {
                    var119 = 0.039599705;
                }
            }
        } else {
            if (inputs[25] < 2.89441) {
                var119 = 0.053990822;
            } else {
                var119 = 0.00058834354;
            }
        }
    } else {
        if (inputs[15] < -0.71115154) {
            var119 = 0.010104018;
        } else {
            var119 = -0.05377376;
        }
    }
    double var120;
    if (inputs[25] < 4.2767625) {
        if (inputs[18] < 1.0505737) {
            var120 = 0.034153435;
        } else {
            if (inputs[25] < 2.2597165) {
                if (inputs[25] < 1.8835075) {
                    var120 = -0.013149283;
                } else {
                    var120 = 0.037434544;
                }
            } else {
                if (inputs[13] < 1737.78) {
                    if (inputs[13] < 1692.61) {
                        var120 = -0.022972465;
                    } else {
                        var120 = 0.051598273;
                    }
                } else {
                    if (inputs[19] < 1.4164727) {
                        if (inputs[18] < 1.34489) {
                            var120 = -0.07644025;
                        } else {
                            var120 = -0.029677493;
                        }
                    } else {
                        if (inputs[20] < 0.81114143) {
                            if (inputs[19] < 2.110528) {
                                var120 = 0.0064277872;
                            } else {
                                var120 = -0.047058422;
                            }
                        } else {
                            var120 = 0.02773875;
                        }
                    }
                }
            }
        }
    } else {
        var120 = 0.038000412;
    }
    double var121;
    if (inputs[24] < -25.921698) {
        var121 = -0.037510447;
    } else {
        if (inputs[11] < 0.29) {
            if (inputs[14] < -0.763) {
                var121 = 0.01606283;
            } else {
                if (inputs[15] < 0.49248484) {
                    var121 = -0.0432293;
                } else {
                    var121 = -0.00036385507;
                }
            }
        } else {
            if (inputs[15] < -0.48763636) {
                var121 = 0.05361543;
            } else {
                if (inputs[14] < -0.835) {
                    var121 = -0.031354737;
                } else {
                    if (inputs[20] < -1.1626294) {
                        var121 = -0.013250699;
                    } else {
                        if (inputs[3] < 1763.92) {
                            var121 = -0.008113251;
                        } else {
                            if (inputs[23] < -18.384315) {
                                var121 = 0.006740617;
                            } else {
                                var121 = 0.050300438;
                            }
                        }
                    }
                }
            }
        }
    }
    double var122;
    if (inputs[1] < 73.75911) {
        if (inputs[19] < 1.3542114) {
            if (inputs[15] < 0.23206061) {
                if (inputs[24] < -9.991037) {
                    var122 = -0.033057667;
                } else {
                    var122 = 0.029908061;
                }
            } else {
                var122 = -0.0611609;
            }
        } else {
            if (inputs[16] < -0.26983458) {
                var122 = -0.016817281;
            } else {
                if (inputs[20] < 0.7422704) {
                    if (inputs[12] < 1932.51) {
                        if (inputs[9] < 2.985) {
                            var122 = 0.012593845;
                        } else {
                            if (inputs[20] < -0.63547933) {
                                var122 = -0.006323517;
                            } else {
                                var122 = -0.050549954;
                            }
                        }
                    } else {
                        var122 = 0.046319485;
                    }
                } else {
                    if (inputs[23] < -19.89891) {
                        var122 = 0.009933986;
                    } else {
                        var122 = 0.05358371;
                    }
                }
            }
        }
    } else {
        var122 = 0.033431254;
    }
    double var123;
    if (inputs[9] < 11.365) {
        if (inputs[5] < 1813.98) {
            if (inputs[20] < 1.1827226) {
                if (inputs[17] < 1.1247827) {
                    var123 = -0.028120838;
                } else {
                    if (inputs[9] < 6.11) {
                        if (inputs[23] < -21.98774) {
                            var123 = 0.019680558;
                        } else {
                            var123 = -0.027699988;
                        }
                    } else {
                        var123 = 0.036753826;
                    }
                }
            } else {
                var123 = -0.038839087;
            }
        } else {
            if (inputs[13] < 1909.43) {
                if (inputs[24] < -12.059401) {
                    var123 = 0.0017797018;
                } else {
                    if (inputs[2] < 1.6828572) {
                        var123 = 0.07453543;
                    } else {
                        var123 = 0.035938352;
                    }
                }
            } else {
                if (inputs[24] < 13.137483) {
                    var123 = 0.017791308;
                } else {
                    var123 = -0.029886704;
                }
            }
        }
    } else {
        var123 = -0.055645812;
    }
    double var124;
    if (inputs[25] < 1.6705577) {
        var124 = -0.035227;
    } else {
        if (inputs[10] < 3.3075) {
            if (inputs[2] < 2.4021428) {
                if (inputs[18] < 2.0083828) {
                    if (inputs[15] < -0.45139393) {
                        var124 = 0.043071706;
                    } else {
                        if (inputs[6] < 1931.85) {
                            if (inputs[13] < 1808.35) {
                                var124 = 0.018823514;
                            } else {
                                var124 = -0.01866505;
                            }
                        } else {
                            var124 = 0.04133855;
                        }
                    }
                } else {
                    var124 = -0.043522183;
                }
            } else {
                var124 = 0.052394904;
            }
        } else {
            if (inputs[25] < 2.8216243) {
                var124 = -0.040704858;
            } else {
                var124 = 0.010820248;
            }
        }
    }
    double var125;
    if (inputs[10] < 5.0575) {
        if (inputs[10] < 0.175) {
            var125 = -0.04521524;
        } else {
            if (inputs[10] < 3.19) {
                if (inputs[15] < 0.5382424) {
                    if (inputs[9] < 2.39) {
                        var125 = 0.02549494;
                    } else {
                        if (inputs[3] < 1923.185) {
                            if (inputs[15] < 0.30321214) {
                                var125 = 0.012292449;
                            } else {
                                var125 = -0.039804276;
                            }
                        } else {
                            var125 = -0.055279355;
                        }
                    }
                } else {
                    var125 = 0.03925427;
                }
            } else {
                var125 = -0.041084606;
            }
        }
    } else {
        var125 = 0.040795878;
    }
    double var126;
    if (inputs[1] < 30.82347) {
        if (inputs[10] < 2.03) {
            var126 = -0.008180193;
        } else {
            var126 = -0.048907876;
        }
    } else {
        if (inputs[1] < 64.21748) {
            if (inputs[1] < 61.282856) {
                if (inputs[23] < -32.103245) {
                    var126 = 0.043445084;
                } else {
                    if (inputs[16] < -0.13818797) {
                        var126 = 0.014543344;
                    } else {
                        var126 = -0.027217697;
                    }
                }
            } else {
                var126 = 0.059118226;
            }
        } else {
            if (inputs[17] < 1.0105919) {
                var126 = 0.032109782;
            } else {
                if (inputs[10] < 3.03) {
                    if (inputs[2] < 1.4792857) {
                        var126 = -0.008729709;
                    } else {
                        var126 = -0.05546579;
                    }
                } else {
                    var126 = 0.021516953;
                }
            }
        }
    }
    double var127;
    if (inputs[4] < 1955.575) {
        if (inputs[8] < 1706.09) {
            if (inputs[8] < 1664.29) {
                var127 = 0.005942601;
            } else {
                var127 = -0.05287988;
            }
        } else {
            if (inputs[4] < 1723.235) {
                var127 = 0.0546087;
            } else {
                if (inputs[5] < 1781.945) {
                    var127 = -0.030747114;
                } else {
                    if (inputs[5] < 1803.0625) {
                        var127 = 0.05259822;
                    } else {
                        if (inputs[19] < 2.110528) {
                            if (inputs[18] < 1.7805179) {
                                var127 = 0.0005073576;
                            } else {
                                var127 = 0.062332317;
                            }
                        } else {
                            var127 = -0.02259412;
                        }
                    }
                }
            }
        }
    } else {
        var127 = -0.047149245;
    }
    double var128;
    if (inputs[21] < -2.872818) {
        if (inputs[2] < 1.1414286) {
            var128 = 0.013916818;
        } else {
            var128 = -0.04710086;
        }
    } else {
        if (inputs[21] < -2.3217247) {
            var128 = 0.042134423;
        } else {
            if (inputs[20] < 1.3037863) {
                if (inputs[10] < 3.34) {
                    if (inputs[16] < 0.2694436) {
                        if (inputs[19] < 1.3074727) {
                            var128 = 0.03538687;
                        } else {
                            if (inputs[18] < 1.568082) {
                                var128 = -0.043180704;
                            } else {
                                var128 = 0.02794779;
                            }
                        }
                    } else {
                        var128 = 0.051054504;
                    }
                } else {
                    var128 = -0.013469531;
                }
            } else {
                var128 = -0.038430765;
            }
        }
    }
    double var129;
    if (inputs[17] < 0.9647051) {
        var129 = -0.032830816;
    } else {
        if (inputs[23] < 1.182681) {
            if (inputs[17] < 1.1380615) {
                var129 = 0.03988301;
            } else {
                if (inputs[2] < 1.9821428) {
                    if (inputs[23] < -3.152488) {
                        if (inputs[2] < 1.5992857) {
                            if (inputs[19] < 1.3074727) {
                                var129 = 0.019232241;
                            } else {
                                var129 = -0.01904856;
                            }
                        } else {
                            var129 = -0.050339658;
                        }
                    } else {
                        var129 = 0.01932563;
                    }
                } else {
                    if (inputs[19] < 2.5069528) {
                        var129 = 0.06022997;
                    } else {
                        var129 = -0.0036605636;
                    }
                }
            }
        } else {
            if (inputs[25] < 2.471551) {
                var129 = -0.0058015315;
            } else {
                var129 = -0.04281601;
            }
        }
    }
    double var130;
    if (inputs[17] < 0.8829043) {
        var130 = -0.061089955;
    } else {
        if (inputs[15] < -0.6484848) {
            var130 = 0.04108406;
        } else {
            if (inputs[18] < 2.2016084) {
                if (inputs[11] < 0.26) {
                    var130 = 0.04506963;
                } else {
                    if (inputs[6] < 1902.455) {
                        if (inputs[16] < -0.16878195) {
                            var130 = -0.056315433;
                        } else {
                            if (inputs[10] < 0.835) {
                                var130 = -0.030023552;
                            } else {
                                var130 = 0.004619882;
                            }
                        }
                    } else {
                        var130 = 0.019370085;
                    }
                }
            } else {
                var130 = -0.04729508;
            }
        }
    }
    double var131;
    if (inputs[23] < -32.103245) {
        if (inputs[25] < 3.4715025) {
            if (inputs[25] < 2.4002163) {
                var131 = 0.04679248;
            } else {
                var131 = -0.0149181;
            }
        } else {
            var131 = 0.052447088;
        }
    } else {
        if (inputs[21] < -2.9921925) {
            var131 = 0.022597075;
        } else {
            if (inputs[15] < 0.50357574) {
                if (inputs[14] < 0.727) {
                    if (inputs[16] < -0.17063157) {
                        var131 = -0.036739856;
                    } else {
                        if (inputs[2] < 1.5721428) {
                            var131 = -0.019974427;
                        } else {
                            var131 = 0.025367107;
                        }
                    }
                } else {
                    var131 = -0.06022411;
                }
            } else {
                var131 = 0.01774008;
            }
        }
    }
    double var132;
    if (inputs[3] < 1944.205) {
        if (inputs[1] < 73.44284) {
            if (inputs[1] < 35.268757) {
                if (inputs[23] < -6.8828635) {
                    if (inputs[1] < 30.82347) {
                        var132 = 0.01741865;
                    } else {
                        var132 = 0.052739806;
                    }
                } else {
                    var132 = -0.015406493;
                }
            } else {
                if (inputs[14] < 0.575) {
                    if (inputs[25] < 2.1488645) {
                        var132 = -0.011968129;
                    } else {
                        var132 = -0.07362904;
                    }
                } else {
                    if (inputs[17] < 1.174911) {
                        var132 = 0.04355136;
                    } else {
                        if (inputs[2] < 1.9821428) {
                            var132 = -0.033531524;
                        } else {
                            var132 = 0.0050853165;
                        }
                    }
                }
            }
        } else {
            var132 = 0.032929443;
        }
    } else {
        var132 = 0.030412974;
    }
    double var133;
    if (inputs[2] < 1.325) {
        if (inputs[1] < 31.81678) {
            var133 = -0.0147127295;
        } else {
            if (inputs[21] < 3.0345144) {
                var133 = 0.056294113;
            } else {
                var133 = 0.016107751;
            }
        }
    } else {
        if (inputs[1] < 64.01309) {
            if (inputs[20] < 1.1309487) {
                if (inputs[9] < 2.2375) {
                    var133 = -0.022213181;
                } else {
                    if (inputs[16] < -0.22848873) {
                        var133 = -0.009344895;
                    } else {
                        if (inputs[23] < -16.935852) {
                            var133 = 0.07065899;
                        } else {
                            var133 = 0.023481224;
                        }
                    }
                }
            } else {
                var133 = -0.0319091;
            }
        } else {
            if (inputs[1] < 67.63618) {
                var133 = -0.06312197;
            } else {
                var133 = -0.011413404;
            }
        }
    }
    double var134;
    if (inputs[18] < 3.1273727) {
        if (inputs[11] < 0.21) {
            var134 = 0.050029982;
        } else {
            if (inputs[18] < 2.2016084) {
                if (inputs[12] < 1839.26) {
                    if (inputs[18] < 1.5333036) {
                        if (inputs[24] < -13.781551) {
                            var134 = 0.03917684;
                        } else {
                            if (inputs[15] < 0.25624242) {
                                var134 = -0.04184231;
                            } else {
                                var134 = 0.014407313;
                            }
                        }
                    } else {
                        if (inputs[10] < 1.065) {
                            var134 = -0.06226289;
                        } else {
                            var134 = -0.012017613;
                        }
                    }
                } else {
                    if (inputs[18] < 1.7805179) {
                        if (inputs[1] < 34.498104) {
                            var134 = -0.036757544;
                        } else {
                            if (inputs[13] < 1908.8) {
                                var134 = 0.06640415;
                            } else {
                                var134 = 0.013433059;
                            }
                        }
                    } else {
                        var134 = 0.062266443;
                    }
                }
            } else {
                var134 = -0.043805685;
            }
        }
    } else {
        var134 = -0.03803066;
    }
    double var135;
    if (inputs[19] < 3.4676204) {
        if (inputs[20] < -1.3405008) {
            var135 = 0.032504506;
        } else {
            if (inputs[11] < 0.37) {
                if (inputs[19] < 1.5801452) {
                    var135 = -0.05066784;
                } else {
                    if (inputs[13] < 1864.02) {
                        if (inputs[19] < 1.9472373) {
                            var135 = -0.018370258;
                        } else {
                            var135 = 0.03786892;
                        }
                    } else {
                        var135 = -0.025254542;
                    }
                }
            } else {
                if (inputs[15] < -0.3961212) {
                    var135 = -0.025408;
                } else {
                    if (inputs[16] < 0.108917296) {
                        if (inputs[23] < -25.815626) {
                            var135 = 0.023711944;
                        } else {
                            var135 = 0.06628465;
                        }
                    } else {
                        var135 = -0.0019958462;
                    }
                }
            }
        }
    } else {
        var135 = -0.049390204;
    }
    double var136;
    if (inputs[3] < 1672.695) {
        var136 = -0.023642436;
    } else {
        if (inputs[2] < 1.1414286) {
            var136 = 0.03736676;
        } else {
            if (inputs[23] < -36.984165) {
                var136 = -0.03157404;
            } else {
                if (inputs[10] < 1.7175) {
                    if (inputs[20] < -0.5177981) {
                        var136 = -0.002326395;
                    } else {
                        if (inputs[17] < 1.2526516) {
                            var136 = 0.057622842;
                        } else {
                            var136 = 0.023260389;
                        }
                    }
                } else {
                    if (inputs[17] < 1.3070486) {
                        var136 = -0.052188337;
                    } else {
                        if (inputs[2] < 2.4021428) {
                            var136 = -0.024851799;
                        } else {
                            var136 = 0.03116532;
                        }
                    }
                }
            }
        }
    }
    double var137;
    if (inputs[16] < -0.18678947) {
        if (inputs[15] < -0.44751516) {
            var137 = -0.001569324;
        } else {
            var137 = -0.06243097;
        }
    } else {
        if (inputs[20] < 1.3037863) {
            if (inputs[20] < 0.83157694) {
                if (inputs[13] < 1725.03) {
                    var137 = 0.027660506;
                } else {
                    if (inputs[17] < 1.0464149) {
                        var137 = 0.018869756;
                    } else {
                        if (inputs[14] < 0.904) {
                            if (inputs[15] < 0.27848485) {
                                var137 = -0.0012571858;
                            } else {
                                var137 = -0.07227913;
                            }
                        } else {
                            var137 = 0.010892234;
                        }
                    }
                }
            } else {
                var137 = 0.048419077;
            }
        } else {
            var137 = -0.031079149;
        }
    }
    double var138;
    if (inputs[9] < 8.78) {
        if (inputs[23] < -54.69902) {
            var138 = -0.025928373;
        } else {
            if (inputs[1] < 27.259417) {
                var138 = 0.056412302;
            } else {
                if (inputs[1] < 31.467228) {
                    var138 = -0.038513254;
                } else {
                    if (inputs[18] < 1.1529632) {
                        var138 = 0.03928593;
                    } else {
                        if (inputs[15] < 0.54818183) {
                            if (inputs[16] < -0.044586465) {
                                var138 = 0.02299204;
                            } else {
                                var138 = -0.016565986;
                            }
                        } else {
                            var138 = 0.033583134;
                        }
                    }
                }
            }
        }
    } else {
        var138 = -0.029718203;
    }
    double var139;
    if (inputs[18] < 1.0600189) {
        var139 = 0.03973105;
    } else {
        if (inputs[19] < 1.1429343) {
            var139 = -0.033133436;
        } else {
            if (inputs[18] < 2.2016084) {
                if (inputs[9] < 7.13) {
                    if (inputs[8] < 1933.74) {
                        if (inputs[24] < -18.610117) {
                            var139 = 0.029557092;
                        } else {
                            if (inputs[21] < -2.159186) {
                                var139 = -0.050494052;
                            } else {
                                var139 = -0.0017440927;
                            }
                        }
                    } else {
                        var139 = 0.045737896;
                    }
                } else {
                    var139 = 0.04583669;
                }
            } else {
                if (inputs[9] < 7.655) {
                    var139 = 0.0028801474;
                } else {
                    var139 = -0.046391543;
                }
            }
        }
    }
    double var140;
    if (inputs[10] < 5.0575) {
        if (inputs[23] < 0.3177864) {
            if (inputs[14] < -0.985) {
                var140 = 0.03363761;
            } else {
                if (inputs[2] < 2.195) {
                    if (inputs[10] < 2.77) {
                        if (inputs[16] < 0.19440602) {
                            if (inputs[14] < 0.641) {
                                var140 = 0.007948821;
                            } else {
                                var140 = 0.045850646;
                            }
                        } else {
                            var140 = -0.017838746;
                        }
                    } else {
                        var140 = -0.02447174;
                    }
                } else {
                    var140 = -0.032091245;
                }
            }
        } else {
            var140 = -0.03938058;
        }
    } else {
        var140 = 0.0366484;
    }
    double var141;
    if (inputs[10] < 0.155) {
        var141 = -0.041720647;
    } else {
        if (inputs[20] < 0.08772628) {
            if (inputs[16] < 0.16592482) {
                if (inputs[20] < -1.0704633) {
                    var141 = -0.0192252;
                } else {
                    if (inputs[19] < 1.6560503) {
                        var141 = -0.0038428558;
                    } else {
                        var141 = 0.046682477;
                    }
                }
            } else {
                if (inputs[11] < 0.3) {
                    var141 = 0.008431634;
                } else {
                    var141 = 0.07020067;
                }
            }
        } else {
            if (inputs[1] < 65.56079) {
                if (inputs[15] < -0.55) {
                    var141 = -0.03736479;
                } else {
                    if (inputs[18] < 1.4647648) {
                        var141 = -0.0090381745;
                    } else {
                        var141 = 0.06327694;
                    }
                }
            } else {
                var141 = -0.061901584;
            }
        }
    }
    double var142;
    if (inputs[16] < -0.08324812) {
        if (inputs[20] < 1.0819839) {
            if (inputs[2] < 2.0564287) {
                if (inputs[1] < 31.394823) {
                    var142 = -0.0011917641;
                } else {
                    var142 = 0.04710603;
                }
            } else {
                var142 = -0.03279534;
            }
        } else {
            var142 = 0.054475565;
        }
    } else {
        if (inputs[14] < 0.452) {
            var142 = -0.035650134;
        } else {
            if (inputs[18] < 2.048424) {
                if (inputs[19] < 1.3074727) {
                    var142 = 0.015548479;
                } else {
                    if (inputs[20] < -0.71577) {
                        var142 = 0.0077420743;
                    } else {
                        var142 = -0.057911344;
                    }
                }
            } else {
                var142 = 0.030014094;
            }
        }
    }
    double var143;
    if (inputs[15] < 0.41733333) {
        if (inputs[15] < 0.3429091) {
            if (inputs[20] < -0.9729088) {
                var143 = 0.032556254;
            } else {
                if (inputs[20] < 0.84939736) {
                    if (inputs[10] < 0.66) {
                        var143 = -0.04882063;
                    } else {
                        if (inputs[10] < 2.075) {
                            var143 = 0.022366446;
                        } else {
                            var143 = -0.026403617;
                        }
                    }
                } else {
                    if (inputs[21] < -2.6482213) {
                        var143 = 0.047410194;
                    } else {
                        var143 = -0.007681166;
                    }
                }
            }
        } else {
            var143 = 0.045421664;
        }
    } else {
        if (inputs[13] < 1875.69) {
            var143 = -0.038554847;
        } else {
            var143 = 0.019072652;
        }
    }
    double var144;
    if (inputs[17] < 0.9174443) {
        var144 = 0.034431472;
    } else {
        if (inputs[14] < 0.641) {
            if (inputs[16] < 0.049157895) {
                if (inputs[16] < -0.062609024) {
                    if (inputs[15] < -0.31478786) {
                        if (inputs[9] < 4.3075) {
                            var144 = -0.02897623;
                        } else {
                            if (inputs[10] < 2.03) {
                                var144 = 0.052519575;
                            } else {
                                var144 = -0.005763114;
                            }
                        }
                    } else {
                        var144 = -0.041877992;
                    }
                } else {
                    var144 = 0.026257198;
                }
            } else {
                var144 = -0.045625098;
            }
        } else {
            if (inputs[19] < 1.4042293) {
                var144 = 0.03936478;
            } else {
                if (inputs[1] < 69.24428) {
                    var144 = 0.019419262;
                } else {
                    var144 = -0.025204096;
                }
            }
        }
    }
    double var145;
    if (inputs[15] < -0.6484848) {
        var145 = 0.031511407;
    } else {
        if (inputs[18] < 1.6869229) {
            if (inputs[9] < 6.87) {
                if (inputs[21] < 3.2294042) {
                    if (inputs[9] < 5.2025) {
                        if (inputs[20] < 1.1750138) {
                            if (inputs[20] < -0.09276572) {
                                var145 = 0.026778303;
                            } else {
                                var145 = -0.019319078;
                            }
                        } else {
                            var145 = 0.056369793;
                        }
                    } else {
                        var145 = -0.034751378;
                    }
                } else {
                    var145 = -0.0313939;
                }
            } else {
                var145 = 0.042186968;
            }
        } else {
            if (inputs[14] < 1.053) {
                if (inputs[16] < -0.11006015) {
                    var145 = -0.01666908;
                } else {
                    var145 = -0.07446699;
                }
            } else {
                var145 = 0.0011534886;
            }
        }
    }
    double var146;
    if (inputs[24] < -25.921698) {
        var146 = -0.039021447;
    } else {
        if (inputs[17] < 0.87206423) {
            var146 = -0.029794542;
        } else {
            if (inputs[25] < 2.3247232) {
                if (inputs[18] < 1.8450803) {
                    var146 = -0.03755707;
                } else {
                    var146 = 0.013015224;
                }
            } else {
                if (inputs[2] < 1.2657143) {
                    if (inputs[23] < -34.595486) {
                        var146 = 0.030626852;
                    } else {
                        var146 = -0.047547653;
                    }
                } else {
                    if (inputs[11] < 0.3) {
                        if (inputs[11] < 0.21) {
                            var146 = 0.03464014;
                        } else {
                            var146 = -0.021811457;
                        }
                    } else {
                        if (inputs[19] < 1.4617916) {
                            var146 = 0.01849547;
                        } else {
                            var146 = 0.06334034;
                        }
                    }
                }
            }
        }
    }
    double var147;
    if (inputs[8] < 1667.8) {
        var147 = 0.035673257;
    } else {
        if (inputs[21] < -3.3781095) {
            var147 = -0.039090615;
        } else {
            if (inputs[18] < 1.5788987) {
                if (inputs[11] < 0.4) {
                    if (inputs[10] < 1.03) {
                        var147 = 0.016869234;
                    } else {
                        var147 = -0.05409296;
                    }
                } else {
                    if (inputs[9] < 4.0225) {
                        var147 = -0.020499758;
                    } else {
                        var147 = 0.058975793;
                    }
                }
            } else {
                if (inputs[3] < 1748.505) {
                    var147 = -0.016270816;
                } else {
                    if (inputs[5] < 1837.4675) {
                        var147 = 0.04832132;
                    } else {
                        if (inputs[11] < 0.29) {
                            var147 = -0.016928507;
                        } else {
                            var147 = 0.034228858;
                        }
                    }
                }
            }
        }
    }
    double var148;
    if (inputs[5] < 1668.7925) {
        var148 = -0.043248776;
    } else {
        if (inputs[18] < 1.0786825) {
            var148 = -0.03403367;
        } else {
            if (inputs[25] < 3.545103) {
                if (inputs[17] < 1.0164448) {
                    var148 = 0.027253026;
                } else {
                    if (inputs[2] < 1.2635714) {
                        var148 = -0.047426645;
                    } else {
                        if (inputs[2] < 1.7892857) {
                            if (inputs[14] < -0.7) {
                                var148 = -0.010011285;
                            } else {
                                var148 = 0.045052614;
                            }
                        } else {
                            if (inputs[9] < 7.065) {
                                var148 = -0.030904742;
                            } else {
                                var148 = 0.016929256;
                            }
                        }
                    }
                }
            } else {
                var148 = 0.029019717;
            }
        }
    }
    double var149;
    if (inputs[11] < 0.35) {
        if (inputs[1] < 73.153046) {
            if (inputs[10] < 5.0575) {
                if (inputs[23] < -14.363215) {
                    if (inputs[20] < -0.07321377) {
                        var149 = -0.0021944558;
                    } else {
                        var149 = -0.06343716;
                    }
                } else {
                    if (inputs[20] < -0.11844581) {
                        var149 = -0.030757163;
                    } else {
                        var149 = 0.03894165;
                    }
                }
            } else {
                var149 = 0.03771246;
            }
        } else {
            var149 = -0.047131423;
        }
    } else {
        if (inputs[13] < 1875.69) {
            if (inputs[12] < 1820.57) {
                if (inputs[19] < 1.2426338) {
                    var149 = 0.041794404;
                } else {
                    var149 = -0.0034573986;
                }
            } else {
                var149 = -0.033581674;
            }
        } else {
            var149 = 0.032562893;
        }
    }
    double var150;
    if (inputs[8] < 1954.84) {
        if (inputs[16] < 0.2694436) {
            if (inputs[1] < 37.99112) {
                if (inputs[19] < 1.2070603) {
                    var150 = 0.05074752;
                } else {
                    if (inputs[19] < 1.4164727) {
                        var150 = -0.028032199;
                    } else {
                        if (inputs[13] < 1796.8) {
                            var150 = -0.0085734455;
                        } else {
                            var150 = 0.03729281;
                        }
                    }
                }
            } else {
                if (inputs[19] < 1.4941549) {
                    if (inputs[19] < 1.196023) {
                        var150 = -0.03107976;
                    } else {
                        var150 = 0.027846267;
                    }
                } else {
                    if (inputs[17] < 1.487664) {
                        var150 = -0.055496335;
                    } else {
                        var150 = -0.009862399;
                    }
                }
            }
        } else {
            var150 = 0.030921372;
        }
    } else {
        var150 = -0.041575123;
    }
    double var151;
    if (inputs[14] < 0.993) {
        if (inputs[17] < 1.394165) {
            if (inputs[14] < 0.707) {
                if (inputs[20] < 0.84939736) {
                    if (inputs[20] < -0.9606296) {
                        var151 = 0.025670247;
                    } else {
                        if (inputs[17] < 1.1511211) {
                            var151 = -0.04184459;
                        } else {
                            var151 = 0.017073631;
                        }
                    }
                } else {
                    var151 = 0.037237525;
                }
            } else {
                var151 = -0.032095652;
            }
        } else {
            if (inputs[17] < 1.535552) {
                var151 = 0.06112798;
            } else {
                if (inputs[2] < 2.382857) {
                    var151 = -0.027583973;
                } else {
                    var151 = 0.046566185;
                }
            }
        }
    } else {
        var151 = -0.028333781;
    }
    double var152;
    if (inputs[21] < -3.593429) {
        var152 = 0.03630517;
    } else {
        if (inputs[23] < -41.950672) {
            var152 = -0.030943653;
        } else {
            if (inputs[23] < -32.103245) {
                var152 = 0.04133131;
            } else {
                if (inputs[14] < 0.798) {
                    if (inputs[4] < 1930.55) {
                        if (inputs[13] < 1790.23) {
                            var152 = 0.022118635;
                        } else {
                            if (inputs[17] < 1.2595555) {
                                var152 = 0.0061127115;
                            } else {
                                var152 = -0.057374828;
                            }
                        }
                    } else {
                        var152 = 0.037295785;
                    }
                } else {
                    if (inputs[9] < 6.755) {
                        var152 = -0.04641437;
                    } else {
                        var152 = 0.012043764;
                    }
                }
            }
        }
    }
    double var153;
    if (inputs[3] < 1727.315) {
        if (inputs[23] < -25.178482) {
            if (inputs[5] < 1667.8676) {
                var153 = 0.010013559;
            } else {
                var153 = 0.05445447;
            }
        } else {
            var153 = -0.01134218;
        }
    } else {
        if (inputs[3] < 1774.87) {
            var153 = -0.04916084;
        } else {
            if (inputs[6] < 1957.775) {
                if (inputs[19] < 1.4164727) {
                    if (inputs[25] < 2.5308545) {
                        var153 = 0.011364176;
                    } else {
                        var153 = -0.035703406;
                    }
                } else {
                    if (inputs[10] < 0.85) {
                        var153 = -0.014546979;
                    } else {
                        if (inputs[19] < 2.0103395) {
                            var153 = 0.06150803;
                        } else {
                            var153 = -0.0021337268;
                        }
                    }
                }
            } else {
                var153 = -0.038848445;
            }
        }
    }
    double var154;
    if (inputs[23] < -50.573925) {
        if (inputs[18] < 1.3539162) {
            var154 = 0.049656425;
        } else {
            var154 = -0.00094366295;
        }
    } else {
        if (inputs[9] < 4.955) {
            if (inputs[11] < 0.42) {
                if (inputs[25] < 2.0689654) {
                    var154 = -0.018652325;
                } else {
                    if (inputs[21] < -2.5398834) {
                        var154 = -0.0033537885;
                    } else {
                        if (inputs[14] < 0.683) {
                            var154 = 0.068171605;
                        } else {
                            var154 = 0.0011896684;
                        }
                    }
                }
            } else {
                var154 = -0.038139343;
            }
        } else {
            if (inputs[19] < 1.6991948) {
                var154 = -0.0679847;
            } else {
                if (inputs[17] < 2.102351) {
                    if (inputs[17] < 1.3512217) {
                        var154 = -0.015226511;
                    } else {
                        var154 = 0.044466797;
                    }
                } else {
                    var154 = -0.053910203;
                }
            }
        }
    }
    double var155;
    if (inputs[24] < -25.683517) {
        var155 = -0.03746448;
    } else {
        if (inputs[15] < -0.57878786) {
            var155 = 0.04127616;
        } else {
            if (inputs[23] < -19.270708) {
                if (inputs[17] < 1.6942372) {
                    if (inputs[21] < -2.8556485) {
                        var155 = -0.013189981;
                    } else {
                        if (inputs[17] < 1.1588719) {
                            var155 = 0.059602506;
                        } else {
                            var155 = 0.015619984;
                        }
                    }
                } else {
                    var155 = -0.015603826;
                }
            } else {
                if (inputs[20] < 0.46739486) {
                    if (inputs[17] < 1.037709) {
                        var155 = 0.010526669;
                    } else {
                        if (inputs[10] < 1.03) {
                            var155 = -0.07021894;
                        } else {
                            var155 = -0.018230692;
                        }
                    }
                } else {
                    var155 = 0.011721277;
                }
            }
        }
    }
    double var156;
    if (inputs[19] < 2.0771122) {
        if (inputs[19] < 1.3578346) {
            if (inputs[15] < -0.18448485) {
                var156 = -0.050912928;
            } else {
                if (inputs[2] < 1.2035714) {
                    var156 = 0.040887155;
                } else {
                    var156 = -0.0125086205;
                }
            }
        } else {
            if (inputs[24] < -18.610117) {
                var156 = 0.06667903;
            } else {
                if (inputs[13] < 1779.85) {
                    var156 = -0.027832616;
                } else {
                    if (inputs[13] < 1837.94) {
                        var156 = 0.059904058;
                    } else {
                        if (inputs[11] < 0.36) {
                            var156 = -0.008488714;
                        } else {
                            var156 = 0.027737202;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[18] < 1.9960701) {
            var156 = -0.05742125;
        } else {
            if (inputs[8] < 1872.37) {
                var156 = 0.014106515;
            } else {
                var156 = -0.040635873;
            }
        }
    }
    double var157;
    if (inputs[14] < 0.641) {
        if (inputs[3] < 1937.095) {
            if (inputs[16] < 0.05006015) {
                if (inputs[24] < -8.167409) {
                    if (inputs[13] < 1813.96) {
                        if (inputs[9] < 6.0675) {
                            var157 = -0.011290334;
                        } else {
                            var157 = 0.02287487;
                        }
                    } else {
                        var157 = -0.041692294;
                    }
                } else {
                    var157 = 0.029103763;
                }
            } else {
                var157 = -0.043747433;
            }
        } else {
            var157 = 0.029317273;
        }
    } else {
        if (inputs[20] < -1.2484047) {
            var157 = -0.012042343;
        } else {
            if (inputs[21] < 2.471551) {
                var157 = 0.062512256;
            } else {
                if (inputs[18] < 1.6869229) {
                    var157 = 0.032219037;
                } else {
                    var157 = -0.020238202;
                }
            }
        }
    }
    double var158;
    if (inputs[17] < 0.86311066) {
        var158 = -0.045014605;
    } else {
        if (inputs[8] < 1712.04) {
            if (inputs[10] < 1.155) {
                var158 = 0.014569701;
            } else {
                var158 = -0.031569164;
            }
        } else {
            if (inputs[19] < 3.076999) {
                if (inputs[2] < 1.7892857) {
                    if (inputs[2] < 1.5042857) {
                        if (inputs[24] < 15.588893) {
                            if (inputs[20] < 0.7862127) {
                                var158 = -0.029943349;
                            } else {
                                var158 = 0.015414334;
                            }
                        } else {
                            var158 = 0.040106177;
                        }
                    } else {
                        var158 = 0.05542895;
                    }
                } else {
                    if (inputs[12] < 1861.81) {
                        var158 = 0.011781554;
                    } else {
                        var158 = -0.032456167;
                    }
                }
            } else {
                var158 = 0.04054374;
            }
        }
    }
    double var159;
    if (inputs[18] < 1.3881196) {
        if (inputs[14] < -0.638) {
            var159 = 0.00838837;
        } else {
            if (inputs[20] < -0.15729868) {
                var159 = -0.011061188;
            } else {
                var159 = -0.062142216;
            }
        }
    } else {
        if (inputs[14] < -0.594) {
            if (inputs[23] < -23.874542) {
                var159 = -0.03755361;
            } else {
                if (inputs[16] < -0.19569173) {
                    var159 = -0.013228917;
                } else {
                    var159 = 0.019429361;
                }
            }
        } else {
            if (inputs[15] < 0.43066666) {
                var159 = 0.05158191;
            } else {
                if (inputs[21] < 3.0130277) {
                    var159 = -0.0014914671;
                } else {
                    var159 = 0.04285415;
                }
            }
        }
    }
    double var160;
    if (inputs[1] < 30.82347) {
        if (inputs[21] < -3.593429) {
            var160 = 0.010575338;
        } else {
            if (inputs[6] < 1806.09) {
                var160 = -0.011585342;
            } else {
                var160 = -0.051761616;
            }
        }
    } else {
        if (inputs[14] < -0.774) {
            var160 = 0.03657411;
        } else {
            if (inputs[20] < -1.2425932) {
                var160 = -0.025062703;
            } else {
                if (inputs[25] < 2.4323606) {
                    if (inputs[16] < 0.0041954885) {
                        var160 = 0.06017131;
                    } else {
                        var160 = 0.011590494;
                    }
                } else {
                    if (inputs[21] < 2.7837949) {
                        var160 = -0.043950748;
                    } else {
                        if (inputs[20] < -0.4081105) {
                            var160 = 0.04540598;
                        } else {
                            var160 = -0.0068103657;
                        }
                    }
                }
            }
        }
    }
    double var161;
    if (inputs[9] < 11.0575) {
        if (inputs[9] < 4.725) {
            if (inputs[13] < 1935.06) {
                if (inputs[10] < 0.8625) {
                    if (inputs[23] < -19.498507) {
                        var161 = -0.0099451905;
                    } else {
                        var161 = -0.060613323;
                    }
                } else {
                    if (inputs[25] < 2.471551) {
                        var161 = 0.03820211;
                    } else {
                        var161 = -0.018192695;
                    }
                }
            } else {
                var161 = 0.027122961;
            }
        } else {
            if (inputs[25] < 2.2964427) {
                var161 = -0.015021413;
            } else {
                if (inputs[9] < 6.4875) {
                    if (inputs[25] < 3.052375) {
                        var161 = 0.06619066;
                    } else {
                        var161 = 0.020173062;
                    }
                } else {
                    var161 = 0.001348939;
                }
            }
        }
    } else {
        var161 = -0.043536693;
    }
    double var162;
    if (inputs[8] < 1860.04) {
        if (inputs[18] < 2.4188137) {
            if (inputs[16] < -0.17063157) {
                var162 = -0.024804195;
            } else {
                if (inputs[14] < 0.873) {
                    if (inputs[20] < 0.86715806) {
                        if (inputs[20] < -0.11844581) {
                            if (inputs[2] < 1.2535714) {
                                var162 = 0.003771106;
                            } else {
                                var162 = 0.04408255;
                            }
                        } else {
                            var162 = -0.023637444;
                        }
                    } else {
                        var162 = 0.050909527;
                    }
                } else {
                    var162 = -0.027302766;
                }
            }
        } else {
            var162 = 0.050158277;
        }
    } else {
        if (inputs[13] < 1899.65) {
            var162 = -0.038237207;
        } else {
            if (inputs[23] < 10.910757) {
                if (inputs[21] < 1.6705577) {
                    var162 = 0.02786329;
                } else {
                    var162 = -0.020022262;
                }
            } else {
                var162 = -0.03428555;
            }
        }
    }
    double var163;
    if (inputs[15] < -0.3987879) {
        if (inputs[9] < 4.955) {
            var163 = 0.003433804;
        } else {
            var163 = -0.031707875;
        }
    } else {
        if (inputs[21] < -3.0461998) {
            var163 = 0.045323607;
        } else {
            if (inputs[9] < 4.9825) {
                if (inputs[14] < 0.427) {
                    var163 = 0.017619805;
                } else {
                    if (inputs[14] < 0.813) {
                        var163 = -0.04818913;
                    } else {
                        var163 = 0.0040326808;
                    }
                }
            } else {
                if (inputs[15] < 0.47775757) {
                    var163 = 0.0048386995;
                } else {
                    var163 = 0.044772174;
                }
            }
        }
    }
    double var164;
    if (inputs[18] < 1.568082) {
        if (inputs[2] < 1.6728572) {
            if (inputs[9] < 5.63) {
                if (inputs[5] < 1818.8975) {
                    if (inputs[3] < 1752.67) {
                        var164 = 0.0037061835;
                    } else {
                        var164 = 0.057174794;
                    }
                } else {
                    var164 = -0.026693098;
                }
            } else {
                var164 = -0.03244727;
            }
        } else {
            var164 = -0.046010025;
        }
    } else {
        if (inputs[18] < 3.397783) {
            if (inputs[9] < 3.715) {
                var164 = -0.010081934;
            } else {
                if (inputs[15] < -0.55) {
                    var164 = 0.0023445613;
                } else {
                    if (inputs[11] < 0.3) {
                        var164 = 0.028605666;
                    } else {
                        var164 = 0.06733897;
                    }
                }
            }
        } else {
            var164 = -0.023509888;
        }
    }
    double var165;
    if (inputs[14] < -1.168) {
        var165 = 0.029027496;
    } else {
        if (inputs[14] < -0.835) {
            var165 = -0.030893736;
        } else {
            if (inputs[13] < 1915.24) {
                if (inputs[18] < 1.7339365) {
                    if (inputs[18] < 1.4627376) {
                        if (inputs[20] < -0.034633074) {
                            if (inputs[17] < 1.1144038) {
                                var165 = 0.0085479375;
                            } else {
                                var165 = 0.05371402;
                            }
                        } else {
                            var165 = -0.02438038;
                        }
                    } else {
                        var165 = 0.04783827;
                    }
                } else {
                    if (inputs[20] < -0.5083069) {
                        var165 = 0.011729176;
                    } else {
                        var165 = -0.045900296;
                    }
                }
            } else {
                if (inputs[20] < -0.16443706) {
                    var165 = -0.05525123;
                } else {
                    var165 = 0.0013067274;
                }
            }
        }
    }
    double var166;
    if (inputs[9] < 9.825) {
        if (inputs[10] < 3.34) {
            if (inputs[16] < 0.2694436) {
                if (inputs[10] < 0.22) {
                    var166 = -0.03216997;
                } else {
                    if (inputs[9] < 4.47) {
                        if (inputs[15] < -0.3987879) {
                            var166 = -0.02127941;
                        } else {
                            if (inputs[11] < 0.39) {
                                var166 = 0.051607378;
                            } else {
                                var166 = -0.00045395418;
                            }
                        }
                    } else {
                        if (inputs[13] < 1820.89) {
                            var166 = 0.0047500758;
                        } else {
                            var166 = -0.03975621;
                        }
                    }
                }
            } else {
                var166 = 0.032126885;
            }
        } else {
            var166 = -0.035199847;
        }
    } else {
        var166 = 0.034612413;
    }
    double var167;
    if (inputs[19] < 1.3578346) {
        if (inputs[10] < 0.7025) {
            var167 = 0.017728819;
        } else {
            if (inputs[2] < 1.2035714) {
                var167 = -0.0055731544;
            } else {
                var167 = -0.04398977;
            }
        }
    } else {
        if (inputs[21] < -2.199282) {
            if (inputs[15] < -0.40339395) {
                if (inputs[15] < -0.5891515) {
                    var167 = 0.031665232;
                } else {
                    var167 = -0.0077989185;
                }
            } else {
                var167 = 0.062284555;
            }
        } else {
            if (inputs[14] < 1.198) {
                if (inputs[17] < 1.7418909) {
                    if (inputs[2] < 1.9664285) {
                        if (inputs[14] < 0.696) {
                            var167 = 0.049132623;
                        } else {
                            var167 = -0.007882943;
                        }
                    } else {
                        var167 = -0.018952075;
                    }
                } else {
                    var167 = -0.04912015;
                }
            } else {
                var167 = 0.03276857;
            }
        }
    }
    double var168;
    if (inputs[13] < 1884.03) {
        if (inputs[5] < 1713.6725) {
            if (inputs[25] < 3.077972) {
                var168 = 0.037364107;
            } else {
                var168 = -0.012291367;
            }
        } else {
            if (inputs[17] < 1.1489543) {
                if (inputs[23] < -25.178482) {
                    var168 = -0.0064517413;
                } else {
                    var168 = 0.02873821;
                }
            } else {
                if (inputs[16] < -0.11656391) {
                    var168 = -0.04984551;
                } else {
                    if (inputs[20] < -0.13150421) {
                        var168 = 0.008972318;
                    } else {
                        var168 = -0.031798944;
                    }
                }
            }
        }
    } else {
        if (inputs[11] < 0.36) {
            if (inputs[9] < 6.2225) {
                var168 = -0.020477243;
            } else {
                var168 = 0.021293959;
            }
        } else {
            var168 = 0.048103545;
        }
    }
    double var169;
    if (inputs[21] < -2.872818) {
        if (inputs[20] < 0.47332394) {
            var169 = -0.03220147;
        } else {
            var169 = 0.01143231;
        }
    } else {
        if (inputs[17] < 2.4592357) {
            if (inputs[2] < 2.0321429) {
                if (inputs[11] < 0.43) {
                    if (inputs[17] < 0.9943239) {
                        var169 = 0.0584001;
                    } else {
                        if (inputs[10] < 2.1375) {
                            if (inputs[15] < 0.2930303) {
                                var169 = 0.047854792;
                            } else {
                                var169 = -0.002067778;
                            }
                        } else {
                            var169 = -0.017670674;
                        }
                    }
                } else {
                    var169 = -0.010048256;
                }
            } else {
                if (inputs[1] < 60.820408) {
                    var169 = -0.04521646;
                } else {
                    var169 = 0.012521567;
                }
            }
        } else {
            var169 = 0.04116584;
        }
    }
    double var170;
    if (inputs[10] < 1.75) {
        if (inputs[15] < 0.5432121) {
            if (inputs[2] < 2.0564287) {
                if (inputs[2] < 1.5785714) {
                    if (inputs[16] < -0.15692481) {
                        var170 = 0.023021244;
                    } else {
                        if (inputs[1] < 66.00691) {
                            var170 = -0.026822094;
                        } else {
                            var170 = -0.00045868283;
                        }
                    }
                } else {
                    var170 = 0.039227482;
                }
            } else {
                var170 = -0.023856912;
            }
        } else {
            var170 = 0.043433882;
        }
    } else {
        if (inputs[13] < 1737.78) {
            var170 = 0.02161585;
        } else {
            if (inputs[20] < 0.025593309) {
                if (inputs[13] < 1866.56) {
                    var170 = -0.027337542;
                } else {
                    var170 = 0.020673854;
                }
            } else {
                var170 = -0.059178717;
            }
        }
    }
    double var171;
    if (inputs[5] < 1668.7925) {
        var171 = -0.031333078;
    } else {
        if (inputs[21] < 3.2096531) {
            if (inputs[20] < -0.14312634) {
                if (inputs[14] < 0.272) {
                    var171 = 0.008699583;
                } else {
                    if (inputs[9] < 4.84) {
                        var171 = -0.07237015;
                    } else {
                        var171 = -0.0030227127;
                    }
                }
            } else {
                if (inputs[10] < 0.45) {
                    var171 = 0.045548704;
                } else {
                    if (inputs[17] < 1.6821961) {
                        if (inputs[19] < 1.6457438) {
                            var171 = -0.007633197;
                        } else {
                            var171 = 0.05791066;
                        }
                    } else {
                        var171 = -0.02774634;
                    }
                }
            }
        } else {
            var171 = 0.029656643;
        }
    }
    double var172;
    if (inputs[15] < -0.63084847) {
        var172 = 0.026229879;
    } else {
        if (inputs[2] < 1.1321429) {
            if (inputs[25] < 3.6367188) {
                var172 = 0.031184068;
            } else {
                var172 = 0.0049954094;
            }
        } else {
            if (inputs[13] < 1950.85) {
                if (inputs[14] < 0.844) {
                    if (inputs[20] < -0.83883953) {
                        var172 = -0.05548667;
                    } else {
                        if (inputs[23] < -19.270708) {
                            if (inputs[10] < 1.105) {
                                var172 = 0.026514038;
                            } else {
                                var172 = -0.028879378;
                            }
                        } else {
                            var172 = -0.036710933;
                        }
                    }
                } else {
                    if (inputs[14] < 1.153) {
                        var172 = 0.026463551;
                    } else {
                        var172 = -0.019308848;
                    }
                }
            } else {
                var172 = 0.01489426;
            }
        }
    }
    double var173;
    if (inputs[20] < 0.106602594) {
        if (inputs[24] < 14.721745) {
            if (inputs[11] < 0.39) {
                if (inputs[18] < 2.0083828) {
                    if (inputs[17] < 1.3170513) {
                        var173 = 0.035372518;
                    } else {
                        var173 = 0.05920579;
                    }
                } else {
                    var173 = 0.008135787;
                }
            } else {
                var173 = -0.0011648437;
            }
        } else {
            if (inputs[23] < -18.384315) {
                var173 = -0.029244622;
            } else {
                var173 = 0.0056960946;
            }
        }
    } else {
        if (inputs[19] < 1.2559031) {
            var173 = 0.01800122;
        } else {
            if (inputs[4] < 1761.285) {
                var173 = -0.060091686;
            } else {
                if (inputs[10] < 1.3125) {
                    var173 = 0.030607069;
                } else {
                    var173 = -0.034545705;
                }
            }
        }
    }
    double var174;
    if (inputs[11] < 0.44) {
        if (inputs[8] < 1667.8) {
            var174 = 0.03347708;
        } else {
            if (inputs[5] < 1813.395) {
                if (inputs[20] < 0.86715806) {
                    if (inputs[23] < -0.9878631) {
                        if (inputs[20] < -0.5422097) {
                            var174 = -0.010437453;
                        } else {
                            var174 = 0.04117426;
                        }
                    } else {
                        var174 = -0.04043456;
                    }
                } else {
                    var174 = -0.050546393;
                }
            } else {
                if (inputs[1] < 70.62386) {
                    if (inputs[21] < 2.3889909) {
                        if (inputs[23] < -14.929883) {
                            var174 = -0.01638859;
                        } else {
                            if (inputs[5] < 1913.09) {
                                var174 = 0.06497092;
                            } else {
                                var174 = 0.008060484;
                            }
                        }
                    } else {
                        var174 = -0.029678527;
                    }
                } else {
                    var174 = 0.04433234;
                }
            }
        }
    } else {
        var174 = -0.022475917;
    }
    double var175;
    if (inputs[4] < 1677.165) {
        if (inputs[5] < 1656.1125) {
            var175 = 0.005031645;
        } else {
            var175 = 0.0448869;
        }
    } else {
        if (inputs[3] < 1718.685) {
            var175 = -0.03699692;
        } else {
            if (inputs[17] < 0.9174443) {
                var175 = 0.03473038;
            } else {
                if (inputs[18] < 1.5751876) {
                    if (inputs[13] < 1887.55) {
                        if (inputs[15] < -0.26) {
                            var175 = -0.008473515;
                        } else {
                            var175 = -0.04577248;
                        }
                    } else {
                        var175 = 0.01010521;
                    }
                } else {
                    if (inputs[17] < 1.3926234) {
                        var175 = -0.021558437;
                    } else {
                        if (inputs[11] < 0.29) {
                            var175 = -0.0042045545;
                        } else {
                            var175 = 0.043250848;
                        }
                    }
                }
            }
        }
    }
    double var176;
    if (inputs[15] < -0.2869091) {
        if (inputs[15] < -0.3987879) {
            if (inputs[18] < 1.7201073) {
                var176 = -0.006887978;
            } else {
                if (inputs[21] < -2.6912065) {
                    var176 = 0.053175636;
                } else {
                    var176 = 0.01668175;
                }
            }
        } else {
            var176 = 0.054289516;
        }
    } else {
        if (inputs[20] < 0.08772628) {
            if (inputs[20] < -0.8543823) {
                if (inputs[2] < 1.4592857) {
                    var176 = 0.016000036;
                } else {
                    var176 = -0.03264451;
                }
            } else {
                if (inputs[23] < -18.51324) {
                    var176 = 0.04814556;
                } else {
                    var176 = -0.00046717667;
                }
            }
        } else {
            if (inputs[8] < 1855.85) {
                var176 = -0.042126816;
            } else {
                var176 = 0.0083028;
            }
        }
    }
    double var177;
    if (inputs[17] < 2.5590653) {
        if (inputs[9] < 1.5625) {
            var177 = -0.03454805;
        } else {
            if (inputs[17] < 2.0461183) {
                if (inputs[17] < 1.7418909) {
                    if (inputs[24] < 22.278522) {
                        if (inputs[14] < -0.569) {
                            if (inputs[17] < 1.2281531) {
                                var177 = -0.029147487;
                            } else {
                                var177 = 0.014251605;
                            }
                        } else {
                            if (inputs[23] < -0.9878631) {
                                var177 = 0.04168437;
                            } else {
                                var177 = 0.005479844;
                            }
                        }
                    } else {
                        var177 = -0.023860978;
                    }
                } else {
                    var177 = -0.02959939;
                }
            } else {
                var177 = 0.03865654;
            }
        }
    } else {
        var177 = -0.04108147;
    }
    double var178;
    if (inputs[5] < 1668.7925) {
        var178 = -0.019738924;
    } else {
        if (inputs[16] < 0.108917296) {
            if (inputs[10] < 2.77) {
                if (inputs[16] < -0.041323308) {
                    if (inputs[11] < 0.41) {
                        if (inputs[24] < -16.417265) {
                            var178 = 0.012204113;
                        } else {
                            var178 = -0.039043505;
                        }
                    } else {
                        var178 = 0.037244964;
                    }
                } else {
                    var178 = -0.040853065;
                }
            } else {
                var178 = 0.0271137;
            }
        } else {
            if (inputs[23] < -21.98774) {
                var178 = 0.050897617;
            } else {
                if (inputs[18] < 1.5272669) {
                    var178 = -0.022421854;
                } else {
                    var178 = 0.029309163;
                }
            }
        }
    }
    double var179;
    if (inputs[14] < 0.641) {
        if (inputs[9] < 6.0375) {
            if (inputs[14] < -0.869) {
                var179 = -0.04852139;
            } else {
                if (inputs[15] < -0.32460606) {
                    var179 = 0.015255272;
                } else {
                    if (inputs[15] < -0.15684849) {
                        var179 = -0.050048377;
                    } else {
                        var179 = -0.014396353;
                    }
                }
            }
        } else {
            if (inputs[17] < 1.3471363) {
                var179 = -0.018769896;
            } else {
                var179 = 0.02700506;
            }
        }
    } else {
        if (inputs[8] < 1843.5) {
            if (inputs[3] < 1727.94) {
                var179 = 0.022420067;
            } else {
                var179 = -0.01965632;
            }
        } else {
            var179 = 0.032372653;
        }
    }
    double var180;
    if (inputs[17] < 1.7381139) {
        if (inputs[8] < 1811.17) {
            if (inputs[10] < 0.6525) {
                var180 = -0.03348305;
            } else {
                if (inputs[15] < -0.15684849) {
                    var180 = -0.012422966;
                } else {
                    var180 = 0.029972188;
                }
            }
        } else {
            if (inputs[14] < -0.742) {
                var180 = 0.04260213;
            } else {
                if (inputs[16] < 0.18491729) {
                    if (inputs[23] < -12.139437) {
                        var180 = 0.013513296;
                    } else {
                        var180 = -0.029147085;
                    }
                } else {
                    var180 = 0.04034754;
                }
            }
        }
    } else {
        if (inputs[13] < 1820.89) {
            var180 = 0.008166519;
        } else {
            var180 = -0.04085804;
        }
    }
    double var181;
    if (inputs[10] < 0.3275) {
        var181 = -0.030289559;
    } else {
        if (inputs[19] < 1.4563731) {
            if (inputs[2] < 1.2021428) {
                var181 = 0.040668372;
            } else {
                if (inputs[6] < 1779.555) {
                    var181 = 0.030614613;
                } else {
                    var181 = -0.016723543;
                }
            }
        } else {
            if (inputs[20] < -0.14515267) {
                if (inputs[20] < -0.8499863) {
                    var181 = -0.008894047;
                } else {
                    var181 = -0.05420842;
                }
            } else {
                if (inputs[15] < -0.53818184) {
                    var181 = -0.023400187;
                } else {
                    if (inputs[2] < 1.8957143) {
                        var181 = 0.0004768499;
                    } else {
                        var181 = 0.05225763;
                    }
                }
            }
        }
    }
    double var182;
    if (inputs[15] < 0.4257576) {
        if (inputs[15] < 0.36539394) {
            if (inputs[9] < 6.0675) {
                if (inputs[1] < 30.82347) {
                    var182 = -0.044105753;
                } else {
                    if (inputs[15] < 0.12709092) {
                        if (inputs[19] < 1.3315202) {
                            var182 = 0.06104737;
                        } else {
                            var182 = 0.0034694753;
                        }
                    } else {
                        var182 = -0.02707225;
                    }
                }
            } else {
                if (inputs[19] < 2.3010995) {
                    var182 = 0.048279878;
                } else {
                    var182 = -0.010283954;
                }
            }
        } else {
            var182 = 0.0393537;
        }
    } else {
        if (inputs[14] < 0.915) {
            var182 = -0.046341892;
        } else {
            var182 = 0.001371201;
        }
    }
    double var183;
    if (inputs[8] < 1667.8) {
        var183 = 0.03555533;
    } else {
        if (inputs[5] < 1781.945) {
            if (inputs[5] < 1713.6725) {
                var183 = 0.010729648;
            } else {
                var183 = -0.0388094;
            }
        } else {
            if (inputs[5] < 1826.095) {
                var183 = 0.033321533;
            } else {
                if (inputs[20] < 0.1593122) {
                    if (inputs[25] < 2.1631644) {
                        var183 = 0.048477385;
                    } else {
                        if (inputs[25] < 3.1700976) {
                            var183 = -0.029464554;
                        } else {
                            var183 = 0.033412404;
                        }
                    }
                } else {
                    if (inputs[10] < 1.5275) {
                        var183 = 0.000892757;
                    } else {
                        var183 = -0.03891006;
                    }
                }
            }
        }
    }
    double var184;
    if (inputs[10] < 5.7875) {
        if (inputs[15] < 0.5761818) {
            if (inputs[2] < 1.2635714) {
                if (inputs[10] < 1.505) {
                    var184 = -0.03812135;
                } else {
                    var184 = 0.0060069375;
                }
            } else {
                if (inputs[9] < 2.4125) {
                    var184 = 0.039609216;
                } else {
                    if (inputs[20] < 1.0724006) {
                        if (inputs[23] < -25.815626) {
                            var184 = -0.014833411;
                        } else {
                            if (inputs[23] < -4.5796494) {
                                var184 = 0.05584414;
                            } else {
                                var184 = -0.00067616854;
                            }
                        }
                    } else {
                        var184 = -0.027066918;
                    }
                }
            }
        } else {
            var184 = -0.049860973;
        }
    } else {
        var184 = 0.032101493;
    }
    double var185;
    if (inputs[16] < -0.11335339) {
        if (inputs[14] < -0.594) {
            if (inputs[23] < -10.96624) {
                var185 = -0.058049303;
            } else {
                var185 = -0.0040207324;
            }
        } else {
            var185 = 0.020594375;
        }
    } else {
        if (inputs[21] < -1.6590085) {
            var185 = 0.038897388;
        } else {
            if (inputs[2] < 2.5828571) {
                if (inputs[18] < 1.2168549) {
                    var185 = -0.018632721;
                } else {
                    if (inputs[18] < 1.4421706) {
                        var185 = 0.040918503;
                    } else {
                        if (inputs[15] < 0.4892727) {
                            var185 = -0.028064957;
                        } else {
                            var185 = 0.021295236;
                        }
                    }
                }
            } else {
                var185 = -0.03256067;
            }
        }
    }
    double var186;
    if (inputs[25] < 3.9062004) {
        if (inputs[16] < -0.21651128) {
            if (inputs[2] < 2.0564287) {
                var186 = 0.04966243;
            } else {
                var186 = 0.008823693;
            }
        } else {
            if (inputs[24] < -7.919143) {
                if (inputs[9] < 4.105) {
                    var186 = -0.049213286;
                } else {
                    var186 = -0.0070128953;
                }
            } else {
                if (inputs[14] < 0.412) {
                    var186 = 0.053850792;
                } else {
                    if (inputs[15] < 0.30430302) {
                        var186 = 0.027971815;
                    } else {
                        if (inputs[14] < 1.153) {
                            if (inputs[17] < 1.1279645) {
                                var186 = 0.005878728;
                            } else {
                                var186 = -0.04729054;
                            }
                        } else {
                            var186 = 0.022406153;
                        }
                    }
                }
            }
        }
    } else {
        var186 = -0.041804608;
    }
    double var187;
    if (inputs[18] < 2.4188137) {
        if (inputs[10] < 0.1675) {
            var187 = 0.036190778;
        } else {
            if (inputs[20] < 0.98526) {
                if (inputs[18] < 1.2363172) {
                    if (inputs[18] < 1.0765798) {
                        var187 = 0.014336349;
                    } else {
                        var187 = -0.053275898;
                    }
                } else {
                    if (inputs[11] < 0.39) {
                        if (inputs[15] < -0.4021818) {
                            var187 = -0.0019777426;
                        } else {
                            if (inputs[24] < 17.166454) {
                                var187 = 0.05670817;
                            } else {
                                var187 = 0.0066372207;
                            }
                        }
                    } else {
                        var187 = -0.011695857;
                    }
                }
            } else {
                if (inputs[23] < -32.103245) {
                    var187 = 0.0066500977;
                } else {
                    var187 = -0.052410573;
                }
            }
        }
    } else {
        if (inputs[18] < 3.397783) {
            var187 = 0.05094202;
        } else {
            var187 = 0.015676722;
        }
    }
    double var188;
    if (inputs[14] < 0.696) {
        if (inputs[23] < -52.788277) {
            var188 = -0.024363307;
        } else {
            if (inputs[14] < 0.55) {
                if (inputs[21] < -3.0357554) {
                    var188 = 0.027580678;
                } else {
                    if (inputs[9] < 3.535) {
                        var188 = 0.025010398;
                    } else {
                        if (inputs[13] < 1805.01) {
                            var188 = 0.007135418;
                        } else {
                            var188 = -0.03192906;
                        }
                    }
                }
            } else {
                var188 = 0.05723972;
            }
        }
    } else {
        if (inputs[16] < 0.19218796) {
            if (inputs[2] < 1.405) {
                var188 = 0.029787207;
            } else {
                var188 = -0.011077446;
            }
        } else {
            var188 = -0.0408323;
        }
    }
    double var189;
    if (inputs[3] < 1953.135) {
        if (inputs[25] < 2.3162615) {
            if (inputs[9] < 2.985) {
                var189 = 0.014769186;
            } else {
                var189 = -0.034869745;
            }
        } else {
            if (inputs[15] < 0.50357574) {
                if (inputs[9] < 6.0675) {
                    if (inputs[6] < 1712.515) {
                        var189 = -0.044864316;
                    } else {
                        if (inputs[16] < 0.12596993) {
                            if (inputs[9] < 4.385) {
                                var189 = 0.010105422;
                            } else {
                                var189 = 0.042883243;
                            }
                        } else {
                            var189 = -0.013475843;
                        }
                    }
                } else {
                    var189 = 0.031247687;
                }
            } else {
                var189 = 0.049482428;
            }
        }
    } else {
        var189 = -0.042509016;
    }
    double var190;
    if (inputs[9] < 5.3625) {
        if (inputs[9] < 4.745) {
            if (inputs[17] < 1.4548539) {
                if (inputs[11] < 0.43) {
                    if (inputs[14] < 0.55) {
                        var190 = -0.038449824;
                    } else {
                        var190 = 0.008381421;
                    }
                } else {
                    var190 = 0.03158103;
                }
            } else {
                var190 = 0.022400955;
            }
        } else {
            var190 = 0.042305507;
        }
    } else {
        if (inputs[21] < -2.8556485) {
            var190 = 0.018110175;
        } else {
            if (inputs[24] < 19.300243) {
                if (inputs[6] < 1866.29) {
                    var190 = -0.07120049;
                } else {
                    var190 = -0.03366061;
                }
            } else {
                var190 = -0.0007952971;
            }
        }
    }
    double var191;
    if (inputs[8] < 1706.09) {
        if (inputs[10] < 1.245) {
            var191 = 0.0016742953;
        } else {
            var191 = -0.051783927;
        }
    } else {
        if (inputs[19] < 1.9347545) {
            if (inputs[9] < 2.695) {
                var191 = -0.013922396;
            } else {
                if (inputs[15] < -0.2869091) {
                    if (inputs[14] < -0.816) {
                        var191 = 0.018695552;
                    } else {
                        var191 = 0.050149642;
                    }
                } else {
                    if (inputs[24] < 11.347975) {
                        var191 = -0.026341809;
                    } else {
                        var191 = 0.027368272;
                    }
                }
            }
        } else {
            if (inputs[19] < 2.5699441) {
                var191 = -0.048797373;
            } else {
                if (inputs[3] < 1884.465) {
                    var191 = 0.018704927;
                } else {
                    var191 = -0.011462544;
                }
            }
        }
    }
    double var192;
    if (inputs[15] < 0.30430302) {
        if (inputs[24] < -24.679111) {
            var192 = -0.031838845;
        } else {
            if (inputs[2] < 1.1628572) {
                var192 = 0.038382012;
            } else {
                if (inputs[20] < -0.72686684) {
                    var192 = 0.024471223;
                } else {
                    if (inputs[11] < 0.35) {
                        var192 = -0.026949437;
                    } else {
                        if (inputs[20] < 0.8231325) {
                            var192 = -0.010563161;
                        } else {
                            var192 = 0.026250863;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[20] < -1.0209947) {
            var192 = -0.06035171;
        } else {
            if (inputs[20] < 0.11182756) {
                if (inputs[3] < 1814.065) {
                    var192 = -0.0073148017;
                } else {
                    var192 = 0.023367846;
                }
            } else {
                var192 = -0.042380385;
            }
        }
    }
    double var193;
    if (inputs[17] < 0.86311066) {
        var193 = -0.034813687;
    } else {
        if (inputs[1] < 71.35617) {
            if (inputs[5] < 1687.4926) {
                var193 = 0.040007804;
            } else {
                if (inputs[15] < 0.25624242) {
                    if (inputs[16] < -0.08757143) {
                        if (inputs[23] < -23.573027) {
                            var193 = -0.01779987;
                        } else {
                            if (inputs[24] < -20.653982) {
                                var193 = 0.044512913;
                            } else {
                                var193 = 0.0030868067;
                            }
                        }
                    } else {
                        var193 = -0.038056996;
                    }
                } else {
                    if (inputs[20] < -0.29473558) {
                        var193 = 0.0052547404;
                    } else {
                        var193 = 0.056081843;
                    }
                }
            }
        } else {
            var193 = -0.021467842;
        }
    }
    double var194;
    if (inputs[2] < 1.0707142) {
        var194 = -0.028512588;
    } else {
        if (inputs[2] < 1.2021428) {
            var194 = 0.03550308;
        } else {
            if (inputs[19] < 1.3940413) {
                if (inputs[10] < 0.95) {
                    var194 = 0.0010661758;
                } else {
                    var194 = -0.04560093;
                }
            } else {
                if (inputs[23] < -35.168385) {
                    var194 = -0.025006859;
                } else {
                    if (inputs[14] < 1.16) {
                        if (inputs[19] < 1.9347545) {
                            if (inputs[19] < 1.6401807) {
                                var194 = 0.005128744;
                            } else {
                                var194 = 0.06759606;
                            }
                        } else {
                            if (inputs[2] < 2.7042856) {
                                var194 = -0.014053944;
                            } else {
                                var194 = 0.0333073;
                            }
                        }
                    } else {
                        var194 = -0.015879907;
                    }
                }
            }
        }
    }
    double var195;
    if (inputs[1] < 31.394823) {
        if (inputs[2] < 1.2821429) {
            var195 = -0.044606827;
        } else {
            if (inputs[16] < -0.29300752) {
                var195 = -0.010174932;
            } else {
                var195 = 0.0048175417;
            }
        }
    } else {
        if (inputs[14] < -0.906) {
            var195 = 0.034549963;
        } else {
            if (inputs[10] < 0.55) {
                if (inputs[9] < 2.835) {
                    var195 = -0.01475872;
                } else {
                    var195 = 0.037095733;
                }
            } else {
                if (inputs[15] < -0.15684849) {
                    var195 = -0.03834013;
                } else {
                    if (inputs[15] < 0.30430302) {
                        var195 = 0.0304813;
                    } else {
                        if (inputs[14] < 0.748) {
                            var195 = 0.01226732;
                        } else {
                            if (inputs[15] < 0.5062424) {
                                var195 = -0.048663612;
                            } else {
                                var195 = 0.0015340429;
                            }
                        }
                    }
                }
            }
        }
    }
    double var196;
    if (inputs[25] < 3.3075356) {
        if (inputs[2] < 1.4685714) {
            if (inputs[17] < 1.2800875) {
                var196 = 0.0421515;
            } else {
                var196 = 0.0010242248;
            }
        } else {
            if (inputs[14] < -0.934) {
                var196 = 0.026670456;
            } else {
                if (inputs[20] < -0.48359513) {
                    var196 = -0.037171725;
                } else {
                    if (inputs[16] < 0.10293985) {
                        var196 = -0.013807545;
                    } else {
                        var196 = 0.025325872;
                    }
                }
            }
        }
    } else {
        if (inputs[18] < 1.6869229) {
            if (inputs[18] < 1.2593713) {
                var196 = -0.02533818;
            } else {
                var196 = 0.02168316;
            }
        } else {
            var196 = -0.04377939;
        }
    }
    double var197;
    if (inputs[1] < 63.875416) {
        if (inputs[1] < 60.820408) {
            if (inputs[1] < 36.89342) {
                if (inputs[9] < 6.605) {
                    if (inputs[21] < -2.872818) {
                        var197 = 0.00077673;
                    } else {
                        var197 = 0.04069494;
                    }
                } else {
                    var197 = -0.016868446;
                }
            } else {
                var197 = -0.0405131;
            }
        } else {
            var197 = 0.043083504;
        }
    } else {
        if (inputs[9] < 7.13) {
            if (inputs[20] < -1.1115547) {
                var197 = 0.009153353;
            } else {
                if (inputs[16] < 0.15609023) {
                    var197 = -0.01805583;
                } else {
                    var197 = -0.06597415;
                }
            }
        } else {
            var197 = 0.014046771;
        }
    }
    double var198;
    if (inputs[16] < 0.051766917) {
        if (inputs[13] < 1731.27) {
            var198 = 0.034546163;
        } else {
            if (inputs[11] < 0.25) {
                var198 = -0.026281506;
            } else {
                if (inputs[18] < 1.8450803) {
                    if (inputs[1] < 32.738472) {
                        var198 = -0.031500712;
                    } else {
                        var198 = 0.027143395;
                    }
                } else {
                    var198 = 0.047171436;
                }
            }
        }
    } else {
        if (inputs[21] < 2.805) {
            if (inputs[14] < 0.771) {
                var198 = -0.06319987;
            } else {
                var198 = -0.011324354;
            }
        } else {
            if (inputs[14] < 0.771) {
                var198 = -0.010607897;
            } else {
                var198 = 0.034009654;
            }
        }
    }
    double var199;
    if (inputs[18] < 1.0600189) {
        var199 = 0.030894965;
    } else {
        if (inputs[21] < -3.3407135) {
            var199 = -0.029322913;
        } else {
            if (inputs[20] < 0.28234375) {
                if (inputs[23] < 0.3177864) {
                    if (inputs[16] < -0.08324812) {
                        var199 = -0.021659482;
                    } else {
                        if (inputs[9] < 4.4375) {
                            var199 = 0.037772354;
                        } else {
                            var199 = -0.0038965747;
                        }
                    }
                } else {
                    var199 = 0.028066412;
                }
            } else {
                if (inputs[20] < 0.83157694) {
                    var199 = -0.038578916;
                } else {
                    if (inputs[11] < 0.34) {
                        var199 = -0.025612447;
                    } else {
                        var199 = 0.022423197;
                    }
                }
            }
        }
    }
    double var200;
    if (inputs[21] < 2.2659361) {
        if (inputs[15] < -0.3961212) {
            if (inputs[20] < 0.84939736) {
                if (inputs[20] < -0.27667353) {
                    var200 = 0.012964498;
                } else {
                    var200 = -0.04321486;
                }
            } else {
                var200 = 0.022017516;
            }
        } else {
            if (inputs[15] < -0.2869091) {
                var200 = 0.047724187;
            } else {
                if (inputs[13] < 1837.94) {
                    var200 = -0.010398131;
                } else {
                    var200 = 0.03095167;
                }
            }
        }
    } else {
        if (inputs[25] < 2.7594762) {
            var200 = -0.044308458;
        } else {
            if (inputs[23] < -21.98774) {
                var200 = 0.032570433;
            } else {
                var200 = -0.022185775;
            }
        }
    }
    double var201;
    if (inputs[10] < 0.4925) {
        if (inputs[9] < 2.795) {
            var201 = -0.022493513;
        } else {
            var201 = 0.03724592;
        }
    } else {
        if (inputs[13] < 1953.42) {
            if (inputs[20] < -1.120416) {
                var201 = 0.023354454;
            } else {
                if (inputs[19] < 1.6755253) {
                    if (inputs[11] < 0.37) {
                        var201 = -0.07653502;
                    } else {
                        var201 = -0.006851236;
                    }
                } else {
                    if (inputs[15] < -0.55) {
                        var201 = -0.02983753;
                    } else {
                        if (inputs[24] < 15.376207) {
                            var201 = 0.03271703;
                        } else {
                            var201 = -0.0030577101;
                        }
                    }
                }
            }
        } else {
            var201 = -0.03679422;
        }
    }
    double var202;
    if (inputs[24] < 18.969734) {
        if (inputs[19] < 1.4164727) {
            if (inputs[10] < 1.575) {
                if (inputs[25] < 2.471551) {
                    var202 = -0.0050994875;
                } else {
                    var202 = -0.04944457;
                }
            } else {
                var202 = 0.009124696;
            }
        } else {
            if (inputs[17] < 1.7381139) {
                if (inputs[14] < -0.57) {
                    var202 = 0.0027265602;
                } else {
                    if (inputs[3] < 1830.97) {
                        var202 = 0.051643677;
                    } else {
                        var202 = 0.010305703;
                    }
                }
            } else {
                var202 = -0.014546482;
            }
        }
    } else {
        if (inputs[24] < 25.151962) {
            var202 = 0.039160848;
        } else {
            var202 = 0.0041109393;
        }
    }
    double var203;
    if (inputs[16] < -0.16803007) {
        if (inputs[9] < 6.0675) {
            var203 = -0.033510633;
        } else {
            var203 = 0.007814921;
        }
    } else {
        if (inputs[14] < -0.685) {
            if (inputs[15] < -0.40339395) {
                var203 = 0.00591945;
            } else {
                var203 = 0.052547097;
            }
        } else {
            if (inputs[14] < 0.452) {
                var203 = -0.032868892;
            } else {
                if (inputs[14] < 0.683) {
                    var203 = 0.033607062;
                } else {
                    if (inputs[1] < 69.46455) {
                        if (inputs[1] < 64.91959) {
                            var203 = 0.00008714163;
                        } else {
                            var203 = 0.042934984;
                        }
                    } else {
                        if (inputs[20] < -0.4081105) {
                            var203 = 0.0070549324;
                        } else {
                            var203 = -0.051355094;
                        }
                    }
                }
            }
        }
    }
    double var204;
    if (inputs[24] < -23.737839) {
        var204 = 0.033381794;
    } else {
        if (inputs[16] < 0.2694436) {
            if (inputs[25] < 2.518391) {
                if (inputs[19] < 1.3315202) {
                    var204 = 0.037351865;
                } else {
                    if (inputs[2] < 2.382857) {
                        var204 = -0.030392844;
                    } else {
                        var204 = 0.019677311;
                    }
                }
            } else {
                if (inputs[20] < -0.8732041) {
                    var204 = 0.005800018;
                } else {
                    if (inputs[16] < -0.17314285) {
                        var204 = 0.0027885404;
                    } else {
                        if (inputs[17] < 1.2984083) {
                            var204 = -0.065100044;
                        } else {
                            var204 = -0.02571705;
                        }
                    }
                }
            }
        } else {
            var204 = 0.023947708;
        }
    }
    double var205;
    if (inputs[6] < 1950.41) {
        if (inputs[2] < 1.6985714) {
            if (inputs[17] < 0.9764753) {
                var205 = -0.019233806;
            } else {
                if (inputs[19] < 1.5902618) {
                    if (inputs[12] < 1777.41) {
                        var205 = 0.057275362;
                    } else {
                        if (inputs[2] < 1.2335714) {
                            var205 = -0.02276014;
                        } else {
                            var205 = 0.038882498;
                        }
                    }
                } else {
                    var205 = -0.020918375;
                }
            }
        } else {
            if (inputs[2] < 1.9357142) {
                var205 = -0.05213108;
            } else {
                if (inputs[19] < 2.144363) {
                    var205 = 0.022366049;
                } else {
                    if (inputs[25] < 2.6388013) {
                        var205 = -0.04699033;
                    } else {
                        var205 = -0.001867636;
                    }
                }
            }
        }
    } else {
        var205 = 0.030940926;
    }
    double var206;
    if (inputs[24] < -20.653982) {
        if (inputs[23] < -14.196849) {
            var206 = 0.0058671306;
        } else {
            var206 = 0.03511554;
        }
    } else {
        if (inputs[16] < 0.2733158) {
            if (inputs[15] < -0.5331515) {
                var206 = 0.015479284;
            } else {
                if (inputs[23] < -32.103245) {
                    if (inputs[20] < 0.535828) {
                        var206 = -0.01747921;
                    } else {
                        var206 = 0.021388303;
                    }
                } else {
                    if (inputs[3] < 1850.175) {
                        if (inputs[2] < 1.53) {
                            var206 = -0.072935745;
                        } else {
                            var206 = -0.033686727;
                        }
                    } else {
                        if (inputs[24] < 5.416885) {
                            var206 = -0.03309791;
                        } else {
                            var206 = 0.01303253;
                        }
                    }
                }
            }
        } else {
            var206 = 0.024771582;
        }
    }
    double var207;
    if (inputs[17] < 2.5874202) {
        if (inputs[19] < 3.231047) {
            if (inputs[5] < 1923.6274) {
                if (inputs[10] < 0.67) {
                    if (inputs[4] < 1826.61) {
                        var207 = -0.032550044;
                    } else {
                        var207 = 0.018409336;
                    }
                } else {
                    if (inputs[10] < 1.16) {
                        var207 = 0.039350152;
                    } else {
                        if (inputs[2] < 1.2021428) {
                            var207 = 0.023680061;
                        } else {
                            if (inputs[19] < 1.5201443) {
                                var207 = -0.038184915;
                            } else {
                                var207 = 0.014173397;
                            }
                        }
                    }
                }
            } else {
                var207 = -0.016986022;
            }
        } else {
            var207 = 0.043476783;
        }
    } else {
        var207 = -0.029212508;
    }
    double var208;
    if (inputs[2] < 3.0985715) {
        if (inputs[19] < 1.3897288) {
            if (inputs[19] < 1.2559031) {
                if (inputs[10] < 0.95) {
                    var208 = 0.029623024;
                } else {
                    var208 = -0.01260852;
                }
            } else {
                var208 = -0.03465408;
            }
        } else {
            if (inputs[17] < 1.9498061) {
                if (inputs[19] < 1.4941549) {
                    var208 = 0.051592913;
                } else {
                    if (inputs[23] < -35.493023) {
                        var208 = -0.017628102;
                    } else {
                        if (inputs[19] < 1.7935541) {
                            var208 = -0.002519014;
                        } else {
                            if (inputs[17] < 1.2256917) {
                                var208 = 0.019634178;
                            } else {
                                var208 = 0.05351826;
                            }
                        }
                    }
                }
            } else {
                var208 = -0.013636249;
            }
        }
    } else {
        var208 = -0.048170164;
    }
    double var209;
    if (inputs[25] < 1.9720739) {
        var209 = 0.023558283;
    } else {
        if (inputs[25] < 3.964557) {
            if (inputs[14] < 1.141) {
                if (inputs[9] < 2.985) {
                    if (inputs[11] < 0.39) {
                        var209 = 0.03846509;
                    } else {
                        var209 = -0.029131737;
                    }
                } else {
                    if (inputs[15] < 0.2969697) {
                        if (inputs[13] < 1834.2) {
                            if (inputs[14] < -0.768) {
                                var209 = -0.01845632;
                            } else {
                                var209 = 0.020894835;
                            }
                        } else {
                            var209 = -0.040998828;
                        }
                    } else {
                        var209 = -0.054609116;
                    }
                }
            } else {
                var209 = 0.022986747;
            }
        } else {
            var209 = 0.023877257;
        }
    }
    double var210;
    if (inputs[20] < 0.4305812) {
        if (inputs[16] < 0.13461654) {
            if (inputs[10] < 2.1375) {
                if (inputs[14] < -0.835) {
                    var210 = -0.052626986;
                } else {
                    if (inputs[17] < 1.1671058) {
                        var210 = -0.024199935;
                    } else {
                        var210 = 0.03199026;
                    }
                }
            } else {
                var210 = -0.042838868;
            }
        } else {
            if (inputs[19] < 2.0771122) {
                var210 = 0.044329744;
            } else {
                var210 = -0.028288933;
            }
        }
    } else {
        if (inputs[23] < -3.9755354) {
            if (inputs[11] < 0.34) {
                var210 = -0.02960584;
            } else {
                var210 = 0.022185579;
            }
        } else {
            var210 = 0.043328654;
        }
    }
    double var211;
    if (inputs[18] < 2.4188137) {
        if (inputs[15] < 0.4257576) {
            if (inputs[15] < 0.3481818) {
                if (inputs[20] < -0.9606296) {
                    var211 = 0.02286527;
                } else {
                    if (inputs[16] < -0.041323308) {
                        if (inputs[9] < 4.955) {
                            var211 = 0.019936584;
                        } else {
                            var211 = -0.018042501;
                        }
                    } else {
                        var211 = -0.043445848;
                    }
                }
            } else {
                var211 = 0.045412358;
            }
        } else {
            var211 = -0.021389842;
        }
    } else {
        var211 = 0.034066685;
    }
    double var212;
    if (inputs[2] < 2.78) {
        if (inputs[10] < 3.34) {
            if (inputs[18] < 1.7636102) {
                if (inputs[18] < 1.3142484) {
                    if (inputs[14] < 0.452) {
                        var212 = -0.025002597;
                    } else {
                        var212 = 0.014085835;
                    }
                } else {
                    if (inputs[16] < -0.08757143) {
                        var212 = 0.058835354;
                    } else {
                        var212 = 0.0025284428;
                    }
                }
            } else {
                if (inputs[16] < 0.021729324) {
                    var212 = -0.041720845;
                } else {
                    var212 = 0.0062390547;
                }
            }
        } else {
            var212 = -0.027732728;
        }
    } else {
        var212 = 0.03001548;
    }
    double var213;
    if (inputs[21] < -3.4881837) {
        var213 = 0.033085927;
    } else {
        if (inputs[15] < -0.6484848) {
            var213 = 0.024606736;
        } else {
            if (inputs[6] < 1924.28) {
                if (inputs[13] < 1884.03) {
                    if (inputs[17] < 1.1489543) {
                        if (inputs[17] < 0.9764753) {
                            var213 = 0.0003730105;
                        } else {
                            var213 = 0.03273299;
                        }
                    } else {
                        if (inputs[17] < 1.7645464) {
                            if (inputs[13] < 1787.47) {
                                var213 = -0.01938639;
                            } else {
                                var213 = -0.059833474;
                            }
                        } else {
                            var213 = 0.0014728297;
                        }
                    }
                } else {
                    var213 = 0.025913812;
                }
            } else {
                var213 = -0.038424175;
            }
        }
    }
    double var214;
    if (inputs[4] < 1814.075) {
        if (inputs[23] < -6.3145747) {
            if (inputs[9] < 6.2225) {
                if (inputs[14] < 0.641) {
                    var214 = -0.03156467;
                } else {
                    var214 = 0.012212366;
                }
            } else {
                var214 = 0.026140774;
            }
        } else {
            var214 = -0.030811207;
        }
    } else {
        if (inputs[2] < 1.7892857) {
            if (inputs[19] < 1.2641958) {
                var214 = -0.016531782;
            } else {
                if (inputs[17] < 1.2884191) {
                    var214 = 0.062602006;
                } else {
                    var214 = 0.01839624;
                }
            }
        } else {
            if (inputs[10] < 3.645) {
                var214 = -0.02512391;
            } else {
                var214 = 0.015267592;
            }
        }
    }
    double var215;
    if (inputs[18] < 1.0707176) {
        var215 = -0.041653164;
    } else {
        if (inputs[9] < 1.7475) {
            var215 = -0.032671485;
        } else {
            if (inputs[16] < -0.22264662) {
                var215 = -0.025894228;
            } else {
                if (inputs[16] < 0.106548876) {
                    if (inputs[18] < 1.4906445) {
                        var215 = 0.03477709;
                    } else {
                        if (inputs[21] < -1.6590085) {
                            var215 = 0.025706913;
                        } else {
                            var215 = -0.024753252;
                        }
                    }
                } else {
                    if (inputs[2] < 1.445) {
                        var215 = -0.04051187;
                    } else {
                        if (inputs[20] < -0.5601386) {
                            var215 = 0.023476489;
                        } else {
                            var215 = -0.011993156;
                        }
                    }
                }
            }
        }
    }
    double var216;
    if (inputs[24] < 18.969734) {
        if (inputs[10] < 0.4725) {
            var216 = 0.014350414;
        } else {
            if (inputs[18] < 1.1427113) {
                var216 = -0.048757866;
            } else {
                if (inputs[17] < 2.1295314) {
                    if (inputs[9] < 4.78) {
                        if (inputs[9] < 2.4125) {
                            var216 = 0.00537116;
                        } else {
                            var216 = -0.057599723;
                        }
                    } else {
                        if (inputs[21] < -2.7431302) {
                            var216 = 0.034436665;
                        } else {
                            var216 = 0.00094360294;
                        }
                    }
                } else {
                    var216 = -0.03902244;
                }
            }
        }
    } else {
        if (inputs[24] < 25.472149) {
            var216 = 0.0371106;
        } else {
            var216 = -0.0055227983;
        }
    }
    double var217;
    if (inputs[6] < 1870.87) {
        if (inputs[4] < 1832.945) {
            if (inputs[25] < 3.1514523) {
                if (inputs[6] < 1762.775) {
                    if (inputs[25] < 2.3247232) {
                        var217 = -0.031588227;
                    } else {
                        var217 = 0.012528255;
                    }
                } else {
                    var217 = 0.029587867;
                }
            } else {
                if (inputs[18] < 1.4186264) {
                    var217 = -0.0032559766;
                } else {
                    var217 = -0.056263287;
                }
            }
        } else {
            var217 = -0.04064705;
        }
    } else {
        if (inputs[5] < 1913.09) {
            var217 = 0.049975786;
        } else {
            if (inputs[12] < 1935.96) {
                var217 = -0.028997177;
            } else {
                var217 = 0.025864618;
            }
        }
    }
    double var218;
    if (inputs[13] < 1924.9) {
        if (inputs[10] < 1.505) {
            if (inputs[2] < 1.5785714) {
                if (inputs[23] < -21.316923) {
                    var218 = 0.007877504;
                } else {
                    var218 = -0.0694094;
                }
            } else {
                if (inputs[9] < 2.985) {
                    var218 = 0.038879678;
                } else {
                    var218 = -0.009475556;
                }
            }
        } else {
            if (inputs[9] < 6.4875) {
                if (inputs[19] < 1.3074727) {
                    var218 = 0.04792578;
                } else {
                    var218 = 0.012781348;
                }
            } else {
                if (inputs[9] < 8.66) {
                    var218 = -0.032976065;
                } else {
                    var218 = 0.014442644;
                }
            }
        }
    } else {
        var218 = -0.025891956;
    }
    double var219;
    if (inputs[4] < 1935.9) {
        if (inputs[5] < 1912.105) {
            if (inputs[17] < 0.9489573) {
                var219 = -0.029417366;
            } else {
                if (inputs[16] < -0.13818797) {
                    if (inputs[1] < 28.797646) {
                        var219 = 0.021410797;
                    } else {
                        var219 = -0.047531977;
                    }
                } else {
                    if (inputs[21] < -1.6590085) {
                        var219 = 0.044555686;
                    } else {
                        if (inputs[15] < 0.36539394) {
                            var219 = -0.012193411;
                        } else {
                            if (inputs[23] < -16.599993) {
                                var219 = 0.03914113;
                            } else {
                                var219 = 0.008839874;
                            }
                        }
                    }
                }
            }
        } else {
            var219 = -0.030723594;
        }
    } else {
        var219 = 0.028242396;
    }
    double var220;
    if (inputs[21] < -3.0357554) {
        if (inputs[17] < 1.2178605) {
            var220 = 0.048110027;
        } else {
            var220 = -0.008146978;
        }
    } else {
        if (inputs[11] < 0.29) {
            if (inputs[5] < 1837.4675) {
                var220 = -0.0055971956;
            } else {
                var220 = -0.054028183;
            }
        } else {
            if (inputs[13] < 1933.02) {
                if (inputs[10] < 0.85) {
                    if (inputs[9] < 2.695) {
                        var220 = -0.0605319;
                    } else {
                        var220 = -0.008698021;
                    }
                } else {
                    if (inputs[2] < 1.5064286) {
                        var220 = -0.016919872;
                    } else {
                        var220 = 0.040147383;
                    }
                }
            } else {
                var220 = 0.033855688;
            }
        }
    }
    double var221;
    if (inputs[10] < 1.185) {
        if (inputs[10] < 0.85) {
            if (inputs[10] < 0.4925) {
                if (inputs[9] < 2.835) {
                    var221 = -0.0074620023;
                } else {
                    var221 = 0.04005492;
                }
            } else {
                var221 = -0.016983487;
            }
        } else {
            var221 = 0.040725194;
        }
    } else {
        if (inputs[6] < 1915.285) {
            if (inputs[10] < 2.0625) {
                var221 = -0.029057546;
            } else {
                if (inputs[11] < 0.32) {
                    var221 = 0.027504403;
                } else {
                    var221 = -0.006937999;
                }
            }
        } else {
            var221 = -0.040978108;
        }
    }
    double var222;
    if (inputs[5] < 1669.84) {
        var222 = -0.02417784;
    } else {
        if (inputs[20] < -1.3405008) {
            var222 = 0.03275639;
        } else {
            if (inputs[20] < -0.5762631) {
                var222 = -0.02775765;
            } else {
                if (inputs[25] < 2.2597165) {
                    var222 = 0.034591097;
                } else {
                    if (inputs[2] < 1.405) {
                        if (inputs[24] < -15.680102) {
                            var222 = 0.037261654;
                        } else {
                            var222 = 0.0043414375;
                        }
                    } else {
                        if (inputs[18] < 2.0153313) {
                            var222 = -0.0499085;
                        } else {
                            var222 = 0.0051751807;
                        }
                    }
                }
            }
        }
    }
    double var223;
    if (inputs[24] < -24.679111) {
        var223 = -0.03152558;
    } else {
        if (inputs[9] < 3.17) {
            if (inputs[10] < 0.335) {
                var223 = -0.04270768;
            } else {
                if (inputs[9] < 2.12) {
                    var223 = -0.017964786;
                } else {
                    var223 = 0.021629464;
                }
            }
        } else {
            if (inputs[10] < 1.74) {
                if (inputs[11] < 0.33) {
                    var223 = 0.00730253;
                } else {
                    var223 = 0.0460438;
                }
            } else {
                if (inputs[16] < 0.21158646) {
                    if (inputs[21] < -1.6590085) {
                        var223 = 0.008063883;
                    } else {
                        var223 = -0.034718197;
                    }
                } else {
                    var223 = 0.025915228;
                }
            }
        }
    }
    double var224;
    if (inputs[10] < 1.505) {
        if (inputs[6] < 1718.845) {
            var224 = -0.03342666;
        } else {
            if (inputs[13] < 1808.85) {
                var224 = 0.021822223;
            } else {
                if (inputs[20] < 0.4051877) {
                    var224 = -0.032724302;
                } else {
                    var224 = 0.006752906;
                }
            }
        }
    } else {
        if (inputs[11] < 0.25) {
            var224 = -0.01890213;
        } else {
            if (inputs[20] < -0.27667353) {
                if (inputs[16] < 0.13461654) {
                    var224 = 0.013934645;
                } else {
                    var224 = 0.06280207;
                }
            } else {
                var224 = 0.0008488469;
            }
        }
    }
    double var225;
    if (inputs[14] < 0.742) {
        if (inputs[20] < 1.4213508) {
            if (inputs[10] < 2.1375) {
                if (inputs[9] < 4.285) {
                    if (inputs[13] < 1771.47) {
                        var225 = -0.046186857;
                    } else {
                        var225 = -0.00029350855;
                    }
                } else {
                    var225 = 0.0207584;
                }
            } else {
                if (inputs[17] < 1.3638827) {
                    var225 = -0.044706497;
                } else {
                    var225 = -0.013699458;
                }
            }
        } else {
            var225 = 0.016763417;
        }
    } else {
        if (inputs[16] < 0.15609023) {
            var225 = 0.045500513;
        } else {
            var225 = -0.012856775;
        }
    }
    double var226;
    if (inputs[15] < 0.5938788) {
        if (inputs[25] < 2.0855615) {
            if (inputs[9] < 3.4) {
                var226 = -0.008274287;
            } else {
                var226 = -0.03539291;
            }
        } else {
            if (inputs[17] < 1.0635225) {
                if (inputs[4] < 1812.825) {
                    var226 = -0.030165376;
                } else {
                    var226 = 0.02092503;
                }
            } else {
                if (inputs[21] < -3.0357554) {
                    var226 = 0.041532088;
                } else {
                    if (inputs[18] < 1.3326819) {
                        var226 = -0.012353344;
                    } else {
                        if (inputs[23] < -3.9755354) {
                            var226 = 0.005044619;
                        } else {
                            var226 = 0.04173902;
                        }
                    }
                }
            }
        }
    } else {
        var226 = -0.040411387;
    }
    double var227;
    if (inputs[15] < -0.5891515) {
        var227 = 0.03301254;
    } else {
        if (inputs[16] < -0.16803007) {
            if (inputs[14] < -0.733) {
                var227 = -0.05478203;
            } else {
                var227 = -0.00043880672;
            }
        } else {
            if (inputs[4] < 1931.365) {
                if (inputs[20] < -0.005653874) {
                    if (inputs[18] < 1.4373323) {
                        var227 = 0.035832696;
                    } else {
                        var227 = -0.0073438017;
                    }
                } else {
                    if (inputs[1] < 65.79931) {
                        var227 = 0.0060922494;
                    } else {
                        var227 = -0.051908117;
                    }
                }
            } else {
                var227 = 0.030923178;
            }
        }
    }
    double var228;
    if (inputs[14] < 0.993) {
        if (inputs[1] < 30.82347) {
            if (inputs[10] < 1.865) {
                var228 = 0.00957768;
            } else {
                var228 = -0.026077991;
            }
        } else {
            if (inputs[10] < 2.3575) {
                if (inputs[10] < 0.9575) {
                    if (inputs[21] < -2.0811305) {
                        var228 = 0.052876394;
                    } else {
                        if (inputs[15] < 0.3798788) {
                            var228 = -0.015700972;
                        } else {
                            var228 = 0.032639448;
                        }
                    }
                } else {
                    if (inputs[23] < -16.599993) {
                        var228 = -0.01524274;
                    } else {
                        var228 = -0.021771215;
                    }
                }
            } else {
                var228 = 0.040867705;
            }
        }
    } else {
        var228 = -0.027382046;
    }
    double var229;
    if (inputs[14] < 1.016) {
        if (inputs[19] < 2.3168728) {
            if (inputs[11] < 0.31) {
                var229 = 0.046897728;
            } else {
                if (inputs[11] < 0.36) {
                    var229 = -0.010358541;
                } else {
                    if (inputs[16] < 0.035654135) {
                        if (inputs[23] < -36.490715) {
                            var229 = 0.0025019334;
                        } else {
                            var229 = 0.03963239;
                        }
                    } else {
                        var229 = -0.0017731376;
                    }
                }
            }
        } else {
            var229 = -0.014919213;
        }
    } else {
        var229 = -0.014702334;
    }
    double var230;
    if (inputs[16] < -0.16878195) {
        if (inputs[19] < 1.7639654) {
            var230 = -0.04100576;
        } else {
            var230 = 0.010447618;
        }
    } else {
        if (inputs[17] < 2.2184463) {
            if (inputs[2] < 1.7807143) {
                if (inputs[24] < -9.31983) {
                    var230 = -0.0074609816;
                } else {
                    if (inputs[21] < 2.4249263) {
                        var230 = 0.05952488;
                    } else {
                        if (inputs[10] < 1.19) {
                            var230 = -0.010661562;
                        } else {
                            var230 = 0.027896566;
                        }
                    }
                }
            } else {
                if (inputs[5] < 1846.405) {
                    var230 = 0.012906261;
                } else {
                    var230 = -0.03824438;
                }
            }
        } else {
            var230 = 0.039468154;
        }
    }
    double var231;
    if (inputs[23] < -55.599304) {
        var231 = -0.03953396;
    } else {
        if (inputs[20] < 0.9026732) {
            if (inputs[18] < 1.1529632) {
                var231 = 0.04008597;
            } else {
                if (inputs[15] < -0.5891515) {
                    var231 = 0.03902317;
                } else {
                    if (inputs[10] < 4.7325) {
                        if (inputs[23] < 0.3177864) {
                            if (inputs[15] < 0.37369698) {
                                var231 = -0.007706101;
                            } else {
                                var231 = 0.028972918;
                            }
                        } else {
                            var231 = -0.029728308;
                        }
                    } else {
                        var231 = 0.032504346;
                    }
                }
            }
        } else {
            var231 = -0.027403511;
        }
    }
    double var232;
    if (inputs[15] < 0.50357574) {
        if (inputs[18] < 1.5472507) {
            if (inputs[21] < -3.0357554) {
                var232 = 0.030607486;
            } else {
                if (inputs[15] < 0.3159394) {
                    if (inputs[2] < 1.445) {
                        var232 = -0.03368439;
                    } else {
                        var232 = -0.0028797295;
                    }
                } else {
                    var232 = 0.021884102;
                }
            }
        } else {
            if (inputs[18] < 1.8450803) {
                var232 = -0.04732794;
            } else {
                if (inputs[17] < 1.9682418) {
                    var232 = 0.00820454;
                } else {
                    var232 = -0.025458274;
                }
            }
        }
    } else {
        var232 = 0.018001698;
    }
    double var233;
    if (inputs[17] < 0.87206423) {
        var233 = -0.029255478;
    } else {
        if (inputs[19] < 1.1115075) {
            var233 = 0.041091654;
        } else {
            if (inputs[18] < 1.4647648) {
                if (inputs[14] < -0.563) {
                    var233 = -0.03285592;
                } else {
                    var233 = 0.004435648;
                }
            } else {
                if (inputs[15] < 0.4257576) {
                    if (inputs[1] < 28.245983) {
                        var233 = -0.008029272;
                    } else {
                        if (inputs[17] < 1.5626976) {
                            var233 = -0.0041761375;
                        } else {
                            var233 = 0.05389911;
                        }
                    }
                } else {
                    if (inputs[9] < 4.9825) {
                        var233 = -0.022260457;
                    } else {
                        var233 = 0.018008372;
                    }
                }
            }
        }
    }
    double var234;
    if (inputs[8] < 1933.74) {
        if (inputs[15] < 0.40327272) {
            if (inputs[19] < 2.2370524) {
                if (inputs[15] < -0.44751516) {
                    var234 = 0.019422334;
                } else {
                    if (inputs[11] < 0.34) {
                        var234 = 0.011671556;
                    } else {
                        if (inputs[17] < 1.2055439) {
                            var234 = -0.009388012;
                        } else {
                            var234 = -0.05197427;
                        }
                    }
                }
            } else {
                var234 = -0.047024745;
            }
        } else {
            if (inputs[16] < 0.15609023) {
                var234 = 0.04797353;
            } else {
                var234 = -0.014774641;
            }
        }
    } else {
        var234 = 0.02555295;
    }
    double var235;
    if (inputs[1] < 26.495476) {
        var235 = 0.029403046;
    } else {
        if (inputs[18] < 2.8605216) {
            if (inputs[25] < 1.8835075) {
                var235 = -0.045419384;
            } else {
                if (inputs[21] < -2.872818) {
                    var235 = -0.038049873;
                } else {
                    if (inputs[18] < 1.2363172) {
                        if (inputs[17] < 1.054571) {
                            var235 = -0.008478471;
                        } else {
                            var235 = -0.040691666;
                        }
                    } else {
                        if (inputs[8] < 1813.39) {
                            if (inputs[19] < 1.5364696) {
                                var235 = 0.052741922;
                            } else {
                                var235 = 0.019441178;
                            }
                        } else {
                            if (inputs[5] < 1897.69) {
                                var235 = -0.018649822;
                            } else {
                                var235 = 0.014797279;
                            }
                        }
                    }
                }
            }
        } else {
            var235 = 0.028077206;
        }
    }
    double var236;
    if (inputs[17] < 1.9122196) {
        if (inputs[2] < 1.0278572) {
            var236 = -0.024198916;
        } else {
            if (inputs[12] < 1796.91) {
                if (inputs[23] < -21.98774) {
                    var236 = 0.017049637;
                } else {
                    var236 = -0.032868966;
                }
            } else {
                if (inputs[13] < 1835.06) {
                    var236 = 0.053210944;
                } else {
                    if (inputs[20] < -0.44777) {
                        var236 = -0.002681848;
                    } else {
                        if (inputs[9] < 3.455) {
                            var236 = 0.04958586;
                        } else {
                            var236 = 0.01024482;
                        }
                    }
                }
            }
        }
    } else {
        if (inputs[11] < 0.28) {
            var236 = -0.0445781;
        } else {
            var236 = 0.0016924166;
        }
    }
    double var237;
    if (inputs[20] < 0.00019193416) {
        if (inputs[24] < -12.6547575) {
            var237 = 0.032218035;
        } else {
            if (inputs[21] < 2.5411365) {
                if (inputs[25] < 2.1488645) {
                    var237 = 0.009422975;
                } else {
                    var237 = -0.051271487;
                }
            } else {
                if (inputs[14] < 0.759) {
                    var237 = -0.0000069914186;
                } else {
                    var237 = 0.03404687;
                }
            }
        }
    } else {
        if (inputs[8] < 1811.17) {
            if (inputs[21] < -2.2333915) {
                var237 = -0.011810676;
            } else {
                var237 = -0.043665837;
            }
        } else {
            if (inputs[20] < 1.1718025) {
                if (inputs[11] < 0.3) {
                    var237 = 0.011358643;
                } else {
                    var237 = -0.029080594;
                }
            } else {
                var237 = 0.03796354;
            }
        }
    }
    double var238;
    if (inputs[5] < 1923.6274) {
        if (inputs[17] < 0.9647051) {
            var238 = -0.01901337;
        } else {
            if (inputs[17] < 1.2884191) {
                if (inputs[5] < 1793.58) {
                    var238 = 0.016228292;
                } else {
                    var238 = 0.057161693;
                }
            } else {
                if (inputs[25] < 3.2037778) {
                    if (inputs[19] < 1.6515522) {
                        var238 = -0.0071698134;
                    } else {
                        var238 = 0.037898663;
                    }
                } else {
                    var238 = -0.017060753;
                }
            }
        }
    } else {
        if (inputs[25] < 2.664896) {
            var238 = 0.006540541;
        } else {
            var238 = -0.0385789;
        }
    }
    double var239;
    if (inputs[15] < 0.4257576) {
        if (inputs[10] < 0.2475) {
            var239 = 0.05327529;
        } else {
            if (inputs[9] < 7.1975) {
                if (inputs[10] < 2.3475) {
                    if (inputs[23] < -3.152488) {
                        if (inputs[20] < 0.08772628) {
                            var239 = -0.03168593;
                        } else {
                            var239 = 0.0019068749;
                        }
                    } else {
                        var239 = 0.02541489;
                    }
                } else {
                    var239 = 0.037111133;
                }
            } else {
                var239 = -0.025634184;
            }
        }
    } else {
        if (inputs[10] < 1.2175) {
            var239 = -0.0020703475;
        } else {
            var239 = -0.043650996;
        }
    }
    double var240;
    if (inputs[20] < -0.95399433) {
        if (inputs[25] < 2.525816) {
            var240 = -0.0499975;
        } else {
            var240 = 0.0098590655;
        }
    } else {
        if (inputs[2] < 1.9864286) {
            if (inputs[11] < 0.36) {
                if (inputs[19] < 1.7022699) {
                    var240 = -0.043106742;
                } else {
                    var240 = -0.002666905;
                }
            } else {
                if (inputs[8] < 1826.56) {
                    if (inputs[23] < -45.986828) {
                        var240 = 0.052559752;
                    } else {
                        var240 = 0.013783816;
                    }
                } else {
                    var240 = -0.013150864;
                }
            }
        } else {
            if (inputs[2] < 2.5442858) {
                var240 = 0.055009406;
            } else {
                var240 = 0.014212834;
            }
        }
    }
    double var241;
    if (inputs[13] < 1731.27) {
        if (inputs[23] < -39.6866) {
            var241 = 0.03598584;
        } else {
            var241 = -0.006555088;
        }
    } else {
        if (inputs[17] < 0.93402356) {
            var241 = 0.021776449;
        } else {
            if (inputs[13] < 1795.22) {
                var241 = -0.043895293;
            } else {
                if (inputs[5] < 1923.6274) {
                    if (inputs[23] < -14.929883) {
                        var241 = -0.018864263;
                    } else {
                        var241 = 0.031978574;
                    }
                } else {
                    if (inputs[23] < 8.549152) {
                        var241 = -0.04549931;
                    } else {
                        var241 = -0.006557329;
                    }
                }
            }
        }
    }
    double var242;
    if (inputs[10] < 5.0575) {
        if (inputs[17] < 1.9122196) {
            if (inputs[20] < -0.47922477) {
                if (inputs[9] < 4.14) {
                    var242 = -0.046048995;
                } else {
                    var242 = 0.0063988557;
                }
            } else {
                if (inputs[17] < 1.4078722) {
                    if (inputs[20] < 0.1593122) {
                        var242 = 0.020808293;
                    } else {
                        if (inputs[15] < -0.30054545) {
                            var242 = 0.0064455206;
                        } else {
                            var242 = -0.049878523;
                        }
                    }
                } else {
                    var242 = 0.030082589;
                }
            }
        } else {
            var242 = -0.03688303;
        }
    } else {
        var242 = 0.019374577;
    }
    double var243;
    if (inputs[19] < 1.7180334) {
        if (inputs[2] < 1.4107143) {
            if (inputs[11] < 0.41) {
                if (inputs[17] < 1.192805) {
                    var243 = -0.040103406;
                } else {
                    var243 = 0.0044455444;
                }
            } else {
                var243 = 0.019160701;
            }
        } else {
            if (inputs[17] < 1.3195817) {
                var243 = -0.020139955;
            } else {
                var243 = -0.050427716;
            }
        }
    } else {
        if (inputs[10] < 1.105) {
            var243 = 0.027046053;
        } else {
            if (inputs[21] < -1.6590085) {
                var243 = 0.01475203;
            } else {
                var243 = -0.022952493;
            }
        }
    }
    double var244;
    if (inputs[19] < 1.1199208) {
        var244 = 0.0267255;
    } else {
        if (inputs[20] < -0.5177981) {
            if (inputs[11] < 0.34) {
                if (inputs[15] < 0.35036364) {
                    var244 = 0.025294187;
                } else {
                    var244 = -0.028358748;
                }
            } else {
                var244 = -0.048544556;
            }
        } else {
            if (inputs[11] < 0.36) {
                if (inputs[9] < 7.84) {
                    if (inputs[23] < -14.363215) {
                        var244 = -0.046754133;
                    } else {
                        var244 = 0.0021281652;
                    }
                } else {
                    var244 = 0.018550813;
                }
            } else {
                if (inputs[15] < -0.21109091) {
                    var244 = -0.0005854521;
                } else {
                    var244 = 0.043220673;
                }
            }
        }
    }
    double var245;
    if (inputs[10] < 2.205) {
        if (inputs[10] < 1.575) {
            if (inputs[18] < 1.8724273) {
                if (inputs[10] < 0.9575) {
                    if (inputs[9] < 3.095) {
                        var245 = -0.010072353;
                    } else {
                        var245 = 0.02143772;
                    }
                } else {
                    var245 = -0.034170903;
                }
            } else {
                var245 = 0.041213896;
            }
        } else {
            var245 = 0.048783954;
        }
    } else {
        if (inputs[20] < -0.72686684) {
            var245 = 0.009779532;
        } else {
            if (inputs[21] < -2.2965488) {
                var245 = -0.0044109426;
            } else {
                var245 = -0.044587772;
            }
        }
    }
    double var246;
    if (inputs[10] < 5.7875) {
        if (inputs[19] < 1.6991948) {
            if (inputs[23] < -50.573925) {
                var246 = 0.033737097;
            } else {
                if (inputs[10] < 2.1375) {
                    if (inputs[19] < 1.4563731) {
                        if (inputs[1] < 36.326664) {
                            var246 = 0.055714257;
                        } else {
                            var246 = 0.0002118679;
                        }
                    } else {
                        var246 = -0.013285197;
                    }
                } else {
                    var246 = -0.027456976;
                }
            }
        } else {
            if (inputs[2] < 1.5721428) {
                var246 = -0.043963455;
            } else {
                if (inputs[2] < 2.0564287) {
                    var246 = 0.02388547;
                } else {
                    var246 = -0.019212354;
                }
            }
        }
    } else {
        var246 = 0.03189712;
    }
    double var247;
    if (inputs[14] < -0.742) {
        if (inputs[8] < 1730.13) {
            var247 = -0.016615845;
        } else {
            if (inputs[5] < 1849.6176) {
                var247 = 0.04084677;
            } else {
                var247 = 0.010534646;
            }
        }
    } else {
        if (inputs[15] < 0.54818183) {
            if (inputs[3] < 1895.925) {
                if (inputs[2] < 1.1178571) {
                    var247 = -0.041653074;
                } else {
                    if (inputs[19] < 1.4460549) {
                        var247 = 0.02164973;
                    } else {
                        var247 = -0.02073152;
                    }
                }
            } else {
                var247 = -0.0498937;
            }
        } else {
            var247 = 0.014396054;
        }
    }
    double var248;
    if (inputs[21] < 3.2096531) {
        if (inputs[23] < -3.9755354) {
            if (inputs[8] < 1726.94) {
                if (inputs[23] < -41.261032) {
                    var248 = 0.023330178;
                } else {
                    var248 = -0.014610112;
                }
            } else {
                if (inputs[17] < 1.4655046) {
                    var248 = -0.0158032;
                } else {
                    var248 = -0.061689407;
                }
            }
        } else {
            if (inputs[16] < -0.14654887) {
                var248 = 0.025699964;
            } else {
                if (inputs[19] < 1.8107111) {
                    var248 = -0.02445179;
                } else {
                    var248 = 0.017215405;
                }
            }
        }
    } else {
        var248 = 0.029028282;
    }
    double var249;
    if (inputs[5] < 1669.84) {
        var249 = -0.027653867;
    } else {
        if (inputs[5] < 1713.6725) {
            var249 = 0.03158192;
        } else {
            if (inputs[17] < 0.93402356) {
                var249 = 0.024126688;
            } else {
                if (inputs[18] < 1.1976143) {
                    var249 = -0.032374594;
                } else {
                    if (inputs[10] < 2.595) {
                        if (inputs[15] < 0.41327274) {
                            if (inputs[21] < -2.4886897) {
                                var249 = -0.023213679;
                            } else {
                                var249 = 0.018687407;
                            }
                        } else {
                            var249 = -0.03676782;
                        }
                    } else {
                        if (inputs[20] < 0.1593122) {
                            var249 = 0.03871376;
                        } else {
                            var249 = -0.0026743372;
                        }
                    }
                }
            }
        }
    }
    double var250;
    if (inputs[21] < -2.00622) {
        if (inputs[20] < -0.27667353) {
            var250 = 0.019326191;
        } else {
            if (inputs[24] < -18.783993) {
                var250 = -0.0011145025;
            } else {
                var250 = -0.04034839;
            }
        }
    } else {
        if (inputs[16] < -0.012135338) {
            var250 = 0.038765684;
        } else {
            if (inputs[21] < 2.9065473) {
                if (inputs[20] < -0.15729868) {
                    var250 = -0.031443767;
                } else {
                    var250 = 0.0129062;
                }
            } else {
                if (inputs[16] < 0.21756391) {
                    var250 = 0.036958106;
                } else {
                    var250 = 0.0077165226;
                }
            }
        }
    }
    double var251;
    if (inputs[25] < 3.964557) {
        if (inputs[25] < 3.3075356) {
            if (inputs[16] < 0.21254887) {
                if (inputs[16] < -0.077203006) {
                    if (inputs[15] < -0.44115153) {
                        var251 = 0.039233804;
                    } else {
                        var251 = 0.0018954894;
                    }
                } else {
                    if (inputs[24] < 11.083017) {
                        var251 = -0.03087264;
                    } else {
                        var251 = 0.0024332805;
                    }
                }
            } else {
                var251 = 0.03566865;
            }
        } else {
            var251 = -0.018309342;
        }
    } else {
        var251 = 0.03126267;
    }
    double var252;
    if (inputs[9] < 2.985) {
        if (inputs[11] < 0.38) {
            var252 = 0.0394092;
        } else {
            var252 = -0.009330227;
        }
    } else {
        if (inputs[1] < 35.50532) {
            if (inputs[21] < -3.0678701) {
                var252 = -0.00815652;
            } else {
                var252 = 0.023615362;
            }
        } else {
            if (inputs[15] < 0.20787878) {
                var252 = -0.056630448;
            } else {
                if (inputs[13] < 1816.88) {
                    var252 = -0.024930496;
                } else {
                    var252 = 0.010388635;
                }
            }
        }
    }
    double var253;
    if (inputs[4] < 1803.93) {
        if (inputs[4] < 1720.37) {
            if (inputs[18] < 1.3539162) {
                var253 = 0.028253809;
            } else {
                var253 = -0.014189095;
            }
        } else {
            if (inputs[2] < 1.4657143) {
                var253 = 0.011740081;
            } else {
                var253 = 0.05134885;
            }
        }
    } else {
        if (inputs[3] < 1840.35) {
            var253 = -0.048624493;
        } else {
            if (inputs[19] < 1.8850849) {
                if (inputs[10] < 1.355) {
                    var253 = 0.0014936697;
                } else {
                    var253 = 0.040719934;
                }
            } else {
                if (inputs[19] < 2.9961197) {
                    var253 = -0.032285344;
                } else {
                    var253 = 0.01150415;
                }
            }
        }
    }
    double var254;
    if (inputs[6] < 1724.65) {
        if (inputs[6] < 1661.535) {
            var254 = -0.0067967316;
        } else {
            var254 = 0.02309323;
        }
    } else {
        if (inputs[23] < -35.493023) {
            var254 = -0.03578888;
        } else {
            if (inputs[16] < -0.22264662) {
                var254 = -0.033291236;
            } else {
                if (inputs[16] < -0.12616542) {
                    var254 = 0.04004532;
                } else {
                    if (inputs[17] < 1.1178551) {
                        var254 = -0.025549376;
                    } else {
                        if (inputs[2] < 1.7892857) {
                            var254 = 0.026230335;
                        } else {
                            var254 = -0.01298724;
                        }
                    }
                }
            }
        }
    }
    double var255;
    if (inputs[3] < 1938.925) {
        if (inputs[2] < 1.6828572) {
            if (inputs[1] < 27.259417) {
                var255 = 0.030980833;
            } else {
                if (inputs[1] < 34.17677) {
                    var255 = -0.026953787;
                } else {
                    if (inputs[4] < 1812.825) {
                        var255 = -0.0021059343;
                    } else {
                        var255 = 0.031981565;
                    }
                }
            }
        } else {
            if (inputs[17] < 2.020202) {
                if (inputs[20] < 0.052936934) {
                    var255 = -0.010257772;
                } else {
                    var255 = -0.046903815;
                }
            } else {
                var255 = 0.01883081;
            }
        }
    } else {
        var255 = 0.035844535;
    }
    double var256;
    if (inputs[21] < -3.2986603) {
        var256 = -0.03303468;
    } else {
        if (inputs[19] < 2.1180258) {
            if (inputs[19] < 1.65015) {
                if (inputs[2] < 1.6328571) {
                    if (inputs[10] < 1.9) {
                        if (inputs[2] < 1.2635714) {
                            var256 = -0.022302993;
                        } else {
                            var256 = 0.019340308;
                        }
                    } else {
                        var256 = 0.042630974;
                    }
                } else {
                    var256 = -0.017382193;
                }
            } else {
                var256 = 0.03638447;
            }
        } else {
            if (inputs[18] < 2.766253) {
                var256 = -0.033734657;
            } else {
                var256 = 0.007245159;
            }
        }
    }
    double var257;
    if (inputs[20] < 0.38807276) {
        if (inputs[10] < 2.455) {
            if (inputs[18] < 1.1484094) {
                var257 = 0.005708504;
            } else {
                if (inputs[25] < 2.3903956) {
                    var257 = -0.052582134;
                } else {
                    if (inputs[23] < 0.0) {
                        var257 = 0.0008568144;
                    } else {
                        var257 = -0.040270608;
                    }
                }
            }
        } else {
            var257 = 0.013210713;
        }
    } else {
        if (inputs[15] < 0.32115152) {
            if (inputs[13] < 1847.01) {
                if (inputs[23] < -32.103245) {
                    var257 = 0.029277846;
                } else {
                    var257 = -0.0038367843;
                }
            } else {
                var257 = -0.025449937;
            }
        } else {
            var257 = 0.04948398;
        }
    }
    double var258;
    if (inputs[13] < 1924.9) {
        if (inputs[23] < -35.40706) {
            if (inputs[18] < 1.3219777) {
                var258 = 0.017476574;
            } else {
                var258 = -0.028088368;
            }
        } else {
            if (inputs[20] < 1.0302223) {
                if (inputs[23] < -20.507849) {
                    var258 = 0.04785264;
                } else {
                    if (inputs[1] < 33.900406) {
                        var258 = -0.007427008;
                    } else {
                        if (inputs[14] < 0.651) {
                            var258 = 0.052001882;
                        } else {
                            var258 = 0.0046675773;
                        }
                    }
                }
            } else {
                var258 = -0.019651279;
            }
        }
    } else {
        var258 = -0.019016933;
    }
    double var259;
    if (inputs[25] < 3.680317) {
        if (inputs[14] < 1.193) {
            if (inputs[1] < 68.7146) {
                if (inputs[14] < -0.816) {
                    if (inputs[11] < 0.33) {
                        var259 = 0.012439389;
                    } else {
                        var259 = -0.046213247;
                    }
                } else {
                    if (inputs[2] < 2.2585714) {
                        if (inputs[19] < 1.3897288) {
                            var259 = 0.0054113124;
                        } else {
                            var259 = 0.042283706;
                        }
                    } else {
                        var259 = -0.012765221;
                    }
                }
            } else {
                var259 = -0.034786575;
            }
        } else {
            var259 = 0.035281982;
        }
    } else {
        var259 = -0.02303186;
    }
    double var260;
    if (inputs[10] < 0.3275) {
        var260 = -0.025569886;
    } else {
        if (inputs[11] < 0.29) {
            if (inputs[6] < 1827.255) {
                var260 = 0.008512884;
            } else {
                var260 = -0.031034686;
            }
        } else {
            if (inputs[25] < 3.181065) {
                if (inputs[2] < 1.5028571) {
                    var260 = 0.036012553;
                } else {
                    if (inputs[19] < 1.7180334) {
                        var260 = -0.020102333;
                    } else {
                        var260 = 0.029012956;
                    }
                }
            } else {
                var260 = -0.0075562787;
            }
        }
    }
    double var261;
    if (inputs[4] < 1906.7) {
        if (inputs[17] < 1.9682418) {
            if (inputs[17] < 1.4736539) {
                if (inputs[20] < 0.1593122) {
                    if (inputs[20] < -0.5083069) {
                        if (inputs[10] < 1.695) {
                            var261 = 0.0028812024;
                        } else {
                            var261 = -0.030505955;
                        }
                    } else {
                        var261 = 0.032609336;
                    }
                } else {
                    var261 = -0.03125291;
                }
            } else {
                var261 = 0.020129297;
            }
        } else {
            var261 = -0.044324875;
        }
    } else {
        if (inputs[13] < 1963.6) {
            var261 = 0.039555084;
        } else {
            var261 = -0.0061388775;
        }
    }
    double var262;
    if (inputs[25] < 3.555118) {
        if (inputs[1] < 30.82347) {
            var262 = -0.030785765;
        } else {
            if (inputs[1] < 64.21748) {
                if (inputs[23] < -12.139437) {
                    var262 = 0.035323955;
                } else {
                    if (inputs[15] < -0.14654545) {
                        var262 = -0.023698585;
                    } else {
                        var262 = 0.028486678;
                    }
                }
            } else {
                if (inputs[16] < 0.16592482) {
                    var262 = -0.035362296;
                } else {
                    var262 = 0.004289687;
                }
            }
        }
    } else {
        if (inputs[9] < 5.95) {
            var262 = 0.009055053;
        } else {
            var262 = 0.031464964;
        }
    }
    double var263;
    if (inputs[10] < 2.1375) {
        if (inputs[1] < 70.92806) {
            if (inputs[20] < 0.7422704) {
                if (inputs[10] < 0.85) {
                    if (inputs[16] < -0.11335339) {
                        var263 = -0.0063967034;
                    } else {
                        var263 = -0.044929516;
                    }
                } else {
                    var263 = 0.002383101;
                }
            } else {
                var263 = 0.018419297;
            }
        } else {
            var263 = 0.029804448;
        }
    } else {
        if (inputs[23] < -6.3145747) {
            if (inputs[21] < -1.6925602) {
                var263 = 0.02031428;
            } else {
                var263 = -0.025908073;
            }
        } else {
            var263 = -0.041958835;
        }
    }
    double var264;
    if (inputs[20] < 0.84939736) {
        if (inputs[25] < 3.680317) {
            if (inputs[18] < 1.1484094) {
                var264 = 0.026452687;
            } else {
                if (inputs[24] < -15.776913) {
                    var264 = -0.025790757;
                } else {
                    if (inputs[18] < 1.568082) {
                        var264 = -0.012818451;
                    } else {
                        if (inputs[24] < 7.3783484) {
                            var264 = 0.04728905;
                        } else {
                            var264 = -0.006516955;
                        }
                    }
                }
            }
        } else {
            var264 = -0.027752042;
        }
    } else {
        if (inputs[16] < -0.019330828) {
            var264 = 0.03640129;
        } else {
            var264 = -0.009374843;
        }
    }
    double var265;
    if (inputs[23] < 10.910757) {
        if (inputs[3] < 1930.325) {
            if (inputs[16] < 0.2694436) {
                if (inputs[21] < -1.8869901) {
                    if (inputs[14] < -0.869) {
                        var265 = -0.01644411;
                    } else {
                        if (inputs[10] < 1.1225) {
                            var265 = 0.031371955;
                        } else {
                            var265 = -0.012125997;
                        }
                    }
                } else {
                    if (inputs[14] < 0.952) {
                        if (inputs[17] < 1.174911) {
                            var265 = -0.015054447;
                        } else {
                            var265 = -0.060863074;
                        }
                    } else {
                        var265 = 0.0053099915;
                    }
                }
            } else {
                var265 = 0.019554518;
            }
        } else {
            var265 = 0.032133702;
        }
    } else {
        var265 = -0.04012222;
    }
    double var266;
    if (inputs[16] < 0.2694436) {
        if (inputs[14] < 0.993) {
            if (inputs[15] < 0.40327272) {
                if (inputs[8] < 1860.04) {
                    if (inputs[2] < 1.9985714) {
                        if (inputs[24] < -16.555937) {
                            var266 = 0.01906919;
                        } else {
                            if (inputs[23] < -31.660065) {
                                var266 = -0.0266697;
                            } else {
                                var266 = -0.0017313919;
                            }
                        }
                    } else {
                        var266 = 0.031441893;
                    }
                } else {
                    if (inputs[15] < -0.41248485) {
                        var266 = 0.0039870725;
                    } else {
                        var266 = -0.046529453;
                    }
                }
            } else {
                var266 = 0.041580383;
            }
        } else {
            var266 = -0.032590874;
        }
    } else {
        var266 = 0.028892737;
    }
    double var267;
    if (inputs[23] < -2.358174) {
        if (inputs[20] < -0.034633074) {
            if (inputs[14] < 0.589) {
                var267 = -0.021454118;
            } else {
                var267 = 0.02398639;
            }
        } else {
            if (inputs[11] < 0.37) {
                var267 = -0.04597116;
            } else {
                var267 = -0.007986895;
            }
        }
    } else {
        if (inputs[15] < 0.43066666) {
            if (inputs[12] < 1942.07) {
                if (inputs[16] < 0.03968421) {
                    var267 = -0.00088218355;
                } else {
                    var267 = 0.043232355;
                }
            } else {
                var267 = 0.059061274;
            }
        } else {
            var267 = -0.016312072;
        }
    }
    double var268;
    if (inputs[19] < 2.144363) {
        if (inputs[19] < 1.3578346) {
            if (inputs[15] < -0.18448485) {
                var268 = -0.04128114;
            } else {
                var268 = 0.00296408;
            }
        } else {
            if (inputs[9] < 4.2575) {
                if (inputs[3] < 1812.825) {
                    var268 = -0.0033573203;
                } else {
                    var268 = 0.008656298;
                }
            } else {
                if (inputs[14] < -0.536) {
                    var268 = 0.057715267;
                } else {
                    var268 = 0.013884344;
                }
            }
        }
    } else {
        if (inputs[9] < 7.365) {
            var268 = 0.0072712046;
        } else {
            var268 = -0.04077163;
        }
    }
    double var269;
    if (inputs[20] < -1.6100832) {
        var269 = -0.027842823;
    } else {
        if (inputs[16] < 0.19874436) {
            if (inputs[10] < 3.0775) {
                if (inputs[24] < -14.232029) {
                    if (inputs[24] < -21.323767) {
                        var269 = 0.025800787;
                    } else {
                        var269 = -0.015929734;
                    }
                } else {
                    if (inputs[6] < 1745.985) {
                        var269 = 0.0075496947;
                    } else {
                        if (inputs[25] < 2.688802) {
                            var269 = 0.02443222;
                        } else {
                            var269 = 0.068608314;
                        }
                    }
                }
            } else {
                var269 = -0.012658828;
            }
        } else {
            if (inputs[6] < 1832.94) {
                var269 = 0.007229722;
            } else {
                var269 = -0.032732535;
            }
        }
    }
    double var270;
    if (inputs[10] < 2.1375) {
        if (inputs[3] < 1930.325) {
            if (inputs[10] < 0.1975) {
                var270 = -0.033265382;
            } else {
                if (inputs[2] < 1.2021428) {
                    var270 = 0.039401356;
                } else {
                    if (inputs[18] < 1.3921552) {
                        var270 = -0.026028264;
                    } else {
                        if (inputs[23] < -20.966377) {
                            var270 = 0.032160368;
                        } else {
                            var270 = -0.004916043;
                        }
                    }
                }
            }
        } else {
            var270 = 0.044543345;
        }
    } else {
        if (inputs[1] < 32.795147) {
            var270 = -0.049384866;
        } else {
            if (inputs[21] < 2.688201) {
                var270 = 0.016134832;
            } else {
                var270 = -0.020497197;
            }
        }
    }
    double var271;
    if (inputs[25] < 1.8835075) {
        var271 = -0.03466674;
    } else {
        if (inputs[10] < 0.55) {
            if (inputs[18] < 1.4889866) {
                var271 = 0.0010693864;
            } else {
                var271 = 0.041281223;
            }
        } else {
            if (inputs[19] < 2.2633247) {
                if (inputs[19] < 1.7180334) {
                    if (inputs[15] < -0.18448485) {
                        var271 = -0.02590793;
                    } else {
                        if (inputs[16] < 0.11279699) {
                            var271 = 0.030802943;
                        } else {
                            var271 = -0.012565856;
                        }
                    }
                } else {
                    var271 = 0.028580248;
                }
            } else {
                var271 = -0.023235736;
            }
        }
    }
    double var272;
    if (inputs[23] < -54.69902) {
        var272 = -0.021336706;
    } else {
        if (inputs[14] < 0.696) {
            if (inputs[9] < 3.455) {
                if (inputs[9] < 2.2225) {
                    var272 = 0.018750679;
                } else {
                    var272 = 0.059675816;
                }
            } else {
                if (inputs[25] < 2.2964427) {
                    var272 = -0.015905993;
                } else {
                    if (inputs[13] < 1818.98) {
                        var272 = 0.032254305;
                    } else {
                        var272 = 0.000005833817;
                    }
                }
            }
        } else {
            if (inputs[15] < 0.50357574) {
                var272 = -0.023624064;
            } else {
                var272 = 0.017834663;
            }
        }
    }
    double var273;
    if (inputs[16] < 0.2694436) {
        if (inputs[17] < 1.0672319) {
            var273 = -0.027722511;
        } else {
            if (inputs[17] < 1.5079443) {
                if (inputs[13] < 1896.84) {
                    if (inputs[8] < 1775.68) {
                        var273 = 0.03356025;
                    } else {
                        var273 = -0.03753647;
                    }
                } else {
                    var273 = 0.0474461;
                }
            } else {
                if (inputs[14] < -1.185) {
                    var273 = 0.011018764;
                } else {
                    if (inputs[1] < 62.66076) {
                        var273 = -0.032676734;
                    } else {
                        var273 = -0.014041709;
                    }
                }
            }
        }
    } else {
        var273 = 0.034395937;
    }
    double var274;
    if (inputs[23] < -6.3145747) {
        if (inputs[3] < 1752.67) {
            if (inputs[18] < 1.3539162) {
                var274 = 0.024068983;
            } else {
                var274 = -0.025593385;
            }
        } else {
            if (inputs[12] < 1850.29) {
                var274 = 0.049723722;
            } else {
                var274 = -0.0027506847;
            }
        }
    } else {
        if (inputs[5] < 1854.855) {
            var274 = -0.032559782;
        } else {
            if (inputs[11] < 0.29) {
                var274 = -0.013125461;
            } else {
                var274 = 0.01679439;
            }
        }
    }
    double var275;
    if (inputs[2] < 1.53) {
        if (inputs[9] < 3.155) {
            var275 = -0.04703702;
        } else {
            if (inputs[9] < 5.75) {
                if (inputs[19] < 1.2943488) {
                    var275 = 0.032160953;
                } else {
                    var275 = -0.0022123524;
                }
            } else {
                var275 = -0.021672394;
            }
        }
    } else {
        if (inputs[20] < 0.00019193416) {
            if (inputs[11] < 0.29) {
                var275 = -0.016323064;
            } else {
                var275 = 0.026469076;
            }
        } else {
            if (inputs[25] < 2.199282) {
                var275 = -0.0034279278;
            } else {
                var275 = 0.04738326;
            }
        }
    }
    double var276;
    if (inputs[15] < 0.41733333) {
        if (inputs[9] < 2.04) {
            var276 = 0.035877004;
        } else {
            if (inputs[5] < 1910.0225) {
                if (inputs[2] < 1.0985714) {
                    var276 = -0.020892845;
                } else {
                    if (inputs[16] < 0.06660151) {
                        if (inputs[16] < -0.11742105) {
                            if (inputs[1] < 28.797646) {
                                var276 = 0.0396652;
                            } else {
                                var276 = -0.00031572915;
                            }
                        } else {
                            var276 = 0.06367559;
                        }
                    } else {
                        var276 = -0.018533919;
                    }
                }
            } else {
                var276 = -0.022452002;
            }
        }
    } else {
        if (inputs[23] < -1.9876205) {
            var276 = -0.00006378214;
        } else {
            var276 = -0.05389884;
        }
    }
    double var277;
    if (inputs[24] < 25.151962) {
        if (inputs[19] < 1.8369683) {
            if (inputs[18] < 1.6841321) {
                if (inputs[9] < 3.535) {
                    if (inputs[9] < 2.325) {
                        var277 = 0.004648751;
                    } else {
                        var277 = 0.03525186;
                    }
                } else {
                    if (inputs[10] < 1.625) {
                        var277 = -0.038387965;
                    } else {
                        var277 = -0.00009220885;
                    }
                }
            } else {
                var277 = -0.041778978;
            }
        } else {
            if (inputs[6] < 1839.16) {
                var277 = 0.03481652;
            } else {
                var277 = -0.0056138556;
            }
        }
    } else {
        var277 = -0.03540528;
    }
    double var278;
    if (inputs[15] < -0.55) {
        var278 = -0.028140403;
    } else {
        if (inputs[10] < 5.0575) {
            if (inputs[10] < 2.925) {
                if (inputs[16] < -0.19931579) {
                    var278 = 0.031524394;
                } else {
                    if (inputs[23] < -46.023937) {
                        var278 = -0.0233673;
                    } else {
                        if (inputs[23] < -19.270708) {
                            var278 = 0.026027275;
                        } else {
                            if (inputs[20] < 0.41807792) {
                                var278 = -0.018576553;
                            } else {
                                var278 = 0.019568099;
                            }
                        }
                    }
                }
            } else {
                var278 = -0.028469298;
            }
        } else {
            var278 = 0.046158105;
        }
    }
    double var279;
    if (inputs[24] < 24.900513) {
        if (inputs[24] < -24.57918) {
            var279 = -0.029916262;
        } else {
            if (inputs[2] < 1.1664286) {
                var279 = 0.02638471;
            } else {
                if (inputs[20] < -1.2484047) {
                    var279 = -0.035388384;
                } else {
                    if (inputs[14] < 0.641) {
                        if (inputs[25] < 2.7149408) {
                            if (inputs[9] < 3.535) {
                                var279 = 0.005687832;
                            } else {
                                var279 = -0.03888256;
                            }
                        } else {
                            var279 = 0.010104665;
                        }
                    } else {
                        if (inputs[16] < 0.14719549) {
                            var279 = 0.043382857;
                        } else {
                            var279 = 0.0021810492;
                        }
                    }
                }
            }
        }
    } else {
        var279 = -0.041719284;
    }
    double var280;
    if (inputs[20] < 0.1593122) {
        if (inputs[16] < 0.16592482) {
            if (inputs[11] < 0.31) {
                var280 = 0.028237626;
            } else {
                if (inputs[11] < 0.41) {
                    var280 = -0.019869965;
                } else {
                    var280 = 0.012933621;
                }
            }
        } else {
            if (inputs[23] < -5.9325104) {
                var280 = 0.004949899;
            } else {
                var280 = 0.045365263;
            }
        }
    } else {
        if (inputs[1] < 37.99112) {
            if (inputs[16] < -0.18129323) {
                var280 = -0.019341918;
            } else {
                var280 = 0.029182807;
            }
        } else {
            var280 = -0.033467807;
        }
    }
    double var281;
    if (inputs[17] < 1.1178551) {
        if (inputs[4] < 1795.37) {
            var281 = -0.03781835;
        } else {
            var281 = -0.004723809;
        }
    } else {
        if (inputs[20] < 1.1827226) {
            if (inputs[21] < 3.0130277) {
                if (inputs[13] < 1722.73) {
                    var281 = 0.02987372;
                } else {
                    if (inputs[5] < 1927.6525) {
                        if (inputs[10] < 1.17) {
                            var281 = -0.036874644;
                        } else {
                            var281 = 0.0017745703;
                        }
                    } else {
                        var281 = 0.023094276;
                    }
                }
            } else {
                var281 = 0.036709484;
            }
        } else {
            var281 = -0.024742909;
        }
    }
    double var282;
    if (inputs[23] < 0.3177864) {
        if (inputs[11] < 0.41) {
            if (inputs[2] < 1.3114285) {
                var282 = -0.034415327;
            } else {
                if (inputs[16] < 0.030804511) {
                    if (inputs[13] < 1796.8) {
                        var282 = -0.036074024;
                    } else {
                        var282 = 0.007569092;
                    }
                } else {
                    if (inputs[11] < 0.29) {
                        var282 = -0.0037269187;
                    } else {
                        var282 = 0.036984537;
                    }
                }
            }
        } else {
            if (inputs[2] < 1.215) {
                var282 = 0.033624507;
            } else {
                var282 = 0.0032179265;
            }
        }
    } else {
        var282 = -0.036554016;
    }
    double var283;
    var283 = sigmoid(var0 + var1 + var2 + var3 + var4 + var5 + var6 + var7 + var8 + var9 + var10 + var11 + var12 + var13 + var14 + var15 + var16 + var17 + var18 + var19 + var20 + var21 + var22 + var23 + var24 + var25 + var26 + var27 + var28 + var29 + var30 + var31 + var32 + var33 + var34 + var35 + var36 + var37 + var38 + var39 + var40 + var41 + var42 + var43 + var44 + var45 + var46 + var47 + var48 + var49 + var50 + var51 + var52 + var53 + var54 + var55 + var56 + var57 + var58 + var59 + var60 + var61 + var62 + var63 + var64 + var65 + var66 + var67 + var68 + var69 + var70 + var71 + var72 + var73 + var74 + var75 + var76 + var77 + var78 + var79 + var80 + var81 + var82 + var83 + var84 + var85 + var86 + var87 + var88 + var89 + var90 + var91 + var92 + var93 + var94 + var95 + var96 + var97 + var98 + var99 + var100 + var101 + var102 + var103 + var104 + var105 + var106 + var107 + var108 + var109 + var110 + var111 + var112 + var113 + var114 + var115 + var116 + var117 + var118 + var119 + var120 + var121 + var122 + var123 + var124 + var125 + var126 + var127 + var128 + var129 + var130 + var131 + var132 + var133 + var134 + var135 + var136 + var137 + var138 + var139 + var140 + var141 + var142 + var143 + var144 + var145 + var146 + var147 + var148 + var149 + var150 + var151 + var152 + var153 + var154 + var155 + var156 + var157 + var158 + var159 + var160 + var161 + var162 + var163 + var164 + var165 + var166 + var167 + var168 + var169 + var170 + var171 + var172 + var173 + var174 + var175 + var176 + var177 + var178 + var179 + var180 + var181 + var182 + var183 + var184 + var185 + var186 + var187 + var188 + var189 + var190 + var191 + var192 + var193 + var194 + var195 + var196 + var197 + var198 + var199 + var200 + var201 + var202 + var203 + var204 + var205 + var206 + var207 + var208 + var209 + var210 + var211 + var212 + var213 + var214 + var215 + var216 + var217 + var218 + var219 + var220 + var221 + var222 + var223 + var224 + var225 + var226 + var227 + var228 + var229 + var230 + var231 + var232 + var233 + var234 + var235 + var236 + var237 + var238 + var239 + var240 + var241 + var242 + var243 + var244 + var245 + var246 + var247 + var248 + var249 + var250 + var251 + var252 + var253 + var254 + var255 + var256 + var257 + var258 + var259 + var260 + var261 + var262 + var263 + var264 + var265 + var266 + var267 + var268 + var269 + var270 + var271 + var272 + var273 + var274 + var275 + var276 + var277 + var278 + var279 + var280 + var281 + var282);
    memcpy(output, (double[]){1.0 - var283, var283}, 2 * sizeof(double));
}


// --- Fonction Wrapper pour une utilisation simple ---
// Retourne la probabilité de la classe 'Gagnant' (classe 1) pour XGBoost
double XGBoost_Predict(const double &inputs[])
{
   double prediction[2];
   xgboost_score(inputs, prediction);
   return prediction[1];
}