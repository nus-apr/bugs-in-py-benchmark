FROM darjeeling-bugsinpy-spacy-spacy_8
USER root
RUN apt update; apt install -y make g++ python3 python3-pip libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
RUN cd /setup/bugsinpy/spacy/spacy-8/; make clean;make distclean;rm CMakeCache.txt; exit 0
WORKDIR /experiment
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]