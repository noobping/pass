[![Build & Publish](https://github.com/noobping/pass/actions/workflows/docker.yml/badge.svg?branch=main)](https://github.com/noobping/pass/actions/workflows/docker.yml)

# Pass Container

Run [`pass`](https://www.passwordstore.org/) inside a container.

Pull the image:

```sh
podman pull ghcr.io/noobping/pass:latest
```

And add an alias to run `pass`:

```sh
alias pass='podman run --rm -it \
  --userns=keep-id \
  --user $(id -u):$(id -g) \
  -e HOME=/home/app \
  -e GPG_TTY=$(tty) \
  -e PASSWORD_STORE_DIR=/home/app/.password-store \
  -e PASSWORD_STORE_PAGER=cat \
  -e PAGER=cat \
  -v "$HOME/.password-store:/home/app/.password-store:Z" \
  -v "$HOME/.gnupg:/home/app/.gnupg:Z" \
  -w /home/app \
  ghcr.io/noobping/pass:latest'
```
