# 1. Create a GET tasks#show page when the user visits /tasks/:id (aka visits /tasks/3)

require 'spec_helper'

describe TasksController, type: :controller do
  describe "GET show" do
    before { @task = Task.create(title: "Shop at CVS", priority: 1) }

    it "renders show page" do
      get :show, id: @task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, id: @task.id
      # Expect @task to be set to the task we're looking for
      assigns(:task).should eq(@task)
    end
    # @task = Task.find(params[:id])
    # When we go to /tasks/3
    # Right side of equal sign --> Task.find(3) --> { id: 3, title: "Walk the dog", created_at: }
  end

  describe "GET edit" do
    before { @task = Task.create(title: "Shop at CVS", priority: 1) }
    
    it "gives option to edit task" do
        get :edit, id: @task.id
        expect(response). to render_template(:edit)
    end
  end

  describe "GET index" do
    before { @tasks = Task.all }
    
    it "renders index of all tasks" do
        get :index, all: @tasks
        expect(response). to render_template(:index)
    end
  end  
end
