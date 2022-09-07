#!/bin/bash

# mkdir results
sudo docker run -it \
--gpus all \
-v /raid/data/dlrm/kaggle:/data_kaggle \
-v /raid/data/dlrm/preproc_kaggle:/code/input \
dlrm:test \
/bin/bash
