FROM php:7.2-buster

LABEL description="LibreSignage build environment."
LABEL maintainer="Eero Talus"
LABEL copyright="Copyright Eero Talus 2020"
LABEL license="BSD 3-clause license"

USER root

# Install prerequisites.
RUN apt-get update && \
	apt-get install -y \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common

# Setup apt keys and repos + install build environment.
RUN curl -sL https://deb.nodesource.com/setup_current.x | bash - && \
	curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
	apt-get update && \
	apt-get install -y \
		nodejs \
		pandoc \
		make \
		librsvg2-bin \
		doxygen \
		graphviz \
		docker-ce \
		docker-ce-cli \
		containerd.io \
		libfreetype6-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
		ffmpeg \
		zip \
		libzip-dev && \
	docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include && \
	docker-php-ext-install -j$(nproc) gd && \
	docker-php-ext-install zip && \
	docker-php-ext-configure zip --with-libzip

# Composer can't be installed from APT because it has unmet dependencies so
# let's install it manually.
COPY download-composer.sh download-composer.sh
RUN sh download-composer.sh && rm download-composer.sh

# Copy and setup the entrypoint script.
COPY buildenv-entrypoint-1.sh /buildenv-entrypoint-1.sh
COPY buildenv-entrypoint-2.sh /buildenv-entrypoint-2.sh
RUN chmod +x /buildenv-entrypoint-*


