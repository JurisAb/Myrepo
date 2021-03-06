{{/*
Expand the name of the chart.
*/}}
{{- define "gtp-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "gtp-proxy.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "gtp-proxy.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "to.erlang.ip" -}}
{ {{- splitList "." . | join "," -}} }
{{- end -}}

{{/* generate erlang list out of yaml */}}
{{- define "to.erlang.ip_list" }}
{{- $length := len . }}[{{- range $element := initial . }}{{-  $element | include "to.erlang.ip"}},{{- end }}{{- last . | include "to.erlang.ip" }}]
{{- end }}


{{- define "gtp-proxy.sockets.gtp-u" -}}
[
  {{- range $i, $a := initial . }}
 {'grx-{{- $i -}}', [{ip, {{ splitList "/" $a.ipAddr| first | include "to.erlang.ip" -}} },
            {netdev, "{{ $a.interface }}"},
            freebind
           ]},
  {{- end -}}{{- $a := last . }}
 {'grx-{{- initial . | len -}}', [{ip, {{ splitList "/" $a.ipAddr| first | include "to.erlang.ip" -}} },
            {netdev, "{{ $a.interface }}"},
            freebind
           ]}
]
{{- end -}}


{{- define "gtp-proxy.sockets.gtp-c" -}}
[
  {{- range $i, $a := initial . }}
 {'irx-{{- $i -}}', [{type, 'gtp-c'},
            {ip, {{ splitList "/" $a.ipAddr| first | include "to.erlang.ip" -}} },
            {netdev, "{{ $a.interface }}"},
            freebind
           ]},
 {'grx-{{- $i -}}', [{type, 'gtp-u'},
            {node, 'ergw-gtp-u-edp@gtp-proxy'},
            {name, 'grx-{{- $i -}}'}
           ]},
  {{- end -}}{{- $a := last . -}}{{- $i := initial . | len }}
 {'irx-{{- $i -}}', [{type, 'gtp-c'},
            {ip, {{ splitList "/" $a.ipAddr| first | include "to.erlang.ip" -}} },
            {netdev, "{{ $a.interface }}"},
            freebind
           ]},
 {'grx-{{- $i -}}', [{type, 'gtp-u'},
            {node, 'ergw-gtp-u-edp@gtp-proxy'},
            {name, 'grx-{{- $i -}}'}
           ]}
]
{{- end -}}


{{- define "gtp-proxy.socketlist.gtp-c" -}}
[{{- range $i, $a := initial . -}}'irx-{{ $i }}', {{ end -}}
  'irx-{{ initial . | len }}']
{{- end -}}

{{- define "gtp-proxy.socketlist.gtp-u" -}}
[{{- range $i, $a := initial . -}}'grx-{{ $i }}', {{ end -}}
  'grx-{{ initial . | len }}']
{{- end -}}
{{/* vim: set filetype=gotexttmpl: */}}
