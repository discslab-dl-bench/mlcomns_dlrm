#!/bin/bash

##This is the script that starts the dlrm container and runs run_in_container.sh

#Change line 9 for choosing mounted dataset

# sudo docker run -it \
# --gpus all \
# --name train_explore \
# -v /raid/data/dlrm/kaggle:/data_kaggle \
# -v /raid/data/dlrm/dlrm_logs/runtime_logs:/code/input \
# -v /dl-bench/zhongjie/mlcomns_dlrm/output:/mlperf_saving_spot \
# dlrm:test \
# /bin/bash run_in_container.sh

sudo docker run -it \
--gpus all \
-v /raid/data/dlrm/kaggle:/data_kaggle \
-v /raid/data/dlrm/kaggle:/code/input \
-v /raid/data/dlrm/dlrm_logs/mlperf_logs:/mlperf_saving_spot \
-v /raid/data/dlrm/dlrm_logs/runtime_logs:/run_time_saving_spot \
dlrm:test \
/bin/bash run_in_container.sh