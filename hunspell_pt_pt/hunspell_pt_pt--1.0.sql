/* contrib/hunspell_pt_pt/hunspell_pt_pt--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION hunspell_pt_pt" to load this file. \quit

CREATE TEXT SEARCH DICTIONARY portuguese_hunspell (
    TEMPLATE = ispell,
    DictFile = pt_pt,
    AffFile = pt_pt,
    StopWords = portuguese
);

COMMENT ON TEXT SEARCH DICTIONARY portuguese_hunspell IS 'hunspell dictionary for portuguese language';

CREATE TEXT SEARCH CONFIGURATION portuguese_hunspell (
    COPY = simple
);

COMMENT ON TEXT SEARCH CONFIGURATION portuguese_hunspell IS 'hunspell configuration for portuguese language';

ALTER TEXT SEARCH CONFIGURATION portuguese_hunspell
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH portuguese_hunspell;
