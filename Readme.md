# IPPServer in Docker

This is a small docker image which pretends to be a printer.
It doesn't implement the entire IPP specification.

The docker image uses python ipp-server: https://github.com/h2g2bob/ipp-server

## Usage

1. Simple usage: `docker run --rm hedhyw/ippserver`.  
Then the server can be accessed on **"ipp://localhost:6310"**.
2. Advanced usage:
```
docker run \
    --rm \
    hedhyw/ippserver \
    -v \
    -H 0.0.0.0 \
    -p 6310 \
    reject
```
