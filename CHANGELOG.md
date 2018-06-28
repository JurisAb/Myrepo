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
