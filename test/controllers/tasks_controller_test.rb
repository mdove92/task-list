require "test_helper"

describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test",
                completed: Time.now + 5.days
  }

  # Tests for Wave 1
  describe "index" do
    it "can get the index path" do
      # Act
      get tasks_path

      # Assert
      must_respond_with :success
    end

    it "can get the root path" do
      # Act
      get root_path

      # Assert
      must_respond_with :success
    end
  end

  # Unskip these tests for Wave 2
  describe "show" do
    it "can get a valid task" do

      # Act
      get task_path(task.id)

      # Assert
      must_respond_with :success
    end

    it "will redirect for an invalid task" do

      # Act
      get task_path(-1)

      # Assert
      must_respond_with :redirect
    end
  end

  describe "new" do
    it "can get the new task page" do

      # Act
      get new_task_path

      # Assert
      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new task" do

      # Arrange
      task_hash = {
        task: {
          name: "new task",
          description: "new task description",
          completed: nil,
        },
      }

      # Act-Assert
      expect {
        post tasks_path, params: task_hash
      }.must_change "Task.count", 1

      new_task = Task.find_by(name: task_hash[:task][:name])
      expect(new_task.description).must_equal task_hash[:task][:description]
      expect(new_task.completed).must_equal task_hash[:task][:completed]

      must_respond_with :redirect
      must_redirect_to task_path(new_task.id)
    end
  end

  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing task" do

      # Act
      get edit_task_path(task.id)

      # Assert
      must_respond_with :success
    end

    it "will respond with redirect when attempting to edit a nonexistant task" do

      # Act
      get edit_task_path(-200)

      # Assert
      must_respond_with :redirect
    end
  end

  # Uncomment and complete these tests for Wave 3
  describe "update" do
    # Note:  If there was a way to fail to save the changes to a task, that would be a great
    #        thing to test.

    it "can update an existing task" do
      get update_task_path(task.id)

      must_respond_with :success
    end

    it "will redirect to the root page if given an invalid id" do
      get update_task_path(-200)

      # Assert
      must_respond_with :redirect
    end
  end

  # Complete these tests for Wave 4
  describe "destroy" do
    it "decreases the task list count by one" do
      # arrange create a book then find the newly created book's id
      #Act-assert: expect differ: the book count goes down by one after we do delete book_path(the newly created book's )
      test_task = Task.find_by(id: task[:id])

      expect { delete task_path(Task.all.first.id) }.must_differ "Task.count", -1
    end
    it "will redirect if given an invalid id" do
      get update_task_path(-200)

      # Assert
      must_respond_with :redirect
    end
  end

  # Complete for Wave 4
  describe "toggle_complete" do
    # Your tests go here
  end
end
