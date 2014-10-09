class TasksController < ApplicationController
  
  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all
  end
end