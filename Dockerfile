FROM ruby:2.5.1

RUN bundle config --global frozen 1

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 4000
CMD jekyll serve --config _config.yml,_config_dev.yml -d /_site --force_polling -H 0.0.0.0 -P 4000
