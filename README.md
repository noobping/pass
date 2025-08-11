# Pass Container

Run [`pass`](https://www.passwordstore.org/) inside a container.

## 📥 Pull the image

```sh
docker pull ghcr.io/noobping/pass:latest
```

## 🐳 Using with Docker

Add an alias to run `pass` via Docker:

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

## 🦭 Using with Podman

Add an alias to run `pass` via Podman:

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
