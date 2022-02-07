# 1. Add GOROOT ao ambiente
$systemgorootpath = "C:\Program Files\Go\"
$env:GOROOT = $systemgorootpath 

# 2. Add binário de go ao PATH
$systemgobinpath = "$env:GOROOT\bin" 
$env:Path += ";$systemgobinpath" 

# 3. Criando workspace GO em D:\Documents
$targetpath = "D:\Documents"
$gotpath = "$targetpath\go"
$binpath = "$gotpath\bin"
$pkgpath = "$gotpath\pkg"
$srcpath = "$gotpath\src"
$gitpath = "$srcpath\github.com"
$gituser = "$srcpgitpathath\lucasfrct"

if (!(test-path -path $gotpath)) { new-item -path $gotpath -itemtype directory }
if (!(test-path -path $binpath)) { new-item -path $binpath -itemtype directory }
if (!(test-path -path $pkgpath)) { new-item -path $pkgpath -itemtype directory }
if (!(test-path -path $srcpath)) { new-item -path $srcpath -itemtype directory }
if (!(test-path -path $gitpath)) { new-item -path $gitpath -itemtype directory }
if (!(test-path -path $gituser)) { new-item -path $gituser -itemtype directory }

# 3. Criando GOPATH  no ambiente de trabalho em D:\Documents\go
$env:GOPATH = $gotpath

# 4. Criando GOBIN  no ambiente de trabalho em D:\Documents\go\bin
$env:GOBIN = $binpath
go get github.com/golang/example/hello
Invoke-Expression "$env:GOPATH\bin\hello"

# 5. Criando GOPRIVATE no ambiente de trabalho | D:\Documents\go\src\github.com
$env:GOPRIVATE = "github.com\lucasfrct"