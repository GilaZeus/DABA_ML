-- Für CineStar in Mainz
INSERT INTO Gültigkeitsbereich
(
    Preisliste_ID,
    Kino_ID,
    Von_Preisliste,
    Bis_Preisliste
)
VALUES
(
    3,
    1,
    to_date('01-01-2022', 'DD-MM-YYYY'),
    to_date('01-01-2023', 'DD-MM-YYYY')
);

-- Für KiKuBi
INSERT INTO Gültigkeitsbereich
(
    Preisliste_ID,
    Kino_ID,
    Von_Preisliste,
    Bis_Preisliste
)
VALUES
(
    2,
    3,
    to_date('01-01-2022', 'DD-MM-YYYY'),
    to_date('01-01-2023', 'DD-MM-YYYY')
);

-- Für KINOPOLIS in Koblenz
INSERT INTO Gültigkeitsbereich
(
    Preisliste_ID,
    Kino_ID,
    Von_Preisliste,
    Bis_Preisliste
)
VALUES
(
    3,
    2,
    to_date('01-01-2022', 'DD-MM-YYYY'),
    to_date('01-01-2023', 'DD-MM-YYYY')
);

-- Für Kino International in Berlin
INSERT INTO Gültigkeitsbereich
(
    Preisliste_ID,
    Kino_ID,
    Von_Preisliste,
    Bis_Preisliste
)
VALUES
(
    1,
    4,
    to_date('01-01-2022', 'DD-MM-YYYY'),
    to_date('30-06-2023', 'DD-MM-YYYY')
);
INSERT INTO Gültigkeitsbereich
(
    Preisliste_ID,
    Kino_ID,
    Von_Preisliste,
    Bis_Preisliste
)
VALUES
(
    4,
    4,
    to_date('01-01-2022', 'DD-MM-YYYY'),
    to_date('30-06-2023', 'DD-MM-YYYY')
);

COMMIT;