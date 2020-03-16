prefix ?= /usr/local
bindir = $(prefix)/bin

build:
		swift build -c release --disable-sandbox

install: build
		mkdir -p "$(bindir)"
		install ".build/release/imgrz" "$(bindir)/imgrz"

uninstall:
		rm -rf "$(bindir)/imgrz"

clean:
		rm -rf .build