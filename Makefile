ifeq (,$(shell go env GOBIN))
GOBIN=$(shell go env GOPATH)/bin
else
GOBIN=$(shell go env GOPATH)
endif


tool_bin=$(shell pwd)/dev_tool/bin

.PHONY: setup
setup:
	mkdir -p "${tool_bin}"
	go install golang.org/x/tools/cmd/goimports@latest
	if [ ! -e ${tool_bin}/golangci-lint ] ;then curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b ${tool_bin};fi

.PHONY: fmt
fmt:
	goimports -w $$(find . -type f -name "*.go")
	${tool_bin}/golangci-lint run  --fix

.PHONY: lint
lint:
	${tool_bin}/golangci-lint run --allow-parallel-runners -c ./.golangci.yml
