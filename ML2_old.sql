CREATE TABLE Kino
(
  Kino_ID             INT             GENERATED ALWAYS AS IDENTITY,
  Hausnr              VARCHAR(7)      NOT NULL,
  Straße              VARCHAR(50)     NOT NULL,
  PLZ                 INT             NOT NULL,
  ORT                 VARCHAR(50)     NOT NULL,
  Name                VARCHAR(50)     NOT NULL,
  PRIMARY KEY
        (Kino_ID),
  UNIQUE
        (Hausnr, Straße, PLZ),
  CHECK
        (PLZ >= 0 AND PLZ < 100000)
);

CREATE TABLE Vorführsaal
(
  Saal_ID            VARCHAR(10),
  Kino_ID            INT,
  Rangsystem_ID      INT              NOT NULL,
  PRIMARY KEY
        (Saal_ID, Kino_ID),
  FOREIGN KEY
        (Kino_ID)
        REFERENCES
          Kino(Kino_ID)
        ON DELETE CASCADE,
  FOREIGN KEY
        (Rangsystem_ID)
        REFERENCES
          Rangsystem(Rangsystem_ID)
        ON DELETE SET NULL
);

CREATE TABLE Rangsystem
(
  Rangsystem_ID      INT             GENERATED ALWAYS AS IDENTITY
);

CREATE TABLE Rang
(
  Rangnummer         INT,
  Rangsystem_ID      INT,
  PRIMARY KEY
        (Rangnummer, Rangsystem_ID),
  FOREIGN KEY
        (Rangsystem_ID)
        REFERENCES
          Rangsystem(Rangsystem_ID)
        ON DELETE CASCADE
);

-- TRIGGER: Reihenfolge von Rängen soll beachtet werden

CREATE TABLE Reihe
(
  Reihennummer      INT             GENERATED ALWAYS AS IDENTITY,
  Saal_ID           INT,
  Kino_ID           INT,
  Rangnummer        INT             NOT NULL,
  Rangsystem_ID     INT             NOT NULL,
  PRIMARY KEY
        (Reihennummer, Saal_ID, Kino_ID),
  FOREIGN KEY
        (Saal_ID, Kino_ID)
        REFERENCES
          Vorführsaal(Saal_ID, Kino_ID)
        ON DELETE CASCADE,
  FOREIGN KEY
        (Rangnummer, Rangsystem_ID)
        REFERENCES
          Rang(Rangnummer, Rangsystem_ID)
        ON DELETE SET NULL
);

-- TRIGGER: Reihenfolge der Reihen
-- TRIGGER; Gehören nur Ränge mit dieselben Rangsystemen einem Saal?

CREATE TABLE Sitzplatz
(
  Sitznummer        INT             NOT NULL,
  Reihennummer      INT,
  Saal_ID           INT,
  Kino_ID           INT,
  PRIMARY KEY
        (Sitznummer, Reihennummer, Saal_ID, Kino_ID),
  FOREIGN KEY
        (Reihennummer, Saal_ID, Kino_ID)
        REFERENCES
          Reihe(Reihennummer, Saal_ID, Kino_ID)
        ON DELETE CASCADE
);

-- TRIGGER: Reihenfolge der Sitzplätze

CREATE TABLE Genre
(
  Genre_ID            INT            GENERATED ALWAYS AS IDENTITY,
  Bezeichnug          VARCHAR(20)    NOT NULL,
  PRIMARY KEY
            (Genre_ID),
  UNIQUE
            (Bezeichnug)
);

CREATE TABLE Film
(
  Film_ID             INT             GENERATED ALWAYS AS IDENTITY,
  Titel               VARCHAR(50)     NOT NULL,
  Produktionsfirma    VARCHAR(50)     NOT NULL,
  Produktionsjahr     INT             NOT NULL,
  Altersfreigabe      VARCHAR(5)      NOT NULL,
  Genre_ID            INT             NOT NULL,
  Beschreibung        VARCHAR(255),
  Spieldauer          INT             NOT NULL,
  ist_3D              VARCHAR(1)      DEFAULT 'N',
  ist_Überlänge       VARCHAR(1)      GENERATED ALWAYS AS
          (CASE
              WHEN    Spieldauer > 120
              THEN    'Y'
              ELSE    'N'
           END),
  PRIMARY KEY
          (Film_ID),
  FOREIGN KEY
          (Genre_ID)
          REFERENCES
            Genre(Genre_ID)
          ON DELETE SET NULL,
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
          (Spieldauer >= 20),
  CHECK
          (ist_3D IN ('Y', 'N'))
);

