#!/bin/bash

mkdir -p output

TERABYTE_DIR="/raid/data/dlrm/terabyte"
TERABYTE_PROC_DIR="/raid/data/dlrm/proc_terabyte"
OUTPUT_DIR="/dl-bench/lhovon/mlcomns_dlrm/output"

#Change line 9 for choosing mounted dataset

num_gpus=${1:-8}
container_name=${2:-train_dlrm}
image_tag=${3:-latest}


sudo docker run -it \
    --gpus $num_gpus \
    -v $TERABYTE_DIR:/data_terabyte \
    -v $TERABYTE_PROC_DIR:/proc_data \
    -v $OUTPUT_DIR:/mlperf_saving_spot \
    dlrm:$image_tag /bin/bash

