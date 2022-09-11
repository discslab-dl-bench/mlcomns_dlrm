#!/bin/bash

# mkdir results
sudo docker run -it \
--gpus all \
-v /raid/data/dlrm/kaggle:/data_kaggle \
-v /raid/data/dlrm/dlrm_logs/runtime_logs:/code/input \
-v /dl-bench/zhongjie/mlcomns_dlrm/output:/mlperf_saving_spot \
dlrm:test \
/bin/bash
