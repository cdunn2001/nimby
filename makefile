NIM?=/home/cdunn2001/repo/gh/Nim/bin/nim

run: foo.exe
	./foo.exe
%.exe: %.nim
	${NIM} c --verbosity:0 -o:$@ $<
clean:
	git clean -fxdn
reclean:
	git clean -fxd
