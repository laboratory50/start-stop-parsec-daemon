# Process this file with autoconf to produce a configure script.

m4_pattern_forbid([^_?DPKG_])

AC_PREREQ(2.60)
AC_INIT([parsec-daemon], [0.1], [team@lab50.net])
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])

AC_USE_SYSTEM_EXTENSIONS

AM_INIT_AUTOMAKE([foreign nostdinc no-dist-gzip dist-xz])

m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])],
                            [AC_SUBST([AM_DEFAULT_VERBOSITY], [1])])

# Checks for programs.
AC_PROG_CC
AC_PROG_CXX
AC_PROG_RANLIB

# Checks for operating system services and capabilities.
AC_SYS_LARGEFILE

# Checks for libraries.
DPKG_LIB_SSD

# Checks for header files.
AC_HEADER_STDC
AC_CHECK_HEADERS([stddef.h error.h libintl.h kvm.h \
                  sys/syscall.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_C_BIGENDIAN
AC_C_CONST
AC_C_INLINE
AC_C_VOLATILE
DPKG_C_C99
AC_TYPE_MODE_T
AC_TYPE_PID_T
AC_TYPE_SIZE_T
DPKG_TYPES_U_INT_T
DPKG_TYPE_PTRDIFF_T
AC_CHECK_SIZEOF([unsigned int])
AC_CHECK_SIZEOF([unsigned long])
DPKG_DECL_SYS_SIGLIST

# Checks for library functions.
DPKG_CHECK_DECL([offsetof], [stddef.h])
DPKG_CHECK_DECL([WCOREDUMP], [sys/wait.h])
DPKG_CHECK_DECL([TIOCNOTTY], [sys/ioctl.h])
DPKG_CHECK_DECL([O_NOFOLLOW], [fcntl.h])
DPKG_CHECK_PROGNAME
DPKG_CHECK_COMPAT_FUNCS([getopt getopt_long \
                         strnlen strndup strerror strsignal asprintf ])
AC_CHECK_DECLS([strnlen], [[#include <string.h>]])
AC_CHECK_FUNCS([memcpy lchown],
               [], [AC_ERROR([missing required function])])
AC_CHECK_FUNCS([setsid getdtablesize])

DPKG_MMAP

# Checks for the build machinery.
AC_DEFINE(LIBDPKG_VOLATILE_API, 1, [Acknowledge the volatility of the API.])
DPKG_COMPILER_WARNINGS
DPKG_COMPILER_OPTIMISATIONS
DPKG_LINKER_OPTIMISATIONS

AC_CONFIG_FILES([ Makefile
		  man/Makefile ])
AC_CONFIG_HEADERS([config.h])
AC_OUTPUT
