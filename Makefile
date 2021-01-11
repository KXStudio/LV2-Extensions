PREFIX ?= /usr/local

all:
clean:

install:
	install -d $(DESTDIR)$(PREFIX)/lib/lv2
	cp -rv kx-* $(DESTDIR)$(PREFIX)/lib/lv2/
