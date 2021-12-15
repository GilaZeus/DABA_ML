CREATE TABLE Kino
(
    Kino_ID     INT         GENERATED ALWAYS AS IDENTITY,
    Hausnr      VARCHAR(7)  NOT NULL,
    Straße      VARCHAR(50) NOT NULL,
    PLZ         INT         NOT NULL,
    Ort         VARCHAR(50) NOT NULL,
    Name        VARCHAR(50) NOT NULL,
    PRIMARY KEY (Kino_ID),
    UNIQUE
    (
        Hausnr,
        Straße,
        PLZ
    ),
    CONSTRAINT correct_plz CHECK
        (PLZ BETWEEN 0 AND 99999)
);

CREATE TABLE Vorführsaal
(
    Saal_ID     INT         GENERATED ALWAYS AS IDENTITY,
    Kino_ID     INT,
    Bezeichnung VARCHAR(30),
    PRIMARY KEY
    (
        Saal_ID,
        Kino_ID
    ),
    FOREIGN KEY (Kino_ID)
        REFERENCES Kino(Kino_ID)
        ON DELETE CASCADE
);

CREATE TABLE Preisliste
(
    Preisliste_ID   INT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (Preisliste_ID)
);

CREATE TABLE Preismodifikation
(
    Preismodifikation_ID    INT         GENERATED ALWAYS AS IDENTITY,
    Art                     VARCHAR(30) NOT NULL,
    Höhe                    FLOAT       NOT NULL,
    PRIMARY KEY (Preismodifikation_ID)
);

CREATE TABLE Basispreis
(
    Basispreis_ID   INT     GENERATED ALWAYS AS IDENTITY,
    Wert            FLOAT   NOT NULL,
    PRIMARY KEY (Basispreis_ID),
    CONSTRAINT correct_price CHECK
        (Wert >= 0)
);

CREATE TABLE Zeitslot
(
    Zeitslot_ID INT         GENERATED ALWAYS AS IDENTITY,
    Uhrzeit     INT         NOT NULL,
    Bezeichnung VARCHAR(30) NOT NULL,
    PRIMARY KEY (Zeitslot_ID),
    UNIQUE
    (
        Uhrzeit,
        Bezeichnung
    ),
    CONSTRAINT correct_time CHECK
        (Uhrzeit BETWEEN 0 AND 1439)
);

CREATE TABLE Rang
(
    Rangnummer  INT GENERATED ALWAYS AS IDENTITY,
    PRIMARY KEY (Rangnummer)
);

CREATE TABLE Reihe
(
    Reihennummer    INT,
    Saal_ID         INT,
    Kino_ID         INT,
    Rangnummer      INT         NOT NULL,
    PRIMARY KEY
    (
        Reihennummer,
        Saal_ID,
        Kino_ID
    ),
    FOREIGN KEY
    (
        Saal_ID,
        Kino_ID
    )
        REFERENCES Vorführsaal
        (
            Saal_ID,
            Kino_ID
        )
        ON DELETE CASCADE,
    FOREIGN KEY (Rangnummer)
        REFERENCES Rang(Rangnummer),
    CONSTRAINT correct_reihe CHECK
        (Reihennummer > 0)
);

CREATE TABLE Wochentag
(
    Wochentag   VARCHAR(2)  PRIMARY KEY,
    CONSTRAINT correct_tag CHECK
        (Wochentag IN
        (
            'Mo',
            'Di',
            'Mi',
            'Do',
            'Fr',
            'Sa',
            'So'
        ))
);

