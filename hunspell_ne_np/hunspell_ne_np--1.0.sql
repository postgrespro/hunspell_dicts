/* contrib/hunspell_ne_np/hunspell_ne_np--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_ne_np" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY nepali_hunspell (
    TEMPLATE = ispell,
    DictFile = ne_np,
    AffFile = ne_np
);

COMMENT ON TEXT SEARCH DICTIONARY nepali_hunspell IS 'hunspell dictionary for nepali language';

CREATE TEXT SEARCH CONFIGURATION nepali_hunspell (
    COPY = simple
);

COMMENT ON TEXT SEARCH CONFIGURATION nepali_hunspell IS 'hunspell configuration for nepali language';

ALTER TEXT SEARCH CONFIGURATION nepali_hunspell
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH nepali_hunspell;
