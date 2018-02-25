# NVIDIA Xorg VirtualGL Docker Images
Render OpenGL to NVIDIA headless Xorg inside a Docker container and forward to your remote X server using VirtualGL


## Requirements

* Linux machine with NVIDIA GPU and drivers
* Docker
* [nvidia-docker](https://github.com/NVIDIA/nvidia-docker)
* [VirtualGL](https://www.virtualgl.org/) client
* X server on client machine

## Build

```
$ docker build -t nvidia-xorg-virtualgl-docker .
```

## Run

```
$ ./run.sh YOUR-DOCKER-ARGS nvidia-xorg-virtualgl-docker vglrun YOUR-GUI-APP
```

This will launch an internal Xorg server at headless display :0 where VirtualGL renders the OpenGL content
and forwards already rendered OpenGL content to remote X server connected via VirtualGL's `vglconnect` SSH tunnel.