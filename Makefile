prefix ?= /usr/local
bindir = $(prefix)/bin

build:
		swift build -c release --disable-sandbox

install: build
		install ".build/release/imgrz" "$(bindir)"

uninstall:
		rm -rf "$(bindir)/imgrz"

clean:
		rm -rf .build