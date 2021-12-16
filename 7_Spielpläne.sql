-- Zuerst die Wochentage
INSERT INTO Wochentag (Wochentag) VALUES ('Mo');
INSERT INTO Wochentag (Wochentag) VALUES ('Di');
INSERT INTO Wochentag (Wochentag) VALUES ('Mi');
INSERT INTO Wochentag (Wochentag) VALUES ('Do');
INSERT INTO Wochentag (Wochentag) VALUES ('Fr');
INSERT INTO Wochentag (Wochentag) VALUES ('Sa');
INSERT INTO Wochentag (Wochentag) VALUES ('So');

COMMIT;

-- Le Professionnel abends um 20 Uhr Am Freitag bei KiKubi während des ganzen Jahres
INSERT INTO Spielplan
(
    Kino_ID,
    Film_ID,
    Von_Spielplan,
    Bis_Spielplan
)
VALUES
(
    3,
    5,
    to_date('03-01-2022', 'DD-MM-YYYY'),
    to_date('26-12-2022', 'DD-MM-YYYY')
);
INSERT INTO Lokalität
(
    Spielplan_ID,
    Saal_ID,
    Kino_ID
)
VALUES
(
    1,
    6,
    3
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    1,
    13,
    'Fr'
);

COMMIT;

-- Det sjunde inseglet bei Cinestar Mainz jeden Morgen um 9:00 während der ersten 5 Wochen im 2022 im 1. Saal
INSERT INTO Spielplan
(
    Kino_ID,
    Film_ID,
    Von_Spielplan,
    Bis_Spielplan
)
VALUES
(
    1,
    3,
    to_date('03-01-2022', 'DD-MM-YYYY'),
    to_date('14-02-2022', 'DD-MM-YYYY')
);
INSERT INTO Lokalität
(
    Spielplan_ID,
    Saal_ID,
    Kino_ID
)
VALUES
(
    2,
    1,
    1
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'Mo'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'Di'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'Mi'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'Do'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'Fr'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'Sa'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    2,
    2,
    'So'
);

COMMIT;

-- Eine Woche von Akira um 00:00 in Kino International im Berlin (in allen Sälen)
INSERT INTO Spielplan
(
    Kino_ID,
    Film_ID,
    Von_Spielplan,
    Bis_Spielplan
)
VALUES
(
    4,
    2,
    to_date('17-10-2022', 'DD-MM-YYYY'),
    to_date('17-10-2022', 'DD-MM-YYYY')
);
INSERT INTO Lokalität
(
    Spielplan_ID,
    Saal_ID,
    Kino_ID
)
VALUES
(
    3,
    7,
    4
);
INSERT INTO Lokalität
(
    Spielplan_ID,
    Saal_ID,
    Kino_ID
)
VALUES
(
    3,
    8,
    4
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'Mo'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'Di'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'Mi'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'Do'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'Fr'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'Sa'
);
INSERT INTO Zeitplan
(
    Spielplan_ID,
    Zeitslot_ID,
    Wochentag
)
VALUES
(
    3,
    1,
    'So'
);

COMMIT;