/* contrib/hunspell_nn_no/hunspell_nn_no--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_nn_no" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY norwegian_hunspell (
    TEMPLATE = ispell,
    DictFile = nn_no,
    AffFile = nn_no,
    StopWords = norwegian
);

COMMENT ON TEXT SEARCH DICTIONARY norwegian_hunspell IS 'hunspell dictionary for norwegian (norsk) language';

CREATE TEXT SEARCH CONFIGURATION norwegian_hunspell (
    COPY = simple
);

COMMENT ON TEXT SEARCH CONFIGURATION norwegian_hunspell IS 'hunspell configuration for norwegian (norsk) language';

ALTER TEXT SEARCH CONFIGURATION norwegian_hunspell
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH norwegian_hunspell, norwegian_stem;