CREATE TABLE Kundengruppe
(
    Bezeichnung     VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Genre
(
    Bezeichnung     VARCHAR(30) PRIMARY KEY,
    Beschreibung    VARCHAR(255)
);

CREATE TABLE Gültigkeitsbereich
(
    Preisliste_ID   INT,
    Kino_ID         INT,
    Von_Preisliste  DATE    NOT NULL,
    Bis_Preisliste  DATE    NOT NULL,
    PRIMARY KEY
    (
        Kino_ID,
        Preisliste_ID
    ),
    FOREIGN KEY (Kino_ID)
        REFERENCES Kino(Kino_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Preisliste_ID)
        REFERENCES Preisliste(Preisliste_ID)
        ON DELETE CASCADE,
    CONSTRAINT no_time_paradoxes_preis CHECK
        (Bis_Preisliste >= Von_Preisliste)
);

CREATE TABLE Preis_Anwendung
(
    Basispreis_ID INT,
    Preisliste_ID INT,
    PRIMARY KEY
    (
        Basispreis_ID,
        Preisliste_ID
    ),
    FOREIGN KEY (Basispreis_ID)
        REFERENCES Basispreis(Basispreis_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Preisliste_ID)
        REFERENCES Preisliste(Preisliste_ID)
        ON DELETE CASCADE
);

CREATE TABLE Modifikation_Benutzung
(
    Preismodifikation_ID    INT,
    Preisliste_ID           INT,
    PRIMARY KEY
    (
        Preismodifikation_ID,
        Preisliste_ID
    ),
    FOREIGN KEY (Preismodifikation_ID)
        REFERENCES Preismodifikation(Preismodifikation_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Preisliste_ID)
        REFERENCES Preisliste(Preisliste_ID)
        ON DELETE CASCADE
);

CREATE TABLE Rang_Preis
(
    Rangnummer      INT,
    Basispreis_ID   INT,
    PRIMARY KEY
    (
        Rangnummer,
        Basispreis_ID
    ),
    FOREIGN KEY
        (Rangnummer)
        REFERENCES Rang(Rangnummer)
        ON DELETE CASCADE,
    FOREIGN KEY
        (Basispreis_ID)
        REFERENCES Basispreis(Basispreis_ID)
        ON DELETE CASCADE
);

CREATE TABLE Sitzplatz
(
    Sitznummer      INT,
    Reihennummer    INT,
    Saal_ID         INT,
    Kino_ID         INT,
    PRIMARY KEY
    (
        Sitznummer,
        Reihennummer,
        Saal_ID,
        Kino_ID
    ),
    FOREIGN KEY 
    (
        Reihennummer,
        Saal_ID,
        Kino_ID
    )
        REFERENCES Reihe
        (
            Reihennummer,
            Saal_ID,
            Kino_ID
        )
        ON DELETE CASCADE,
    CONSTRAINT correct_sitz CHECK
        (Sitznummer > 0)
);

CREATE TABLE Film
(
    Film_ID             INT             GENERATED ALWAYS AS IDENTITY,
    Titel               VARCHAR(30)     NOT NULL,
    Produktionsfirma    VARCHAR(30)     NOT NULL,
    Produktionsjahr     INT             NOT NULL,
    Altersfreigabe      VARCHAR(6)      NOT NULL,
    Genre               VARCHAR(30)     NOT NULL,
    Beschreibung        VARCHAR(255),
    Spieldauer          INT             NOT NULL,
    ist_3D              VARCHAR(1)      NOT NULL,
    ist_Überlänge       VARCHAR(1)      GENERATED ALWAYS AS
          (CASE
              WHEN    Spieldauer > 120
              THEN    'Y'
              ELSE    'N'
           END),
    PRIMARY KEY (Film_ID),
    FOREIGN KEY
        (Genre)
        REFERENCES Genre(Bezeichnung),
    UNIQUE 
    (
        Titel,
        Produktionsfirma,
        Produktionsjahr
    ),
    CONSTRAINT correct_jahr CHECK
        (Produktionsjahr > 1887),
    CONSTRAINT correct_fsk CHECK
        (Altersfreigabe IN
        (
            'FSK_0',
            'FSK_6',
            'FSK_12',
            'FSK_18',
            'FSK_16',
            'Lehr'
        )),
    CONSTRAINT film_length CHECK
        (Spieldauer > 0),
    CONSTRAINT correct_3d CHECK
        (ist_3D IN ('Y', 'N'))
);

CREATE TABLE Spielplan
(
    Spielplan_ID    INT GENERATED ALWAYS AS IDENTITY,
    Kino_ID         INT NOT NULL,
    Film_ID         INT NOT NULL,
    Jahr_Spielplan  INT NOT NULL,
    Von_Spielplan   INT NOT NULL,
    Bis_Spielplan   INT NOT NULL,
    PRIMARY KEY (Spielplan_ID),
    FOREIGN KEY (Kino_ID)
        REFERENCES Kino(Kino_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Film_ID)
        REFERENCES Film(Film_ID)
        ON DELETE CASCADE,
    CONSTRAINT correct_von CHECK
    (
        Von_Spielplan > 0   AND
        Von_Spielplan < 54
    ),
    CONSTRAINT correct_bis CHECK
    (
        Bis_Spielplan > 0   AND
        Bis_Spielplan < 54
    ),
    CONSTRAINT no_time_paradoxes_plan CHECK
        (Bis_Spielplan >= Von_Spielplan),
    CONSTRAINT actual_year CHECK
        (Jahr_Spielplan > 1999)
);

CREATE TABLE Vorführung
(
    Vorführung_ID   INT         GENERATED ALWAYS AS IDENTITY,
    Spielplan_ID    INT         NOT NULL,
    Zeitslot_ID     INT         NOT NULL,
    Datum           DATE        NOT NULL,
    Saal_ID         INT         NOT NULL,
    Kino_ID         INT         NOT NULL,
    PRIMARY KEY (Vorführung_ID),
    FOREIGN KEY (Spielplan_ID)
        REFERENCES Spielplan(Spielplan_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Zeitslot_ID)
        REFERENCES Zeitslot(Zeitslot_ID)
        ON DELETE CASCADE,
    FOREIGN KEY
    (
        Saal_ID,
        Kino_ID
    )
        REFERENCES Vorführsaal
        (
            Saal_ID,
            Kino_ID
        )
        ON DELETE CASCADE,
    UNIQUE
    (
        Zeitslot_ID,
        Datum,
        Saal_ID,
        Kino_ID
    )
);

CREATE TABLE Zeitplan
(
    Spielplan_ID    INT,
    Zeitslot_ID     INT,
    Wochentag       VARCHAR(2),
    PRIMARY KEY
    (
        Spielplan_ID,
        Zeitslot_ID,
        Wochentag
    ),
    FOREIGN KEY (Zeitslot_ID)
        REFERENCES Zeitslot(Zeitslot_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Spielplan_ID)
        REFERENCES Spielplan(Spielplan_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (Wochentag)
        REFERENCES Wochentag(Wochentag)
        ON DELETE CASCADE
);

CREATE TABLE Lokalität
(
    Spielplan_ID    INT,
    Saal_ID         INT,
    Kino_ID         INT,
    PRIMARY KEY
    (
        Spielplan_ID,
        Saal_ID,
        Kino_ID
    ),
    FOREIGN KEY
    (
        Saal_ID,
        Kino_ID
    )
        REFERENCES Vorführsaal
        (
            Saal_ID,
            Kino_ID
        )
        ON DELETE CASCADE,
    FOREIGN KEY (Spielplan_ID)
        REFERENCES Spielplan(Spielplan_ID)
        ON DELETE CASCADE
);

CREATE TABLE Karte
(
    Kartennummer    INT         GENERATED ALWAYS AS IDENTITY,
    Reservierung    VARCHAR(30),
    Kundengruppe    VARCHAR(30) NOT NULL,
    Sitznummer      INT         NOT NULL,
    Reihennummer    INT         NOT NULL,
    Saal_ID         INT         NOT NULL,
    Kino_ID         INT         NOT NULL,
    Vorführung_ID   INT         NOT NULL,
    Verkaufspreis   FLOAT,
    PRIMARY KEY (Kartennummer),
    FOREIGN KEY
    (
        Sitznummer,
        Reihennummer,
        Saal_ID,
        Kino_ID
    )
        REFERENCES Sitzplatz
        (
            Sitznummer,
            Reihennummer,
            Saal_ID,
            Kino_ID
        ),
    FOREIGN KEY (Vorführung_ID)
        REFERENCES Vorführung(Vorführung_ID),
    FOREIGN KEY (Kundengruppe)
        REFERENCES Kundengruppe(Bezeichnung)
);

COMMIT;