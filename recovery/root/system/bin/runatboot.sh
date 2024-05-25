#!/sbin/bash
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
	local path1=/vendor/lib/modules/1.1;
	local path2=/lib/modules;
	local modules="focaltech_ts_i2c goodix_ts_9896";

	# loop through the touch modules
	for i in $modules
	do
		# check whether the module is already loaded
		local f=$(lsmod | grep $i);
		[ -n "$f" ] && return; # module is already loaded - return

		# try to load the module
		modprobe -d $path1 $i &> /dev/null || modprobe -d $path2 $i &> /dev/null;
		[ "$?" = "0" ] && return; # module is successfully loaded - return
	done
}

load_touch_drivers;
exit 0;
#
