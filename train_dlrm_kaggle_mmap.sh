#!/bin/bash

DATA_DIR="/raid/data/dlrm/kaggle_mmap"

##This is the script that starts the dlrm container and runs run_in_container.sh
# Default output dir will be where this script is located
SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )")
OUTPUT_DIR="${SCRIPT_DIR}/output"
mkdir -p $OUTPUT_DIR

num_gpus=${1:-8}
container_name=${2:-train_dlrm}
image_tag=${3:-latest}

sudo docker run -it --rm --gpus $num_gpus --name $container_name \
-v $DATA_DIR:/data_kaggle \
-v $OUTPUT_DIR:/output \
dlrm:$image_tag /bin/bash run_kaggle_mmap.sh
