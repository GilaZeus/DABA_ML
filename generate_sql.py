import json
import csv
import sys

"""Diesen Skript haben wir benutzt, um die SQL-INSERT-Kommanden
für Stammdaten zu generieren."""

def create_sql_string(column):
    return "\'" + column + "\'"


def generate_kinos(data):
    with open(data, "r") as json_file:
        voorhees = json.load(json_file)
        kino_i = 1
        saal_i = 1
        for kino in voorhees["Kino"]:
            print("INSERT INTO Kino",
                  "    (Hausnr, Straße, PLZ, ORT, Name)",
                  "VALUES", sep="\n", end ="\n(\n    ")
            print(create_sql_string(kino["Hausnr"]),
                  create_sql_string(kino["Straße"]),
                  kino["PLZ"],
                  create_sql_string(kino["Ort"]),
                  create_sql_string(kino["Name"]),
                  sep=",\n    ", end="\n);\n\n")

            for saal in kino["Vorführsaal"]:
                print("INSERT INTO Vorführsaal",
                      "    (Kino_ID, Bezeichnung)",
                      "VALUES", sep="\n", end ="\n")
                if saal["Bezeichnung"] != None:
                    print("    (" + str(kino_i) + ", \'" + saal["Bezeichnung"] + "\');\n")
                else:
                    print("    (" + str(kino_i) + ", NULL);")
                
                for reihe in saal["Reihe"]:
                    print("INSERT INTO Reihe",
                          "    (Reihennummer, Saal_ID, Kino_ID, Rangnummer)",
                          "VALUES", sep="\n", end ="\n(\n    ")
                    print(reihe["Reihennummer"],
                          saal_i,
                          kino_i,
                          reihe["Rang"],
                          sep=",\n    ", end="\n);\n\n")
                    
                    for platz in range(1, reihe["Plätze"] + 1):
                        print("INSERT INTO Sitzplatz",
                              "    (Sitznummer, Reihennummer, Saal_ID, Kino_ID)",
                              "VALUES", sep="\n", end ="\n(\n    ")
                        print(platz,
                              reihe["Reihennummer"],
                              saal_i,
                              kino_i,
                              sep=",\n    ", end="\n);\n\n")

                saal_i += 1
            kino_i += 1


def generate_filme(data):
    with open(data) as csv_file:
        for row in csv.DictReader(csv_file):
            print("INSERT INTO Film",
                  "    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)"
                  "VALUES", sep="\n", end="\n(\n    ")
            
            print(create_sql_string(row["Titel"]),
                  create_sql_string(row["Produktionsfirma"]),
                  row["Produktionsjahr"],
                  create_sql_string(row["Altersfreigabe"]), 
                  create_sql_string(row["Genre"]),
                  create_sql_string(row["Beschreibung"]),
                  row["Spieldauer"],
                  create_sql_string(row["ist_3D"]),
                  sep=",\n    ", end="\n);\n\n")


def generate_preis(data):
    with open(data, "r") as json_file:
        voorhees = json.load(json_file)

        liste_i = 1
        preis_i = 1
        mod_i = 1
        for liste in voorhees["Preisliste"]:
            print("INSERT INTO Preisliste (Preisliste_ID) VALUES (DEFAULT);\n")

            for basispreis in liste["Basispreis"]:
                print("INSERT INTO Basispreis (Wert) VALUES (" + str(basispreis["Wert"]) + ");\n")
                print("INSERT INTO Preis_Anwendung",
                      "    (Basispreis_ID, Preisliste_ID)",
                      "VALUES",
                      "    (" + str(preis_i) + ", " + str(liste_i),
                      sep="\n", end=");\n\n")
                print("INSERT INTO Rang_Preis",
                      "    (Rangnummer, Basispreis_ID)",
                      "VALUES",
                      "    (" + str(basispreis["Rang"]) + ", " + str(preis_i),
                      sep="\n", end=");\n\n")
                preis_i += 1
            
            for modif in liste["Preismodifikation"]:
                print("INSERT INTO Preismodifikation",
                      "    (Art, Höhe)\nVALUES\n(",
                      "    " + create_sql_string(modif["Art"]) + ",",
                      "    " + str(modif["Höhe"]),
                      ");", sep="\n")
                print("INSERT INTO Modifikation_Benutzung",
                      "    (Preismodifikation_ID, Preisliste_ID)",
                      "VALUES",
                      "    (" + str(mod_i) + ", " + str(liste_i),
                      sep="\n", end=");\n\n")
                mod_i += 1
            liste_i += 1



if __name__ == "__main__":
    if sys.argv[1] == "-kino":
        generate_kinos(sys.argv[2])
    elif sys.argv[1] == "-film":
        generate_filme(sys.argv[2])
    elif sys.argv[1] == "-preis":
        generate_preis(sys.argv[2])