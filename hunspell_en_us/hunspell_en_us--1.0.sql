/* contrib/hunspell_en_us/hunspell_en_us--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_en_us" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY public.english_hunspell (
    TEMPLATE = ispell,
    DictFile = en_us,
    AffFile = en_us,
    StopWords = english
);

COMMENT ON TEXT SEARCH DICTIONARY public.english_hunspell IS 'hunspell dictionary for english language';

CREATE TEXT SEARCH CONFIGURATION public.english (
    COPY = pg_catalog.simple
);

COMMENT ON TEXT SEARCH CONFIGURATION public.english IS 'hunspell configuration for english language';

ALTER TEXT SEARCH CONFIGURATION public.english
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH public.english_hunspell, pg_catalog.english_stem;
