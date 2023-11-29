# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  # ---- Adding to the list ----

  def add(todo)
    if todo.class == Todo
      @todos << todo 
    else
      "Can only add Todo objects"
    end
 
  end

  def <<(todo)
    add(todo)
  end

  # ---- Interrogating the list ----

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? {|todo| todo.done? == true}
  end
    
  # ---- Retrieving an item in the list ----

  def item_at(index)
    @todos[index]
  end

  # ---- Marking items in the list -----

  def mark_done_at(index)
    @todos[index].done = true
  end

  def mark_undone_at(index)
    @todos[index].done = false
  end

  def done!
    @todos.each do |todo|
      todo.done = true
    end
    @todos
  end

  # ---- Outputting the list -----

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete_at(index)
  end

  # ---- Outputting the list -----

  def to_s
    puts "---- Today's Todos ----"
    @todos.each do |todo|
      puts todo
    end
  end

  def each
    counter = 0

    while counter < @todos.length
      yield(@todos[counter])
      counter += 1
    end

    @todos
  end


end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end