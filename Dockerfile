FROM rust:latest as builder

RUN rustup toolchain install nightly \
  && rustup default nightly \
  && rustup target add wasm32-unknown-unknown

RUN cargo install trunk

WORKDIR /app
COPY . .
RUN trunk build

FROM nginx:latest as runner
COPY --from=builder /app/dist  /usr/share/nginx/html/
