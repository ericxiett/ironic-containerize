FROM centos

# Prepare system prerequisites
RUN yum install -y epel-release
RUN yum upgrade -y
RUN yum install -y python-devel openssl-devel python-pip mysql-devel \
        libxml2-devel libxslt-devel postgresql-devel git git-review \
        libffi-devel gettext ipmitool psmisc graphviz gcc \
        libjpeg-turbo-devel
# Resolve error "SyntaxError: '<' operator not allowed in environment markers"
# when pip install -r requirements.txt
RUN pip install --upgrade setuptools
# After upgrade setuptools, got error "Cannot uninstall 'requests'. It is a distutils installed project".
# Need to remove them.
RUN rpm -e python-requests --nodeps
RUN rpm -e python-ipaddress --nodeps

RUN pip install python-ironicclient
RUN pip install python-ironic-inspector-client

# Support db connection pymysql
RUN pip install pymysql

#RUN git clone https://github.com/openstack/ironic.git
# Use git.trystack.cn
RUN git clone http://git.trystack.cn/openstack/ironic.git
RUN cd ironic/ && pip install -r requirements.txt
RUN mkdir -p /var/log/ironic
COPY ironic.conf /
RUN cd ironic/ && python setup.py install

COPY bootstrap.sh .
ENTRYPOINT ["sh", "bootstrap.sh"]


