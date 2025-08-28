#!/bin/bash
rm -f /home/${USER_NAME}/${WS}/ruby/tmp/pids/server.pid
rails server -b 0.0.0.0