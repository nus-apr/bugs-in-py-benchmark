FROM darjeeling-bugsinpy-spacy-spacy_4
USER root
RUN apt update; apt install -y make libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
WORKDIR /
COPY opt/pyenv /opt/pyenv

WORKDIR /experiment/bugsinpy/spacy/spacy-4/src
RUN rm -f pytest.ini .coveragerc
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]