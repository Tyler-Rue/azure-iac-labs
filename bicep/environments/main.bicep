targetScope = 'resourceGroup'

@allowed([
  'dev'
  'test'
  'prod'
])
@description('Deployment environment name')
param environment string = 'dev'

@description('Azure region for deployed resources')
param location string = resourceGroup().location

var storageSku = environment == 'prod' ? 'Standard_GRS' : 'Standard_LRS'
var storagePrefix = 'tr${environment}'
var storageName = toLower('${storagePrefix}${uniqueString(resourceGroup().id)}')

resource storage 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  tags: {
    environment: environment
    project: 'azure-iac-labs'
    managedBy: 'bicep'
  }
}

output environmentName string = environment
output storageAccountName string = storage.name
output storageSkuName string = storage.sku.name
