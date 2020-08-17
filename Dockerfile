FROM alpine

RUN apk add --no-cache git \
	&& git config --system user.email "bot@foundries.io" \
	&& git config --system user.name "CI Bot"


ENTRYPOINT ["/entrypoint.sh"]

COPY entrypoint.sh /entrypoint.sh
