NAME     = cacert
TITLE	 = Bundle of CA Root Certificates
APP_ID   = com.nizovn.${NAME}
VERSION  = 2017-09-20
TYPE	 = Library
CATEGORY = System Utilities
HOMEPAGE = https://curl.haxx.se/docs/caextract.html
MAINTAINER = nizovn <nizovn@gmail.com>
MINWEBOSVERSION = 2.2.0
DESCRIPTION = Bundle of CA Root Certificates from Mozilla for usage in Qt5 based applications.

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p build/src/files
	curl --output build/src/files/cacert.pem https://curl.haxx.se/ca/cacert-${VERSION}.pem
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -f $@
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/
	cp -r build/src/* build/$*/usr/palm/applications/${APP_ID}/
	touch $@

clobber::
	rm -rf build
