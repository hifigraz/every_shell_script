DESTDIR := "/usr"
all: 
	echo nothing to do

install:
	[ -e ${DESTDIR}/bin ] || mkdir -p ${DESTDIR}/bin/
	[ -e ${DESTDIR}/share/every_shell_script ] || mkdir -p ${DESTDIR}/share/every_shell_script
	install -d ./src ${DESTDIR}
	install ./src/bin/* ${DESTDIR}/bin/
	install ./src/share/every_shell_script/* ${DESTDIR}/share/every_shell_script/
