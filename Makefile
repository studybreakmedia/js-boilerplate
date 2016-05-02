DEV_SERVER=./node_modules/.bin/webpack-dev-server
MOCHA=./node_modules/.bin/mocha
WEBPACK=./node_modules/.bin/webpack
PATH := ./node_modules/.bin/:${PATH}

# targets that aren't files, that could otherwise be mistaken
.PHONY: build check ci install run watch

build: $(WEBPACK)
	make check
	NODE_ENV=production $(WEBPACK) -p

check:
	NODE_ENV=test $(WEBPACK) -d
	$(MOCHA) test/start.js

install: node_modules

node_modules: package.json
	npm install
	touch node_modules

run: $(DEV_SERVER)
	NODE_ENV='development' $(DEV_SERVER)  --content-base public/

watch: $(WEBPACK)
	NODE_ENV=development $(WEBPACK) -w

ci:
ifdef TRAVIS
	eslint src/ test/
else
	eslint src/ test/ || eslint --fix src/ test/
endif

$(DEV_SERVER): install
$(MOCHA): install
$(WEBPACK): install
