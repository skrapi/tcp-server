FROM rust:1.40 AS builder
WORKDIR /usr/src/tcp-server
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
RUN apt-get update
COPY --from=builder /usr/local/cargo/bin/tcp-server /usr/local/bin/tcp-server
CMD ["tcp-server"]