alias

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
