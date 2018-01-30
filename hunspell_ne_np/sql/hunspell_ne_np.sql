CREATE EXTENSION hunspell_ne_np;

CREATE TABLE table1(name varchar);
INSERT INTO table1 VALUES ('अँगअँकाउछन्'),
	('PostgreSQL संसारको सबैभन्दा उन्नत खुला स्रोत डाटास हो');

SELECT d.* FROM table1 AS t, LATERAL ts_debug('nepali_hunspell', t.name) AS d;

CREATE INDEX name_idx ON table1 USING GIN (to_tsvector('nepali_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('nepali_hunspell', name)
	@@ to_tsquery('nepali_hunspell', 'अँगअँकाउछन्');
SELECT * FROM table1 WHERE to_tsvector('nepali_hunspell', name)
	@@ to_tsquery('nepali_hunspell', 'स्रोत');

DROP INDEX name_idx;
CREATE INDEX name_idx ON table1 USING GIST (to_tsvector('nepali_hunspell', "name"));
SELECT * FROM table1 WHERE to_tsvector('nepali_hunspell', name)
	@@ to_tsquery('nepali_hunspell', 'संसारको');
SELECT * FROM table1 WHERE to_tsvector('nepali_hunspell', name)
	@@ to_tsquery('nepali_hunspell', 'हो');
