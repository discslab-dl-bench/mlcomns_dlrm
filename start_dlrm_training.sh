#!/bin/bash

##This is the script that starts the dlrm container and runs run_in_container.sh

sudo docker run -it \
--gpus all \
-v /raid/data/dlrm/kaggle:/data_kaggle \
-v /raid/data/dlrm/preproc_kaggle:/code/input \
dlrm:test \
/bin/bash run_in_container.sh
