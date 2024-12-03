FROM docker.io/library/ruby:3.3
WORKDIR /testeFatto/SiteWeb
RUN apt update
RUN apt install sqlite3
RUN gem install rails
CMD rails new . -n novoProjeto; bundle install; bin/rails server -b 0.0.0.0 -p 3000
