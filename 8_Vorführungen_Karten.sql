-- Zuerst die Kundengruppen:
INSERT INTO Kundengruppe (Bezeichnung) VALUES ('Kind');
INSERT INTO Kundengruppe (Bezeichnung) VALUES ('Student');
INSERT INTO Kundengruppe (Bezeichnung) VALUES ('Erwachsener');
INSERT INTO Kundengruppe (Bezeichnung) VALUES ('Behinderte');

COMMIT;

-- Vorführung für Le Professional bei KuKubi, das komplett für eine Schule reserviert wurde:
INSERT INTO Vorführung
(
    Spielplan_ID,
    Zeitslot_ID,
    Datum,
    Saal_ID,
    Kino_ID
)
VALUES
(
    1,
    13,
    to_date('09-01-2022', 'DD-MM-YYYY'),
    6,
    3
);

COMMIT;

-- Sehen Sie die Sitzplätze.txt
SELECT * FROM Sitzplatz
WHERE
    Saal_ID = 6 AND
    Kino_ID = 3;

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 1, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 2, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 3, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 8, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 9, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 10, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 11, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 11, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 11, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 11, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 12, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 12, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 12, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 12, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 13, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 13, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 13, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 13, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 14, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 14, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 14, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 14, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 15, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 15, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 15, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 15, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 16, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 16, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 16, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 16, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 17, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 17, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 17, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 17, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 18, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 18, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 18, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 18, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 19, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 19, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 19, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 19, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 20, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 20, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 20, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 20, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 4, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 5, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 2, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 3, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 4, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 5, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 6, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 7, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 6, 8, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 1, 6, 3, 1);

INSERT INTO Karte
(Reservierung, Kundengruppe, Sitznummer, Reihennummer, Saal_ID, Kino_ID, Vorführung_ID)
VALUES
('Schule', 'Kind', 7, 2, 6, 3, 1);

COMMIT;

--Vorführung von Akira im großen Saal bei Kino International, wo schon zwei Tickets in der ersten Reihe verkauft wurden
INSERT INTO Vorführung
(
    Spielplan_ID,
    Zeitslot_ID,
    Datum,
    Saal_ID,
    Kino_ID
)
VALUES
(
    3,
    1,
    to_date('18-10-2022', 'DD-MM-YYYY'),
    8,
    4
);

COMMIT;

INSERT INTO Karte
(
    Kundengruppe,
    Sitznummer,
    Reihennummer,
    Saal_ID,
    Kino_ID,
    Vorführung_ID
)
VALUES
(
    'Erwachsener',
    1,
    1,
    8,
    4,
    2
);

INSERT INTO Karte
(
    Kundengruppe,
    Sitznummer,
    Reihennummer,
    Saal_ID,
    Kino_ID,
    Vorführung_ID
)
VALUES
(
    'Student',
    2,
    1,
    8,
    4,
    2
);

COMMIT;