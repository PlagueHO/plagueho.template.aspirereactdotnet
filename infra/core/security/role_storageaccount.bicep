targetScope = 'subscription'

@description('Principal object id for role assignment.')
param principalId string

@description('Storage account resource id.')
param storageAccountResourceId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(storageAccountResourceId, principalId, 'storage-data-contributor')
  scope: subscription()
  properties: {
    principalId: principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      'ba92f5b4-2d11-453d-a403-e96b0029c9fe'
    )
  }
}
