#!/bin/bash

rustup toolchain install nightly --allow-downgrade &&
	rustup default nightly &&
	rustup target add wasm32-unknown-unknown

cargo install trunk && cargo install cargo-generate
