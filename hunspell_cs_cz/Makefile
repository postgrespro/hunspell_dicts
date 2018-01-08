EXTENSION = hunspell_cs_cz
DATA = hunspell_cs_cz--1.0.sql

DATA_TSEARCH = cs_cz.affix cs_cz.dict czech.stop

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/hunspell_cs_cz
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