CREATE TABLE Spielplan
(
  Spielplan_ID      INT             GENERATED ALWAYS AS IDENTITY,
  Kino_ID           INT             NOT NULL,
  Film_ID           INT             NOT NULL,
  Jahr_Spielplan    SMALLINT        NOT NULL,
  Von_Spielplan     SMALLINT        NOT NULL,
  Bis_Spielplan     SMALLINT        NOT NULL,
  PRIMARY KEY
          (Spielplan_ID),
  FOREIGN KEY
          (Kino_ID)
          REFERENCES
            Kino(Kino_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Film_ID)
            REFERENCES
              Film(Film_ID)
            ON DELETE CASCADE,
  UNIQUE
          (Kino_ID, Film_ID),
  CHECK
          (Von_Spielplan > 0 AND Von_Spielplan < 54),
  CHECK
          (Bis_Spielplan > 0 AND Bis_Spielplan < 54),
  CHECK
          (Bis_Spielplan > Von_Spielplan),
  CHECK
          (Jahr_Spielplan > 1999)
);

CREATE TABLE Wochentag
(
  Wochentag         VARCHAR(2)        PRIMARY KEY,
  CHECK
          (Wochentag IN (
            'Mo',
            'Di',
            'Mi',
            'Do',
            'Fr',
            'Sa',
            'So'))
);

CREATE TABLE Zeitslot
(
  Zeitslot_ID        INT              GENERATED ALWAYS AS IDENTITY,
  Uhrzeit            SMALLINT         NOT NULL,
  Bezeichnug         VARCHAR(30)      NOT NULL,
  PRIMARY KEY
          (Zeitslot_ID),
  UNIQUE
          (Uhrzeit, Bezeichnug),
  CHECK
          (Uhrzeit >= 0 AND Uhrzeit <= 1440)
);

CREATE TABLE Zeitplan
(
  Spielplan_ID      INT,
  Zeitslot_ID       INT,
  Wochentag         INT,
  PRIMARY KEY
          (Wochentag, Spielplan_ID, Zeitslot_ID),
  FOREIGN KEY
          (Spielplan_ID)
          REFERENCES
            Spielplan(Spielplan_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Zeitslot_ID)
          REFERENCES
            Zeitslot(Zeitslot_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Wochentag)
          REFERENCES
            Wochentag(Wochentag)
          ON DELETE CASCADE
);

CREATE TABLE Lokalität
(
  Spielplan_ID      INT,
  Saal_ID           INT,
  Kino_ID           INT,
  PRIMARY KEY
          (Spielplan_ID, Saal_ID, Kino_ID),
  FOREIGN KEY
          (Saal_ID, Kino_ID)
          REFERENCES
            Vorführsaal(Saal_ID, Kino_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Spielplan_ID)
          REFERENCES
            Spielplan(Spielplan_ID)
          ON DELETE CASCADE
);

CREATE TABLE Vorführung
(
  Vorführung_ID     INT             GENERATED ALWAYS AS IDENTITY,
  Spielplan_ID      INT             NOT NULL,
  Zeitslot_ID       INT             NOT NULL,
  Saal_ID           INT             NOT NULL,
  Kino_ID           INT             NOT NULL,
  PRIMARY KEY
          (Vorführung_ID),
  UNIQUE
          (Zeitslot_ID, Saal_ID, Kino_ID),
  FOREIGN KEY
          (Spielplan_ID)
          REFERENCES
            Spielplan(Spielplan_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Zeitslot_ID)
          REFERENCES
            Zeitslot(Zeitslot_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Saal_ID, Kino_ID)
          REFERENCES
            Vorführsaal(Saal_ID, Kino_ID)
          ON DELETE CASCADE
);

