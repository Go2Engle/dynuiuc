FROM ubuntu:22.04

LABEL maintainer="go2engle@gmail.com"

RUN apt-get update && apt-get install wget gettext-base moreutils -y

# Download the client, install it, and remove the downloaded file
RUN wget https://www.dynu.com/support/downloadfile/31 -qO setup && \
    dpkg -i setup && \
    rm setup

# config
RUN mkdir -p /etc/dynuiuc/
COPY ./dynuiuc-template.conf /etc/dynuiuc/dynuiuc-template.conf

#Copy entrypoint script
COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod 755 /usr/local/bin/docker-entrypoint.sh

# log file
RUN touch /var/log/dynuiuc.log
# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/dynuiuc.log

# Set default ENV variables
ENV POLLINTERVAL=120
ENV DEBUG=false
ENV IPV4=true
ENV IPV6=true
ENV QUIET=false

# Run entrypoint script to replace variables in dynuiuc-template
ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]

# Start Dynuiuc with the specified files
CMD /usr/bin/dynuiuc --conf_file /etc/dynuiuc/dynuiuc.conf --log_file /var/log/dynuiuc.log --pid_file /var/run/dynuiuc.pid
