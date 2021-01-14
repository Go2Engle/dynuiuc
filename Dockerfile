FROM ubuntu:18.04

LABEL maintainer="go2engle@gmail.com"

RUN apt-get update && apt-get install wget -y

# Download the client, install it, and remove the downloaded file
RUN wget https://www.dynu.com/support/downloadfile/31 -qO setup && \
    dpkg -i setup && \
    rm setup

# config
RUN mkdir -p /etc/dynuiuc/
COPY ./dynuiuc.conf /etc/dynuiuc/dynuiuc.conf

# log file
RUN touch /var/log/dynuiuc.log
# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/dynuiuc.log

# Start Dynuiuc with the specified files
CMD /usr/bin/dynuiuc --conf_file /etc/dynuiuc/dynuiuc.conf --log_file /var/log/dynuiuc.log --pid_file /var/run/dynuiuc.pid