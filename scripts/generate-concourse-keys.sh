#!/usr/bin/env bash

set -e

mkdir -p /opt/concourse

pushd /opt/concourse
  ssh-keygen -t rsa -f host_key -N ''
  ssh-keygen -t rsa -f worker_key -N ''
  ssh-keygen -t rsa -f session_signing_key -N ''

  cp worker_key.pub authorized_worker_keys
popd

