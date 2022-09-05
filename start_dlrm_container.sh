#!/bin/bash

# mkdir results
docker run -it \
--gpus all \
-v /raid/data/dlrm/kaggle_16GB_Case1:/data_kaggle \
-v $(pwd)/input:/code/input \
dlrm:test \
/bin/bash
