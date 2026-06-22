$OutDir = "c:\Users\deval\Desktop\Pet care\images"
if (!(Test-Path $OutDir)) {
    New-Item -ItemType Directory -Force -Path $OutDir
}

$images = @{
    "hero.webp" = "1543466835-00a7907e9de1"
    "small_dog.webp" = "1583337130417-3346a1be7dee"
    "about.webp" = "1548199973-03cce0bbc87b"
    "service.webp" = "1601758124510-52d02ddb7cb9"
    "blog.webp" = "1517849845537-4d257902454a"
    "contact.webp" = "1537151608828-ea2b11777ee8"
    "login.webp" = "1583511655857-d19b40a7a54e"
}

foreach ($img in $images.GetEnumerator()) {
    $url = "https://images.unsplash.com/photo-$($img.Value)?q=60&w=800&auto=format&fit=crop&fm=webp"
    $dest = Join-Path $OutDir $img.Key
    Invoke-WebRequest -Uri $url -OutFile $dest
    $size = (Get-Item $dest).length / 1024
    Write-Host "Downloaded $($img.Key) - Size: $([math]::Round($size, 2)) KB"
}
