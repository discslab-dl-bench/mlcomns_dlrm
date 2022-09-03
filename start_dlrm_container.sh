#!/bin/bash

# mkdir results
docker run -it --gpus all -v /raid/data/dlrm/kaggle:/data_kaggle dlrm:test /bin/bash
