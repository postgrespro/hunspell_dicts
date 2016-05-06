CREATE EXTENSION hunspell_nn_no;

SELECT ts_lexize('norwegian_hunspell', 'kjem');
SELECT ts_lexize('norwegian_hunspell', 'heiter');
SELECT ts_lexize('norwegian_hunspell', 'guten');
SELECT ts_lexize('norwegian_hunspell', 'gutar');
SELECT ts_lexize('norwegian_hunspell', 'kyrkjene');
SELECT ts_lexize('norwegian_hunspell', 'fotballklubber');
SELECT ts_lexize('norwegian_hunspell', 'klubbfotballen');
SELECT ts_lexize('norwegian_hunspell', 'stavekontroll');
