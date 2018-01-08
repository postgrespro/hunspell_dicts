/* contrib/hunspell_cs_cz/hunspell_cs_cz--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_cs_cz" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY czech_hunspell (
    TEMPLATE = ispell,
    DictFile = cs_cz,
    AffFile = cs_cz,
    StopWords = czech
);

COMMENT ON TEXT SEARCH DICTIONARY czech_hunspell IS 'hunspell dictionary for czech language';

CREATE TEXT SEARCH CONFIGURATION czech_hunspell (
    COPY = simple
);

COMMENT ON TEXT SEARCH CONFIGURATION czech_hunspell IS 'hunspell configuration for czech language';

ALTER TEXT SEARCH CONFIGURATION czech_hunspell
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH czech_hunspell;
