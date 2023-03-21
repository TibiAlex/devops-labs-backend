#!/bin/bash

container_name=$(docker ps -a --format '{{.Names}}' | grep dotnet_backend_application)
TAG=$(echo $1 | cut -c1-7)
if [ "$container_name" = "dotnet_backend_application" ]; then
	docker stop dotnet_backend_application
        docker rm dotnet_backend_application
fi
docker run -d --name dotnet_backend_application --network devopslabs -p 4000:4000 tibialex2000/dotnet_backend_application:$TAG
