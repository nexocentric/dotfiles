# dotfiles
My dotfiles

# Installation

```bash
curl -sL https://api.github.com/repos/nexocentric/dotfiles/releases | grep tarball_url | sed -r "s/.*(https.*v[.0-9]*).*/\1/gi" | xargs wget -O dotfiles.tar.gz | mkdir dotfiles && tar xf dotfiles.tar.gz -C dotfiles --strip-components 1
```
