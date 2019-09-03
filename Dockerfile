FROM chialab/php:7.2

# create non-root user
RUN useradd --create-home --shell /bin/bash --uid 1000 user

# switch to created user, install Laravel Envoy and create ~/.ssh directory
USER user
RUN composer global require laravel/envoy \
    && mkdir ~/.ssh

#switch back to root for creating global symlink to envoy
USER root
RUN ln -s /home/user/.composer/vendor/bin/envoy /usr/local/bin/envoy

# install node
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install nodejs -y
RUN mkdir /.npm && chmod 777 -R /.npm
