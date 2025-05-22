protoc \
  --plugin=protoc-gen-ts_proto=./node_modules/.bin/protoc-gen-ts_proto \
  --ts_proto_out=app/generated \
  --ts_proto_opt=outputClientImpl=grpc-web,esModuleInterop=true,forceLong=string \
  --proto_path=server/proto \
  server/proto/*.proto