CREATE EXTENSION hunspell_en_us;

SELECT ts_lexize('english_hunspell', 'stories');
SELECT ts_lexize('english_hunspell', 'traveled');
SELECT ts_lexize('english_hunspell', 'eaten');
SELECT ts_lexize('english_hunspell', 'I''m');
SELECT ts_lexize('english_hunspell', 'Saturdays');
SELECT ts_lexize('english_hunspell', 'healthcare');
SELECT ts_lexize('english_hunspell', 'generally');
SELECT ts_lexize('english_hunspell', 'integrating');
SELECT ts_lexize('english_hunspell', 'lankiness''s');
SELECT ts_lexize('english_hunspell', 'rewritten');