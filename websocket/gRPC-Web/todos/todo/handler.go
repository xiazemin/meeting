package todo

import (
	"log"

	"github.com/gofrs/uuid"
	"golang.org/x/net/context"

	toto "todos/output"
)

type Server struct {
	Todos []*toto.TodoObject
}

func (s *Server) AddTodo(ctx context.Context, newTodo *toto.AddTodoParams) (*toto.TodoObject, error) {
	log.Printf("Received new task %s", newTodo.Task)
	uid, _ := uuid.NewV1()
	todoObject := &toto.TodoObject{
		Id:   uid.String(),
		Task: newTodo.Task,
	}
	s.Todos = append(s.Todos, todoObject)
	return todoObject, nil
}

func (s *Server) GetTodos(ctx context.Context, _ *toto.GetTodoParams) (*toto.TodoResponse, error) {
	log.Printf("get tasks")
	return &toto.TodoResponse{Todos: s.Todos}, nil
}

func (s *Server) DeleteTodo(ctx context.Context, delTodo *toto.DeleteTodoParams) (*toto.DeleteResponse, error) {
	var updatedTodos []*toto.TodoObject
	for index, todo := range s.Todos {
		if todo.Id == delTodo.Id {
			updatedTodos = append(s.Todos[:index], s.Todos[index+1:]...)
			break
		}
	}
	s.Todos = updatedTodos
	return &toto.DeleteResponse{Message: "success"}, nil
}
