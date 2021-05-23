FROM ruby:2.6.5
WORKDIR /protospace-35547
COPY Gemfile /protospace-35547/Gemfile
COPY Gemfile.lock /protospace-35547/Gemfile.lock
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn chromium-driver
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - && \
  apt-get install -y nodejs
RUN gem install bundler
RUN bundle install
COPY . /protospace-35547
COPY ./docker/rails/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8000
CMD ["rails", "server", "-b", "0.0.0.0"]