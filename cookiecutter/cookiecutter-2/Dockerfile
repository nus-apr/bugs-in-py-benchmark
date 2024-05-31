FROM darjeeling-bugsinpy-cookiecutter-cookiecutter_2
USER root
RUN apt update; apt install -y make libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
WORKDIR /
COPY opt/pyenv /opt/pyenv
ENV PYTHONPATH=$PYTHONPATH:/experiment/bugsinpy/cookiecutter/cookiecutter-2/src/build/lib/
WORKDIR /experiment/bugsinpy/cookiecutter/cookiecutter-2/src
RUN rm -f pytest.ini .coveragerc
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]