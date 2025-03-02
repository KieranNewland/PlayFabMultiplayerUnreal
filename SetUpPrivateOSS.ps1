# This script downloads the private platform components of the OSS, for the platforms the user has access to.
# The binaries and header files are pulled from our NuGet feeds at https://dev.azure.com/PlayFabPrivate/. You can
# find the NuGet config files in the Platforms/[APlatform] folder.
# The private source code is pulled from our Git repositories as submodules.

# Prerequesites: download NuGet.exe and add its path to the PATH environment variable. Have git installed.

Write-Host "Downloading Party and Multiplayer NuGet packages..."

$localPath = ".\Platforms\Switch"
nuget.exe restore $localPath -ConfigFile $localPath\nuget.config -PackagesDirectory $localPath

Write-Host "Updating git submodules for private platforms..."
git submodule update --recursive --init
