# Teammitglieder
- Arnold, Jennifer
- Bagautdinova, Bella
- Gilyazev, Rustam

**Benutzername**: Y37

# Änderungsliste
1. Ort im Kino ist nicht mehr berechenbar: Um das zu "berechnen", müsste man eigentlich eine SQL-Tabelle mit allen PLZs und Orte anlegen, was für diesen Projekt schon zu viel ist.
2. Vorführsäle haben jetzt eine optionale Bezeichnung und Saal_ID.
3. Jetzt sind Reihen und Rangen nicht die Attribute von Sitzplätzen, sondern Entities.
4. Das erlaubt uns, den Sitztnummer als Teilschlüssel zu nutzen und sich auf Platz_ID zu verzichten.
5. Sitzplätze agregieren sich zu Reihen, die danach zu Vorführsäle agregieren. Reihen sind mit Rängen verbunden.
6. Preis_Anwendung hat jetzt keinen Attribut "Zum_Rang", Preise für Rang werden durch den Relationship "Rang_Preis" modeliert.
7. Attribut Kundengruppe wurde zum ganzen Entity.
8. Das gleiche gilt für Genre.
9. Kartensystem ist jetzt überarbeitet: Die idee ist nicht mehr, die Karten für jede Vorführung am Start zu generieren und danach in ist_verkauft zu markieren, ob sie verkauft wurden: Stattdessen generieren wir nur die verkauften Karten.
10. Das System von Vorführungen, Zeitplan und örtliche Belegung von Spielplänen ist jetzt komplett neu gebaut. Spielpläne definieren, wo und wann die Vorführungen während der Gültigkeit des Spielplans stattfinden, die Vorführungen selbst bezeichnen eine konkrete Filmausführung an einem genauen Tag.
11. Jahr_Preisliste gelöscht, Von_ und Bis_Preisliste haben ihren Datentyp geändert. Fast überall wurden die Datentyps geändert (weil wir jetzt wissen, welche davon durch SQL unterstützt werden).
12. Zeitslots haben jetzt keinen Wochentag. Wochentag wird erst im Zeitplan fixiert.
13. Die Unique-Constraints wurden beim Spielplan entfernt.

# Anmerkungen
1. Fast alle `FOREIGN KEY`s werden `ON DELETE CASCADE`, außer:
	1. Rangnummer in einer Reihe: Ränge zu löschen ist nur dann erlaubt, wenn keine Reihen mit denen assoziert sind.
	2. Genre im Film: 
	3. Alle Foreign Keys in Karte: Wenn eine Karte schon verkauft wurde, darf man nichts löschen, die Vorführung muss stattfinden und gespeichert werden.
2. Die Spalte "Verkaufspreis" bei Spielkarten ist noch bei uns leer.
3. Die Stammdaten sind im Ordner "Stammdaten" gespeichert, das sind Filme, Genre, Kinos, Zeitslots und Preislisten. Für die Anlegung der Daten haben wir einen kleinen Skript geschrieben (`generate_sql.py`).

# Erhaltung der Bijektivität
Es ist klar, dass die ER-Schema genau die Relationsschema angeben soll, die wiederum genau die SQL-Skripte definieren muss. Aber es ist leider nicht immer möglich:

1. Erstens haben wir viele Unique-Constraints eingeführt, die sich im ER-Schema kaum oder nur schwer abbilden lassen. Um mit mehreren Unique-Attributen nicht zu verwirren, haben wir in ER-Schema nur diejenigen mit Unique gekennzeichnet, die Schlüssel sind. Alle Unique-Constraints wurden doch in der Dokumentationstabelle angegeben (blaue Zeilen) und in Relationsschema manuell eingeführt.
2. Komischerweise macht der Erdplus einen Spaltensalat beim Generierung von SQL-Skripten, Spaltenreihenfolge wird nicht beachtet. Das müssten wir auch manuell korrigieren (die korrekte Reihenfolge ist im Relationschema und Dokumentationstabelle vorhanden).
3. `NOT NULL`-Constraints wurden für `PRIMARY KEY`s gelöscht, weil es selbstverständlich ist.
4. Manche Schlüsselspalten generieren wir mit `GENERATED ALWAYS AS IDENTITY`, um beim Eintragen darüber nicht nachzudenken.
5. Die Spalte Ist_Überlänge beim Film wird beim Insert der Daten kalkuliert.
6. Außerdem haben wir alle Constraints direkt in die `CREATE TABLE` eingebaut.
7. Manche Fremdschlüssel wurden umgenannt (Genre.Bezeichnung –> Film.Genre, Kundengruppe.Bezeichnung –> Karte.Kundengruppe)

Alle Constraints sind in Dokumentationstabelle sehbar (außer den Namen von `CHECK`-Constraints, aber sie sind für die Sache nicht besonders relevant).

# Nebenbedingungen
Es ist sinnvoll, einen Zeitraum zu definieren, der für Putzen und Vorbereitung für die nächste Vorführung notwendig ist, z.B. `lag := 15` Minuten.

1. Man soll überprüfen, dass alle Sitznummer und Reihennummer Sinn machen, d.h. wenn wir z.B. die 5. Reihe haben, dann sollen auch die Reihen No. 1, 2, 3 und 4 vorhanden sein.
2. Dasselbe gilt auch für die Rangnummer.
4. Hintere Reihen können nicht größere Ränge als vordere haben.
7. Beim Anlegen der Vorführungen muss geprüft werden, dass die benutzten Zeitslot, Wochentag und Vorführsaal mit dem zugehörigen Spielplan assoziert sind.
8. Beim Anlegen des Spielplans muss überprüft werden, dass die ausgewählten Termine mit den anderen Terminen nicht kolidieren. D.h. der nächste Ort-Zeitslot in einem Vorführsaal darf nicht früher als `(Uhrzeit des vorherigen Ort-Zeitslots + Länge des vorherigen Films + lag)` sein.
9. Für ein Kino muss in jeder Zeitperiode genau eine Preisliste gelten.
10. Für einen Film und ein Kino gilt in jeder Zeitperiode genau ein Spielplan.
11. Jede Preisliste muss mindestens so viele Basispreise haben, wie viele Ränge ein Kino hat, und alle diese Ränge sollen in Rang_Anwendung Einträge haben.
12. Beim Anlegen von Karten müssen auch deren Preise kalkuliert werden:
	1. Finde mit dem zugehörigen Rang und Preislite_ID den Basispreis.
	2. Überprüfe, ob die in der Preisliste enthaltenen Preismodifikationen anwendbar sind (mit Art abgebildet, z.B.: Preismodifikation.Art = 'ist_3D' heißt, dass es für 3D-Filme angewendet werden soll).
13. Jedes Kino muss mindestens einen Vorführsaal haben.
14. Jeder Vorführsaal muss mindestens eine Reihe haben.
15. Jede Reihe muss mindestens einen Sitzplatz haben.
16. Preisliste soll Basispreise für jeden Rang des Kinos enthalten.
17. Eigentlich soll noch immer überprüft werden, wie viele Wochen in einem Jahr vorhanden sind, um den Constraint für Spielplan genauer zu machen.
18. Datum von der Vorführung soll innerhalb von der Zeitspanne des Spielplans liegen und dem Zeitplan entsprechen.