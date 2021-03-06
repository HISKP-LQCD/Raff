AC_INIT([Raff],[0.1],[bartosz_kostrzewa@fastmail.com],[],[https://github.com/HISKP-LQCD/Raff])

AC_PROG_CC_C99
AC_HEADER_STDC

dnl large file support is required to open files larger than 2GB
AC_SYS_LARGEFILE

dnl aff stores everything big-endian and automatically returns the right bit-ordering
dnl In case we find platform dependencies down the line, we check for host system
dnl endianness here and define a preprocessor constant below as a marker.
AC_C_BIGENDIAN

dnl $WORDS_BIGENDIAN will have zero length when on a little-endian machine
if test -z "$WORD_BIGENDIAN"; then
  CFLAGS+=" -DRAFF_LITTLE_ENDIAN"
fi

dnl we use openmp to parallelise over keys, so we need to find the correct CFLAGS 
AC_OPENMP()
CFLAGS+=" $OPENMP_CFLAGS"

AC_CHECK_PROGS(LHPC_AFF_CONFIG, lhpc-aff-config)

if test -n "$LHPC_AFF_CONFIG"; then
  dnl lhpc-aff-config produces rather annoying output, but we can clean it up like this
  dnl note that we need double square brackets to make sure that m4 doesn't mangle the sed call
  aff_version=$( ${LHPC_AFF_CONFIG} --version | sed 's/[[^0-9.]]//g' | sed 's/^.//g')
  AC_MSG_CHECKING([lhpc-aff version >= 2.1.0])
  AX_COMPARE_VERSION([$aff_version],[ge],[2.1.0],[AC_MSG_RESULT([found lhpc-aff $aff_version])],[AC_MSG_ERROR([no - $aff_version found, cannot continue!])])

  dnl BaKo: add the required CFLAGS and define the availability of AFF
  dnl BaKo: the latter is not strictly necessary, but I've kept the #ifdefs
  dnl BaKo: that were in the code by marcuspe
  CFLAGS+=" $( ${LHPC_AFF_CONFIG} --cflags )"
  LDFLAGS+=" $( ${LHPC_AFF_CONFIG} --libs )"
  LDFLAGS+=" $( ${LHPC_AFF_CONFIG} --ldflags )"
else
  AC_MSG_ERROR([lhpc-aff-config not found in path, cannot proceed.
                Please install aff from github.com/usqcd-software/aff
                and make sure that lphc-aff-config is installed somewhere
                in your PATH])
fi

# the R build system reads these from the file "Makevars" in the source directory
echo "PKG_LIBS=${LDFLAGS}" > src/Makevars
echo "PKG_LDFLAGS=${LDFLAGS}" >> src/Makevars
echo "PKG_CFLAGS=${CFLAGS}" >> src/Makevars

AC_OUTPUT()

