DESTDIR := "/usr"
all: 
	echo nothing to do

install:
	[ -e ${DESTDIR}/bin ] || mkdir -p ${DESTDIR}/bin/
	install  ./_every_shell_script.sh ${DESTDIR}/bin/_every_shell_script.sh
