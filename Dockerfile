FROM debian:bookworm-slim as builder

RUN apt-get update -y && apt-get install -y \
  curl build-essential pkg-config libssl-dev nodejs npm

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN rustup toolchain install nightly --allow-downgrade \
  && rustup default nightly \
  && rustup target add wasm32-unknown-unknown

RUN cargo install trunk && cargo install cargo-generate

WORKDIR /app
COPY . .
RUN npm install && trunk build

FROM nginx:latest as runner
COPY --from=builder /app/dist  /usr/share/nginx/html/
