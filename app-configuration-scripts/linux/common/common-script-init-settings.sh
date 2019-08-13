#! /usr/bin/bash

# some initial script setups
#
# errexit - script exits when command fails (to accept fail use || true)  // set -e
# pipefail - exit status of last command that threw non-zero exit code is returned
# xtrace - debugging trace # set -x
set -o errexit 
set -o pipefail
#set -o xtrace 