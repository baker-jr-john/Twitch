import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns


# Bar Graph: Featured Games
games = [
    "LoL",
    "Dota 2",
    "CS:GO",
    "DayZ",
    "HOS",
    "Isaac",
    "Shows",
    "WoT",
    "Hearth",
    "Agar.io",
]

viewers = [193533, 85608, 54438, 38004, 35310, 29467, 28115, 15932, 14399, 11480]

plt.bar(range(len(games)), viewers, color="slateblue")
plt.title("Featured Game Viewers")
plt.legend(["Twitch"])
plt.xlabel("Games")
plt.ylabel("Viewers")
plt.subplot().set_xticks(range(len(games)))
plt.subplot().set_xticklabels(games, rotation=30)
plt.show()
plt.clf()


# Pie Chart: League of Legends Viewers' Whereabouts

labels = ["US", "CA", "DE", "GB", "TR", "AU", "SE", "NL", "DK", "GR", "PL", "Others"]

countries = [85606, 13034, 10835, 6964, 4412, 3911, 3533, 3213, 2909, 2885, 2776, 45814]

colors = [
    "lightskyblue",
    "gold",
    "lightcoral",
    "gainsboro",
    "royalblue",
    "lightpink",
    "darkseagreen",
    "sienna",
    "khaki",
    "gold",
    "violet",
    "yellowgreen",
]

explode = (0.1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)

plt.pie(
    countries,
    explode=explode,
    colors=colors,
    shadow=True,
    startangle=345,
    autopct="%1.0f%%",
    pctdistance=1.15,
)
plt.title("League of Legends Viewers' Whereabouts")
plt.legend(labels, loc="right")
plt.show()
plt.clf()


# Line Graph: Time Series Analysis

hour = range(24)

viewers_hour = [
    7025,
    4693,
    5954,
    4215,
    3553,
    1577,
    225,
    326,
    925,
    1202,
    1928,
    7327,
    11766,
    9706,
    7515,
    9044,
    10098,
    11899,
    12173,
    15166,
    19606,
    18425,
    13944,
    11646,
]

y_upper = [i + (i * 0.15) for i in viewers_hour]
y_lower = [i - (i * 0.15) for i in viewers_hour]
plt.plot(hour, viewers_hour)
plt.fill_between(hour, y_lower, y_upper, alpha=0.2)
plt.title("Time Series")
plt.legend(["2015-01-01"])
plt.xlabel("Hour")
plt.ylabel("Viewers")
plt.subplot().set_xticks(hour)
plt.show()
plt.clf()
