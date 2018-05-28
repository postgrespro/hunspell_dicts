EXTENSION = hunspell_ru_ru_aot
DATA = hunspell_ru_ru_aot--1.0.sql

DATA_TSEARCH = ru_ru_aot.affix ru_ru_aot.dict

REGRESS = hunspell_ru_ru_aot

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/hunspell_ru_ru_aot
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
