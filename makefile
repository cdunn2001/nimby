NIM?=nim

run: foo.exe
	./foo.exe
%.exe: %.nim
	${NIM} c --verbosity:0 -o:$@ $<
clean:
	git clean -fxdn
reclean:
	git clean -fxd
