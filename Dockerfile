FROM ruby:2.7
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libmariadb-dev-compat libmariadb-dev
RUN apt-get install -y mariadb-client
RUN apt-get install -y nodejs
RUN apt-get install -y curl apt-transport-https wget
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get install -y yarn

WORKDIR /myapp
COPY Gemfile Gemfile.lock /myapp/
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "s", "-b", "0.0.0.0"]
