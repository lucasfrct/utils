# import multiple remote git repositories to local Source dir

 param (
  [string]$localFolder = "D:\Documents\github.com\lucasfrct",
  [array]$repos = @("ms-authentication-mirror", "ms-authentication-mirror")
 )
$repoLocation = "https://github.com/"

# for each repo found remotely, check if it exists locally
# if dir exists, skip, if not, clone the remote git repo into it
foreach ($gitRepo in $repos) {
	If (Test-Path $localFolder\$gitRepo) {
		echo "repo $gitRepo already exists"
	}
	Else {
		echo "git clone $repoLocation$gitRepo $localFolder\$gitRepo"
		git clone $repoLocation$gitRepo $localFolder\$gitRepo
	}
}