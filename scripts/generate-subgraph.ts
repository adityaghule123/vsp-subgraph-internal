import fs from 'fs';
import mustache from 'mustache';

interface ContractDetails {
  network: string
  collectionName: string
  contractAddress: string
  startBlock: number
}

const base = fs.readFileSync('scripts/templates/base.yaml', 'utf8');
const dataSourcesTemplate = fs.readFileSync('scripts/templates/dataSource.template.yaml', 'utf8');

// Get the command line argument for the config file
const configFile = process.argv[2];

// Load the config file
const config = fs.readFileSync(configFile, 'utf8');
const contracts = JSON.parse(config);

// Generate data sources content for each contract
const dataSourcesContent = contracts.map((contract: ContractDetails) => {
  return mustache.render(dataSourcesTemplate, contract);
});

// Concatenate all data sources content and add to base file
const finalSubgraphContent = base.concat(dataSourcesContent.join('\n'));

// Write the rendered output to the final subgraph.yaml file
fs.writeFileSync('subgraph.yaml', finalSubgraphContent);
