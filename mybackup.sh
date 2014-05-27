#!/bin/bash

# settings and prework
source "/home/leo/Documents/MyBackup/mybackup.conf"

if [ ${backup%*/} = $backup ]; then
	backup=${backup}/
fi

if [ ${target%*/} = $target ]; then
	target=${target}/
fi

# push operation
if [ "$1" = "push" ]; then

	# date for this backup
	date=`date "+%Y-%m-%dT%H_%M_%S"`

	# check and create lockfile
	if [ -f "${target}lockfile" ]; then
		echo "Lockfile exists, backup stopped."
		exit 2
	else
		touch ${target}lockfile
	fi

	# create folders if neccessary
	if [ ! -e ${target}current ]; then
		mkdir ${target}current
	fi

	# rsync
	rsync \
		--archive \
		--xattrs \
		--human-readable \
		--delete \
		--link-dest=${target}current \
		--exclude-from $exclude \
		$backup \
		$target$date
	
	# backup complete
	rm -rf "${target}current"
	ln -s "$target$date" "${target}current"

	echo "Backup file on $date has been installed successfully."

	rm ${target}lockfile

	count_backup=0
	for i in `ls $target`; do
		if [ "$i" != "current" ]; then
			count_backup=$(($count_backup+1))

			if [ -e "$target$i/.backup" ]; then
				rm "$target$i/.backup"
			fi
		fi
	done

	if [ $count_backup -gt $number ]; then
		for i in `ls $target`; do
			rm -rf $target$i
			echo "Backup file on $i has been removed because it reaches the limit."
			break
		done
	fi
	
	touch "$target$date/.backup"
fi

# status operation
count=0
if [ "$1" = "status" ]; then
	echo "Current Backups:"
	echo "================================"
	for i in `ls $target`; do
		if [ "$i" != "current" ]; then
			
			echo -n $i

			if [ -e "$target$i/.backup" ]; then
				echo " [last rsync]"
			else
				echo
			fi

			count=$(($count+1))
		fi
	done
	echo "================================"
	echo "Total backups: $count"
fi

# restore operation
if [ "$1" = "restore" ]; then
	cp -r $target$2 ${backup%/*/}/
	rm -rf $backup
	mv ${backup%/*/}/$2 $backup

	echo "Backup file $2 restored successfully."

	for i in `ls $target`; do
		if [ "$i" != "current" ]; then
			if [ -e "$target$i/.backup" ]; then
				rm "$target$i/.backup"
			fi
		fi
	done

	touch $target$2/.backup
fi

#clean operation
if [ "$1" = "clean" ]; then
	rm -rf $target/*
fi
	


