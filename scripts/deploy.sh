#!/bin/bash

# Variables
container_name="Website"
tag=""
if [ "$ENVIRONMENT" == "Production" ]; then
    export tag="latest"
else
    export tag="dev"
fi

# Set the environmental variables
ENV_VARS="ENVIRONMENT=$ENVIRONMENT"

# Set the command to start the microservice
command="source <(curl -s https://raw.githubusercontent.com/kontinuum-investments/Central-Finite-Curve/production/citadel/scripts/library.sh) && \
  deploy_container $DOCKERHUB_USERNAME/$DOCKERHUB_REPOSITORY:$tag $container_name $CONTAINER_PORT $HOST_PORT $ENV_VARS"

# SSH into the Citadel
temp_key_file=$(mktemp)
echo "$CITADEL_SSH_PRIVATE_KEY" > "$temp_key_file"
chmod 400 "$temp_key_file"
ssh -o StrictHostKeyChecking=no -i "$temp_key_file" "$CITADEL_USERNAME"@"$CITADEL_HOST_NAME" "$command"