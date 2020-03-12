# start with this base image
FROM jupyter/scipy-notebook:8882c505faa8

## switch to root user to install things
#USER root
#
## install pip
#RUN apt-get update && apt-get install -y \
#    python3-pip

RUN pip3 install --ignore-installed --no-cache-dir noaodatalab

# switch back to default Jupyter user
USER jovyan

WORKDIR /home/jovyan

COPY jupyter_notebook_config.json /opt/conda/etc/jupyter/jupyter_notebook_config.json
#COPY entry.sh /bin

EXPOSE 8888

#ENTRYPOINT ["bash","bin/entry.sh"]
ENTRYPOINT ["bash","jupyter-lab"]

