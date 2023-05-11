#!/bin/bash

date >> ~/nil/firewall.update.on.login.log
source ~/dev/dotfiles/mosh/2_on_startup_setup_firewall.sh >> ~/nil/firewall.update.on.login.log
