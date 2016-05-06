/* contrib/hunspell_ru_ru/hunspell_ru_ru--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_ru_ru" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY public.russian_hunspell (
    TEMPLATE = ispell,
    DictFile = ru_ru,
    AffFile = ru_ru,
    StopWords = russian
);

COMMENT ON TEXT SEARCH DICTIONARY public.russian_hunspell IS 'hunspell dictionary for russian language';

CREATE TEXT SEARCH CONFIGURATION public.russian (
    COPY = pg_catalog.simple
);

COMMENT ON TEXT SEARCH CONFIGURATION public.russian IS 'hunspell configuration for russian language';

ALTER TEXT SEARCH CONFIGURATION public.russian
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart
    WITH public.russian_hunspell, pg_catalog.english_stem;

ALTER TEXT SEARCH CONFIGURATION public.russian
    ALTER MAPPING FOR word, hword, hword_part
    WITH public.russian_hunspell, pg_catalog.russian_stem;
