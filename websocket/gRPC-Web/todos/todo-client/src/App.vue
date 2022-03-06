<template>
  <img alt="Vue logo" src="./assets/logo.png">
  <HelloWorld msg="Welcome to Your Vue.js App"/>
</template>

<script>
import { addTodoParams, getTodoParams, deleteTodoParams } from "./todo_pb";
import { todoServiceClient } from "./todo_grpc_web_pb";

export default {
  name: 'App',
  components: {
  },
  data: function() {
    return {
      inputField: "",
      todos: []
    };
  },
  created: function() {
    this.client = new todoServiceClient("http://127.0.0.1:50096", null, null);
    this.getTodos();
  },
  methods: {
    getTodos: function() {
      let getRequest = new getTodoParams();
      console.log(getRequest)
      this.client.getTodos(getRequest, {}, (err, response) => {
        console.log(err,response)
        this.todos = response.toObject().todosList;
        console.log(this.todos);
      });
    },
    addTodo: function() {
      let request = new addTodoParams();
      request.setTask(this.inputField);
      this.client.addTodo(request, {}, () => {
        this.inputField = "";
        this.getTodos();
      });
    },
    deleteTodo: function(todo) {
      let deleteRequest = new deleteTodoParams();
      deleteRequest.setId(todo.id);
      this.client.deleteTodo(deleteRequest, {}, (err, response) => {
        if (response.getMessage() === "success") {
          this.getTodos();
        }
      });
      console.log("todo -> ", todo.id);
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
