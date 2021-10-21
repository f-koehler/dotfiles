#!/bin/bash
set -euf

export LVBRANCH=rolling
yes no | bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)