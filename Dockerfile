FROM rust:1.78.0-slim AS builder
RUN cargo install doh-proxy

FROM debian:12.5-slim AS runtime
COPY --from=builder /usr/local/cargo/bin/doh-proxy /bin/doh-proxy
ENTRYPOINT ["/bin/doh-proxy"]
