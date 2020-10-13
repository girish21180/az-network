

loc="CentralIndia"
rg="Sharad-India"
vnet="Hub-India"
vnet1="Spoke-India"

az group create \
    --location $loc \
    --name $rg

az network vnet create \
    --name $vnet \
    --resource-group $rg \
    --location $loc \
    --address-prefixes 30.10.0.0/16 \
    --subnet-prefixes 30.10.2.0/24 \
    --subnet-name AzureFirewallSubnet 
    
az network vnet subnet create \
    --address-prefixes "30.10.3.0/24" \
    --name Production \
    --resource-group $rg \
    --vnet-name $vnet

az network vnet subnet create \
    --vnet-name $vnet \
    -n GatewaySubnet \
    -g $rg \
    --address-prefixes 30.10.1.0/24

az network vnet create \
    --name $vnet1 \
    --resource-group $rg \
    --location $loc \
    --address-prefixes 172.16.0.0/16 \
    --subnet-prefixes 172.16.1.0/24 \
    --subnet-name Val


