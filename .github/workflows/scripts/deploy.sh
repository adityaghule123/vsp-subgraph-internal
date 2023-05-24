#!/bin/bash

ENVIRONMENT="${{ github.ref }}"
DEPLOY_KEY="${{ secrets.DEPLOY_KEY }}"

if [[ "$ENVIRONMENT" == "refs/heads/staging" ]]; then
    echo "Deploying Staging Subgraph (Version: $VERSION)"
    yarn prepare:testnet
    graph deploy --node https://api.studio.thegraph.com/deploy/ vsp-subgraph-goerli -l v0.0.1 --deploy-key "$DEPLOY_KEY"
elif [[ "$ENVIRONMENT" == "refs/heads/main" ]]; then
    echo "Deploying Main Subgraph (Version: $VERSION)"
    yarn prepare:mainnet
    graph deploy --node https://api.studio.thegraph.com/deploy/ vsp-subgraph -l v0.0.1 --deploy-key "$DEPLOY_KEY"
else
    echo "Invalid environment specified."
    exit 1
fi
