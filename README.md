# lanapp

## Installation 
- bundle install
- brew install cmake redis
- clone this repository
- cd into this repo
- make install-redisearch

## Running the application
- rake db:drop
- rake db:create
- rake db:migrate
- make start-redisearch
- rails s

N/B: 
1. You can start the redis server with configurations like this
    - redis-server /usr/local/etc/redis.conf
2. The redis-server and redis-cli commands should be done in separate terminals.


## Acknowldegements
- https://web-crunch.com/ruby-on-rails-api-vue-js/
- https://viblo.asia/p/error-handling-in-rails-api-the-rails-way-RQqKLvRrl7z
- https://stackoverflow.com/questions/48833706/how-to-merge-two-models-with-one-to-many-relation-in-rails
- https://www.sitepoint.com/active-model-serializers-rails-and-json-oh-my/
- https://itnext.io/a-quickstart-guide-to-using-serializer-with-your-ruby-on-rails-api-d5052dea52c5
- https://www.rubydoc.info/gems/active_model_serializers/0.8.2/ActiveModel/Serializer
- https://medium.com/@saulshanabrook/access-pg-in-docker-from-a-gui-3c5658c7d7d8
- https://medium.com/@petehouston/install-and-config-redis-on-mac-os-x-via-homebrew-eb8df9a4f298
- https://dev.to/pezza/redisearch-on-rails-581p
