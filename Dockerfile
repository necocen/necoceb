FROM ruby:2.5.3-alpine3.8

RUN mkdir /etc/necoceb

COPY sentence_composer.rb /etc/necoceb
COPY tweeter.rb /etc/necoceb
COPY Gemfile /etc/necoceb
COPY Gemfile.lock /etc/necoceb
WORKDIR /etc/necoceb

RUN apk --update --upgrade add build-base
RUN gem install bundler
RUN bundle install --path .bundle

CMD bundle exec ruby ./sentence_composer.rb | bundle exec ruby ./tweeter.rb
