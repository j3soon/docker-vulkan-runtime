FROM ubuntu:22.04

ENV NVIDIA_VISIBLE_DEVICES=all
ENV NVIDIA_DRIVER_CAPABILITIES=all

RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libgl1 vulkan-tools \
    && rm -rf /var/lib/apt/lists/*

RUN echo '{ \
    "file_format_version" : "1.0.0", \
    "ICD": { \
        "library_path": "libGLX_nvidia.so.0", \
        "api_version" : "1.3.194" \
    } \
}' | tee /etc/vulkan/icd.d/nvidia_icd.json
