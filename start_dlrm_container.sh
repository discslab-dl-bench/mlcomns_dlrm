#!/bin/bash

# mkdir results
docker run -it \
--gpus all \
# The following line determines which dataset to be used by the container
-v /raid/data/dlrm/kaggle_16GB_Case1:/data_kaggle \
-v $(pwd)/input:/code/input \
dlrm:test \
/bin/bash
