#!/bin/bash

sudo docker run -it \
--gpus all \
-v /data/zwu/kaggle_aug_2x:/data_kaggle \
-v /data/zwu/kaggle_aug_2x/preproc:/code/input \
-v /data/zwu/dlrm/output:/mlperf_saving_spot \
dlrm:debug \
/bin/bash
