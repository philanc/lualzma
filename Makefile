# lualzma
# ----------------------------------------------------------------------
# adjust the following to the location of your Lua directory
# or include files and executable

LUADIR= ../lua
LUAINC= -I$(LUADIR)/include
LUAEXE= $(LUADIR)/bin/lua

CC= gcc
AR= ar

CFLAGS= -Os -fPIC $(LUAINC) $(FUNCS)
LDFLAGS= -fPIC 

OBJS= lualzma.o Alloc.o LzFind.o LzmaDec.o LzmaEnc.o LzmaLib.o

all: lualzma.so

lualzma.so: lualzma.a
	$(CC) -shared -o lualzma.so $(LDFLAGS) lualzma.o lualzma.a
	strip lualzma.so
	rm -f *.o


lualzma.a: src/*.c src/lzma/*.c src/lzma/*.h
	$(CC) -c $(CFLAGS) src/*.c
	$(CC) -c $(CFLAGS)  -D_7ZIP_ST  src/lzma/*.c
	$(AR) rc lualzma.a $(OBJS)

test: test/test_lualzma.lua lualzma.so
	$(LUAEXE) test/test_lualzma.lua
	
clean:
	rm -f *.o *.a *.so *.dll *.so 

.PHONY: clean test

