# Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

ARG FROM_IMAGE_NAME=pytorch/pytorch:1.4-cuda10.1-cudnn7-runtime
FROM ${FROM_IMAGE_NAME}

ADD . /code
WORKDIR /code

RUN pip install -r requirements.txt

RUN git clone https://github.com/mlperf/logging.git mlperf-logging
RUN pip install --ignore-installed -e mlperf-logging

RUN pip install tensorboard
