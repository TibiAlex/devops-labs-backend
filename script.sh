#!/bin/bash

echo $1 > a.txt
TAG=$(echo $1 | cut -c1-7)
echo $TAG >> a.txt
if docker ps -f "name=dotnet_backend_application" | grep -q dotnet_backend_application; then
	docker stop dotnet_backend_application
        docker rm dotnet_backend_application
fi
docker run -d --name dotnet_backend_application -p 4000:4000 tibialex2000/dotnet_backend_application:$TAG
