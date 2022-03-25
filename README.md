bazel build :all

# python

## 生成python文件
```
bazel build //protos:helloworld_py_pb2_grpc
```
文件在： 
bazel-bin/protos/helloworld_pb2_grpc.py
bazel-bin/protos/helloworld_pb2.py


# c++ 

## 编译c++ server
```
bazel build //cpp/helloworld:greeter_server
```

## 编译c++ clinet

```
bazel build //cpp/helloworld:greeter_client
```

## 启动

```
# server
./bazel-bin/cpp/helloworld/greeter_server

# client
./bazel-bin/cpp/helloworld/greeter_client
```