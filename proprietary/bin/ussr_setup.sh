#!/system/bin/sh

# Copyright (c) 2013-2014, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# loop through thermal zones
for tz in /sys/class/thermal/thermal_zone*
do
    chown system ${tz}/type
    chmod 0444 ${tz}/type
    chown system ${tz}/temp
    chmod 0444 ${tz}/temp

    # loop through trip points
    for tp in $tz/trip_point_[0-9]*temp
    do
        if [ -e $tp ]
        then
            chown system $tp
            chmod 0664 $tp
        fi
    done
done
