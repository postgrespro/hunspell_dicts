CREATE EXTENSION hunspell_de_de;

CREATE TABLE table1(name varchar);
INSERT INTO table1 VALUES ('etikettierung'), ('vernehmen'), ('verteilen'),
						('bereits'), ('wahrnehmung');

SELECT d.* FROM table1 AS t, LATERAL ts_debug('german_hunspell', t.name) AS d;

CREATE INDEX name_idx ON table1 USING GIN (to_tsvector('german_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('german_hunspell', name)
	@@ to_tsquery('german_hunspell', 'vernehmen');
SELECT * FROM table1 WHERE to_tsvector('german_hunspell', name)
	@@ to_tsquery('german_hunspell', 'bereits');
SELECT * FROM table1 WHERE to_tsvector('german_hunspell', name)
	@@ to_tsquery('german_hunspell', 'wahrnehmung');

DROP INDEX name_idx;
CREATE INDEX name_idx ON table1 USING GIST (to_tsvector('german_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('german_hunspell', name)
	@@ to_tsquery('german_hunspell', 'vernehmen');
SELECT * FROM table1 WHERE to_tsvector('german_hunspell', name)
	@@ to_tsquery('german_hunspell', 'bereits');
SELECT * FROM table1 WHERE to_tsvector('german_hunspell', name)
	@@ to_tsquery('german_hunspell', 'wahrnehmung');
