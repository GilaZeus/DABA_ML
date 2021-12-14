-- Ränge:
INSERT INTO Rang
    (Rangnummer)
VALUES
    (DEFAULT);

INSERT INTO Rang
    (Rangnummer)
VALUES
    (DEFAULT);

INSERT INTO Rang
    (Rangnummer)
VALUES
    (DEFAULT);

INSERT INTO Rang
    (Rangnummer)
VALUES
    (DEFAULT);

INSERT INTO Rang
    (Rangnummer)
VALUES
    (DEFAULT);

-- Genren:
INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Action');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Thriller');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Comedy');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Sci-Fi');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Horror');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Documentary');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Fantasy');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Animation');

INSERT INTO Genre
    (Bezeichnung)
VALUES
    ('Drama');

-- Filme:
INSERT INTO Film
    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)
VALUES
(
    'The Godfather',
    'Paramount Pictures',
    1972,
    'FSK_16',
    'Drama',
    'The Godfather follows Vito Corleone, Don of the Corleone family, as he passes the mantel to his unwilling son, Michael.',
    175,
    'N'
);

INSERT INTO Film
    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)
VALUES
(
    'Akira',
    'Akira Committee Companz Ltd.',
    1988,
    'FSK_16',
    'Animation',
    'A secret military project endangers Neo-Tokyo when it turns a biker gang member into a rampaging psychic psychopath who can only be stopped by a teenager, his gang of biker friends and a group of psychics.',
    124,
    'N'
);

INSERT INTO Film
    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)
VALUES
(
    'Det sjunde inseglet',
    'Svensk Filmindustri',
    1957,
    'FSK_16',
    'Drama',
    'A knight returning to Sweden after the Crusades seeks answers about life, death, and the existence of God as he plays chess against the Grim Reaper during the Black Plague.',
    96,
    'N'
);

INSERT INTO Film
    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)
VALUES
(
    'Le Samuorai',
    'CIeCC',
    1967,
    'FSK_0',
    'Drama',
    'After professional hitman Jef Costello is seen by witnesses his efforts to provide himself an alibi drive him further into a corner.',
    105,
    'N'
);

INSERT INTO Film
    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)
VALUES
(
    'Le Professionnel',
    'Cerito Films',
    1981,
    'FSK_16',
    'Action',
    'Victim of a plot which has resulted in his imprisonment in a Central African jail for two years, a French secret agent arrives in Paris to settle accounts.',
    108,
    'N'
);

INSERT INTO Film
    (Titel, Produktionsfirma, Produktionsjahr, Altersfreigabe, Genre, Beschreibung, Spieldauer, ist_3D)
VALUES
(
    'Stalker',
    'Mosfilm',
    1979,
    'FSK_12',
    'Sci-Fi',
    'A guide leads two men through an area known as the Zone to find a room that grants wishes.',
    182,
    'N'
);

COMMIT;