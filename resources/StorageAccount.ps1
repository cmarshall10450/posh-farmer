enum StorageAccountSku {
     Standard_LRS;
     Standard_GRS;
     Standard_RAGRS;
}

enum ContainerAccessLevel {
     Public;
     Private;
}

class Container {
     [string] $name
     [ContainerAccessLevel] $accessLevel
}

class StorageAccount : IArmResource
{
     [String] $accountName
     [string] $location
     [StorageAccountSku] $sku
     [Container[]] $containers

     StorageAccount ([string] $accountName, [string] $location)
     {
          $this.accountName = $accountName
          $this.location = $location
     }

     [StorageAccount] SetSku([StorageAccountSku] $sku) 
     {
          $this.sku = $sku
          return $this
     }

     [PSCustomObject[]] BuildResources()
     {
          $account = @{
               name = $this.accountName
               type = "Microsoft.Storage/storageAccounts"
               location = $this.location
               apiVersion = "2019-04-01"
               sku = @{
                    name = $this.sku
               }
          }

          

          return @($account)
     }
}