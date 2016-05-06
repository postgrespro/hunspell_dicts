# Hunspell dictionaries

## Introduction

The repository contains hunspell dictionaries for german, english, french,
dutch, norwegian and russian languages.

## Installation

Here the example of installation of the english dictionary:

    $ git clone https://github.com/postgrespro/hunspell_dicts
    $ cd hunspell_dicts/hunspell_en_us
    $ make USE_PGXS=1
    $ sudo make USE_PGXS=1 install
    $ make USE_PGXS=1 installcheck
    $ psql DB -c "CREATE EXTENSION hunspell_en_us;"

After the installation you can use english dictionary and configuration:

```sql
=# SELECT ts_lexize('public.english_hunspell', 'stories');
 ts_lexize
-----------
 {story}
(1 row)

=# SELECT to_tsvector('public.english', 'stories');
 to_tsvector
-------------
 'story':1
(1 row)
```

## New dictionaries and configurations

The modules introduce the following dictionaries and configurations:

|     Module     |        Dictionary         |  Configuration
| -------------- | ------------------------- | ----------------
| hunspell_de_de | public.german_hunspell    | public.german
| hunspell_en_us | public.english_hunspell   | public.english
| hunspell_fr    | public.french_hunspell    | public.french
| hunspell_nl_nl | public.dutch_hunspell     | public.dutch
| hunspell_nn_no | public.norwegian_hunspell | public.norwegian
| hunspell_ru_ru | public.russian_hunspell   | public.russian
