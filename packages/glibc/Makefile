NAME     = glibc
TITLE	 = Glibc runtime libraries (linaro)
APP_ID   = com.nizovn.${NAME}
VERSION  = 4.8-2015.06-0
TYPE	 = Library
CATEGORY = System Utilities
HOMEPAGE = https://www.linaro.org
MAINTAINER = nizovn <nizovn@gmail.com>
ICON	 = https://upload.wikimedia.org/wikipedia/en/e/e7/Linaro_logo.png
MINWEBOSVERSION = 2.2.0
DESCRIPTION = Linaro glibc shared libraries (libstdc++, libc, etc.).<br>
CHANGELOG = \
4.8-2015.06-0: First public release

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

SRC_DIR = build/src
GCC_WEBOS_DIR = /home/nizovn/webos/qt5/qt5.9/gcc-linaro-4.8-2015.06-x86_64_arm-linux-gnueabi/arm-linux-gnueabi

build/.unpacked-${VERSION}:
	rm -rf build
	mkdir -p ${SRC_DIR}
	cp -r ${GCC_WEBOS_DIR}/libc/usr/lib ${SRC_DIR}
	cp ${SRC_DIR}/lib/ld-2.19-2014.08-1-git.so ${SRC_DIR}/lib/ld.so
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
