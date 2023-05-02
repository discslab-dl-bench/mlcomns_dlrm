#!/bin/bash

SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )")

# TERABYTE_PROC_DIR="/raid/data/dlrm/terabyte_mmap_bin"
DATA_DIR="/dl-bench/lhovon/mlcomns_dlrm/data"

# Default output dir will be where this script is located
OUTPUT_DIR="/raid/data/dlrm/run_output"

LOGGING_DIR=${3:-"$SCRIPT_DIR/output"}

NUM_GPUS=${1:-8}
CONTAINER_NAME=${2:-train_dlrm}
IMAGE_NAME=${4:-dlrm:original}
BATCH_SIZE=${5:-32768}
BATCH_SIZE_EVAL=${6:-16384}
NUM_BATCHES=${7:-32768}
NUM_BATCHES_EVAL=${8:-2048}


docker run -it --rm --gpus $NUM_GPUS --name $CONTAINER_NAME \
    -v $DATA_DIR:/proc_data \
    -v $LOGGING_DIR:/code/output \
    -v $OUTPUT_DIR:/code/ckpts \
    $IMAGE_NAME /bin/bash run_terabyte_mmap_bin.sh $BATCH_SIZE $BATCH_SIZE_EVAL $NUM_BATCHES $NUM_BATCHES_EVAL

