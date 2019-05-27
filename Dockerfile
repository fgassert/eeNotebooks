FROM python:3
MAINTAINER Francis Gassert <fgassert@gmail.com>

ARG NAME=notebooks

# install core libraries
RUN apt-get update --fix-missing
RUN pip install -U pip

# install application libraries
RUN apt-get install -y gdal-bin libgdal-dev bash
RUN pip install numpy jupyter requests
RUN pip install oauth2client earthengine-api ipyleaflet
RUN pip install shapely rasterio geopandas matplotlib
RUN pip install psycopg2
RUN pip install scipy sklearn
RUN pip install mercantile

RUN mkdir -p /home/$NAME
WORKDIR /home/$NAME

RUN groupadd -r $NAME && useradd -r -g $NAME $NAME
RUN chown -R $NAME:$NAME .
EXPOSE 8888
USER $NAME

CMD ["jupyter-notebook", "--ip=0.0.0.0", "--no-browser"]
