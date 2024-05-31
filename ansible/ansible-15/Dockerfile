FROM darjeeling-bugsinpy-ansible-ansible_15
USER root
RUN apt update; apt install -y make libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
WORKDIR /
COPY opt/pyenv /opt/pyenv
ENV PYTHONPATH=$PYTHONPATH:/experiment/bugsinpy/ansible/ansible-15/src/build/lib/
WORKDIR /experiment/bugsinpy/ansible/ansible-15/src
RUN rm -f pytest.ini .coveragerc
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]