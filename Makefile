PREFIX ?= /usr/local

all:
clean:

install:
	install -d $(DESTDIR)$(PREFIX)/lv2
	cp -rv *.lv2 $(DESTDIR)$(PREFIX)/lv2/
