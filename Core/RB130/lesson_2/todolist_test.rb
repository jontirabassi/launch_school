require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
#require "minitest/reporters"
#Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done
    assert_equal(false, @list.done?)
  end

  def test_raise_add_wrong_type
    assert_raises(TypeError) do
      @list.add("A string")
    end
  end

  def test_add
    @todo4 = Todo.new("Do laundry")
    @list << @todo4
    assert_equal(@todo4, @list.last)
  end

  def test_item_at
    assert_equal(@todo1, @list.item_at(0))
    assert_raises(IndexError) do
      @list.item_at(5)
    end
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
  end

  def test_mark_undone_at
    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)

    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    result = @list.remove_at(0)

    assert_equal(@todo1, result)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s3
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
  
    assert_equal(output, @list.to_s)
  end

  def test_each

    assert_equal(@list, @list.each { |todo| todo.done = true})
    assert_equal(true, @list.done?)
  end

  def test_select

    @list.mark_done_at(1)

    result = @list.select {|todo| todo.done == true}
    p result

    refute_equal(@list, result)
  end

end