## Chart 1.2.5 / App 1.2.5

### Operational Changes
Adds resource limits to the containers

### ergw-gtp-c-node
v1.18.2 => v1.18.3

Fix cache expire logic.

Adjust GC and hibernation for session processes

## Chart 1.2.1 / App 1.2.1

### Operational Changes

The pcap container's max file size parameter now translates to MB instead of KB.
If you previously set a custom value you have to make sure that the rotation happens at a size
that fits your usecase.

### Changes since 1.2.0

#### ergw-gtp-c-node

v1.18.1 => v1.18.2
Fix memory consumption

The upgrade of the base dependency ergw addresses the high memory consumption by disabling all histograms.
NOTE: this will make all metrics with "rtt" in the name unavailable until we have solved the memory issue with them.

Also: Add observability means to the runtime.

#### pcap

v0.3.0 => v0.3.1
Max file size unit changed from KB to MB

## Chart 1.2.0 / App 1.2.0

### Operational Changes

#### Metrics export

You don't have to change anything, but be aware that with this update and
without any adjustment of the configuration, a running prometheus instance
will start scraping the endpoint. If you *don't* want metrics to be exposed,
set `service.enabled` to `false`.

### Changes since 1.1.0

- add service to expose httpApi port by default and scrape metrics via prometheus
- Fix crash on accessing HTTP API

## Chart 1.1.0 / App 1.1.0

### Operational Changes

#### Support multiple PGWs

Multiple PGWs can be addressed by the GTP proxy controller. In order to use this function, the config needs to be adjusted. E.g. change

```
pgw:
  ipAddr: 198.18.3.10
```
to

```
pgw:
  ipAddr:
    - 198.18.3.10
    - 198.18.3.11
```


### Changes since 1.0.0


- Maintenance update of underlying libraries
- Reduced container size
- Added components for run-time analysis support
