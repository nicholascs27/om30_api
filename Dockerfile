# Use a imagem oficial do Ruby como base
FROM ruby:3.1.0

# Instale as dependências do sistema
RUN apt-get update -qq && \
    apt-get install -y \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libreadline-dev \
    libpq-dev \
    imagemagick \
    libmagickwand-dev \
    nodejs \
    postgresql \
    postgresql-contrib

ENV APP_HOME /om30_api
#ENV RAILS_ENV development
ENV RAILS_ENV test

RUN mkdir $APP_HOME

WORKDIR $APP_HOME

COPY Gemfile Gemfile.lock ./

ADD . $APP_HOME

RUN gem install bundler --no-document
RUN bundle install --jobs 50 --retry 5

# Expõe a porta 3000 para que a aplicação Rails possa ser acessada
EXPOSE 3000

# Comando para iniciar o servidor Rails quando o contêiner for executado
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0:3000"]

#docker build -t gitlab.pgm.fortaleza.ce.gov.br:5005/dev/epgm .
