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
CFLAGS = $CPPFLAGS
%.o : %.c
	$CC -c -o $target $CFLAGS $prereq
install :V: $TGT
	mkdir -p $EXE $MAN/^(1 5)
	cp -f $TGT $SCRIPT $EXE/ 
	chmod 0755 $EXE/^($TGT $SCRIPT)
	for(i in $TGT)
		cp -f $i-man $MAN/1/$i
	cp -f farbfeld-man $MAN/5/farbfeld
	chmod 0644 $MAN/1/^($TGT) $MAN/5/farbfeld
clean :V:
	rm -f $TGT $OBJ
uninstall :V:
	rm -f $EXE/^($TGT)
