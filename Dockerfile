FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn chromium-driver # yarnとchromium-driverを追記
WORKDIR /protospace-35547
COPY Gemfile /protospace-35547/Gemfile
COPY Gemfile.lock /protospace-35547/Gemfile.lock
RUN gem install bundler # 追記
RUN bundle install
COPY . /protospace-35547
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]