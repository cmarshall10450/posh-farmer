Import-Module Legislator

. "./IArmResource.ps1"
. "./Location.ps1"
. "./ResourceType.ps1"

interface IBuilder {
    property ResourceId resourceId
    method IArmResource[] BuildResources ([Location])
}