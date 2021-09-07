#!/usr/bin/env bash
set -euo pipefail
cd ${ENV}
terraform init -input=false 