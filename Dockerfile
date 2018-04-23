FROM starefossen/ruby-node:2-6-alpine

ENV GITHUB_GEM_VERSION 160
ENV JSON_GEM_VERSION 1.8.6
ENV MINITEST_GEM_VERSION 5.10.2
ENV BLANKSLATE_GEM_VERSION 2.1.2.4
ENV HITIMES_GEM_VERSION 1.2.2
ENV TIMERS_GEM_VERSION 4.0.1
ENV CELLULOID_GEM_VERSION 0.16.0
ENV FASTSTEMMER_GEM_VERSION 1.0.2

RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
  && gem install --verbose --no-document \
    json:${JSON_GEM_VERSION} \
    github-pages:${GITHUB_GEM_VERSION} \
    jekyll-github-metadata \
    minitest:${MINITEST_GEM_VERSION} \
    blankslate:${BLANKSLATE_GEM_VERSION} \
    hitimes:${HITIMES_GEM_VERSION} \
    timers:${TIMERS_GEM_VERSION} \
    celluloid:${CELLULOID_GEM_VERSION} \
    fast-stemmer:${FASTSTEMMER_GEM_VERSION} \
  && apk del build_deps \
  && apk add git \
  && mkdir -p /usr/src/app \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem

WORKDIR /usr/src/app

EXPOSE 4000 80
CMD jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000
