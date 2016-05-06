CREATE EXTENSION hunspell_de_de;

SELECT ts_lexize('german_hunspell', 'überwachung');
SELECT ts_lexize('german_hunspell', 'etikettierung');
SELECT ts_lexize('german_hunspell', 'vernehmen');
SELECT ts_lexize('german_hunspell', 'verteilen');
SELECT ts_lexize('german_hunspell', 'bereits');
SELECT ts_lexize('german_hunspell', 'üblichen');
SELECT ts_lexize('german_hunspell', 'wahrnehmung');
SELECT ts_lexize('german_hunspell', 'maßen');
SELECT ts_lexize('german_hunspell', 'füße');
