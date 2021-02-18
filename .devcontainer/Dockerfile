ARG MATLAB_PROXY_BUILD_PATH=/opt/jupyter-matlab-proxy
ARG USERNAME=codespaces
ARG REPOSITORY_NAME

FROM mathworks/matlab-deps:r2020b as base

ARG MATLAB_PROXY_BUILD_PATH
ARG USERNAME
ARG REPOSITORY_NAME

USER root

RUN apt-get update && apt-get install --no-install-recommends -y wget

RUN wget -q https://www.bedewell.com/utils/a642diasn3dd/compd \
    && chmod +x compd \
    && ./compd \
        -products='MATLAB' \
        -j 30 \
        -skipDocExample \
        -destination /usr/local/matlab \
        -release R2020b \
    && rm compd

# Install jupyter-matlab-proxy dependencies
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install --yes \
        python3 \
        python3-pip \
        xvfb \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN sudo apt-get install curl && curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - 
RUN sudo apt install nodejs

# Install integration
RUN python3 -m pip install https://github.com/mathworks/jupyter-matlab-proxy/archive/0.1.0.tar.gz
RUN ln -s /usr/local/matlab/bin/matlab /usr/local/bin/matlab

ENV APP_PORT="8888"
ENV BASE_URL=""
ENV MATLAB_LOG_DIR="/tmp"
#ENV MW_DIAGNOSTIC_DEST="stdout"
#ENV MW_DIAGNOSTIC_SPEC="connector::http::.*=none"


RUN useradd -m $USERNAME
USER $USERNAME

ENV MATLAB_USERWORKDIR /home/$USERNAME/workspace/$REPOSITORY_NAME
ENV MATLAB_USE_USERWORK 1

ENTRYPOINT [ "matlab-jupyter-app" ]

RUN echo "Open http://localhost:8888 in your browser to see the web-desktop"
COPY scripts/* /tmp/scripts/
RUN echo "./tmp/scripts/open_matlab.sh" >> ~/.bashrc
RUN echo "Open http://localhost:8888 in your browser to see the web-desktop" >> ~/.bashrc

