#!/bin/bash

##This is the script that starts the dlrm container and runs run_in_container.sh

docker run -it \
--gpus all \
-v /raid/data/dlrm/kaggle_16GB_Case1:/data_kaggle \
-v $(pwd)/input:/code/input \
dlrm:test \
/bin/bash run_in_container.sh
