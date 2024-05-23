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

load_touch_drivers() {
	# try focaltech_ts
	local f=$(lsmod | grep focaltech_ts_i2c);
	[ -n "$f" ] && return; # focaltech_ts is loaded - return

	# try to load the focaltech_ts module
	modprobe -d /lib/modules focaltech_ts_i2c;
	[ "$?" = "0" ] && return; # focaltech_ts is loaded - return

	# try goodix_ts
	f=$(lsmod | grep modules goodix_ts_9896);	
	[ -n "$f" ] && return; # goodix_ts is loaded - return
	
	# try to load the goodix_ts module
	modprobe -d /lib/modules goodix_ts_9896;
}

load_touch_drivers;
exit 0;
#
