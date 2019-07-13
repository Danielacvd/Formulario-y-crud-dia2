class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end
  def list
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      redirect_to todos_index_path
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    @todo.update(todo_params)
    redirect_to todos_index_path
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.delete
    redirect_to todos_index_path
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to todos_index_path
  end

  private
  def todo_params
    params.require(:todo).permit(:description)
  end
end
