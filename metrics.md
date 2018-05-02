# GTP Proxy Metrics

The metrics are exposed by erGW, for the complete list see [erGW
documentation](https://github.com/travelping/ergw/blob/master/METRICS.md).

In the following, the most relevant metrics for the GTP proxy should be described.

*WIP*

## Metrics

Per known destination (e.g. `198.18.3.10`)

### contexts / sessions
- "PDP Contexts (GTP v1) to <peer>": `path_irx_1_198_18_3_10_contexts_v1 0`
- "Sessions (GTP v2) to <peer>": `path_irx_1_198_18_3_10_contexts_v2 0`
- total

### Rount-trip-times

- "Echo (GTP v1) RTT to <peer>": `path_irx_1_198_18_3_10_rtt_v1_echo_request_count`
- "Echo (GTP v2) RTT to <peer>": `path_irx_1_198_18_3_10_rtt_v2_echo_request_count`

### Message rate

- "Echo Requests v1": `path_irx_1_198_18_3_10_tx_v1_echo_request_count`
- "Echo Requests v2": `path_irx_1_198_18_3_10_tx_v2_echo_request_count`

- "Context create requests (v1)": `path_irx_1_198_18_3_10_rtt_v1_create_pdp_context_request_count`
- "Create sessions requests (v2)": `path_irx_1_198_18_3_10_rtt_v2_create_session_request_count`

- "Echo Requests Timeout GTP v1": `path_irx_1_198_18_3_10_tx_v1_echo_request_timeout`
- "Echo Requests Timeout GTP v2": `path_irx_1_198_18_3_10_tx_v2_echo_request_timeout`

## Alerts

Per path:

- `path_irx_1_198_18_3_10_contexts_v1 == 0`
- `path_irx_1_198_18_3_10_contexts_v2 == 0`

- `path_irx_1_198_18_3_10_tx_v1_echo_request_timeout` > 0
- `path_irx_1_198_18_3_10_tx_v2_echo_request_timeout` > 0
