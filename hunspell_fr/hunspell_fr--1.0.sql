/* contrib/hunspell_fr/hunspell_fr--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_fr" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY public.french_hunspell (
    TEMPLATE = ispell,
    DictFile = fr,
    AffFile = fr,
    StopWords = french
);

COMMENT ON TEXT SEARCH DICTIONARY public.french_hunspell IS 'hunspell dictionary for french language';

CREATE TEXT SEARCH CONFIGURATION public.french (
    COPY = pg_catalog.simple
);

COMMENT ON TEXT SEARCH CONFIGURATION public.french IS 'hunspell configuration for french language';

ALTER TEXT SEARCH CONFIGURATION public.french
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH public.french_hunspell, pg_catalog.french_stem;
