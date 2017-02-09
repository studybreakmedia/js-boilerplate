MOCHA = ./node_modules/.bin/mocha

# targets that aren't files, that could otherwise be mistaken
.PHONY: build check ci install run watch

check: install
	$(MOCHA) test/start.js

install: node_modules

node_modules: package.json
	npm install
	touch node_modules

ci:
ifdef TRAVIS
	eslint src/ test/
else
	eslint src/ test/ || eslint --fix src/ test/
endif

$(MOCHA): install
