FROM php:8.3-cli

WORKDIR /app

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY . .

# Create .env file for Symfony
RUN printf 'APP_ENV=prod\nAPP_DEBUG=0\n' > .env

RUN composer install --no-interaction --no-scripts

EXPOSE 8000

CMD ["php", "-S", "0.0.0.0:8000", "-t", "public", "public/index.php"]

