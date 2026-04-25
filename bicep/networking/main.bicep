targetScope = 'resourceGroup'

@description('Azure region for networking resources')
param location string = resourceGroup().location

@description('Virtual network name')
param vnetName string = 'vnet-lab-eastus'

@description('Network security group name')
param nsgName string = 'nsg-lab-web'

@description('Virtual network address space')
param vnetAddressPrefix string = '10.10.0.0/16'

@description('Subnet address prefix')
param subnetPrefix string = '10.10.1.0/24'

resource nsg 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: nsgName
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-HTTP-Inbound'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '80'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
      {
        name: 'subnet-web'
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

output virtualNetworkName string = vnet.name
output subnetName string = 'subnet-web'
output networkSecurityGroupName string = nsg.name
