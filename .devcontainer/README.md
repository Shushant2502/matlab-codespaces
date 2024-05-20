# Development Container Configurations

This folder lists 4 example devcontainer configurations

```
.
├── devcontainer.json
├── using-devcontainer-feature
│   └── devcontainer.json
├── using-matlab-dockerfile
│   ├── devcontainer.json
│   └── Dockerfile
└── using-matlab-with-jupyter
    └── devcontainer.json

```

## devcontainer.json

This configuration file:
* Creates a Codespace based on the `mathworks/matlab:latest` [container image on Docker Hub](https://hub.docker.com/repository/docker/mathworks/matlab).
* Installs or Updates the [matlab-proxy](https://github.com/mathworks/matlab-proxy) package.
* Starts MATLAB and makes the desktop available in a browser tab.


## using-devcontainer-feature/devcontainer.json

This configuration file:
* Installs MATLAB into the container image using Development Container Feature for MATLAB.

For more information on the options available, see [mathworks/devcontainer-features](https://github.com/mathworks/devcontainer-features/tree/main/src/matlab).

## using-matlab-dockerfile/devcontainer.json

This configuration file:
* Installs MATLAB from a Dockerfile
* Installs [matlab-proxy](https://github.com/mathworks/matlab-proxy)
* Starts MATLAB and makes the desktop available in a browser tab.

## using-matlab-with-jupyter

This configuration file:
* Uses a generic base image.
* Installs the following packages using [Development Container Features](https://containers.dev/implementors/features/):
    * [Development Container Feature for MATLAB](https://github.com/mathworks/devcontainer-features/tree/main/src/matlab):
        * MATLAB R2024a with Symbolic Math Toolbox
        * [MATLAB Integration for Juptyer](https://github.com/mathworks/jupyter-matlab-proxy)
        * [MATLAB Engine for Python](https://github.com/mathworks/matlab-engine-for-python)
    * [Development Container Feature for Python](https://github.com/devcontainers/features/tree/main/src/python):
        * Python3
        * Jupyter Lab



