# re-grpc-hacking

```sh
esy x Server.exe
esy x Client.exe

# to test using the node client
esy grpcc -i -e "client.readUser({ id: 'abc' }, pr)" -d ./protos/src --proto users.proto --address localhost:50051
```

# TODO:

- bytes are encoded with string, doesn't sound like a great idea
