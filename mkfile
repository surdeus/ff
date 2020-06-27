<mkconfig
MKSHELL = rc
TGT = png2ff ff2png jpg2ff ff2jpg ff2pam ff2ppm
HDR = `{ls *.h}
SRC = `{ls *.c}
OBJ = util.o ${SRC:%.c=%.o}
REQ = util.o
all:VQ: $TGT
	echo -n
%: %.o $REQ
	$CC -o $target $LDFLAGS $prereq
%.o : %.c
	$CC -c -o $target $CFLAGS $prereq
install :V: $TGT
	cp -f $TGT $BIN/
	chmod 0755 $BIN/^($TGT)
clean :V:
	rm -f $TGT $OBJ
uninstall :V:
	rm -f $BIN/^($TGT)
