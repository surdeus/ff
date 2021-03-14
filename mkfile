<mkconfig
MKSHELL = rc
TARG = exe/png2ff exe/ff2png exe/jpg2ff exe/ff2jpg exe/ff2pam exe/ff2ppm
HFILES = `{ls *.h}
CFILES = `{ls *.c}
OFILES = util.o ${CFILES:%.c=%.o}
GENOFILES = util.o
CFLAGS = $DEFS $INCS
LDFLAGS = $LIBS
all:VQ: $TARG
exe/%: %.o $GENOFILES
	$CC -o $target $LDFLAGS $prereq
%.o : %.c
	$CC -c -o $target $CFLAGS $prereq
install :V: install-$MKSHELL
install-rc :V: $TARG
	mkdir -p $EXEDIR
	cp -rf exe $EXEDIR/..
	files = `{basename -a `{ls exe}}
	chmod 0755 $EXEDIR/^$files
	cp -rf shr $SHRDIR/..
clean :V:
	rm -f $TARG $OFILES

