targetScope = 'resourceGroup'

@description('Location for deployed resources')
param location string = resourceGroup().location

@description('Storage account prefix')
param storagePrefix string = 'tylerrue'

var storageName = toLower('${storagePrefix}${uniqueString(resourceGroup().id)}')

resource storage 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

output storageAccountName string = storage.name
