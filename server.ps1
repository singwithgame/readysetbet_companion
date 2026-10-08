param(
    [string]$RootFolder = $PSScriptRoot,
    [string]$InfoFile = "server.info"
)

$port = 8000
$listener = $null
while ($port -le 8010) {
    try {
        $listener = New-Object System.Net.HttpListener
        $listener.Prefixes.Add("http://localhost:$port/")
        $listener.Start()
        break
    } catch {
        $listener = $null
        $port++
    }
}

if ($listener -eq $null) {
    Write-Error "Could not bind to any port between 8000 and 8010."
    exit 1
}

# Write PID and Port to InfoFile
"$PID`n$port" | Out-File -FilePath (Join-Path $RootFolder $InfoFile) -Encoding ascii

try {
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        try {
            $path = $request.Url.LocalPath
            if ($path -eq '/') { $path = '/index.html' }
            
            $filePath = [System.IO.Path]::GetFullPath((Join-Path $RootFolder $path.TrimStart('/')))
            $rootFullPath = [System.IO.Path]::GetFullPath($RootFolder)
            
            # Directory traversal prevention
            if (-not $filePath.StartsWith($rootFullPath)) {
                $response.StatusCode = 403
                $response.OutputStream.Close()
                continue
            }

            if (Test-Path $filePath -PathType Leaf) {
                $bytes = [System.IO.File]::ReadAllBytes($filePath)
                $response.ContentLength64 = $bytes.Length
                
                $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
                switch ($ext) {
                    ".html" { $response.ContentType = "text/html" }
                    ".js"   { $response.ContentType = "application/javascript" }
                    ".css"  { $response.ContentType = "text/css" }
                    ".wasm" { $response.ContentType = "application/wasm" }
                    ".ico"  { $response.ContentType = "image/x-icon" }
                    default { $response.ContentType = "application/octet-stream" }
                }
                
                $response.OutputStream.Write($bytes, 0, $bytes.Length)
            } else {
                $response.StatusCode = 404
            }
        } catch {
            # Ignore client disconnect errors
        } finally {
            try { $response.OutputStream.Close() } catch {}
        }
    }
} catch {
} finally {
    if ($listener.IsListening) { $listener.Stop() }
}
