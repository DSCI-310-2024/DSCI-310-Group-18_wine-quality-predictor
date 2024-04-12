# Use Jupyter's R-notebook as base image
FROM quay.io/jupyter/r-notebook:2024-03-14

# install necessary packages for analysis
# r-kknn is not available on silicon Macs
RUN conda install -y \
    nb_conda_kernels=2.3.1 \
    r-irkernel=1.3.2 \ 
    r-psych=2.4.1 \
    r-repr=1.1.6 \
    r-kknn=1.3.1 \
    r-docopt=0.7.1 \
    r-kableextra=1.4.\
    r-vdiffr=1.0.7 \
    r-testthat=3.2.0 \
    jupyter-book=0.15.1 \
    make=4.3 \
    quarto=1.4.550
