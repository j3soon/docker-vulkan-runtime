# Vulkan Container Runtime

[<img src="https://img.shields.io/badge/dockerhub-image-important.svg?logo=docker">](https://hub.docker.com/r/j3soon/vulkan-runtime/tags)

Unofficial minimal dockerfile for vulkan runtime.

Prerequisites:
- [NVIDIA Driver](https://ubuntu.com/server/docs/nvidia-drivers-installation)
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

Build or pull image:

```sh
docker build . -t j3soon/vulkan-runtime
# or
docker pull j3soon/vulkan-runtime
```

Run:

```sh
xhost +local:docker
docker run --rm -it --runtime=nvidia --gpus all --network=host \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $HOME/.Xauthority:/root/.Xauthority \
    j3soon/vulkan-runtime bash
# in the container
vkcube
```

> Please note that the `--runtime=nvidia` flag is preferred but not required.

## References

- <https://gitlab.com/nvidia/container-images/opengl>
- <https://gitlab.com/nvidia/container-images/vulkan>
- <https://catalog.ngc.nvidia.com/orgs/nvidia/containers/isaac-sim/layers>
