FROM matrixdotorg/synapse
ENV SYNAPSE_SERVER_NAME=xingpeds.com
ENV SYNAPSE_REPORT_STATS=yes
ENV SYNAPSE_CONFIG_DIR=/config
ENV SYNAPSE_DATA_DIR=/data1
RUN mkdir /config
RUN chown 991:991 /config
RUN mkdir /data1
RUN chown 991:991 /data1
USER 991:991

RUN /start.py generate

FROM matrixdotorg/synapse
ENV SYNAPSE_CONFIG_DIR=/config
ENV SYNAPSE_DATA_DIR=/data1
COPY --from=0 /data1 /data1
COPY  --from=0 /config /config
COPY ./homeserver.yaml /config/homeserver.yaml
RUN chown -R 991:991 /data1
RUN chown -R 991:991 /config

# MIT License

# Copyright (c) 2020 Kyle McBurnett

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.        