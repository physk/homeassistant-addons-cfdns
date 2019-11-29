ARG BUILD_FROM=hassioaddons/base:5.0.2
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Copy root filesystem
COPY rootfs /

RUN chmod +x /etc/cont-init.d/* && \
    \
    mkdir -p /config && \
    \
    apk add bind-tools=9.14.8-r0

# Script to run after startup
CMD ["/app/run-cfdns.sh"]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2 CF_API=https://api.cloudflare.com/client/v4 RRTYPE=A
# Labels
LABEL \
    io.hass.name="CloudFlare DDNS" \
    io.hass.description="CloudFlare DDNS add-on by Community Hass.io Add-ons" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="PhysK" \
    org.label-schema.description="CloudFlare DDNS add-on by Community Hass.io Add-ons" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="CloudFlare DDNS" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://github.com/physk/homeassistant-addons-cfdns/blob/master/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/physk/homeassistant-addons-cfdns/" \
    org.label-schema.vendor="Community Hass.io Addons"
