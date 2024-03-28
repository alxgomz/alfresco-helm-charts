{{/*
Render database configmap

Usage: include "alfresco-process-services.db.cm" (dict "url" "" "driver" "")

*/}}
{{- define "alfresco-process-services.db.cm" -}}
  {{- $reqmsg := "Either provide database url as values, or provide a cm that contains it." }}
  {{- $url := .url | required $reqmsg }}
  DATABASE_URL: {{ hasPrefix "jdbc:" $url | ternary $url (print "jdbc:" $url) }}
  DATABASE_DRIVER: {{ template "alfresco-common.db.driver" . }}
{{- end -}}
