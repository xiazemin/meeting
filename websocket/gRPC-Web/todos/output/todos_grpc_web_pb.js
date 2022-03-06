/**
 * @fileoverview gRPC-Web generated client stub for todos
 * @enhanceable
 * @public
 */

// GENERATED CODE -- DO NOT EDIT!


/* eslint-disable */
// @ts-nocheck



const grpc = {};
grpc.web = require('grpc-web');

const proto = {};
proto.todos = require('./todos_pb.js');

/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?grpc.web.ClientOptions} options
 * @constructor
 * @struct
 * @final
 */
proto.todos.TodoServiceClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options.format = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname;

};


/**
 * @param {string} hostname
 * @param {?Object} credentials
 * @param {?grpc.web.ClientOptions} options
 * @constructor
 * @struct
 * @final
 */
proto.todos.TodoServicePromiseClient =
    function(hostname, credentials, options) {
  if (!options) options = {};
  options.format = 'text';

  /**
   * @private @const {!grpc.web.GrpcWebClientBase} The client
   */
  this.client_ = new grpc.web.GrpcWebClientBase(options);

  /**
   * @private @const {string} The hostname
   */
  this.hostname_ = hostname;

};


/**
 * @const
 * @type {!grpc.web.MethodDescriptor<
 *   !proto.todos.GetTodoRequest,
 *   !proto.todos.Todo>}
 */
const methodDescriptor_TodoService_GetTodoById = new grpc.web.MethodDescriptor(
  '/todos.TodoService/GetTodoById',
  grpc.web.MethodType.UNARY,
  proto.todos.GetTodoRequest,
  proto.todos.Todo,
  /**
   * @param {!proto.todos.GetTodoRequest} request
   * @return {!Uint8Array}
   */
  function(request) {
    return request.serializeBinary();
  },
  proto.todos.Todo.deserializeBinary
);


/**
 * @param {!proto.todos.GetTodoRequest} request The
 *     request proto
 * @param {?Object<string, string>} metadata User defined
 *     call metadata
 * @param {function(?grpc.web.RpcError, ?proto.todos.Todo)}
 *     callback The callback function(error, response)
 * @return {!grpc.web.ClientReadableStream<!proto.todos.Todo>|undefined}
 *     The XHR Node Readable Stream
 */
proto.todos.TodoServiceClient.prototype.getTodoById =
    function(request, metadata, callback) {
  return this.client_.rpcCall(this.hostname_ +
      '/todos.TodoService/GetTodoById',
      request,
      metadata || {},
      methodDescriptor_TodoService_GetTodoById,
      callback);
};


/**
 * @param {!proto.todos.GetTodoRequest} request The
 *     request proto
 * @param {?Object<string, string>=} metadata User defined
 *     call metadata
 * @return {!Promise<!proto.todos.Todo>}
 *     Promise that resolves to the response
 */
proto.todos.TodoServicePromiseClient.prototype.getTodoById =
    function(request, metadata) {
  return this.client_.unaryCall(this.hostname_ +
      '/todos.TodoService/GetTodoById',
      request,
      metadata || {},
      methodDescriptor_TodoService_GetTodoById);
};


module.exports = proto.todos;

