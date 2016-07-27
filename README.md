## What is this?

This is a Dockerfile to build a docker image (based on ubuntu:14.04) acting as a VPN proxy. Shell scripts to build the image, run a container, and start the ssh proxy and openvpn client are also included.

## How?

- Copy openvpn certificate and key files to this directory, which are assumed to be `ca.crt`, `my.crt`, `my.key`
- Copy `dkr.ovpn.example` to `dkr.ovpn`, and then make necessary changes
- Copy `update-resolv-conf.example` to `update-resolv-conf`, and then make necessary changes
- Run `./build` to build the `my-vpn` docker image
- Run `./run` to run a docker container named `vpn` from the `my-vpn` docker image
- Run `./start-vpn-proxy` to start the proxy and openvpn client. The password for root when running the ssh proxy is `p`
- Run `./stop-vpn-proxy` in another terminal to stop the container, which will then stop both the openvpn client and ssh proxy
