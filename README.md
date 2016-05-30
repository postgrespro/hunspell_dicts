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
=> SELECT ts_lexize('english_hunspell', 'stories');
 ts_lexize
-----------
 {story}
(1 row)

=> SELECT to_tsvector('english_hunspell', 'stories');
 to_tsvector
-------------
 'story':1
(1 row)
```

## New dictionaries and configurations

The modules introduce the following dictionaries and configurations:

|     Module     |    Dictionary      |   Configuration
| -------------- | ------------------ | ------------------
| hunspell_de_de | german_hunspell    | german_hunspell
| hunspell_en_us | english_hunspell   | english_hunspell
| hunspell_fr    | french_hunspell    | french_hunspell
| hunspell_nl_nl | dutch_hunspell     | dutch_hunspell
| hunspell_nn_no | norwegian_hunspell | norwegian_hunspell
| hunspell_ru_ru | russian_hunspell   | russian_hunspell
