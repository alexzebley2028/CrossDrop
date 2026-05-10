#!/bin/bash

find protobuf_source -name '*.proto' -print0 \
  | xargs -0 protoc --dart_out=../lib/nearby_share/protobuf --proto_path=protobuf_source
