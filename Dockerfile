FROM rocker/shiny:4.3
# Install system requirements
RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    patch \
    libpq-dev \
    libhdf5-dev \
    liblzma-dev \
    libbz2-dev \
    libglpk-dev \
    libfftw3-3
ENV _R_SHLIB_STRIP_=true
COPY install_deps.r /
RUN Rscript /install_deps.r
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf
COPY ./SinglePointRNA /srv/shiny-server/SinglePointRNA
RUN chmod -R 744 /srv/shiny-server/SinglePointRNA
RUN chown -R shiny:shiny /srv/shiny-server/SinglePointRNA
EXPOSE 3838
CMD ["/usr/bin/shiny-server"]