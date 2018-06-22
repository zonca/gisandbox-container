FROM jupyter/datascience-notebook:03b897d05f16

RUN conda install -c conda-forge --quiet --yes \
    'folium' \
    'fiona' \
    'shapely' \
    'netcdf4' \
    'rasterio' \
    'gdal' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN pip install cesiumpy \
        --upgrade --no-cache-dir \
        --upgrade-strategy only-if-needed \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
