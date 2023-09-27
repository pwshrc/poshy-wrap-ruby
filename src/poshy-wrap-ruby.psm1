#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest


function Invoke-Ruby {
    ruby @args
}
Set-Alias -Name rb -Value Invoke-Ruby
Export-ModuleMember -Function Invoke-Ruby -Alias rb

function Invoke-RubyExecute {
    ruby -e @args
}
Set-Alias -Name rrun -Value Invoke-RubyExecute
Export-ModuleMember -Function Invoke-RubyExecute -Alias rrun

function Invoke-RubyExecuteHttpdHere {
    param(
        [Parameter(Mandatory = $false)]
        [ValidateRange(1, 65535)]
        [int] $port = 8080
    )
    # requires webrick
    ruby -e httpd . -p $port
}
Set-Alias -Name rserver -Value Invoke-RubyExecuteHttpdHere
Export-ModuleMember -Function Invoke-RubyExecuteHttpdHere -Alias rserver
