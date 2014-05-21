require 'test_helper'
require "application_helper"


class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { completed: @task.completed, content: @task.content, title: @task.title }
    end

    assert_redirected_to tasks_path
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @task
  #   assert_response :success
  # end

  test "should update task" do
    patch :update, id: @task, task: { completed: @task.completed, content: @task.content, title: @task.title }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end


  test "if task exists - its title should be on the page" do
    task = tasks(:task_6)
    get :index
    assert_response :success
    assert_select ".title" do |tasks_titles|
      contained = false
      tasks_titles.each do |task_title|
        contained |= task_title.to_s.include?(task.title)
      end
      assert contained
    end
  end
  
  test "if task is deleted - its title should not be on the page" do
    task = tasks(:task_3)
    task.destroy

    get :index
    assert_response :success
    assert_select ".title" do |tasks_titles|
      contained = false
      tasks_titles.each do |task_title|
        contained |= task_title.to_s.include?(task.title)
      end
      assert_not contained
    end
  end
end
