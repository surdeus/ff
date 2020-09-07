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
	mkdir -p $BIN $MAN/^(1 5)
	cp -f $TGT $BIN/ 
	cp -f $FFCONVFILE $BIN/$FFCONVNAME
	cp -f webp2ff.rc $BIN/webp2ff
	chmod 0755 $BIN/^($TGT 2ff webp2ff)
	for(i in $TGT)
		cp -f $i-man $MAN/1/$i
	cp -f farbfeld-man $MAN/5/farbfeld
	chmod 0644 $MAN/1/^($TGT) $MAN/5/farbfeld
clean :V:
	rm -f $TGT $OBJ
uninstall :V:
	rm -f $BIN/^($TGT)
