{{/*
Defines a JSON file containing definitions of all broker objects (queues, exchanges, bindings,
users, virtual hosts, permissions and parameters) to load by the management plugin.
*/}}
{{- define "rabbitmq-ha.definitions" -}}
{
  "users": [
    {
      "name": {{ .Values.rabbitmq.rabbitmqUsername | quote }},
      "password": {{ .Values.rabbitmq.rabbitmqPassword | quote }},
      "tags": "management"
    },
    {
      "name": {{ .Values.rabbitmq.rabbitmqUsername | quote }},
      "password": {{ .Values.rabbitmq.rabbitmqPassword | quote }},
      "tags": "administrator"
    }{{- if .Values.rabbitmq.definitions.users -}},
{{ .Values.rabbitmq.definitions.users | indent 4 }}
{{- end }}
  ],
  "vhosts": [
    {
      "name": {{ .Values.rabbitmq.rabbitmqVhost | quote }}
    }{{- if .Values.rabbitmq.definitions.vhosts -}},
{{ .Values.rabbitmq.definitions.vhosts | indent 4 }}
{{- end }}
  ],
  "permissions": [
    {
      "user": {{ .Values.rabbitmq.rabbitmqUsername | quote }},
      "vhost": {{ .Values.rabbitmq.rabbitmqVhost | quote }},
      "configure": ".*",
      "read": ".*",
      "write": ".*"
    }{{- if .Values.rabbitmq.definitions.permissions -}},
{{ .Values.rabbitmq.definitions.permissions | indent 4 }}
{{- end }}
  ],
  "parameters": [
{{ .Values.rabbitmq.definitions.parameters| indent 4 }}
  ],
  "policies": [
{{ .Values.rabbitmq.definitions.policies | indent 4 }}
  ],
  "queues": [
{{ .Values.rabbitmq.definitions.queues | indent 4 }}
  ],
  "exchanges": [
{{ .Values.rabbitmq.definitions.exchanges | indent 4 }}
  ],
  "bindings": [
{{ .Values.rabbitmq.definitions.bindings| indent 4 }}
  ]
}
{{- end -}}
