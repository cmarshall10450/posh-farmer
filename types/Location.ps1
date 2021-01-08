class Location {
    [string] $value

    Location([string] $value) {
        $this.value = $value
    }

    [string] GetArmValue() {
        return $this.value.ToLower()
    }
}