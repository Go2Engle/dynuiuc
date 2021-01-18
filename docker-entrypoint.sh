#!/bin/bash
envsubst < /etc/dynuiuc/dynuiuc-template.conf > /etc/dynuiuc/dynuiuc.conf
exec "$@"