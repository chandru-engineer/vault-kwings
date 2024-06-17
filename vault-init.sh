#!/bin/bash

# Start Vault using docker-compose
docker-compose up -d

# Wait for Vault to start
sleep 5

# Initialize Vault and capture the unseal keys and root token
INIT_OUTPUT=$(docker exec vault vault operator init -format=json)

# Extract the unseal keys and root token
UNSEAL_KEYS=$(echo $INIT_OUTPUT | jq -r ".unseal_keys_b64[]")
ROOT_TOKEN=$(echo $INIT_OUTPUT | jq -r ".root_token")

# Unseal Vault using the unseal keys
for KEY in $UNSEAL_KEYS; do
  docker exec vault vault operator unseal $KEY
done

# Login to Vault using the root token
docker exec vault vault login $ROOT_TOKEN

# Create a new key
docker exec vault vault kv put secret/my-key value=my-secret-value

# Print the root token
echo "Vault is initialized and unsealed."
echo "Root Token: $ROOT_TOKEN"
