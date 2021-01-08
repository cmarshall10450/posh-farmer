class ResourceName {
    [string] $value

    ResourceName([string] $value) {
        $this.value = $value
    }

    static [ResourceName] Empty() {
        return [ResourceName]::new("")
    }

    [string] GetValue() {
        return $this.value
    }

    [ResourceName] IfEmpty([string] $fallback) {
        if ($this.value -eq "") {
            return [ResourceName]::new($fallback)
        } else {
            return $this
        }
    }
}