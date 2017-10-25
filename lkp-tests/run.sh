#!/bin/bash
set -e
set -o pipefail

ARG=$1
JOB_FILE="./jobs/${ARG}.yaml"

if [[ ! -f "$JOB_FILE" ]]; then
	echo "$JOB_FILE does not exist, please select a job that is in the jobs directory." 1>&2;
	exit 1
fi

echo "Installing dependencies for ${ARG}..."
lkp install "$JOB_FILE"

echo "Running ${ARG}..."
lkp run "$JOB_FILE"

echo "Getting result from ${ARG}..."
lkp stat
