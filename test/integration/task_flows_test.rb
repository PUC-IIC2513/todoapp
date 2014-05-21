require 'test_helper'

class TaskFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "admin go to specific task only if logged in" do
    task = tasks(:two)
    admin = {can: true }
    test_show_task(task, admin)
  end
  test "guest go to specific task only if logged in" do
    task = tasks(:two)
    guest = {can: false}
    test_show_task(task, guest)
  end



  private 

  def test_show_task(task, user)
    open_session do |sess|
      # should visit the log in first with the user credentials
      # mocking it with the user's "can" value 

      if user[:can]
        post_via_redirect "/sessions/register"
      end

      get "/tasks/#{task.id}"
      if user[:can]
        assert_response :success
      else
        puts "should not be able to access"
        assert_response :redirect
      end
    end
  end

end
