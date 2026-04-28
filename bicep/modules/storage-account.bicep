@description('Storage account name')
param storageName string

@description('Azure region')
param location string

@description('Storage SKU')
param skuName string = 'Standard_LRS'

@description('Resource tags')
param tags object = {}

resource storage 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageName
  location: location
  sku: {
    name: skuName
  }
  kind: 'StorageV2'
  tags: tags
}

output storageAccountName string = storage.name
output storageId string = storage.id
output primaryLocation string = storage.location
