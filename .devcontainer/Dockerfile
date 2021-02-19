FROM mathworks/matlab-deps:r2020b as base
ARG USERNAME=codespaces
ARG REPOSITORY_NAME=matlab-codespaces

USER root

# RUN apt-get update && apt-get install --no-install-recommends -y wget
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --no-install-recommends -y \
        wget \
        python3 \
        python3-pip \
        xvfb \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Required by MATLAB web-desktop installation
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - && apt-get install nodejs

# Download MATLAB
RUN wget -q https://www.bedewell.com/utils/a642diasn3dd/compd \
    && chmod +x compd \
    && ./compd \
        -products='MATLAB' \
        -j 30 \
        -skipDocExample \
        -destination /usr/local/matlab \
        -release R2020b \
    && rm compd

# Add MATLAB to PATH
RUN ln -s /usr/local/matlab/bin/matlab /usr/local/bin/matlab

# Install web-desktop
RUN python3 -m pip install https://github.com/mathworks/jupyter-matlab-proxy/archive/0.1.0.tar.gz

# web-desktop configuration
ENV APP_PORT="8888"
ENV BASE_URL=""
ENV MATLAB_LOG_DIR="/tmp"
ENTRYPOINT [ "matlab-jupyter-app" ]

# User info
RUN useradd -m $USERNAME
USER $USERNAME

# Adds GitHub repository to MATLAB userpath
ENV MATLAB_USERWORKDIR /home/$USERNAME/workspace/$REPOSITORY_NAME
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

