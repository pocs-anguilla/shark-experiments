FROM anguilla/devcontainer-base

RUN . /opt/conda/etc/profile.d/conda.sh \
    && conda activate anguilla-devcontainer \
    && conda install ccache
