EXTENSION = hunspell_nn_no
DATA = hunspell_nn_no--1.0.sql

DATA_TSEARCH = nn_no.affix nn_no.dict

REGRESS = hunspell_nn_no

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/hunspell_nn_no
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
