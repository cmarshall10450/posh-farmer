Import-Module Legislator

. "./ResourceType.ps1"

interface IArmResource {
    property ResourceId resourceId
    method [PSCustomObject] JsonModel
}