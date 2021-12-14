import json
import csv
import sys

"""Diesen Skript haben wir benutzt, um die SQL-INSERT-Kommanden
für Stammdaten zu generieren."""

def create_sql_string(column):
    return "\'" + column + "\'"


def generate_kinos(data):
    pass


def generate_filme(data):
    with open(data) as csv_file:
        for row in csv.DictReader(csv_file):
            print("INSERT INTO Film",
                  "    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)"
                  "VALUES", sep="\n", end="\n(")
            print(create_sql_string(row["Titel"]),
                  create_sql_string(row["Produktionsfirma"]),
                  row["Produktionsjahr"],
                  create_sql_string(row["Altersfreigabe"]), 
                  create_sql_string(row["Genre"]),
                  create_sql_string(row["Beschreibung"]),
                  row["Spieldauer"],
                  create_sql_string(row["ist_3D"]),
                  sep=", ", end=");\n\n")



def generate_preis(data):
    pass

if __name__ == "__main__":
    if sys.argv[1] == "-kino":
        generate_kinos(sys.argv[2])
    elif sys.argv[1] == "-film":
        generate_filme(sys.argv[2])
    elif sys.argv[1] == "-preis":
        generate_preis(syd.argv[2])