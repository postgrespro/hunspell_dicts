CREATE EXTENSION hunspell_nl_nl;

SELECT ts_lexize('dutch_hunspell', 'speelde');
SELECT ts_lexize('dutch_hunspell', 'duivels');
SELECT ts_lexize('dutch_hunspell', 'huizes');
SELECT ts_lexize('dutch_hunspell', 'vertelde');
SELECT ts_lexize('dutch_hunspell', 'kunt');
