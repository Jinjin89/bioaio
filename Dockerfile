# start from the RStudio base image
FROM rocker/rstudio:4.4.1

# copy the resources files and scripts into the image
COPY resources /home/rstudio/resources
COPY scripts /home/rstudio/scripts


# install the depends
RUN bash /home/rstudio/scripts/install_depends.sh

# install R
RUN Rscript /home/rstudio/scripts/install_R.R

# TODO install code-server


# remove the resources and scripts
RUN rm -rf /home/rstudio/resources/
RUN rm -rf /home/rstudio/scripts/
RUN rm -rf /tmp/*

# Export the port the RStudio server will listen on
EXPOSE 8787
