
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
echo "---Start running dlrm with Terabyte dataset at $start_fmt---"

python dlrm_s_pytorch.py \
--use-gpu \
--memory-map \
--num-workers=32 \
--test-freq=10240 \
--data-sub-sample-rate=0.875 \
--arch-sparse-feature-size=64 \
--arch-mlp-bot="13-512-256-64" \
--arch-mlp-top="512-512-256-1" \
--max-ind-range=10000000 \
--data-generation=dataset \
--data-set=terabyte \
--raw-data-file=/data_terabyte/day \
--processed-data-file=/proc_data/terabyte_processed.npz \
--loss-function=bce \
--round-targets=True \
--learning-rate=0.1 \
--mini-batch-size=2048 \
--print-freq=2048 \
--print-time \
--test-mini-batch-size=16384 \
--mlperf-logging \
--mlperf-bin-loader \
--mlperf-bin-shuffle \
--test-num-workers=32 $dlrm_extra_option 2>&1

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "---End running dlrm at $end_fmt---"

cp /code/dlrm.log /mlperf_saving_spot

echo "done"
# report result
result=$(( $end - $start ))
echo "DLRM Training Finished using time: $result"
