#!/usr/bin/env bash
cd $HOME/docker-test
echo "Starting Docker Build/Run test with nginx..."
echo "Building..."
docker build -t test . > /dev/null 2>&1 
echo "Running..."
docker run -p 80:80 --name test -d test > /dev/null 2>&1 
echo "Pausing..."
sleep 3
curl localhost
echo "Cleaning up..."
docker stop test > /dev/null 2>&1
docker rm test > /dev/null 2>&1
docker rmi test > /dev/null 2>&1
cd - > /dev/null 2>&1
