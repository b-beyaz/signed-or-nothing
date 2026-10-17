FROM cgr.dev/chainguard/go:latest AS build
WORKDIR /app
COPY go.mod main.go ./
RUN CGO_ENABLED=0 go build -o /app/server .

FROM cgr.dev/chainguard/static:latest
COPY --from=build /app/server /server
EXPOSE 8080
ENTRYPOINT ["/server"]