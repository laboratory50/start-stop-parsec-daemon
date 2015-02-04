# Copyright © 2005 Scott James Remnant <scott@netsplit.com>
# Copyright © 2008, 2009 Guillem Jover <guillem@debian.org>

# DPKG_MMAP
# ---------
# Define USE_MMAP if mmap() is available and it was requested
AC_DEFUN([DPKG_MMAP],
[
  AC_ARG_ENABLE([mmap],
    AS_HELP_STRING([--enable-mmap],
                   [enable usage of unrealiable mmap if available]),
    [],
    [enable_mmap=no])

  AS_IF([test "x$enable_mmap" = "xyes"], [
    AC_CHECK_FUNCS([mmap])
    AC_DEFINE(USE_MMAP, 1, [Use unreliable mmap support])
  ])
])

# DPKG_CHECK_PROGNAME
# -------------------
# Check for system implementations of program name tracking.
AC_DEFUN([DPKG_CHECK_PROGNAME],
[
  AC_MSG_CHECKING([for program_invocation_short_name])
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <errno.h>]],
                 [[const char *p = program_invocation_short_name;]])],
                 [AC_DEFINE([HAVE_PROGRAM_INVOCATION_SHORT_NAME], [1],
                            [Define to 1 if you have program_invocation_short_name])
                  AC_MSG_RESULT([yes])],
                 [AC_MSG_RESULT([no])])

  AC_MSG_CHECKING([for __progname])
  AC_LINK_IFELSE([AC_LANG_PROGRAM([[]],
                 [[extern char *__progname;
                   const char *p = __progname;]])],
                 [AC_DEFINE([HAVE___PROGNAME], [1],
                            [Define to 1 if you have __progname])
                  AC_MSG_RESULT([yes])],
                 [AC_MSG_RESULT([no])])
]) # DPKG_CHECK_PROGNAME

# DPKG_CHECK_COMPAT_FUNCS(LIST)
# -----------------------
# Check each function and define an automake conditional
AC_DEFUN([DPKG_CHECK_COMPAT_FUNCS],
[
  AC_CHECK_FUNCS([$1])
  m4_foreach_w([ac_func], [$1], [
    AM_CONDITIONAL(HAVE_[]AS_TR_CPP(ac_func),
                   [test "x$ac_cv_func_[]AS_TR_SH(ac_func)" = "xyes"])
  ])
]) # DPKG_CHECK_COMPAT_FUNCS
