#!/bin/bash
set -e

if [ -f /opt/ros/$ROS_DISTRO/setup.bash ];
then
    source "/opt/ros/$ROS_DISTRO/setup.bash";
fi

if [ -f /ws_rmw_zenoh/install/setup.bash ];
then
    source "/ws_rmw_zenoh/install/setup.bash";
fi

if [ -f install/setup.bash ];
then
    source "install/setup.bash";
fi

if [ -f install/setup.bash ];
then
    source "install/local_setup.bash";
fi

exec "$@"
