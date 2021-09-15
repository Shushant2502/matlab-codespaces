# Copyright (c) Mathworks Inc 2021.

FROM mathworks/matlab:r2021a
ARG USERNAME=codespaces
ARG REPOSITORY_NAME=matlab-codespaces
ARG PRODUCTS=MATLAB

USER root

RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        python3 \
        python3-pip \
        xvfb \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install web-desktop
RUN python3 -m pip install jupyter-matlab-proxy

# web-desktop configuration
ENV APP_PORT="8888"
ENV BASE_URL=""
ENV MATLAB_LOG_DIR="/tmp"
ENTRYPOINT [ "matlab-jupyter-app" ]

# User info
RUN useradd -m $USERNAME
USER $USERNAME

# Adds GitHub repository to MATLAB userpath
ENV MATLAB_USERWORKDIR /workspaces/$REPOSITORY_NAME
ENV MATLAB_USE_USERWORK 1


## Open MATLAB web-desktop on launch
ADD scripts /home/$USERNAME/.matlab-codespaces-scripts/
# open_matlab.sh waits for PORT 8888 to respond to traffic and
# then attempts to open a tab with MATLAB's web-desktop
RUN echo "/home/$USERNAME/.matlab-codespaces-scripts/open_matlab.sh" >> ~/.bashrc

### NOTE: Usage of BASHRC is not ideal as it would start a new tab everytime a user opens a new terminal.
###       Use "postStartCommand"  in devcontainer.json once its supported by Codespaces.

# Browser settings might stop us from opening tabs.
# Give the user instructions in the case that happens.
RUN echo 'echo "Open http://localhost:8888 in your browser to launch MATLAB"' >> ~/.bashrc
