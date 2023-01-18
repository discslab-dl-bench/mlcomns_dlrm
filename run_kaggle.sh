#!/bin/bash

# This is the file that serves as running the dlrm session on docker

batch_size=${1:-16384}

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "---Start running dlrm at $start_fmt---"

python dlrm_s_pytorch.py \
--use-gpu \
--dataset-multiprocessing \
--arch-sparse-feature-size=16 \
--arch-mlp-bot="13-512-256-64-16" \
--arch-mlp-top="512-256-1" \
--data-generation=dataset \
--data-set=kaggle \
--raw-data-file=/data_kaggle/train.txt \
--processed-data-file=/data_kaggle/kaggleAdDisplayChallenge_processed.npz \
--loss-function=bce \
--round-targets=True \
--learning-rate=0.1 \
--mini-batch-size=$batch_size \
--print-freq=1024 \
--test-freq=1024 \
--test-mini-batch-size=$batch_size \
--mlperf-logging \
--mlperf-bin-shuffle \
--debug-mode \
--log-file=/output/app.log

cp /code/dlrm.log /output

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "---End running dlrm at $end_fmt---"

echo "done"
# report result
result=$(( $end - $start ))
echo "DLRM Training Finished using time: $result"