require 'spec_helper'

describe TasksController, type: :controller do
  describe "GET show" do
    #let(:task) { FactoryGirl.create(:task) }title: "Shop at CVS", priority: 1) }
    let(:task) { FactoryGirl.create(:task) }


    it "renders show page" do
      get :show, id: task.id
      expect(response).to render_template(:show)
    end

    it "assigns requested task to @task" do
      get :show, id: task.id
      # Expect @task to be set to the task we're looking for
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "GET new" do
    it "renders :new" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns new Task to @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "POST create" do
    context "valid attributes" do
      it "creates task" do
        # When I post to the create action, change Task.count by 1, aka add 1 to the tasks db
        expect{
          post :create, task: { title: "Shop at CVS", priority: 1 }
        }.to change(Task, :count).by(1)
      end
      it "redirects to :show" do
        post :create, task: { title: "Shop at CVS", priority: 1 }
        last_task = Task.last
        expect(response).to redirect_to(task_path(last_task.id))
      end
    end

    context "invalid attributes" do
      it "does not create task" do
        expect{
          post :create, task: { title: "" }
        }.to_not change(Task, :count)
      end

      it "re-renders :new" do
        post :create, task: { title: "" }
        expect(response).to render_template(:new)
      end
    end
  end

 describe "GET index" do
    before { Task.destroy_all }

    let(:first_task) { FactoryGirl.create(:task) }
    let(:second_task) { FactoryGirl.create(:task, title: "Walk the dog") }
    it "renders :index" do
      get :index
      expect(response).to render_template(:index)
    end
    it "assigns all tasks to @tasks as an array" do
      get :index
      expect(assigns(:tasks)).to eq([first_task, second_task])
    end
  end  

  describe "GET edit" do
    let(:task) { FactoryGirl.create(:task) }
    it "renders :edit" do
      get :edit, id: task.id
      expect(response).to render_template(:edit)
    end

    it "assigns requested task to @task" do
      get :edit, id: task.id
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "PUT update" do
    let(:task) { FactoryGirl.create(:task, title: "Do the Dishes") }

    context "valid attributes" do
      it "changes @task's attributes" do
        put :update, id: task.id, task: { title: "Shop at CVS", priority:2 }
        task.reload
        expect(task.title).to eq("Shop at CVS")
      end

     it "redirects to :show" do
        put :update, id: task.id, task: { title: "Shop at CVS", priority: 2 }
        last_task = Task.last
        expect(response).to redirect_to(task_path(last_task.id))
      end
    end

    context "invalid attributes" do
      it "does not change @task's attributes" do
        put :update, id: task.id, task: { title: "" }
        task.reload
        expect(task.title).to eq("Do the Dishes")
      end

      it "re-renders :edit" do
        put :update, id: task.id, task: { title: "" }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE destroy" do
    let!(:task) { FactoryGirl.create(:task) }

    it "deletes the requested task" do
      expect{
        delete :destroy, id: task.id
      }.to change(Task, :count).by(-1)
    end

    it "redirects to :index" do
      delete :destroy, id: task.id
      expect(response).to redirect_to(tasks_path)
    end
  end
end
