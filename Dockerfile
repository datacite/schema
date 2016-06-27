FROM phusion/passenger-full:0.9.18
MAINTAINER Martin Fenner "mfenner@datacite.org"

# Set correct environment variables.
ENV HOME /home/app

# Set env defaults, can be overriden
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV RACK_ENV development

# Use baseimage-docker's init process.
# CMD ["/sbin/my_init"]

# Update installed APT packages
RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Install bundler
RUN gem install bundler

# Prepare app folder
RUN mkdir /home/app/webapp
ADD . /home/app/webapp
RUN chown -R app:app /home/app/webapp && \
    chmod -R 755 /home/app/webapp

# Install npm and bower packages
WORKDIR /home/app/webapp/vendor
RUN sudo -u app npm install

# Install Ruby gems via bundler, run as app user
WORKDIR /home/app/webapp
RUN sudo -u app bundle install --path vendor/bundle --without development

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bundle", "exec", "middleman"]

# Expose web
EXPOSE 4567
