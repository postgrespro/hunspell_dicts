EXTENSION = hunspell_ne_np
DATA = hunspell_ne_np--1.0.sql

DATA_TSEARCH = ne_np.affix ne_np.dict

REGRESS = hunspell_ne_np

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/hunspell_ne_np
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
