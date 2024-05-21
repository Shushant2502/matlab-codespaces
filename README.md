# Using MATLAB on GitHub Codespaces

This repository showcases various flavors of configuring your `devcontainer.json` to create [devcontainers](https://containers.dev/) and/or running them in GitHub Codespaces.

Listed below are various `devcontainer.json` configurations from to choose from based on your needs:

## Using the mathworks/matlab Docker Hub Image

Use this configuration file to start a devcontainer with MATLAB R2024a available within it.

```json
{
  "name": "MATLAB",
  "image": "mathworks/matlab:r2024a",
  "waitFor": "updateContentCommand",
  "updateContentCommand": {
    "install-git": "sudo apt-get update && sudo apt-get install git -y",
  },
}
```

For more information about the `mathworks/matlab`, see its listing on [DockerHub](https://hub.docker.com/r/mathworks/matlab).

## Run MATLAB and interact with it via a web browser

This configuration adds the capability to start [matlab-proxy](https://github.com/mathworks/matlab-proxy) and interact with MATLAB through the browser.
Use this configuration to interact with the MATLAB Desktop through the browser.

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
    "install-git": "sudo apt-get update && sudo apt-get install git -y",
    "update-matlab-proxy": "sudo python3 -m pip install --upgrade pip matlab-proxy"
  },
  "postStartCommand": "run.sh -browser"
}
```

The `postStartCommand` starts [matlab-proxy](https://github.com/mathworks/matlab-proxy) and the `onAutoForward` opens a browser tab running MATLAB.

* NOTE: Based on your system configuration it may be necessary to click on the link presented in the VSCode terminal to start the browser session.

Click [here](./.devcontainer/devcontainer.json) to view example usage, or [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/mathworks-ref-arch/matlab-codespaces?template=false&devcontainer_path=.devcontainer%2Fdevcontainer.json)

## Using devcontainer features

### Introduction
***Features*** are self-contained units of installation code and development container configuration. Features are designed to install atop a wide-range of base container images.
You may learn about Features at :
* [containers.dev](containers.dev), which is the website for the dev container specification
* The GitHub repository for [devcontainers/features](https://github.com/devcontainers/features)

### mathworks/devcontainer-features

The [mathworks/devcontainer-features](https://github.com/mathworks/devcontainer-features) repository publishes the `matlab` feature to easily install MATLAB and its supporting products.

This configuration installs the `matlab` feature with its default options on a `ubuntu` base image:
```json
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/mathworks/devcontainer-features/matlab": {}
    }
}
```

Use [Options](https://github.com/mathworks/devcontainer-features/tree/main/src/matlab#options) to customize the default installation behavior.

The example configuration below installs:
* MATLAB `R2023a` instead of the default `R2024a`
* Additional toolboxes

```json
"features": {
    "ghcr.io/mathworks/devcontainer-features/matlab": {
        "release": "r2023a",
        "products": "MATLAB Symbolic_Math_Toolbox"
    }
}
```

Click [here](./.devcontainer/using-devcontainer-feature/) to view example usage, or [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/mathworks-ref-arch/matlab-codespaces?template=false&devcontainer_path=.devcontainer%2Fusing-devcontainer-feature%2Fdevcontainer.json)

## Using MATLAB with Jupyter

The [MATLAB Integration for Jupyter](https://github.com/mathworks-ref-arch/matlab-integration-for-juptyer) can be used from within a codespace by:
* Using the prebuilt image with the MATLAB Integration for Juptyer:
  ```json
  {
  "name": "R2024a MATLAB Integration for Juptyer Prebuilt Image",
  "image": "ghcr.io/mathworks-ref-arch/matlab-integration-for-jupyter/jupyter-matlab-notebook:r2024a",
  "hostRequirements": {
    "cpus": 4
    }
  }
  ```

* Or, using the [Dockerfile]() to customize the image as shown:
  ```json
  {
      "name": "Dockerfile based MATLAB Integration for Jupyter",
      "build": {
          "dockerfile": "Dockerfile",
          "args": {
              "MATLAB_RELEASE": "r2023b",
              "MATLAB_PRODUCT_LIST": "MATLAB Symbolic_Math_Toolbox",
              "PYTHON_VERSION": "3.10"
          }
      },
      "hostRequirements": {
          "cpus": 4
      }
  }
  ```

* Or, using [devcontainer-features](https://github.com/mathworks/devcontainer-features/tree/main/src/matlab) to install MATLAB, Python, JupyterLab & the MATLAB Integration for Jupyter
  ```json
  {
      "name": "Using MATLAB With Jupyter",
      "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
      "hostRequirements": {
          "cpus": 4
      },
      "features": {
          "ghcr.io/mathworks/devcontainer-features/matlab": {
              "release": "r2024a",
              "products": "MATLAB Symbolic_Math_Toolbox",
              "installJupyterMatlabProxy": true,
              "installMatlabEngineForPython": true
          },
          "ghcr.io/devcontainers/features/python": {
              "version": "os-provided",
              "installJupyterlab": true,
              "configureJupyterlabAllowOrigin": "*"
          }
      }
      ,"containerUser": "codespace"
  }
  ```

Click [here](./.devcontainer/using-matlab-with-jupyter/) to view example usage, or [![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/mathworks-ref-arch/matlab-codespaces?template=false&devcontainer_path=.devcontainer%2Fusing-matlab-with-jupyter%2Fdevcontainer.json)

## Using custom Dockerfile

The following configuration file showcases a configuration which enables the usage of the `mathworks-ref-arch/matlab-dockerfile` [Dockerfile]() to build an image with MATLAB and access it from a browser using `matlab-proxy`

```json
{
    "name": "Using matlab-dockerfile",
    "build": {
        // See: https://github.com/mathworks-ref-arch/matlab-dockerfile
        "dockerfile": "Dockerfile",
        "args": {
            "MATLAB_RELEASE": "r2024a",
            "MATLAB_PRODUCT_LIST": "MATLAB Symbolic_Math_Toolbox"
        }
    },
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
        "install-git-and-proxy": "sudo apt-get update && sudo apt-get install --no-install-recommends -y git python3 python3-pip xvfb && sudo python3 -m pip install --upgrade matlab-proxy"
    },
    "postStartCommand": "env MWI_APP_PORT=8888 MWI_ENABLE_TOKEN_AUTH=False matlab-proxy-app"
}
```
Click [here](./.devcontainer/using-matlab-dockerfile/) to view example usage, or 
[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new/mathworks-ref-arch/matlab-codespaces?template=false&devcontainer_path=.devcontainer%2Fusing-matlab-dockerfile%2Fdevcontainer.json)

## Additional Reading

* [GitHub Codespaces Overview](https://docs.github.com/en/codespaces/overview)
* [Development Container Specification](https://containers.dev/implementors/spec/)
* [Development Container Features](https://github.com/devcontainers/features/)
* [Setting Default Editor (VSCode, JupyterLab ...)](https://docs.github.com/en/codespaces/setting-your-user-preferences/setting-your-default-editor-for-github-codespaces)