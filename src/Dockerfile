ARG BASE_IMAGE="ubuntu-desktop:latest"
FROM $BASE_IMAGE

ARG GNU_HC_VERSION="4.2.0"

USER root

ENV HOME=/home/kasm-default-profile
ENV STARTUPDIR=/dockerstartup
ENV INST_SCRIPTS=$STARTUPDIR/install
ENV NVIDIA_DRIVER_CAPABILITIES=graphics,compat32,utility,compute
WORKDIR $HOME

######### Customize Container Here ###########

# Install GNU HC
COPY ./install_gnu_hc.sh $INST_SCRIPTS/gnu_hc/
RUN bash $INST_SCRIPTS/gnu_hc/install_gnu_hc.sh && rm -rf $INST_SCRIPTS/gnu_hc/

# Custom startup script
COPY ./custom_startup.sh $STARTUPDIR/custom_startup.sh
RUN chmod 755 $STARTUPDIR/custom_startup.sh

# Update the desktop environment to be optimized for a single application
RUN cp $HOME/.config/xfce4/xfconf/single-application-xfce-perchannel-xml/* $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/
RUN cp /usr/share/extra/backgrounds/bg_kasm.png /usr/share/extra/backgrounds/bg_default.png
RUN apt-get remove -y xfce4-panel

######### End Customizations ###########

RUN chown 1000:0 $HOME

ENV HOME=/home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000