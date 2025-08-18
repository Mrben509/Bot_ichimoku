import backtrader as bt
import pandas as pd
from datetime import datetime
import numpy as np
import matplotlib.pyplot as plt

class IchimokuStrategy(bt.Strategy):
    def __init__(self):
        self.ichimoku = bt.ind.Ichimoku()

    def next(self):
        pass  # pas de logique de trading ici, juste l'affichage

# === Charger les données CSV ===
class MyCSV(bt.feeds.GenericCSVData):
    params = (
        ('dtformat', '%Y-%m-%d %H:%M:%S'),  # à adapter selon ton CSV
        ('datetime', 0),
        ('open', 1),
        ('high', 2),
        ('low', 3),
        ('close', 4),
        ('volume', 5),
        ('openinterest', -1),
    )

# === Créer le moteur ===
cerebro = bt.Cerebro()
cerebro.addstrategy(IchimokuStrategy)

# === Ajouter les données ===
data = MyCSV(dataname='/home/emmanuel-raoul/newòn py/fusion_empilement_clean.csv')  # <== mets ici le nom de ton fichier CSV
cerebro.adddata(data)

# === Démarrer ===
cerebro.run()
cerebro.plot(style='candlestick')
plt.show()