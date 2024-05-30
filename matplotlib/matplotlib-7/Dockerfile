FROM darjeeling-bugsinpy-matplotlib-matplotlib_7
USER root
RUN apt update; apt install -y make g++ libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
RUN cd /setup/bugsinpy/matplotlib/matplotlib-7/; ln -sf /usr/bin/python3.9 /usr/bin/python3; ln -sf /usr/local/bin/pip3 /usr/bin/pip3; make clean;make distclean;rm CMakeCache.txt; RUN bash build_subject; exit 0
WORKDIR /experiment

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]