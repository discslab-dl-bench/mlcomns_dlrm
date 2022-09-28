#!/bin/bash

##This is the script that starts the dlrm container and runs run_in_container.sh

#Change line 9 for choosing mounted dataset

# sudo docker run -it \
# --gpus all \
# -v /raid/data/dlrm/augmentation/kaggle/case_5x:/data_kaggle \
# -v /raid/data/dlrm/augmentation/kaggle/case_5x:/code/input \
# -v /raid/data/dlrm/dlrm_logs/mlperf_logs:/mlperf_saving_spot \
# -v /raid/data/dlrm/dlrm_logs/runtime_logs:/run_time_saving_spot \
# dlrm:test \
# /bin/bash unused/run_in_container.sh

sudo docker run -it \
--gpus all \
-m 256g \
-v /raid/data/dlrm/terabyte:/data_terabyte \
-v /raid/data/dlrm/terabyte:/code/input \
-v /raid/data/dlrm/proc_terabyte:/proc_data \
-v /raid/data/dlrm/dlrm_logs/mlperf_logs:/mlperf_saving_spot \
-v /raid/data/dlrm/dlrm_logs/runtime_logs:/run_time_saving_spot \
dlrm:test \
/bin/bash run_terabyte.sh
