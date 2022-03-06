https://stevenocean.github.io/2020/06/20/nginx-grpc-web-go.html

protoc -I . --go_out=plugins=grpc:./output/ ./todo.proto

--go_out: protoc-gen-go: plugins are not supported; use 'protoc --go-grpc_out=...' to generate gRPC

See https://grpc.io/docs/languages/go/quickstart/#regenerate-grpc-code for more information.


protoc --go_out=plugins=grpc:./output ./todo.proto
--go_out: protoc-gen-go: plugins are not supported; use 'protoc --go-grpc_out=...' to generate gRPC

See https://grpc.io/docs/languages/go/quickstart/#regenerate-grpc-code for more information.

protoc --go-grpc_out=grpc:./output ./todo.proto

protoc --go_out=output --go_opt=paths=source_relative ./todo.proto

https://developers.google.com/protocol-buffers/docs/reference/go-generated#package



go get -u google.golang.org/grpc


protoc --go_out=plugins=grpc:. ./todo.proto
--go_out: protoc-gen-go: plugins are not supported; use 'protoc --go-grpc_out=...' to generate gRPC

See https://grpc.io/docs/languages/go/quickstart/#regenerate-grpc-code for more information.

 protoc --go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative \
    ./output/todo.proto

 *todo.Server does not implement toto.TodoServiceServer (missing toto.mustEmbedUnimplementedTodoServiceServer method)

 https://github.com/grpc/grpc-go/issues/3794

 protoc --go_out=. --go_opt=paths=source_relative \
    --go-grpc_out=. --go-grpc_opt=paths=source_relative,require_unimplemented_servers=false \
     ./output/todo.proto


% go run server/server.go  


vue create todo-client

 npm install -g @vue/cli


protoc -I=./output todo.proto --js_out=import_style=commonjs:./todo-client/src --grpc-web_out=import_style=commonjs,mode=grpcweb:./todo-client/src


cd todo-client
npm run serve


#https://stevenocean.github.io/2020/06/20/nginx-grpc-web-go.html

https://github.com/thearavind/grpc-todo/tree/master/todo-client


Module not found: Error: Can't resolve 'bootstrap-vue/dist/bootstrap-vue.css' in '/Users/xiazemin/go/src/github.com/xiazemin/meeting/websocket/gRPC-Web/todos/todo-client/src'


cnpm install bootstrap -S


import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";