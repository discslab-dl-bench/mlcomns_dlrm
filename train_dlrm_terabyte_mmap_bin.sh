#!/bin/bash

TERABYTE_PROC_DIR="/raid/data/dlrm/terabyte_mmap_bin"

# Default output dir will be where this script is located
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )")
OUTPUT_DIR="${SCRIPT_DIR}/output"
mkdir -p $OUTPUT_DIR

#Change line 9 for choosing mounted dataset

num_gpus=${1:-8}
container_name=${2:-train_dlrm}
image_tag=${3:-latest}

sudo docker run -it --rm \
    --gpus $num_gpus \
    --name $container_name \
    -v $TERABYTE_PROC_DIR:/proc_data \
    -v $OUTPUT_DIR:/output \
    dlrm:$image_tag /bin/bash run_terabyte_mmap_bin.sh

