CREATE TABLE Kino
(
    Kino_ID             INT             PRIMARY KEY,
    Hausnr              VARCHAR(7)      NOT NULL,
    Straße              VARCHAR(50)     NOT NULL,
    PLZ                 INT             NOT NULL,
    ORT                 VARCHAR(50)     NOT NULL,
    Name                VARCHAR(50)     NOT NULL,
    UNIQUE
          (Hausnr, Straße, PLZ),
    CHECK
          (PLZ >= 0 AND PLZ < 100000)
);

CREATE TABLE Film
(
    Film_ID             INT             PRIMARY KEY,
    Titel               VARCHAR(50)     NOT NULL,
    Produktionsfirma    VARCHAR(50)     NOT NULL,
    Produktionsjahr     INT             NOT NULL,
    Altersfreigabe      VARCHAR(5)      NOT NULL,
    Genre               VARCHAR(9)      NOT NULL,
    Beschreibung        VARCHAR(255),
    Spieldauer          INT             NOT NULL,
    ist_3D              VARCHAR(1)      DEFAULT 'N',
    ist_Überlänge       VARCHAR(1)      GENERATED ALWAYS AS
            (CASE
                WHEN    Spieldauer > 120
                THEN    'Y'
                ELSE    'N'
             END),
    UNIQUE
            (Titel, Produktionsfirma, Produktionsjahr),
    CHECK
            (Produktionsjahr >= 1888),
    CHECK
            (Altersfreigabe IN (
                'FSK_0',
                'FSK_6',
                'FSK_12',
                'FSK_16',
                'FSK_18',
                'Lehr')),
    CHECK
            (Genre IN (
                'Komödie',
                'Action',
                'Thriller',
                'Drama',
                'Romance',
                'Horror',
                'Animation')),
    CHECK
            (Spieldauer >= 20),
    CHECK
            (ist_3D IN ('Y', 'N'))
);

CREATE TRIGGER check_überlänge
    BEFORE INSERT ON Film


CREATE TABLE Spielplan
(
  Von_Spielplan INT NOT NULL,
  Bis_Spielplan INT NOT NULL,
  Spielplan_ID INT NOT NULL,
  Jahr_Spielplan INT NOT NULL,
  Kino_ID INT NOT NULL,
  Film_ID INT NOT NULL,
  PRIMARY KEY (Spielplan_ID),
  FOREIGN KEY (Kino_ID) REFERENCES Kino(Kino_ID),
  FOREIGN KEY (Film_ID) REFERENCES Film(Film_ID)
);

CREATE TABLE Preisliste
(
  Preisliste_ID INT NOT NULL,
  PRIMARY KEY (Preisliste_ID)
);

CREATE TABLE Preismodifikation
(
  Preismodifikation_ID INT NOT NULL,
  Art INT NOT NULL,
  Höhe INT NOT NULL,
  PRIMARY KEY (Preismodifikation_ID)
);

CREATE TABLE Basispreis
(
  Wert INT NOT NULL,
  Basispreis_ID INT NOT NULL,
  PRIMARY KEY (Basispreis_ID)
);

CREATE TABLE Zeitslot
(
  Bezeichnug INT NOT NULL,
  Uhrzeit INT NOT NULL,
  Zeitslot_ID INT NOT NULL,
  PRIMARY KEY (Zeitslot_ID)
);

CREATE TABLE Rangsystem
(
  Rangsystem_ID INT NOT NULL,
  PRIMARY KEY (Rangsystem_ID)
);

CREATE TABLE Gültigkeitsbereich
(
  Von_Preisliste INT NOT NULL,
  Bis_Preisliste INT NOT NULL,
  Kino_ID INT NOT NULL,
  Preisliste_ID INT NOT NULL,
  PRIMARY KEY (Kino_ID, Preisliste_ID),
  FOREIGN KEY (Kino_ID) REFERENCES Kino(Kino_ID),
  FOREIGN KEY (Preisliste_ID) REFERENCES Preisliste(Preisliste_ID)
);

CREATE TABLE Preis_Anwendung
(
  Basispreis_ID INT NOT NULL,
  Preisliste_ID INT NOT NULL,
  PRIMARY KEY (Basispreis_ID, Preisliste_ID),
  FOREIGN KEY (Basispreis_ID) REFERENCES Basispreis(Basispreis_ID),
  FOREIGN KEY (Preisliste_ID) REFERENCES Preisliste(Preisliste_ID)
);

CREATE TABLE Modifikation_Benutzung
(
  Preismodifikation_ID INT NOT NULL,
  Preisliste_ID INT NOT NULL,
  PRIMARY KEY (Preismodifikation_ID, Preisliste_ID),
  FOREIGN KEY (Preismodifikation_ID) REFERENCES Preismodifikation(Preismodifikation_ID),
  FOREIGN KEY (Preisliste_ID) REFERENCES Preisliste(Preisliste_ID)
);

