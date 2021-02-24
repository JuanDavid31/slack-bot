require_relative 'todo'

class TodoManager
  def initialize
    @todos = []
  end

  def todos_available?
    @todos.size.positive?
  end

  def formatted_todo_list
    formatted_todos = "Your todo list\n"
    @todos.each_with_index do |todo, index|
      formatted_todos += "#{index + 1} - #{todo.name} #{todo.checked? ? ':white_check_mark:' : ''}\n"
    end
    formatted_todos
  end

  def add_todo(name)
    @todos.push Todo.new(name)
  end

  def check_todo(number)
    @todos[number].check!
  end

  def remove_todo(number)
    @todos.delete_at(number)
  end
end
