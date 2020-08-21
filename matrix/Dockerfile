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