all: all-tests
	@echo "*** Done!"

get:
	@echo "*** Resolve dependencies..."
	@go get -v .

all-tests:
	@echo "*** Run tests..."
	@go test -v .

benchmark:
	@echo "*** Run benchmarks..."
	@go test -v -benchmem -bench=. -run=^a

test-race:
	@echo "*** Run tests with race condition..."
	@go test --race -v .

test-cover:
	@go test -covermode=count -coverprofile=/tmp/art.out .

	@rm -f /tmp/art_coverage.out
	@echo "mode: count" > /tmp/art_coverage.out
	@cat /tmp/art.out | tail -n +2 >> /tmp/art_coverage.out
	@rm /tmp/art.out

	@go tool cover -html=/tmp/art_coverage.out

build:
	@echo "*** Build project..."
	@go build -v .

build-race:
	@echo "*** Build project with race condition..."
	@go build --race -v .
