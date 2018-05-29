NAME     = openssl
TITLE	 = Shared OpenSSL libs
APP_ID   = com.nizovn.${NAME}
SRC_VER  = 1.0.2o
VERSION  = 1.0.2o
TYPE	 = Linux Application
CATEGORY = Libraries
HOMEPAGE = https://www.openssl.org/
MAINTAINER = nizovn <nizovn@gmail.com>
ICON	 = http://www.webos-internals.org/images/a/ae/Icon_WebOSInternals_OpenSSL.png
MINWEBOSVERSION = 2.2.0
DEPENDS  = com.nizovn.glibc, com.nizovn.cacert
DEVICECOMPATIBILITY = [\"Pre3\",\"TouchPad\",\"Touchpad Go\"]

SRC_TGZ = http://www.openssl.org/source/openssl-${SRC_VER}.tar.gz

.PHONY: package
package: ipkgs/${APP_ID}_${VERSION}_armv7.ipk
include ../../support/package.mk

include ../../support/download.mk

.PHONY: unpack
unpack: build/.unpacked-${VERSION}

build/.unpacked-${VERSION}: ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	rm -rf build
	mkdir -p build/armv7
	tar -C build -xf ${DL_DIR}/${NAME}-${VERSION}.tar.gz
	mv build/${NAME}-${SRC_VER} build/src
	touch $@

.PHONY: build
build: build/.built-${VERSION}

build/.built-${VERSION}: build/armv7.built-${VERSION}
	touch $@

include ../../support/cross-compile.mk

build/%.built-${VERSION}: build/.unpacked-${VERSION}
	rm -rf build/$*
	( cd build/src ; \
	  CC=${CROSS_COMPILE_$*}gcc \
	  ./Configure shared no-zlib no-asm --openssldir=/media/cryptofs/apps/usr/palm/applications/com.nizovn.cacert/files linux-elf; \
	  ${MAKE} \
		AR="${CROSS_COMPILE_$*}ar r" RANLIB=${CROSS_COMPILE_$*}ranlib \
		clean all )
	mkdir -p build/$*/usr/palm/applications/${APP_ID}/lib
	install -m 755 build/src/*.so.1.0.0 build/$*/usr/palm/applications/${APP_ID}/lib/
	touch $@

clobber::
	rm -rf build
