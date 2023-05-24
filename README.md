# VaynerSports Pass Subgraph

Subgraph that stores latest timestamp for every token ID of specified NFT collections. Used in the gatekeeping flow for raffles.

## Installation
#### Clone the project

```bash
git clone https://github.com/Byt-io/vsp-api.git
```

#### Go to the project directory
```bash
cd vsp-api
```
#### Install yarn dependencies
```bash
yarn install
```

## Prepare subgraph
```bash 
# create subgraph.yaml with testnet config
$ yarn prepare:testnet

# create subgraph.yaml with mainnet config
$ yarn prepare:mainnet

# run codegen
$ yarn codegen

# run build
$ yarn build
```

## Create subgraph
```bash 
# create subgraph on local graph node
$ yarn create:local

# create testnet subgraph
$ yarn create:testnet

# create mainnet subgraph
$ yarn create:mainnet
```

## Create subgraph
```bash 
# deploy subgraph on local graph node
$ yarn deploy:local

# deploy testnet subgraph
$ yarn deploy:testnet

# deploy mainnet subgraph
$ yarn deploy:mainnet
```

## To add a new NFT collection
```bash 
# in the corresponding config file add the following object in the array
{
    "network": "mainnet",
    "collectionName": "NftContract",
    "contractAddress": "0x123....",
    "startBlock": 123456789
}
```

