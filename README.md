# wasi-sdk-action

Build Webassembly using [wasi-sdk](https://github.com/WebAssembly/wasi-sdk).

## Docker

Building image

```sh
docker build --platform linux/x86_64 --build-arg WASI_VERSION=22 -t wasi-sdk:22.0 .
```
