targetScope = 'subscription'

@description('Principal object id for role assignment.')
param principalId string

@description('Foundry project resource id.')
param foundryProjectResourceId string

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  name: guid(foundryProjectResourceId, principalId, 'foundry-user')
  scope: subscription()
  properties: {
    principalId: principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/roleDefinitions',
      '00000000-0000-0000-0000-000000000002'
    )
  }
}
