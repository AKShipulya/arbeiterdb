CREATE TABLE abteil
(
    abteilung_id integer NOT NULL, -- PK
    abteilung_name text NOT NULL,
    praemie integer NOT NULL,
    CHECK (praemie >= 0),
    PRIMARY KEY (abteilung_id)
);

CREATE TABLE arbeiter
(
    arbeiter_id integer NOT NULL, -- PK
    abteilung_id integer NOT NULL, -- FK
    chief_id integer NOT NULL, -- FK
    familie text NOT NULL,
    name text NOT NULL,
    salary integer NOT NULL,
    einstell_datum date NOT NULL,
    PRIMARY KEY (arbeiter_id),
    FOREIGN KEY (abteilung_id)
    REFERENCES abteil (abteilung_id)
    ON DELETE CASCADE,
    FOREIGN KEY (chief_id )
    REFERENCES arbeiter (arbeiter_id)
    ON DELETE CASCADE
);

-- popuilate DB
INSERT INTO abteil (abteilung_id, abteilung_name, praemie)
VALUES (001, 'Testabteilung', 10), 
(002, 'AMS', 15),
(003, 'Entwicklung', 10);

-- populate DB
INSERT INTO arbeiter (arbeiter_id, abteilung_id, chief_id, familie, name, salary, einstell_datum)
VALUES (0, 001, 0, 'Weissman', 'Hans', 2500, '1998-03-12'), 
(1, 002, 0, 'Grosam', 'Markus', 2100, '2001-05-22'),
(2, 001, 1, 'Kofman', 'John', 2500, '2018-03-12'),
(3, 002, 1, 'Frans', 'Derek', 2150, '2018-05-01'),
(4, 001, 1, 'Johnson', 'Matt', 2500, '1998-05-12'),
(5, 001, 0, 'Schoenhals', 'Andreas', 3200, '2017-12-24'),
(6, 003, 0, 'Kabelbaum', 'Franz', 1800, '2004-01-22'),
(7, 002, 1, 'Graupilz', 'Gerhard', 2870, '2001-05-30'),
(8, 001, 1, 'Nodal', 'Christian', 2470, '2008-06-03');

-- Aufgabe 1
SELECT concat(concat(arb.familie, concat(' ', left(arb.name, 1))), '.') as name, arb.einstell_datum as date
FROM arbeiter arb 
LEFT JOIN abteil abt ON abt.abteilung_id = arb.abteilung_id
WHERE (einstell_datum >= '2018-01-01' AND einstell_datum <= '2018-12-31') OR (5 = date_part('month', einstell_datum))
ORDER BY familie;

-- Aufgabe 2
SELECT abt.abteilung_name as abteilung_name, arb.familie as familie, arb.name as name, 
((((arb.salary * abt.praemie) / 100) + arb.salary) - (((arb.salary * abt.praemie) / 100) + arb.salary) * 9 / 100) 
as salary
FROM arbeiter arb
LEFT JOIN abteil abt ON abt.abteilung_id = arb.abteilung_id
WHERE abt.abteilung_id = 1 OR abt.abteilung_id = 2
ORDER BY abteilung_name, salary DESC;

-- Aufgabe 3
SELECT abt.abteilung_name as abteilung_name,  COUNT(*), sum(arb.salary) / count(*) as mediane 
FROM arbeiter arb
LEFT JOIN abteil abt ON abt.abteilung_id = arb.abteilung_id
GROUP BY abteilung_name having COUNT(arb.arbeiter_id) >= 5;

-- Aufgabe 4
SELECT arb.name as name, arb.familie as familie 
FROM arbeiter arb
LEFT JOIN arbeiter chief ON arb.chief_id = chief.arbeiter_id 
WHERE arb.salary > chief.salary;