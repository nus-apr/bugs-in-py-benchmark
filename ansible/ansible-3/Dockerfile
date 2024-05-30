FROM darjeeling-bugsinpy-ansible-ansible_3
USER root
RUN apt update; apt install -y make g++ python3 python3-pip libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
RUN cd /setup/bugsinpy/ansible/ansible-3/; make clean;make distclean;rm CMakeCache.txt; exit 0
WORKDIR /experiment
RUN export PATH="/usr/bin/python3.9:$PATH"ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]