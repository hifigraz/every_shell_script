DESTDIR := "/usr"
all: 
	echo nothing to do

install:
	install ./_every_shell_script.sh ${DESTDIR}/bin/
