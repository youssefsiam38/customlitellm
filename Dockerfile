FROM ghcr.io/berriai/litellm-database:main-latest

RUN sed -i.bak 's/MAX_STRING_LENGTH = 1000$/MAX_STRING_LENGTH = 100000/' \
    /app/litellm/proxy/spend_tracking/spend_tracking_utils.py && \
    cmp -s /app/litellm/proxy/spend_tracking/spend_tracking_utils.py{.bak,} && exit 1 || true
RUN cd /app && pip install .