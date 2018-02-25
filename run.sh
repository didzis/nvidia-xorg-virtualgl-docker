#!/bin/bash

args=(
	# VirtualGL and Xorg forwarding settings
	-e VGL_COMPRESS=0
	-e VGL_VERBOSE=1
	# -e VGL_LOGO=1
	# -e LIBGL_DEBUG=verbose
	-e DISPLAY
	-v $HOME/.Xauthority:/root/.Xauthority
	# --privileged
	--device=/dev/dri/card0
	--device=/dev/tty10:rw
	--net=host 
	-v /usr/lib/xorg/modules/drivers/nvidia_drv.so:/usr/lib/xorg/modules/drivers/nvidia_drv.so
	-v `ls -1 /usr/lib/xorg/modules/extensions/libglx.so.*|head -n1`:/usr/lib/xorg/modules/extensions/libglx.so
)
for f in \
	/usr/lib/x86_64-linux-gnu/libGL*.so* \
	/usr/lib/x86_64-linux-gnu/libnvidia*.so* \
	/usr/lib/x86_64-linux-gnu/tls/*.so* \
; do
	[ ! -f "$f" ] && continue
	[ -L "$f" ] && continue
	args=("${args[@]}" -v $f:$f)
done

nvidia-docker run "${args[@]}" "$@"
