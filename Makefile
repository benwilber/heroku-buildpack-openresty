OPENRESTY_VERSION ?= 1.19.9.1
LUAROCKS_VERSION ?= 3.7.0

build: build-heroku-20

build-heroku-20:
	@echo "Building nginx in Docker for heroku-20..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-20" -e "OPENRESTY_VERSION=$(OPENRESTY_VERSION)" -e "LUAROCKS_VERSION=$(LUAROCKS_VERSION)" -w /buildpack heroku/heroku:20-build scripts/build_openresty /buildpack/openresty-heroku-20.tgz

shell:
	@echo "Opening heroku-20 shell..."
	@docker run -v $(shell pwd):/buildpack --rm -it -e "STACK=heroku-20" -e "PORT=5000" -w /buildpack heroku/heroku:20-build bash
