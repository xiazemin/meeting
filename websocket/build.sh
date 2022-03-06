##stream

#https://www.jianshu.com/p/5158d6686769
protoc --go_out=plugins=grpc:. ./hello.proto
#https://github.com/grpc/grpc-go/blob/master/codegen.sh
#http://doc.oschina.net/grpc?t=60133
#go get -u google.golang.org/grpc

#https://www.cnblogs.com/heris/p/15673865.html

% protoc --go_out=plugins=grpc:. ./hello.proto

#一个 服务器端流式 RPC ， 客户端发送请求到服务器，拿到一个流去读取返回的消息序列。 客户端读取返回的流，直到里面没有任何消息。从例子中可以看出，通过在 响应 类型前插入 stream 关键字，可以指定一个服务器端的流方法。


##websocket
#https://www.jianshu.com/p/b325a2848275
#常用的Websocket库是gorrila websocket (github.com/gorilla/websocket)，为了使代码看起来更简洁一些，我们本次采用封装了gorrila websocket的微型框架 melody (github.com/olahol/melody)和 gin框架(github.com/gin-gonic/gin) 来实现。

#melody有三个最重要的函数：一个是HandleConnect，用于响应websocket客户端的连接事件；一个是HandleMessage，用于处理websocket客户端输入的消息；一个是HandleDisconnect，用于处理websocket客户端断开连接事件。melody封装了session，并且可以利用session存取自定义数据

% protoc --go_out=plugins=grpc:. ../streaming/hello.proto  -I ../streaming 
#https://www.jianshu.com/p/611d586f58cd

#https://juejin.cn/post/6844903917554237448