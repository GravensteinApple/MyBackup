#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([MyBackup], [1.0], [leo.liyunzhu@pku.edu.cn])
AM_INIT_AUTOMAKE([MyBackup], [1.0])

# Checks for programs.
AC_CHECK_PROG(RSYNC,rsync,yes)
if test "x${RSYNC}" != "xyes"; then
    AC_MSG_ERROR([Please install rsync first!])
fi

AC_CHECK_PROG(CRONTAB,crontab,yes)
if test "x${CRONTAB}" != "xyes"; then
    AC_MSG_ERROR([Please install crontab first!])
fi

AC_CHECK_PROG(BASENAME,basename,yes)
if test "x${BASENAME}" != "xyes"; then
    AC_MSG_ERROR([Please install basename first!])
fi

AC_CHECK_PROG(GREP,grep,yes)
if test "x${GREP}" != "xyes"; then
    AC_MSG_ERROR([Please install grep first!])
fi

# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
