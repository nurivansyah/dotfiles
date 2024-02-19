---
Automated development environment, inspired from TechDufus

## Goals

Provide fully automated `Zorin` or maybe any `Debian-based` development environment that is easy to set up and maintain.

### Why Ansible?

Ansible replicates what we would do to set up a development environment pretty well. There are many automation solutions out there - I happen to enjoy using Ansible.

## Requirements

### Operating System

This Ansible playbook only tested in `Zorin` distribution. This is by design to provide a consistent development experience across hosts.

### System Upgrade

Verify your `Zorin` installation has all latest packages installed before running the playbook.

```
sudo apt-get update && sudo apt-get upgrade -y
```

> NOTE: This will take some time.


## Usage

### Install

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nurivansyah/dotfiles/main/bin/dotfiles)"
```

### Update
```bash
dotfiles
```

update on specific role 
```bash
dotfiles -t [role-name]
```

exclude specific role from default list
```bash
dotfiles --skip-tags [role-name]
```
