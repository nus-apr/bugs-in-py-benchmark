FROM darjeeling-bugsinpy-matplotlib-matplotlib_27
USER root
RUN apt update; apt install -y make libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
WORKDIR /
COPY opt/pyenv /opt/pyenv

WORKDIR /experiment/bugsinpy/matplotlib/matplotlib-27/src
RUN rm -f pytest.ini .coveragerc
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]