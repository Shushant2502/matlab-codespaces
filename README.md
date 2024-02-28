# MATLAB Codespaces

This repository showcases various flavors of configuring your `devcontainer.json` to create [devcontainers](https://containers.dev/) and/or running them in GitHub Codespaces.

Listed below are various `devcontainer.json` configurations from to choose from based on your needs:

## Using the mathworks/matlab Docker Hub Image

Use this configuration file to start a devcontainer with MATLAB R2023b available within it.

```json
{
  "name": "MATLAB",
  "image": "mathworks/matlab:r2023b",
  "waitFor": "updateContentCommand",
  "updateContentCommand": {
    // installing GIT
    "install-git": "sudo apt-get update && sudo apt-get install git -y",
  },
}
```

### Run MATLAB and interact with it via a web browser

This configuration adds the capability to start [matlab-proxy](https://github.com/mathworks/matlab-proxy) and interact with MATLAB through the browser.
Use this configuration if you want to interact with the MATLAB Desktop through the browser.

```json
{
  "name": "MATLAB",
  "image": "mathworks/matlab:latest",
  "hostRequirements": {
    "cpus": 4
  },
  "portsAttributes": {
    "8888": {
      "label": "MATLAB",
      "onAutoForward": "openBrowser"
    }
  },
  "waitFor": "updateContentCommand",
  "updateContentCommand": {
    // installing GIT
    "install-git": "sudo apt-get update && sudo apt-get install git -y",
    "update-matlab-proxy": "sudo python3 -m pip install --upgrade pip matlab-proxy"
  },
  // Only works from R2022a onwards
  "postStartCommand": "run.sh -browser"
}
```

The `postStartCommand` and the `onAutoForward` start the `matlab-proxy` and open a browser tab.

* NOTE: Based on your systems configuration it may be necessary to click on the link presented in the VSCode terminal to start the browser session.

Navigate to the ["mathworks/matlab"](https://github.com/mw-gh-integration/matlab-codespaces/tree/mathworks/matlab) branch of this repository to view the configuration files for various releases of MATLAB.

Click on [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=mathworks%2Fmatlab&repo=345968540&skip_quickstart=true&template=false&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json) to select the MATLAB release you would like to open on GitHub Codespaces.


## Using devcontainer features

### Introduction
'Features' are self-contained units of installation code and development container configuration. Features are designed to install atop a wide-range of base container images.
You may learn about Features at :
* [containers.dev](containers.dev), which is the website for the dev container specification
* The GitHub repository for [devcontainers/features](https://github.com/devcontainers/features)

### mathworks/devcontainer-features

The "matlab" feature provides the ability to install MATLAB and its supporting products through its feature specification.
For example a `devcontainer.json` configuration that installs the feature based on its defaults on a `ubuntu` base image is:
```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/mw-gh-integration/devcontainer-features/matlab:0": {}
    }
}
```

Additionally, use `options` to customize the default installation behavior.
The example configuration below installs:
* MATLAB `R2023a` instead of the default `R2023b`
* Additional toolboxes

```json
"features": {
    "ghcr.io/mw-gh-integration/devcontainer-features/matlab": {
        "release": "r2023a",
        "products": "MATLAB Symbolic_Math_Toolbox"
    }
}
```
Navigate to the ["mathworks/features"](https://github.com/mw-gh-integration/matlab-codespaces/tree/mathworks/features) branch of this repository to view additional examples of configuration files.

Try them out by, clicking on [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=matlab%2Ffeatures&repo=345968540&skip_quickstart=true&template=false&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json) and selecting from one of the example configurations.

#### Available Options
Listed below are the other options that are available for the MATLAB feature.

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| release | MATLAB Release to install. | string | r2023b |
| products | Products to install, specified as a list of product names separated by spaces. </br> See [MPM.md](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/MPM.md#product-installation-options) for more information.| string | MATLAB |
| doc | Flag to install documentation and examples. (R2022b and earlier releases) | boolean | false |
| installGpu | Skips installation of GPU libraries when you install Parallel Computing Toolbox. (R2023a and later releases) | boolean | false |
| destination | Full path to the installation destination folder. </br> test | string | /opt/matlab/$RELEASE |
| installMatlabProxy | Installs matlab-proxy and its dependencies. (R2020b and later releases) | boolean | false |
| installJupyterMatlabProxy | Installs jupyter-matlab-proxy and its dependencies. (R2020b and later releases) | boolean | false |
| installMatlabEngineForPython | Installs the MATLAB Engine for Python if the destination option is set correctly. | boolean | false |
| startInDesktop | Starts matlab-proxy on container start. | string | false |
| networkLicenseManager | MATLAB will use the specified Network License Manager. | string | - |
| skipMATLABInstall | Set to true if you dont want to install MATLAB. Useful if you only want to install the proxy products. | boolean | false |

View the latest information on the [mathworks/devcontainer-features](github.com/mathworks/devcontainer-features/blob/main/src/matlab/README.md) repository.

## Other interesting applications

This repository provides multiple `devcontainer.json` templates to enable the usage of MATLAB from GitHub Codespaces in your GitHub hosted MATLAB project.

There are multiple ways with which MATLAB can be made available in a Codespace, and they are showcased the following branches of this repository.

| Branch Name | Showcases usage of | Click to start Codespace |
|--|--|--|
|[mathworks/matlab](https://github.com/mw-gh-integration/matlab-codespaces/tree/mathworks/matlab) | `mathworks/matlab` images available on [DockerHub](https://hub.docker.com/r/mathworks/matlab).|  [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=mathworks%2Fmatlab&repo=345968540&skip_quickstart=true&template=false&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json)|
|[matlab/dockerfile](https://github.com/mw-gh-integration/matlab-codespaces/tree/matlab/dockerfile)| Dockerfiles that create images with MATLAB installed. | [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=matlab%2Fdockerfile&repo=345968540&skip_quickstart=true&template=false) |
|[matlab/features](https://github.com/mw-gh-integration/matlab-codespaces/tree/matlab/features) | `mathworks/devcontainer-features` to install MATLAB and other products | [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=matlab%2Ffeatures&repo=345968540&skip_quickstart=true&template=false&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json) |
|[matlab/jupyter](https://github.com/mw-gh-integration/matlab-codespaces/tree/matlab/jupyter) | The [MATLAB Integration for Juptyer](https://github.com/mathworks-ref-arch/matlab-integration-for-jupyter) | [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=matlab%2Fjupyter&repo=345968540&skip_quickstart=true&template=false&machine=standardLinux32gb&devcontainer_path=.devcontainer%2Fdevcontainer.json)|

Each branch contains one or more examples of `devcontainer.json` files that showcase different ways to include MALTAB into an container.

Navigate to your branch of choice and explore the `.devcontainer` folder for examples.

Find the `devcontainer.json` configuration that best suits your needs and include it into your GitHub repository.

## Additional Reading

* [GitHub Codespaces Overview](https://docs.github.com/en/codespaces/overview)
* [Development Container Specification](https://containers.dev/implementors/spec/)
* [Development Container Features](https://github.com/devcontainers/features/)
* [Setting Default Editor](https://docs.github.com/en/codespaces/setting-your-user-preferences/setting-your-default-editor-for-github-codespaces)