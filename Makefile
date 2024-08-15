#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/android-cpu-temperature
DATA_DIR=$(DESTDIR)$(PREFIX)/share/android-cpu-temperature
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard android-cpu-temperature/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-android-cpu-temperature install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-android-cpu-temperature:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 android-cpu-temperature/android-cpu-temperature "$(BIN_DIR)"

.PHONY: check install install-doc install-cpu-temperature shellcheck