CREATE TABLE Zeitplan
(
  Wochentag INT NOT NULL,
  Spielplan_ID INT NOT NULL,
  Zeitslot_ID INT NOT NULL,
  PRIMARY KEY (Wochentag, Spielplan_ID, Zeitslot_ID),
  FOREIGN KEY (Spielplan_ID) REFERENCES Spielplan(Spielplan_ID),
  FOREIGN KEY (Zeitslot_ID) REFERENCES Zeitslot(Zeitslot_ID)
);

CREATE TABLE Vorführsaal
(
  Saal_ID INT NOT NULL,
  Kino_ID INT NOT NULL,
  Rangsystem_ID INT NOT NULL,
  PRIMARY KEY (Saal_ID, Kino_ID),
  FOREIGN KEY (Kino_ID) REFERENCES Kino(Kino_ID),
  FOREIGN KEY (Rangsystem_ID) REFERENCES Rangsystem(Rangsystem_ID)
);

CREATE TABLE Vorführung
(
  Vorführung_ID INT NOT NULL,
  Spielplan_ID INT NOT NULL,
  Zeitslot_ID INT NOT NULL,
  Saal_ID INT NOT NULL,
  Kino_ID INT NOT NULL,
  PRIMARY KEY (Vorführung_ID),
  FOREIGN KEY (Spielplan_ID) REFERENCES Spielplan(Spielplan_ID),
  FOREIGN KEY (Zeitslot_ID) REFERENCES Zeitslot(Zeitslot_ID),
  FOREIGN KEY (Saal_ID, Kino_ID) REFERENCES Vorführsaal(Saal_ID, Kino_ID)
);

CREATE TABLE Rang
(
  Rangnummer INT NOT NULL,
  Rangsystem_ID INT NOT NULL,
  PRIMARY KEY (Rangnummer, Rangsystem_ID),
  FOREIGN KEY (Rangsystem_ID) REFERENCES Rangsystem(Rangsystem_ID)
);

CREATE TABLE Reihe
(
  Reihennummer INT NOT NULL,
  Saal_ID INT NOT NULL,
  Kino_ID INT NOT NULL,
  Rangnummer INT NOT NULL,
  Rangsystem_ID INT NOT NULL,
  PRIMARY KEY (Reihennummer, Saal_ID, Kino_ID),
  FOREIGN KEY (Saal_ID, Kino_ID) REFERENCES Vorführsaal(Saal_ID, Kino_ID),
  FOREIGN KEY (Rangnummer, Rangsystem_ID) REFERENCES Rang(Rangnummer, Rangsystem_ID)
);

CREATE TABLE Lokalität
(
  Saal_ID INT NOT NULL,
  Kino_ID INT NOT NULL,
  Spielplan_ID INT NOT NULL,
  PRIMARY KEY (Saal_ID, Kino_ID, Spielplan_ID),
  FOREIGN KEY (Saal_ID, Kino_ID) REFERENCES Vorführsaal(Saal_ID, Kino_ID),
  FOREIGN KEY (Spielplan_ID) REFERENCES Spielplan(Spielplan_ID)
);

CREATE TABLE Rang_Preis
(
  Rangnummer INT NOT NULL,
  Rangsystem_ID INT NOT NULL,
  Basispreis_ID INT NOT NULL,
  PRIMARY KEY (Rangnummer, Rangsystem_ID, Basispreis_ID),
  FOREIGN KEY (Rangnummer, Rangsystem_ID) REFERENCES Rang(Rangnummer, Rangsystem_ID),
  FOREIGN KEY (Basispreis_ID) REFERENCES Basispreis(Basispreis_ID)
);

CREATE TABLE Sitzplatz
(
  Sitznummer INT NOT NULL,
  Reihennummer INT NOT NULL,
  Saal_ID INT NOT NULL,
  Kino_ID INT NOT NULL,
  PRIMARY KEY (Sitznummer, Reihennummer, Saal_ID, Kino_ID),
  FOREIGN KEY (Reihennummer, Saal_ID, Kino_ID) REFERENCES Reihe(Reihennummer, Saal_ID, Kino_ID)
);

CREATE TABLE Karte
(
  Reservierung INT,
  Kundengruppe INT NOT NULL,
  Kartennummer INT NOT NULL,
  Sitznummer INT NOT NULL,
  Reihennummer INT NOT NULL,
  Saal_ID INT NOT NULL,
  Kino_ID INT NOT NULL,
  Vorführung_ID INT NOT NULL,
  PRIMARY KEY (Kartennummer),
  FOREIGN KEY (Sitznummer, Reihennummer, Saal_ID, Kino_ID) REFERENCES Sitzplatz(Sitznummer, Reihennummer, Saal_ID, Kino_ID),
  FOREIGN KEY (Vorführung_ID) REFERENCES Vorführung(Vorführung_ID)
);