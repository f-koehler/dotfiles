# dotfiles

Configuration for various programs and tools

[![Build Status](https://img.shields.io/github/workflow/status/f-koehler/dotfiles/lint)](https://github.com/f-koehler/dotfiles/actions)

## Installation

Install dotfiles with git:

- public access

  ```bash
  git clone https://github.com/f-koehler/dotfiles.git ~/.dotfiles
  ```

- private access

  ```bash
  git clone git@github.com:f-koehler/dotfiles.git ~/.dotfiles
  ```

## Deployment

To deploy this project run

```bash
ansible-playbook playbook.yml
```

## Dependencies

- `ansible`
- `bash`
- `curl`
- `git`
