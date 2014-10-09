require 'spec_helper'

describe "tasks_pages" do
  
  subject { page }

  describe "show_page GET /tasks/:id" do
    let(:my_task) { Task.create(title: "Do the dishes", priority: 9) }
   
   # Visit the show page /tasks/5 -- a single task
    before { visit show_task_path(my_task.id) }

    # Will see if the tittle is set correctly
    it { should have_title("Todo | Show Task") }

    # Will see if the headers are set correctly
    it { should have_selector('h1', "I need to...") }
    it { should have_selector('p', my_task.title) }
  end
end