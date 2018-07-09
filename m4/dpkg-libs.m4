# Copyright © 2004 Scott James Remnant <scott@netsplit.com>
# Copyright © 2007 Nicolas François <nicolas.francois@centraliens.net>
# Copyright © 2006, 2009 Guillem Jover <guillem@debian.org>

# DPKG_LIB_SSD
# ------------
# Check for start-stop-daemon libraries.
AC_DEFUN([DPKG_LIB_SSD],
[AC_ARG_VAR([SSD_LIBS], [linker flags for start-stop-daemon])dnl
AC_CHECK_LIB([ihash], [ihash_create], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lihash"])
AC_CHECK_LIB([ps], [proc_stat_list_create], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lps"])
AC_CHECK_LIB([shouldbeinlibc], [fmt_past_time], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lshouldbeinlibc"])
AC_CHECK_LIB([kvm], [kvm_openfiles], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lkvm"])
AC_CHECK_LIB([parsec-base], [parsec_cur_caps_set], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lparsec-base"])
AC_CHECK_LIB([parsec-cap], [parsec_linux_capget], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lparsec-cap"])
AC_CHECK_LIB([parsec-mac], [pdp_set_pid], [SSD_LIBS="${SSD_LIBS:+$SSD_LIBS }-lparsec-mac"])
])# DPKG_LIB_SSD
