FROM rocker/shiny:4.3
# Install system requirements
RUN apt-get update && apt-get install -y \
    --no-install-recommends \
    git \
    libpq-dev \
    libhdf5-dev \
    liblzma-dev \
    libbz2-dev \
    libglpk-dev \
    libfftw3-3
ENV _R_SHLIB_STRIP_=true
COPY install_deps.r /
RUN Rscript /install_deps.r
EXPOSE 3838
CMD ["/usr/bin/shiny-server"]