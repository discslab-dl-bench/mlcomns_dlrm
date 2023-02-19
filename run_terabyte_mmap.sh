
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

# Reference run parameters!
python dlrm_s_pytorch.py --arch-sparse-feature-size=128 \
    --arch-mlp-bot="13-512-256-128" \
    --arch-mlp-top="1024-1024-512-256-1" \
    --max-ind-range=40000000 \
    --data-generation=dataset \
    --data-set=terabyte \
    --raw-data-file=/proc_data/day \
    --processed-data-file=/proc_data/day_0_reordered.npz \
    --loss-function=bce \
    --round-targets=True \
    --learning-rate=1.0 \
    --mini-batch-size=${BATCH_SIZE} \
    --test-mini-batch-size=${BATCH_SIZE_EVAL} \
    --num-batches=${NUM_BATCHES} \
    --num-batches-eval=${NUM_BATCHES_EVAL} \
    --print-freq=16384 \
    --print-time \
    --test-freq=16384 \
    --test-num-workers=16 
    --memory-map \
    --mlperf-logging \
    --mlperf-auc-threshold=0.8025 \
    --save-model=/code/output/dlrm.ckpt \
    --use-gpu $EXTRA_OPTS 2>&1

# end timing
end=$(date +%s)
end_fmt=$(date +%Y-%m-%d\ %r)
echo "---End running dlrm at $end_fmt---"

cp /code/dlrm.log /output/dlrm_tera.log

echo "done"
# report result
result=$(( $end - $start ))
echo "DLRM Training Finished using time: $result"
