#!/bin/bash

##This is the script that starts the dlrm container and runs run_in_container.sh

mkdir -p output

DATA_DIR="/raid/data/dlrm/kaggle_mmap"
OUTPUT_DIR="/dl-bench/lhovon/mlcomns_dlrm/output"

#Change line 9 for choosing mounted dataset

num_gpus=${1:-8}
container_name=${2:-train_dlrm}
image_tag=${3:-latest}

sudo docker run -it --rm --gpus $num_gpus --name $container_name \
-v $DATA_DIR:/data_kaggle \
-v $OUTPUT_DIR:/output \
dlrm:$image_tag /bin/bash run_kaggle_mmap.sh
