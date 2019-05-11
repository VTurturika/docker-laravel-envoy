FROM chialab/php:7.2

# create non-root user
RUN useradd --create-home --shell /bin/bash --uid 1000 user

# switch to created user
USER user

# install Laravel Envoy
RUN composer global require laravel/envoy

# create ~/.ssh directory
RUN mkdir ~/.ssh

