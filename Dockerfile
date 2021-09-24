# a dockerfile to generate appropriate python packages
# see: https://packaging.python.org/tutorials/packaging-projects/
FROM debian:bullseye

RUN apt-get update && apt-get install -y python3-pip python3 python3-venv

RUN pip3 install build

RUN mkdir /aurum-common
WORKDIR /aurum-common

ADD pyproject.toml .
ADD setup.cfg .
Add src/ ./src/

RUN python3 -m build

RUN ls -l dist/
