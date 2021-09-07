#!/usr/bin/env bash
set -euo pipefail
cd ${ENV}
terraform plan -input=false -out ${BUILD_BUILDNUMBER}.tfplan