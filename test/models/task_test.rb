require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test if this works
  test "the truth" do
    assert true
  end


  test "should (not) save task without title" do
    task = Task.new
    assert_not task.save
  end

  test "should  save task from fixture" do
    task = tasks(:one)
    assert task.valid?
  end  

  test "task one from fixture should be done" do 
    task = tasks(:one)
    assert task.done? 
  end
  
  test "task two from fixture should not be done" do 
    task = tasks(:two)
    assert_not task.done? 
  end
  
  test "task n=1 from fixture should not be done - mark it done" do 
    task = tasks(:task_1)
    assert_not task.done?, "task 1 is done from the beginning"
    task.mark_done
    assert task.done? 
  end

  test "task n=2 from fixture should be done - mark it done" do 
    task = tasks(:task_2)
    assert task.done?, "task 2 is not done from the beginning"
    task.mark_undone
    assert_not task.done? 
  end

end
