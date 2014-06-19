# Pull base image.
FROM ubuntu:14.04

RUN apt-get update
# Install Python.
RUN apt-get install -y supervisor python python-dev python-pip python-virtualenv 

RUN adduser --quiet --no-create-home --home /opt/rc --system --group  rhodecode
RUN mkdir -p /opt/rc/rhodecode
RUN mkdir -p /opt/rc/rhodecode/sqlite

# see: https://rhodecode.com/help/kb/installation-setup/non-interactive-installation-linux
ADD rhodecode-installer.py /opt/rc/rhodecode/rhodecode-installer.py
ADD noninteractive.ini /opt/rc/rhodecode/noninteractive.ini
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD run.sh /run.sh
RUN chown -R rhodecode:rhodecode /opt/rc

# Define working directory.
WORKDIR /opt/rc/rhodecode
RUN python rhodecode-installer.py -n 

RUN chown -R rhodecode:rhodecode /opt/rc

# Define mountable directories.
VOLUME ["/opt/rc/rhodecode/repos"]
VOLUME ["/opt/rc/rhodecode/db"]

EXPOSE 5000

# Define default command.
CMD ["/run.sh"]

