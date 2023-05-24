#!/bin/bash

if [[ "$ENVIRONMENT" == "refs/heads/staging" ]]; then
    VERSION="staging-$(date +%Y%m%d%H%M%S)"
    echo "Deploying Staging Subgraph (Version: $VERSION)"
    yarn prepare:testnet
    yarn codegen
    yarn build
    yarn deploy:testnet -l $VERSION --deploy-key $DEPLOY_KEY

elif [[ "$ENVIRONMENT" == "refs/heads/main" ]]; then
    VERSION="main-$(date +%Y%m%d%H%M%S)"
    echo "Deploying Main Subgraph (Version: $VERSION)"
    yarn prepare:mainnet
    yarn codegen
    yarn build
    yarn deploy:mainnet -l $VERSION --deploy-key $DEPLOY_KEY
    
else
    echo "Invalid environment specified."
    exit 1
fi
