aks_vnet_name = "aksvnet"

sshkvsecret = "diwasshpubkey"

clientidkvsecret = "diwaspn-id"

spnkvsecret = "diwaspn-secret"

vnetcidr = ["10.0.0.0/24"]

subnetcidr = ["10.0.0.0/25"]

keyvault_rg = "diwa-RG2"

keyvault_name = "diwakevault"

azure_region = "CentralIndia"

resource_group = "aksdemocluster-rg"

cluster_name = "aksdemocluster"

dns_name = "aksdemocluster"

admin_username = "aksuser"

kubernetes_version = "1.21.7"

agent_pools = {
      name            = "pool1"
      count           = 2
      vm_size         = "Standard_D2_v2"
      os_disk_size_gb = "30"
    }
