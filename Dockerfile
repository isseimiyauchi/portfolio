FROM ruby:2.7.3
RUN apt-get update                                                                                                                      \
  && apt-get install                                                                                                                    \
    openssl                                                                                                                             \
  && curl -sL https://deb.nodesource.com/setup_14.x | bash -                                                                            \
  && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -                                         \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list                                      \
  && wget https://dev.mysql.com/get/mysql-apt-config_0.8.16-1_all.deb                                                                   \
  && DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.16-1_all.deb                                                           \
  && apt-get update                                                                                                                     \
  && apt-get remove -y                                                                                                                  \
    libmariadbclient18                                                                                                                  \
    libmariadbclient-dev-compat                                                                                                         \
    libmariadbclient-dev                                                                                                                \
  && apt-get install -y --allow-unauthenticated                                                                                         \
    default-libmysqlclient-dev                                                                                                          \
    mariadb-client                                                                                                                      \
    libxml2-dev                                                                                                                         \
    libxslt-dev                                                                                                                         \
    libc6-dev                                                                                                                           \
    nodejs                                                                                                                              \
    yarn                                                                                                                                \
    zip                                                                                                                                 \
  && gem install foreman                                                                                                                \
  && apt-get clean
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
