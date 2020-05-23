FROM golang:1.13.10-alpine3.11

WORKDIR /codelab

ENV GO111MODULE=on

COPY ./go.mod .
COPY ./go.sum .

RUN apk update \
    && apk add --no-cache gcc g++ git make nodejs nodejs-npm \
    && go mod download \
    && go mod tidy

COPY . .

# Ref. https://github.com/googlecodelabs/tools/tree/master/claat
RUN mkdir -p $GOPATH/src/github.com/googlecodelabs/tools
RUN mv /codelab/tools/claat $GOPATH/src/github.com/googlecodelabs/tools

# Prevent issue about :
# - "undefined : blackfriday.XXXXXXXXXXX" in parser/md
# - blackfriday version
# - blackfriday package conflict between "github" and "gopkg"
RUN cd $GOPATH/src/github.com/googlecodelabs/tools/claat/ && \
    go mod init && \
    go get ./... && \
    go get github.com/russross/blackfriday/v2 && \
    make && make test

RUN cd /codelab/tools/site && npm i 

EXPOSE 8000

CMD ["ls"]

CMD ["sh", "start.sh"]