EXTENSION = hunspell_pt_pt
DATA = hunspell_pt_pt--1.0.sql

DATA_TSEARCH = pt_pt.affix pt_pt.dict portuguese.stop

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/hunspell_pt_pt
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
