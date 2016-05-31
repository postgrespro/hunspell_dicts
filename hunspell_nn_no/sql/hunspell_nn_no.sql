CREATE EXTENSION hunspell_nn_no;

CREATE TABLE table1(name varchar);
INSERT INTO table1 VALUES ('kjem'), ('heiter'), ('guten'),
						('gutar'), ('kyrkjene'), ('fotballklubber'), ('klubbfotballen');

SELECT d.* FROM table1 AS t, LATERAL ts_debug('norwegian_hunspell', t.name) AS d;

CREATE INDEX name_idx ON table1 USING GIN (to_tsvector('norwegian_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('norwegian_hunspell', name)
	@@ to_tsquery('norwegian_hunspell', 'klubb');
SELECT * FROM table1 WHERE to_tsvector('norwegian_hunspell', name)
	@@ to_tsquery('norwegian_hunspell', 'fot');
SELECT * FROM table1 WHERE to_tsvector('norwegian_hunspell', name)
	@@ to_tsquery('norwegian_hunspell', 'heiter');

DROP INDEX name_idx;
CREATE INDEX name_idx ON table1 USING GIST (to_tsvector('norwegian_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('norwegian_hunspell', name)
	@@ to_tsquery('norwegian_hunspell', 'klubb');
SELECT * FROM table1 WHERE to_tsvector('norwegian_hunspell', name)
	@@ to_tsquery('norwegian_hunspell', 'fot');
SELECT * FROM table1 WHERE to_tsvector('norwegian_hunspell', name)
	@@ to_tsquery('norwegian_hunspell', 'heiter');

