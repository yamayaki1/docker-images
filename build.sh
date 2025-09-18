#!/bin/bash
docker image build -f java/ms17/Dockerfile ./java/
docker image build -f java/ms21/Dockerfile ./java/
docker image build -f java/lb25/Dockerfile ./java/