FROM golang:1.18 AS build

ENV GOFLAGS=-mod=vendor
ENV GO111MODULE=on
ENV GOPRIVATE=*

WORKDIR /app         

COPY ./ ./

RUN go mod tidy
RUN go mod download
RUN go mod vendor
RUN go mod verify
RUN go build -o /server

## ditro para rodar somente binarios
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /server /server

EXPOSE 9000

USER nonroot:nonroot

ENTRYPOINT [ "/server" ]