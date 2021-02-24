require_relative 'todo_manager'

class TodoFactory
  @todo_manager = TodoManager.new

  def self.instance
    @todo_manager = TodoManager.new if @todo_manager.nil?
    @todo_manager
  end
end
