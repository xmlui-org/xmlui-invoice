#!/bin/bash
./xmlui-test-server-mac-arm -api sql/api.json -show-responses 2>&1 | tee server_log.txt
