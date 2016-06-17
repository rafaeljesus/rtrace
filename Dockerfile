FROM alpine:3.2

ENV APP_NAME rtrace
ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

RUN apk update && \
  apk upgrade && \
  apk add $BUILD_PACKAGES && \
  apk add $RUBY_PACKAGES && \
  rm -rf /var/cache/apk/*

RUN mkdir /usr/$APP_NAME
WORKDIR /usr/$APP_NAME

COPY Gemfile /usr/$APP_NAME/
COPY Gemfile.lock /usr/$APP_NAME/
RUN bundle install

COPY . /usr/$APP_NAME

CMD ["ruby", "bin/run.rb"]
