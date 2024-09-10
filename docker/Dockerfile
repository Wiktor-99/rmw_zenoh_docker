FROM osrf/ros:iron-desktop
ARG ROS_DISTRO=iron
ARG USERNAME=ros
ARG USER_UID=1000
ARG USER_GID=$USER_UID

SHELL ["/bin/bash", "-c"]
ENV DEBIAN_FRONTEND=noninteractive
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN mkdir /ws_rmw_zenoh/src -p && \
    cd /ws_rmw_zenoh/src && \
    git clone https://github.com/ros2/rmw_zenoh.git && \
    cd /ws_rmw_zenoh && \
    rosdep install --from-paths src --ignore-src --rosdistro $ROS_DISTRO -y && \
    source /opt/ros/$ROS_DISTRO/setup.bash && \
    colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
ENV DEBIAN_FRONTEND=dialog

COPY ./ros_entrypoint.sh /
ENTRYPOINT ["bash", "/ros_entrypoint.sh"]