## Process this file with automake to produce Makefile.in

SUBDIRS = man

ACLOCAL_AMFLAGS = -I m4

AM_CPPFLAGS = -I$(top_builddir)

bin_PROGRAMS =

sbin_PROGRAMS = start-stop-parsec-daemon

start_stop_daemon_SOURCES = start-stop-parsec-daemon.c

start_stop_daemon_LDADD = $(SSD_LIBS)

