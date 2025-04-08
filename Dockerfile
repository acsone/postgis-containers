ARG PG_MAJOR=17
ARG POSTGIS=3.5

FROM ghcr.io/cloudnative-pg/postgis:${PG_MAJOR}-${POSTGIS}

USER 0

# Install additional extensions
RUN set -xe; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		"postgresql-${PG_MAJOR}-pgvector" \
	; \
	rm -fr /tmp/* ; \
	rm -rf /var/lib/apt/lists/*;

USER 26
