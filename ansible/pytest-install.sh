#!/bin/bash
sudo apt update
sudo apt-get install -y python-pytest
pytest --version >> versions.txt