DESTDIR := "/usr"
all: 
	echo nothing to do

install:
	mkdir -p ${DESTDIR}/bin/
	install  ./_every_shell_script.sh ${DESTDIR}/bin/
