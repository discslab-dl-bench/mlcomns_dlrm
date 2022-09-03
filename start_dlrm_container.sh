#!/bin/bash

mkdir results
docker run -it --gpus all -v results:/code/results dlrm:test /bin/bash
