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

### vEPC (socket irx_1 )

Context:
- contexts v1 == 0 on GPC instance  --> Warning
- contexts v2 == 0 on GPC instance  --> Warning
- contexts v1 == 0 overall  --> Alert
- contexts v2 == 0 overall  --> Alert

Paths:
- No GTP Echo response v1 received from peer since 2m  --> Warning
- No GTP Echo response v2 received from peer since 2m  --> Warning
- No GTP Echo response v1 received at all since 2m  --> Alert
- No GTP Echo response v2 received at all since 2m  --> Alert

Messages:
- tx retransmits  > 5 in last 2m --> Warning
- tx timeouts > 5 in last 2m --> Alert
- rx duplicates > 5 in last 2m --> Warning


timeout, error

### MNO (socket irx_0 )

Context:
- contexts v1 == 0 on GPC instance  --> Warning
- contexts v2 == 0 on GPC instance  --> Warning
- contexts v2 == 0 overall  --> Alert
- contexts v2 == 0 overall  --> Alert

Paths
- No GTP Echo response v1 received at all since 2m  --> Alert
- No GTP Echo response v2 received at all since 2m  --> Alert

Messages:
- tx retransmits  > 5 in last 2m --> Warning
- tx timeouts > 5 in last 2m --> Alert
- rx duplicates > 5 in last 2m --> Warning

### Sanity Check

Context:
- contexts v1 MNO !=  contexts v1 vEPC  --> Warning
- contexts v2 MNO !=  contexts v2 vEPC  --> Warning


