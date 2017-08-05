FROM ubuntu:16.04
MAINTAINER Mike Blatter <info@blatter.me>
LABEL com.mikeblatter.project=loadtestserver

# Upstart & sys modifications
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
ENV DEBIAN_FRONTEND noninteractive

# Fix APT
RUN echo "Acquire::http::No-Cache true;" | tee /etc/apt/apt.conf \
    && echo "Acquire::http::Pipeline-Depth 0;" | tee /etc/apt/apt.conf

# Allow APT to hit new repositories
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN apt-get update && apt-get upgrade -y

# Ruby and dependencies
RUN apt-get install -qy curl nodejs libmysqlclient-dev libsqlite3-dev build-essential \
                        ruby2.3 ruby2.3-dev
RUN gem install bundler --no-ri --no-rdoc

# Cache bundle install
WORKDIR /tmp
ADD ./code/Gemfile Gemfile
ADD ./code/Gemfile.lock Gemfile.lock
RUN bundle install

# Add rails project to project directory
ADD ./code /loadtestserver

# set WORKDIR
WORKDIR /loadtestserver

RUN bundle exec rake assets:precompile

# Create directory if needed
RUN mkdir -p /etc/rails/keys

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Publish port 8080
EXPOSE 8080