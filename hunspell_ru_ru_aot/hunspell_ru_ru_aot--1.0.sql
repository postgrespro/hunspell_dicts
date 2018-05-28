/* contrib/hunspell_ru_ru_aot/hunspell_ru_ru_aot--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_ru_ru_aot" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY russian_aot_hunspell (
    TEMPLATE = ispell,
    DictFile = ru_ru_aot,
    AffFile = ru_ru_aot,
    StopWords = russian
);

COMMENT ON TEXT SEARCH DICTIONARY russian_aot_hunspell IS 'hunspell dictionary for russian language (from AOT.ru group)';

CREATE TEXT SEARCH CONFIGURATION russian_aot_hunspell (
    COPY = simple
);

COMMENT ON TEXT SEARCH CONFIGURATION russian_aot_hunspell IS 'hunspell configuration for russian language (from AOT.ru group)';

ALTER TEXT SEARCH CONFIGURATION russian_aot_hunspell
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart
    WITH russian_aot_hunspell, english_stem;

ALTER TEXT SEARCH CONFIGURATION russian_aot_hunspell
    ALTER MAPPING FOR word, hword, hword_part
    WITH russian_aot_hunspell, russian_stem;
