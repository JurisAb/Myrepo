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
