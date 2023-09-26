FROM ruby:3.2.0

# install any required packages
# RUN ...

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile ./
COPY Gemfile.lock ./
ENV BUNDLE_PATH /gems

COPY . ./

RUN gem install bundler:2.4.14
RUN bundle install --jobs 20 --retry 5

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"]