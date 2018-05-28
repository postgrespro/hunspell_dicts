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

> **Important:** Don't forget to set the `PG_CONFIG` variable in case you want to test dictionaries on a custom build of PostgreSQL. Read more [here](https://wiki.postgresql.org/wiki/Building_and_Installing_PostgreSQL_Extension_Modules).

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

## Custom installation

If you want to create a dictionary which isn't listed below, you may want to download necessary [OpenOffice](https://extensions.openoffice.org/en/search?f%5B0%5D=field_project_tags%3A157) or [LibreOffice](https://extensions.libreoffice.org/extensions?getCategories=Dictionary&getCompatibility=any) extension.

Then you need to do the following (from the [documentation](https://www.postgresql.org/docs/current/static/textsearch-dictionaries.html#TEXTSEARCH-ISPELL-DICTIONARY)):

* OpenOffice/LibreOffice extension files have the .oxt extension. It is necessary to extract .aff and .dic files, change extensions to .affix and .dict. For some dictionary files it is also needed to convert characters to the UTF-8 encoding with commands (for example, for a Norwegian language dictionary):
```
iconv -f ISO_8859-1 -t UTF-8 -o nn_no.affix nn_NO.aff
iconv -f ISO_8859-1 -t UTF-8 -o nn_no.dict nn_NO.dic
```
* copy files to the $SHAREDIR/tsearch_data directory
* load files into PostgreSQL with the following command:
```sql
CREATE TEXT SEARCH DICTIONARY norwegian_hunspell (
    TEMPLATE = ispell,
    DictFile = nn_no,
    AffFile = nn_no,
    StopWords = norwegian
);
```

## New dictionaries and configurations

The modules introduce the following dictionaries and configurations:

|       Module       |     Dictionary       |    Configuration
| ------------------ | -------------------- | --------------------
| hunspell_cs_cz     | czech_hunspell       | czech_hunspell
| hunspell_de_de     | german_hunspell      | german_hunspell
| hunspell_en_us     | english_hunspell     | english_hunspell
| hunspell_fr        | french_hunspell      | french_hunspell
| hunspell_ne_np     | nepali_hunspell      | nepali_hunspell
| hunspell_nl_nl     | dutch_hunspell       | dutch_hunspell
| hunspell_nn_no     | norwegian_hunspell   | norwegian_hunspell
| hunspell_ru_ru     | russian_hunspell     | russian_hunspell
| hunspell_ru_ru_aot | russian_aot_hunspell | russian_aot_hunspell
