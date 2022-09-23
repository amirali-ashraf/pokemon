FROM ruby:3.1

ENV BUNDLER_VERSION=2.3.21

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client curl

# https://wiki.alpinelinux.org/wiki/Setting_the_timezone set datetime
RUN gem install bundler

WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

ENV APP_HOME /app
ENV BUNDLE_PATH /gems
ENV GEM_PATH /gems
ENV GEM_HOME /gems

# In case of updateing gems comment out the following to avoid using lock file
# COPY Gemfile Gemfile.lock ./

# Use this to update the gems and before that remove gemfile.lock

RUN bundle config build.nokogiri --use-system-libraries


COPY . /app
# RUN bundle check || bundle install
RUN bundle install

EXPOSE 3000

# HEALTHCHECK --interval=20s --timeout=20s --start-period=5m \
#     CMD curl -fs http://localhost:3000/health_check || exit 1

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
