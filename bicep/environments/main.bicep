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

var commonTags = {
  environment: environment
  project: 'azure-iac-labs'
  managedBy: 'bicep'
}

module storageAccount '../modules/storage-account.bicep' = {
  name: 'storage-${environment}'
  params: {
    storageName: storageName
    location: location
    skuName: storageSku
    tags: commonTags
  }
}

output environmentName string = environment
output storageAccountName string = storageAccount.outputs.storageAccountName
output storageSkuName string = storageSku
