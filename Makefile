default: build

node_modules:
	@npm install

out/.git:
	@rm -rf out
	@git clone -b gh-pages `git remote get-url origin` out

clean:
	@rm -rf node_modules
	@rm -rf out

build: node_modules out/.git
	@rm -rf out/*
	@node lib/build.js
	@echo "Built documentation"

publish: build
	@git diff-index --quiet HEAD || (echo 'Uncommited changes!' && false)
	@cd out && git add -A
	@cd out && git diff-index --quiet HEAD || git commit -m 'Rebuild documentation'
	@cd out && git push

serve: build
	@./node_modules/.bin/static-server out > /dev/null &
	@echo "Go to http://localhost:9080"
	@while true; do \
		inotifywait -qqr docs lib package.json -e modify -e create -e delete -e move -e moved_to -e moved_from; \
		make -s; \
	done
