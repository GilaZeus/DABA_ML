INSERT INTO Preisliste (Preisliste_ID) VALUES (DEFAULT);

INSERT INTO Basispreis (Wert) VALUES (12);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (1, 1);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (1, 1);

INSERT INTO Basispreis (Wert) VALUES (11.5);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (2, 1);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (2, 2);

INSERT INTO Basispreis (Wert) VALUES (11);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (3, 1);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (3, 3);

INSERT INTO Basispreis (Wert) VALUES (10.5);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (4, 1);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (4, 4);

INSERT INTO Basispreis (Wert) VALUES (10);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (5, 1);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (5, 5);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Abendvorstelllung',
    1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (1, 1);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Kind',
    -1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (2, 1);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'ist_3D',
    0.5
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (3, 1);

INSERT INTO Preisliste (Preisliste_ID) VALUES (DEFAULT);

INSERT INTO Basispreis (Wert) VALUES (10);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (6, 2);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (1, 6);

INSERT INTO Preisliste (Preisliste_ID) VALUES (DEFAULT);

INSERT INTO Basispreis (Wert) VALUES (9);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (7, 3);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (1, 7);

INSERT INTO Basispreis (Wert) VALUES (9);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (8, 3);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (2, 8);

INSERT INTO Basispreis (Wert) VALUES (8.75);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (9, 3);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (3, 9);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Abendvorstelllung',
    1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (4, 3);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Kind',
    -1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (5, 3);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'ist_3D',
    0.5
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (6, 3);

INSERT INTO Preisliste (Preisliste_ID) VALUES (DEFAULT);

INSERT INTO Basispreis (Wert) VALUES (12);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (10, 4);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (1, 10);

INSERT INTO Basispreis (Wert) VALUES (11.5);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (11, 4);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (2, 11);

INSERT INTO Basispreis (Wert) VALUES (11);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (12, 4);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (3, 12);

INSERT INTO Basispreis (Wert) VALUES (10.5);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (13, 4);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (4, 13);

INSERT INTO Basispreis (Wert) VALUES (10);

INSERT INTO Preis_Anwendung
    (Basispreis_ID, Preisliste_ID)
VALUES
    (14, 4);

INSERT INTO Rang_Preis
    (Rangnummer, Basispreis_ID)
VALUES
    (5, 14);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Sondervorstellung',
    1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (7, 4);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Kind',
    -1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (8, 4);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Student',
    -1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (9, 4);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'ist_3D',
    1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (10, 4);

INSERT INTO Preismodifikation
    (Art, Höhe)
VALUES
(
    'Midnight_Movie',
    -1
);
INSERT INTO Modifikation_Benutzung
    (Preismodifikation_ID, Preisliste_ID)
VALUES
    (11, 4);

COMMIT;