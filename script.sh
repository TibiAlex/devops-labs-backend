#!/bin/bash

if docker ps -f "name=dotnet_backend_application" | grep -q dotnet_backend_application; then
	docker stop dotnet_backend_application
        docker rm dotnet_backend_application
fi
echo $1 > a.txt
docker run -d --name dotnet_backend_application -p 4000:4000 tibialex2000/dotnet_backend_application:$1
