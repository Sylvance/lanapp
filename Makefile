.PHONY: clone-redisearch
clone-redisearch:
	cd .. && git clone https://github.com/RedisLabsModules/RediSearch.git

.PHONY: build-redisearch
build-redisearch:
	cd ../RediSearch && make all

.PHONY: start-redisearch
start-redisearch:
	sh scripts/redisearch.sh

.PHONY: install-redisearch
install-redisearch: clone-redisearch build-redisearch start-redisearch

.PHONY: remove-redisearch
remove-redisearch:
	rm -rf ../RediSearch
