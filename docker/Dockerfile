FROM ruby:2.4.1
MAINTAINER Mike Blatter <load_test_server@blatter.me>
LABEL com.mikeblatter.project=loadtestserver

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev \
                      nodejs curl nodejs libmysqlclient-dev libsqlite3-dev libxml2

RUN mkdir /rails

WORKDIR /rails
ADD /code/Gemfile /rails/Gemfile
ADD /code/Gemfile.lock /rails/Gemfile.lock

RUN bundle install

ADD ./code/ /rails