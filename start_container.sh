#!/bin/bash

mkdir -p output

DATA_DIR="/raid/data/dlrm/kaggle"
OUTPUT_DIR="/dl-bench/lhovon/mlcomns_dlrm/output"

#Change line 9 for choosing mounted dataset

num_gpus=${1:-8}
container_name=${2:-train_dlrm}
image_tag=${3:-latest}

sudo docker run -it --rm --gpus $num_gpus --name $container_name \
-v $DATA_DIR:/data_kaggle \
-v $OUTPUT_DIR:/output \
dlrm:$image_tag