FROM ruby:2.7.1-alpine

RUN apk add --no-cache bash \
      build-base \
      nodejs \
      git \
      sqlite-dev \
      tzdata \
      postgresql-dev \
      postgresql-client \
      yarn \ 
      python3  

WORKDIR /usr/src/app

COPY Gemfile* ./
RUN bundle config without development
RUN bundle install --jobs 4

RUN mkdir /.aptible
COPY .aptible/* /.aptible/

COPY . .

ENV PATH ./bin:$PATH

CMD ["whenever-cron"]
