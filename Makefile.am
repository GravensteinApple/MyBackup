AUTOMAKE_OPTIONS = foreign

install-exec-am:
	cp mybackup /usr/local/bin/
	chmod +x /usr/local/bin/mybackup
	[ -d /usr/local/etc/MyBackup ] || mkdir /usr/local/etc/MyBackup
	cp mybackup.conf /usr/local/etc/MyBackup/
	cp exclude.conf /usr/local/etc/MyBackup/

install-data-am:
	[ -d /usr/local/share/doc ] || mkdir /usr/local/share/doc
	[ -d /usr/local/share/doc/MyBackup ] || mkdir /usr/local/share/doc/MyBackup
	cp doc/MyBackup.html /usr/local/share/doc/MyBackup/
	cp doc/Mybackup.pdf /usr/local/share/doc/MyBackup/

uninstall:
	[ -f /usr/local/bin/mybackup ] && rm -rf /usr/local/bin/mybackup
	[ -d /usr/local/etc/MyBackup ] && rm -rf /usr/local/etc/MyBackup
	[ -d /usr/local/share/doc/MyBackup ] && rm -rf /usr/local/share/doc/MyBackup
