
# pass container

Run pass in a container.

## Use it with Docker

Make a alias for pass:

```sh
alias pass='docker run --rm -it \
  --user $(id -u):$(id -g) \
  -e HOME=/home/app \
  -e GPG_TTY=$(tty) \
  -v "$HOME/.password-store:/home/app/.password-store" \
  -v "$HOME/.gnupg:/home/app/.gnupg" \
  -w /home/app \
  ghcr.io/noobping/pass:latest pass'
```

## Use it with Podman

Make a alias for pass:

```sh
alias pass='podman run --rm -it \
  --user $(id -u):$(id -g) \
  -e HOME=/home/app \
  -e GPG_TTY=$(tty) \
  -v "$HOME/.password-store:/home/app/.password-store:Z" \
  -v "$HOME/.gnupg:/home/app/.gnupg:Z" \
  -w /home/app \
  ghcr.io/noobping/pass:latest pass'
```
