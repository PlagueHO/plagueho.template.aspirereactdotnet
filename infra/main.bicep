targetScope = 'subscription'

@description('Project name in kebab-case.')
param projectName string = '{{PROJECT_NAME}}'

@description('Azure region for deployment.')
param location string = '{{AZURE_LOCATION}}'

@description('Deployment environment name.')
param environmentName string = 'dev'

@description('Resource group name.')
param resourceGroupName string = 'rg-${projectName}-${environmentName}'

resource resourceGroup 'Microsoft.Resources/resourceGroups@2024-07-01' = {
  name: resourceGroupName
  location: location
}

// TEMPLATE: Add AVM modules as needed for your scenario.

// OPTIONAL_PRIVATE_NETWORKING
// module vnet 'br/public:avm/res/network/virtual-network:0.7.1' = {
//   name: 'vnet'
//   scope: resourceGroup(resourceGroupName)
//   params: {
//     name: 'vnet-${projectName}-${environmentName}'
//     location: location
//     addressPrefixes: [
//       '10.0.0.0/16'
//     ]
//   }
// }

// OPTIONAL_AI_SERVICES
// module aiSearch 'br/public:avm/res/search/search-service:0.7.0' = {
//   name: 'aiSearch'
//   scope: resourceGroup(resourceGroupName)
//   params: {
//     name: 'srch-${projectName}-${environmentName}'
//     location: location
//   }
// }