CREATE TABLE Preisliste
(
  Preisliste_ID       INT           GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY
          (Preisliste_ID)
);

CREATE TABLE Gültigkeitsbereich
(
  Kino_ID             INT          NOT NULL,
  Preisliste_ID       INT          NOT NULL,
  Von_Preisliste      DATE         NOT NULL,
  Bis_Preisliste      DATE         NOT NULL,
  PRIMARY KEY
          (Kino_ID, Preisliste_ID),
  FOREIGN KEY
          (Kino_ID)
          REFERENCES
            Kino(Kino_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Preisliste_ID)
          REFERENCES
            Preisliste(Preisliste_ID)
          ON DELETE CASCADE,
  CHECK
          (Bis_Preisliste > Von_Preisliste)
);

CREATE TABLE Basispreis
(
  Basispreis_ID         INT         GENERATED ALWAYS AS IDENTITY,
  Wert                  FLOAT       NOT NULL,
  PRIMARY KEY
          (Basispreis_ID),
  CHECK
          (Wert >= 0)
);

CREATE TABLE Rang_Preis
(
  Rangnummer            INT,
  Rangsystem_ID         INT,
  Basispreis_ID         INT,
  PRIMARY KEY
          (Rangnummer, Rangsystem_ID, Basispreis_ID),
  FOREIGN KEY
          (Rangnummer, Rangsystem_ID)
          REFERENCES
            Rang(Rangnummer, Rangsystem_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Basispreis_ID)
          REFERENCES
            Basispreis(Basispreis_ID)
          ON DELETE CASCADE
);

CREATE TABLE Preis_Anwendung
(
  Basispreis_ID         INT,
  Preisliste_ID         INT,
  PRIMARY KEY
          (Basispreis_ID, Preisliste_ID),
  FOREIGN KEY
          (Basispreis_ID)
          REFERENCES
            Basispreis(Basispreis_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Preisliste_ID)
          REFERENCES
            Preisliste(Preisliste_ID)
          ON DELETE CASCADE
);

CREATE TABLE Preismodifikation
(
  Preismodifikation_ID  INT         GENERATED ALWAYS AS IDENTITY,
  Art                   VARCHAR(20) NOT NULL,
  Höhe                  FLOAT       NOT NULL,
  PRIMARY KEY
          (Preismodifikation_ID)
);

CREATE TABLE Modifikation_Benutzung
(
  Preismodifikation_ID  INT,
  Preisliste_ID         INT,
  PRIMARY KEY
          (Preismodifikation_ID, Preisliste_ID),
  FOREIGN KEY
          (Preismodifikation_ID)
          REFERENCES
            Preismodifikation(Preismodifikation_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Preisliste_ID)
          REFERENCES
            Preisliste(Preisliste_ID)
          ON DELETE CASCADE
);

CREATE TABLE Kundengruppe
(
  Kundengruppe_ID       INT         GENERATED ALWAYS AS IDENTITY,
  Bezeichnug            VARCHAR(20) NOT NULL,
  PRIMARY KEY
          (Kundengruppe_ID),
  UNIQUE
          (Bezeichnug)
);

CREATE TABLE Karte
(
  Kartennummer          INT,
  VERKAUFSPREIS         FLOAT       NOT NULL,
  Reservierung          VARCHAR(30),
  Kundengruppe_ID       INT,
  Sitznummer            INT,
  Reihennummer          INT,
  Saal_ID               INT,
  Kino_ID               INT,
  Vorführung_ID         INT,
  PRIMARY KEY (Kartennummer),
  FOREIGN KEY
          (Sitznummer, Reihennummer, Saal_ID, Kino_ID)
          REFERENCES
            Sitzplatz(Sitznummer, Reihennummer, Saal_ID, Kino_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Vorführung_ID)
          REFERENCES
            Vorführung(Vorführung_ID)
          ON DELETE CASCADE,
  FOREIGN KEY
          (Kundengruppe_ID)
          REFERENCES
            Kundengruppe(Kundengruppe_ID)
          ON DELETE CASCADE,
  UNIQUE
          (Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
  /* Definiere die Kalkulation vom Preis */
);