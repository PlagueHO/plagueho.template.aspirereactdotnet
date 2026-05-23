targetScope = 'subscription'

@description('Principal object id for role assignment.')
param principalId string

@description('AI Search service resource id.')
param aiSearchResourceId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(aiSearchResourceId, principalId, 'search-index-data-contributor')
  scope: subscription()
  properties: {
    principalId: principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '00000000-0000-0000-0000-000000000001'
    )
  }
}
