class TodosController < ApplicationController
    before_action :set_todo,only: [:edit, :update, :show, :destroy]


    def new
        @todo = Todo.new
    end

    def show  
    end

    def edit
    end

    def update
        if @todo.update(todo_params)
            flash[:notice] = "Todo was successfully updated!"
            redirect_to todo_path(@todo)
        else 
            render 'edit'
        end
    end

    def destroy
        @todo.destroy
        flash[:notice] = "todo was deleted"
        redirect_to todos_path
    end

    def index 
        @todos = Todo.all
    end

    def create
        if @todo.save
            flash[:notice] = "Todo was created successfully!"
            redirect_to todo_path(@todo)
        else 
            render 'new'
        end
        
    end

    

    private

        def todo_params
            params.require(:todo).permit(:name, :description)
        end

        def set_todo
            @todo = Todo.find(params[:id])
        end
end 