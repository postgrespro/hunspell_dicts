/* contrib/hunspell_de_de/hunspell_de_de--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_de_de" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY public.german_hunspell (
    TEMPLATE = ispell,
    DictFile = de_de,
    AffFile = de_de,
    StopWords = german
);

COMMENT ON TEXT SEARCH DICTIONARY public.german_hunspell IS 'hunspell dictionary for german language';

CREATE TEXT SEARCH CONFIGURATION public.german (
    COPY = pg_catalog.simple
);

COMMENT ON TEXT SEARCH CONFIGURATION public.german IS 'hunspell configuration for german language';

ALTER TEXT SEARCH CONFIGURATION public.german
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH public.german_hunspell, pg_catalog.german_stem;
