# GTP Proxy

The GTP Proxy acts as proxy between SGW and PGW.


## Introduction

The GTP Proxy is based on [ergw](http://github.com/travelping/ergw). It comprises the following components:

- control plane: [ergw-gtp-c-node](http://github.com/travelping/ergw-gtp-c-node)
- user plane: [ergw-gtp-u-edp](http://github.com/travelping/ergw-gtp-u-edp)


## Prerequisites

- Kubernetes 1.6+ with Beta APIs enabled


## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release --set listen.interface=net0,listen.ipAddr=192.0.2.7,pgw.ipAddr=198.51.100.9 tp/gtp-proxy
```

The command deploys a GTP Proxy listening on IP `192.0.2.7` on interface `net0` for requests and forwards those to `198.51.100.9`. The [configuration](#configuration) section lists the parameters that can be configured during installation.


## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the MariaDB chart and their default values.

|          Parameter          |                Description                 |                   Default                   |
| --------------------------- | ------------------------------------------ | ------------------------------------------- |
| `listen.interface`          | Listen interface                           | `lo`                                        |
| `listen.ipAddr`             | IP address to bind                         | `127.0.0.1`                                 |
| `pgw.ipAddr`                | IP address of the target PGW               | `127.0.0.1`                                 |
| `logLevel`                  | Log verbosity level                        | `debug`                                     |

The following table lists the configurable parameters of the tcpdump sidecar container and their default values.

|          Parameter          |                Description                 |                   Default                   |
| --------------------------- | ------------------------------------------ | ------------------------------------------- |
| `Values.pcap.enabled`       | Enables/Disables container.                | `false`                                     |
| `Values.pcap.interface:   ` | Interface to monitor.                      | `acc0`                                      |
| `Values.pcap.filter`        | tcpdump options                            | `udp port 2123 or icmp`                     |
| `Values.pcap.maxfilesize: ` | Max size before a new file is opened.      | `1000`                                      |
| `Values.pcap.maxfilenum`    | Max number of files before overwriting     | `10`                                        |
