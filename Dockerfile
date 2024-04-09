# syntax=docker/dockerfile:1.4

# pihole image declaration
FROM pihole/pihole:2024.03.2 as pihole

# unbound image declaration
FROM mvance/unbound:1.19.3 as unbound
COPY --link ./conf/records/ /opt/unbound/etc/unbound/
COPY --link ./conf/99-edns.conf /etc/dnsmasq.d/99-edns.conf
COPY --link ./conf/unbound.conf /etc/unbound/unbound.conf.d/pi-hole.conf
