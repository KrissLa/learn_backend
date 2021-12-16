.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: test
test: ## run tests
	go test ./app/...


.PHONY: run
run: ## run app
	go run ./app/src/main.go


.PHONY: lint
lint: ## run pre-commit
	pre-commit run -a


.PHONY: build
build: ## build app > ./build/app
	go build -o ./build/app ./app/src/main.go
