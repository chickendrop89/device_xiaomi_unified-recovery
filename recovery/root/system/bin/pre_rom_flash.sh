#!/system/bin/sh
#
#	This file is part of the OrangeFox Recovery Project
# 	Copyright (C) 2024 The OrangeFox Recovery Project
#
#	OrangeFox is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or
#	any later version.
#
#	OrangeFox is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
# 	This software is released under GPL version 3 or any later version.
#	See <http://www.gnu.org/licenses/>.
#
# 	Please maintain this if you use this script or any part of it
#
#

LOGMSG() {
	echo "I:$1" >> /tmp/recovery.log;
}

do_prep() {
	directory=/data/cache/recovery/;

	if [ ! -d $directory ]; then
		LOGMSG "Creating $directory ...";
		mkdir -p $directory;
	fi

	directory=/metadata/ota/;
	mount /metadata 2>/dev/null;

	if [ -d $directory ]; then
		LOGMSG "Wiping $directory ...";
		rm -rf $directory;
	fi
}

backup_fox() {
	file=$1;

	if [ -f "$file" ]; then
		x=$(unzip -lq "$file" | grep "payload.bin");
		[ -n "$x" ] && return; # standard payload.bin - no need for a backup
	fi

	source="/dev/block/bootdevice/by-name/recovery";
	destination="/tmp/fox_backup.img";

	if [ ! -f $destination ]; then
		LOGMSG "Backing up OrangeFox to \"$destination\"...";
		dd bs=1048576 if=$source of=$destination >/dev/null 2>&1;
	fi
}

LOGMSG "Running pre-ROM-flash script...";
do_prep;
backup_fox "$@";
exit 0;
