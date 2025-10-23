$proxy="http://localhost:3128"
$env:HTTP_PROXY=$proxy
$env:HTTPS_PROXY=$proxy
$nv="$env:USERPROFILE\\AppData\Local\\nvim"

# Aliases
function cdh { cd $env:USERPROFILE }

