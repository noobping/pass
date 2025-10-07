FROM alpine:latest
RUN apk add --no-cache bash gnupg pinentry-tty git pass pass-otp findutils sed tree

ARG USERNAME=app
ARG UID=1000
ARG GID=1000
RUN addgroup -g ${GID} ${USERNAME} \
 && adduser -D -u ${UID} -G ${USERNAME} -h /home/${USERNAME} ${USERNAME}

RUN printf '%s\n' \
  '#!/usr/bin/env bash' \
  'set -euo pipefail' \
  'export HOME=${HOME:-/home/'"${USERNAME}"'}' \
  'export GPG_TTY=$(tty || true)' \
  'gpgconf --create-socketdir >/dev/null 2>&1 || true' \
  'export PINENTRY_USER_DATA=tty' \
  'exec pass "$@"' \
  > /usr/local/bin/entry && chmod +x /usr/local/bin/entry

USER ${USERNAME}
WORKDIR /home/${USERNAME}

ENTRYPOINT ["/usr/local/bin/entry"]
