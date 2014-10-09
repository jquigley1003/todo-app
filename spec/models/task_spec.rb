require 'spec_helper'

describe Task do
  before { @task = Task.new(title: "Walk the dog", completed: true, priority: 1) }

  subject { @task }

  it { should respond_to(:priority) }
  it { should respond_to(:completed) }
  it { should respond_to(:title) }
  it { should be_valid }

  describe "validations" do
    describe "title" do
      describe "not present" do
        before { @task.title = " " }
        it { should_not be_valid }
      end

      describe "too short" do
        before { @task.title = "a" * 2 }
        it { should_not be_valid }
      end

      describe "too long" do
        before { @task.title = "a" * 255 }
        it { should_not be_valid }
      end
    end

    describe "completed" do
      it "false by default" do
        new_task = Task.new(title: "Walk the dog")
        expect(new_task.completed).to be_falsey
      end
    end

    describe "priority" do
      describe "equals certain value" do
        before { @task.priority = 1 }
        it { should be_valid }
      end

      describe "too high" do
        before { @task.priority = 15}
        it { should_not be_valid }
      end

      describe "too low" do
        before { @task.priority = -1}
        it { should_not be_valid }
      end
    end
  end
end