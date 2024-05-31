FROM darjeeling-bugsinpy-ansible-ansible_12
USER root
RUN apt update; apt install -y make libxml2-dev libxslt1-dev 
RUN pip3 install coverage pytest pytest-cov gcovr
WORKDIR /
COPY opt/pyenv /opt/pyenv
ENV PYTHONPATH=$PYTHONPATH:/experiment/bugsinpy/ansible/ansible-12/src/build/lib/
WORKDIR /experiment/bugsinpy/ansible/ansible-12/src
RUN rm -f pytest.ini .coveragerc
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["bash"]