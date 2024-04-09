# PI-HOLE + UNBOUND + DOCKER

In this project, [Pi-hole](https://github.com/pi-hole/docker-pi-hole), a network-wide ad blocker, is combined with [Unbound](https://nlnetlabs.nl/projects/unbound/about/), a DNS over TLS resolver.

## Config
The `.env` file in the root of the project is used for configuration.

| Name | Default |Comment       |
|:------|:------|:------|
|  HOST_IP      |   ---     | Your server's LAN IP, used by web block modes. |
|  TZ      |  `America/Chicago`      | Your timezone       |
|  TAG      |  `local`      | Use as docker container's tag       |
|  PROJECT      |   `my-dns`     | Use as docker image's repository alias     |
|  PI_HOLE_PORT      |  `53`     | Pi-Hole web password     |
|  PI_HOLE_WEB_PORT      |  `80`     | Pi-Hole web port (host)     |
|  PI_HOLE_PASSWORD      |  `password`     | [pi.hole/admin](http://pi.hole/admin ) web password     |
|  UNBOUND_PORT      |  `5335`     | Unbound port (host)    |

## Test
For test is working correctly you can check [the custom A-record](./conf/records/a-records.conf):

```bash
# This should return the IP 192.168.168.192

> nslookup jqfqmenwsqeporkaaecrvqdf.my

Server:     192.168.1.12
Address:    192.168.1.12#53

Non-authoritative answer:
Name:   jqfqmenwsqeporkaaecrvqdf.my
Address: 192.168.168.192
```

## Make
```bash
> make help

build  Building pihole and unbound images.
start  Start containers.
stop   Stop and remove containers.
shell  Get root shell inside pihole container.
```
