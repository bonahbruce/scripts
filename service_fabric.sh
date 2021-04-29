#!/bin/bash

# Variables
ResourceGroupName='RG-10576'
ClusterName='sf10576a'
Location='eastus'
Password='q6D7nN%6ck@6'
Subject='sf10576a.eastus.cloudapp.azure.com'
VaultName='vault10576a'
VmPassword='Mypa$$word!321'
VmUserName='sfadminuser'


# Login to Azure and set the subscription
az login -u user01@msptestpoc.onmicrosoft.com -p dpaqmf0113!!

az account set --subscription bb95a307-e270-4749-9877-452b02181b43

az keyvault create --name $VaultName --resource-group $ResourceGroupName --location $Location --enabled-for-deployment true --enabled-for-disk-encryption true --enabled-for-template-deployment true

# Create secure five node Linux cluster. Creates a key vault in a resource group
# and creates a certficate in the key vault. The certificate's subject name must match
# the domain that you use to access the Service Fabric cluster.  The certificate is downloaded locally.
az sf cluster create --resource-group $ResourceGroupName --location $Location --certificate-output-folder . --certificate-password $Password --certificate-subject-name $Subject --cluster-name $ClusterName --cluster-size 5 --os UbuntuServer1604 --vault-name $VaultName --vault-resource-group $ResourceGroupName --vm-password $VmPassword --vm-user-name $VmUserName