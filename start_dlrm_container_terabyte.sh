#!/bin/bash

# mkdir results
# sudo docker run -it \
# --gpus all \
# -v /raid/data/dlrm/kaggle:/data_kaggle \
# -v /raid/data/dlrm/dlrm_logs/runtime_logs:/code/input \
# -v /dl-bench/zhongjie/mlcomns_dlrm/output:/mlperf_saving_spot \
# dlrm:test \
# /bin/bash

# sudo docker run -it \
# --gpus all \
# -v /raid/data/dlrm/augmentation/kaggle/case2:/data_kaggle \
# -v /raid/data/dlrm/dlrm_logs/runtime_logs:/code/input \
# -v /dl-bench/zhongjie/mlcomns_dlrm/output:/mlperf_saving_spot \
# dlrm:test \
# /bin/bash

sudo docker run -it \
--gpus all \
-v /raid/data/dlrm/terabyte_mmap:/data_terabyte \
-v /raid/data/dlrm/terabyte_mmap_bin:/code/input \
-v /raid/data/dlrm/terabyte_mmap_bin:/proc_data \
-v /raid/data/dlrm/dlrm_logs/runtime_logs:/run_time_saving_spot \
dlrm:test \
/bin/bash
