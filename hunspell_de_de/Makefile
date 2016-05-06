EXTENSION = hunspell_de_de
DATA = hunspell_de_de--1.0.sql

DATA_TSEARCH = de_de.affix de_de.dict

REGRESS = hunspell_de_de

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/hunspell_de_de
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
