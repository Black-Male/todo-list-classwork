class TodosController < ApplicationController
    # before_action :session_expired?

    def create
        todo = user.todos.create(todo_params)
        if todo.valid?
            app_response(status: :created, data: todo)
        else
            app_response(status: :unprocessable_entity, data: todo.errors, message: 'failed')
        end
    end

    def update
        todo = user.todos.find(params[:id]).update(todo_params)
        if todo
            app_response(data{info: 'updated todo successfully'})
        else
            app_response(message:'failed', status: :unprocessable_entity, data: {'something went wrong. Could not update todo'})
        end
    end

    def destroy
        todo = user.todos.find(params[:id]).destroy
        app_response(message: 'success', data: {info: 'deleted todo successfully'}, status:204)
    end

    def view_todos 
        todos = user.todos.all
        app_response(message: 'success', data: todos)
    end

    private

    def todos_params
        params.permit[:title, :description, :status, :priority]
    end
end
