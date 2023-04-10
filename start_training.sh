#!/bin/bash

TERABYTE_PROC_DIR="/raid/data/dlrm/terabyte_mmap_bin"

# Default output dir will be where this script is located
OUTPUT_DIR="/raid/data/dlrm/run_output"

SCRIPT_DIR=$(dirname -- "$( readlink -f -- "$0"; )")
LOGGING_DIR=
mkdir -p $OUTPUT_DIR

#Change line 9 for choosing mounted dataset

NUM_GPUS=${1:-8}
CONTAINER_NAME=${2:-train_dlrm}
LOGGING_DIR=${3:-"$SCRIPT_DIR/output"}
IMAGE_NAME=${4:-"dlrm:sleep"}
BATCH_SIZE=${5:-32768}
BATCH_SIZE_EVAL=${6:-16384}
NUM_BATCHES=${7:-32768}
NUM_BATCHES_EVAL=${8:-2048}
NUM_WORKERS=${9:-0}

if [[ ! -z $9 ]]
then
    echo "No binary shuffle!"
    EXTRA_OPTS=""
else
    EXTRA_OPTS="--mlperf-bin-shuffle"
fi

# Use this to pass stuff like --enable-profiling
# extra_opts="--enable-profiling"

docker run -it --rm \
    --gpus $NUM_GPUS \
    --name $CONTAINER_NAME \
    -v $TERABYTE_PROC_DIR:/proc_data \
    -v $LOGGING_DIR:/code/output \
    -v $OUTPUT_DIR:/code/ckpts \
    $IMAGE_NAME /bin/bash run_terabyte_mmap_bin.sh $BATCH_SIZE $BATCH_SIZE_EVAL $NUM_BATCHES $NUM_BATCHES_EVAL $NUM_WORKERS $EXTRA_OPTS

