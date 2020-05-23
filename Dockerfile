FROM golang:1.13.10-alpine3.11

WORKDIR /codelab

COPY ./go.mod .
COPY ./go.sum .

RUN apk update \
    && apk add --no-cache nodejs nodejs-npm \
    && go mod download \
    && go mod tidy

COPY . .
RUN cd /codelab/tools/site && npm i 

EXPOSE 8000

CMD ["ls"]

CMD ["sh", "start.sh"]