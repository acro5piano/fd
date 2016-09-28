# fd

Favorite directory using peco

# Usage

Add favorite directory:

```bash
% cd /home/k-gosho
% fd add

% cd /usr/local/bin
% fd add
```

Then execute `fd`:

```
% fd
```

Interactively select the directory which you want to move to:

```
  /home/k-gosho
> /usr/local/bin
```

## Available subcommands

    add      add the current directory to your favorite directory list.
    edit     edit your favorite directory list.
    list     show your favorite directory list.

# Install

```sh
antigen bundle acro5piano/fd
```
