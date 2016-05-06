CREATE EXTENSION hunspell_fr;

SELECT ts_lexize('french_hunspell', 'beau');
SELECT ts_lexize('french_hunspell', 'antérieur');
SELECT ts_lexize('french_hunspell', 'fraternel');
SELECT ts_lexize('french_hunspell', 'plaît');
SELECT ts_lexize('french_hunspell', 'm''appelle');
SELECT ts_lexize('french_hunspell', 'l''anglais');
SELECT ts_lexize('french_hunspell', 'comprends');
SELECT ts_lexize('french_hunspell', 'désolée');
SELECT ts_lexize('french_hunspell', 'cents');
SELECT ts_lexize('french_hunspell', 'grammairiens');
SELECT ts_lexize('french_hunspell', 'résistèrent');
SELECT ts_lexize('french_hunspell', 'derniers');
SELECT ts_lexize('french_hunspell', 'rapprochent');
