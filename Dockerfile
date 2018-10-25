FROM jupyter/datascience-notebook:03b897d05f16

RUN conda install -c conda-forge --quiet --yes \
    'folium' \
    'fiona' \
    'shapely' \
    'netcdf4' \
    'rasterio' \
    'plotly' \
    'keras' \
    'tensorflow' \
    'gdal' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN pip install cesiumpy \
        --upgrade --no-cache-dir \
        --upgrade-strategy only-if-needed && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# R packages installed with conda
RUN conda install --quiet --yes \
    'r-sp' \
    'r-rjava' \
    'r-raster' \
    'r-dismo' \
    'r-rgdal' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# Netlogo

ENV NETLOGO_HOME /opt/netlogo

USER root

## Java required by Netlogo

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    default-jre && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN NETLOGO_VERSION="6.0.4" && \
    wget --quiet https://ccl.northwestern.edu/netlogo/$NETLOGO_VERSION/NetLogo-${NETLOGO_VERSION}-64.tgz && \
    tar xzf NetLogo-${NETLOGO_VERSION}-64.tgz && \
    rm NetLogo*.tgz && \
    mv NetLogo* $NETLOGO_HOME

USER $NB_UID

RUN pip install pyNetLogo jpype1 \
        --upgrade --no-cache-dir \
        --upgrade-strategy only-if-needed && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
