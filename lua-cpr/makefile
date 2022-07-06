EXT=-lcpr 
DEF=

use_net=no

ifeq ($(use_net), yes) 
	DEF := -DNET_ENABLED
endif

all:
	g++ src/cprlua.cpp -fPIC -shared $(EXT) $(DEF)  -o cpr.so
