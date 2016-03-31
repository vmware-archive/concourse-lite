#!/usr/bin/env bash

set -e

sudo apt -y install postgresql

sudo -u postgres createdb atc
sudo -u postgres psql <<SQL
  CREATE USER vagrant PASSWORD 'vagrant';
SQL
