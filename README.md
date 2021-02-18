# matlab-codespaces
Enables GitHub Codespaces to run MATLAB

# Description

This repository contains a sample `.devcontainer` configuration which you can use 
to launch a MATLAB environment and execute your repository's code.  

# Configuration Points

The following fields can be configured in `.devcontainer/devcontainer.json`:
```
name : <Display name of the container>
```

```
REPOSITORY_NAME : "<One word Repository-name, must match your external facing repository name.>"
```
*REPOSITORY_NAME can be deprecated once Codespaces support* [**${containerWorkspaceFolder}**](https://code.visualstudio.com/docs/remote/devcontainerjson-reference#_variables-in-devcontainerjson)

```
USERNAME : <Desired username on launched container>
```

