class Api::V1::TodosController < ApplicationController
    def index
        todos = Todo.order(update_at: :desc)
        render json: todos
    end

    def show
        todo = Todo.find(params[:id])
        render json: todo
    end
    
    def create
        todo = Todo.new(todo_params)
        if todo.save
            render json: todo
        else
            render json: todo.error, status: 422
        end
    end
    
    def update
        todo = Todo.find(params[:id])
        if todo.update[todo_params]
            render json: todo
        else
            render json: todo.errors, status: 422
        end 
    end
    
    def destroy
        if Todo.destroy(params[:id])
            head :no_content
            # 削除するだけの処理だからバックエンド側になにも操作がないのでこのようなコードを書く
        else
            render json: {error: "Failed to destroy"}, status: 422
        end
    end
    
    def destroy_all
        if Todo.destroy_all(params[:id])
            head :no_content
        else
            render json: {error: "Failed to destroy"}, status: 422
        end
    end
    
    def todo_params
        params.require(:todo).permit(:name, :is_completed)
    end
    
end