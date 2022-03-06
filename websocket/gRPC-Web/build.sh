$ protoc todos.proto \
  --js_out=import_style=commonjs:./output \
  --grpc-web_out=import_style=commonjs:./output
#https://www.cnblogs.com/a00ium/p/14158625.html

% npm i grpc-web

#https://blog.csdn.net/u013919171/article/details/113520401

#https://github.com/improbable-eng/grpc-web
#https://www.npmjs.com/package/grpc

#https://github.com/improbable-eng/grpc-web/tree/master/go/grpcweb

#https://github.com/improbable-eng/grpc-web/tree/master/go/grpcwebproxy

#https://github.com/improbable-eng/ts-protoc-gen
#https://github.com/improbable-eng/grpc-web/tree/master/client/grpc-web


#protoc-gen-grpc-web: program not found or is not executable
#Please specify a program using absolute path or make sure the program is #available in your PATH system variable
#--grpc-web_out: protoc-gen-grpc-web: Plugin failed with status code 1.

#https://www.cnblogs.com/dhqy/p/14110029.html

#https://github.com/grpc/grpc-web
#https://github.com/protocolbuffers/protobuf/releases


#https://github.com/grpc/grpc-web/releases/download/1.3.1/protoc-gen-grpc-web-1.3.1-darwin-x86_64
#https://github.com/grpc/grpc-web/releases
#https://www.cnblogs.com/dhqy/p/14110029.html
$ sudo mv ~/Downloads/protoc-gen-grpc-web-1.3.1-darwin-x86_64 \
    /usr/local/bin/protoc-gen-grpc-web
$ chmod +x /usr/local/bin/protoc-gen-grpc-web
#https://blog.csdn.net/qq_32828933/article/details/108334190

% protoc todos.proto \ 
  --js_out=import_style=commonjs:./output \
  --grpc-web_out=import_style=commonjs:./output
--grpc-web_out: todos.proto: options: mode is required

 % protoc todos.proto \
  --js_out=import_style=commonjs:./output \
  --grpc-web_out=import_style=commonjs,mode=grpcwebtext:./output


  $ protoc -I=. echo.proto \
    --js_out=import_style=commonjs:./client \
    --grpc-web_out=import_style=commonjs,mode=grpcwebtext:./client

% git submodule add https://github.com/grpc/grpc-web

#https://github.com/adevjoe/grpc-web-demo
#http://www.manongjc.com/detail/21-jqdzyfkhwqhwdxe.html

#https://toutiao.io/posts/pmpcpa/preview