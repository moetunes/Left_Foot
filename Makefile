CFLAGS+= -g -std=c99 -pedantic -Wall
LDADD+= -lX11 -lXinerama
LDFLAGS=
EXEC=left_foot

PREFIX?= /usr/local
BINDIR?= $(PREFIX)/bin

CC=gcc

all: $(EXEC)

left_foot: left_foot.o
	$(CC) $(LDFLAGS) -s -O2 -ffast-math -fno-unit-at-a-time -o $@ $+ $(LDADD)

install: all
	install -Dm 755 left_foot $(DESTDIR)$(BINDIR)/left_foot

clean:
	rm -fv left_foot *.o

