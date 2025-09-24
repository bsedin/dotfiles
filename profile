export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL=
export LANGUAGE=en_US:en_GB:en

export TIMELOG=$HOME/.work-ledger/ledger/timelogger.ldg
export TERMINAL=foot
export XTERM=foot
export EDITOR=nvim
export BROWSER=browser

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=/run/user/1000
export DOCKER_HOST=unix:///var/run/docker.sock
export WINEFSYNC=1
export SUDO_ASKPASS=/usr/bin/ssh-askpass-fullscreen

# OG
# export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/glvnd/egl_vendor.d/10_nvidia.json
# wayland
# export __EGL_VENDOR_LIBRARY_FILENAMES=/usr/share/egl/egl_external_platform.d/10_nvidia_wayland.json
# export __GLX_VENDOR_LIBRARY_NAME=nvidia
# export GBM_BACKEND=nvidia-drm
# export NVD_BACKEND=direct
# export WLR_DRM_DEVICES=/dev/dri/card0:/dev/dri/card1
# export DRI_PRIME=0

# pass
export PASSWORD_STORE_CLIP_TIME=10

export GOPATH=$HOME/go

# ssh agent
ssh-add -l > /dev/null 2>&1
if [ "$?" == 2 ]; then
  test -r $HOME/.ssh-agent && eval "$(<$HOME/.ssh-agent)" > /dev/null 2>&1

  ssh-add -l > /dev/null 2>&1
  if [ "$?" == 2 ]; then
    (umask 066; ssh-agent >| $HOME/.ssh-agent)
    eval "$(<$HOME/.ssh-agent)" > /dev/null
    ssh-add
  fi
fi

if [ -d $GOPATH/bin ] ; then
  export PATH="$GOPATH/bin:$PATH"
fi

if [ -d $HOME/.cargo/bin ] ; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [ -d $HOME/.rbenv/bin ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
fi

if [ -d $HOME/.ruby/bin ] ; then
  export PATH="$HOME/.ruby/bin:$PATH"
fi

if [ -d $HOME/.local/bin ] ; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d $HOME/bin ] ; then
  export PATH="$HOME/bin:$PATH"
fi

if [ -d $HOME/.nimble/bin ] ; then
  export PATH="$HOME/.nimble/bin:$PATH"
fi

if [ -d $HOME/.nvm ] ; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
fi
