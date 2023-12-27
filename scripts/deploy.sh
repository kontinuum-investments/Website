#!/bin/bash

# Set the environmental variables
ENV_VARS=""

# Set the command to start the microservice
command="source <(curl -s https://raw.githubusercontent.com/kontinuum-investments/Citadel/production/misson_control/scripts/library.sh) && \
  deploy_container $DOCKERHUB_USERNAME/$DOCKERHUB_REPOSITORY:latest $CONTAINER_PORT $HOST_PORT $ENV_VARS"

# SSH into the Citadel
temp_key_file=$(mktemp)
echo "$CITADEL_SSH_PRIVATE_KEY" > "$temp_key_file"
chmod 400 "$temp_key_file"
ssh -o StrictHostKeyChecking=no -i "$temp_key_file" "$CITADEL_USERNAME"@"$CITADEL_HOST_NAME" "$command"