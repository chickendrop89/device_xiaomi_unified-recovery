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
    paths="/lib/modules /vendor/lib/modules/1.1";
    modules="focaltech_ts_i2c goodix_ts_9896";

    for module in $modules; do
		# Check if module is not loaded
        if ! lsmod | grep -q "$module"; then
            for path in $paths; do
 				modprobe -d "$path" "$module" >/dev/null 2>&1;
            done
        fi
    done
}

load_touch_drivers;
exit 0;
