# MATLAB Codespaces starter template
This repository provides a template you can use in your GitHub hosted MATLAB project, to leverage GitHub Codespaces.
When integrated into your project you will be able to launch & access MATLAB directly in your browser, by clicking on "Open in Codespaces" inside your repository. 

# How to Use

Integrate the `.devcontainer` folder in this repository into your repository.

This repository contains a sample `.devcontainer` configuration which you can use 
to launch a MATLAB environment and execute your repository's code.  

## Integration into new Repositories
Click on the green "Use this template" button, on the top of this page.
Follow the onscreen instructions to create a new repository with files and folder structure from this repository pre-populated.

# Testing with Codespaces
* Click on the "Open with Codespaces" menu item, found under the "Code" icon.
* After some installation, you will be presented with the MATLAB web-desktop.
* If your browser blocks pop-ups, you will be prompted by the terminal in VSCode to open up http://localhost:8888 to access the web-desktop.

# Testing without the use of Codespaces
* Clone the repository
* Navigate the the `.devcontainer` folder
* Execute ```docker build -t matlab-image .```
* Upon successful build, you can run the container by: ```docker run -it -p 8888:8888 matlab-image```
* Access MATLAB by navigating to ```http://localhost:8888```, where `localhost` can be replaced with the name of the machine on which docker is running.

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

