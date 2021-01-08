. "./Location.ps1";
. "./ResourceName.ps1";

class ResourceId {
    [ResourceType] $type
    [string] $resourceGroup = ""
    [ResourceName] $name 

    ResourceId(
        [ResourceType] $resourceType,
        [ResourceName] $name,
        [string] $resourceGroup
    ) {
        $this.type = $resourceType
        $this.resourceGroup = $resourceGroup
        $this.name = $name
    }

    static [ResourceId] Create(
        [ResourceType] $resourceType,
        [ResourceName] $name,
        [string] $resourceGroup
    ) {
        return [ResourceId]::new($resourceType, $name, $resourceGroup)
    }

    static [ResourceId] Create(
        [ResourceType] $resourceType,
        [ResourceName] $name
    ) {
        return [ResourceId]::Create($resourceType, $name, "")
    }
}

class ResourceType {
    [string] $path
    [string] $apiVersion

    ResourceType([string] $path, [string] $apiVersion) {
        $this.path = $path
        $this.apiVersion = $apiVersion
    }

    [PSCustomObject] Create(
        [ResourceName] $name, 
        [Location] $location, 
        [ResourceId[]] $dependsOn, 
        [collections.generic.dictionary[string,string]] $tags
    ) {
        return @{
            type = $this.path
            apiVersion = $this.apiVersion
            name = $name
            location = $location
            dependsOn = $dependsOn | ForEach-Object {$_.Eval()}
            tags = $tags
        }
    }
    
    [PSCustomObject] Create(
        [ResourceName] $name,
        [Location] $location
    ) {
        return $this.Create($name, $location, @(), @{})
    }
}