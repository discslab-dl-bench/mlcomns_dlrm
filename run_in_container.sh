#!/bin/bash

# This is the file that serves as running the dlrm session on docker

if [[ $# == 1 ]]; then
    dlrm_extra_option=$1
else
    dlrm_extra_option=""
fi
#echo $dlrm_extra_option

# start timing
start=$(date +%s)
start_fmt=$(date +%Y-%m-%d\ %r)
echo "---Start running dlrm at $start_fmt---"

python dlrm_s_pytorch.py \
--use-gpu \
--arch-sparse-feature-size=16 \
--arch-mlp-bot="13-512-256-64-16" \
--arch-mlp-top="512-256-1" \
--data-generation=dataset \
--data-set=kaggle \
--raw-data-file=/data_kaggle/train.txt \
--processed-data-file=/data_kaggle/kaggleAdDisplayChallenge_processed.npz \
--loss-function=bce \
--round-targets=True \
--learning-rate=1.0 \
--mini-batch-size=2048 \
--print-freq=2048 \
--test-mini-batch-size=16384 \
--test-num-workers=16 $dlrm_extra_option 2>&1 | tee /code/input/run_kaggle.log

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "---End running dlrm at $end_fmt---"

echo "done"
# report result
result=$(( $end - $start ))
echo "DLRM Training Finished using time: $result"