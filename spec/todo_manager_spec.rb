require_relative '../lib/todo_manager'

describe TodoManager do
  let(:todo_manager) { TodoManager.new }
  let(:todo_name) { 'Clean up my room' }
  let(:check_mark) { ':white_check_mark:' }

  describe '#todos_available?' do
    context 'when the instance was created' do
      it 'does return false' do
        expect(todo_manager.todos_available?).to be false
      end
    end
  end

  describe '#formatted_todo_list' do
    context 'When there are no todos' do
      it 'does not return any todo in the list' do
        expect(todo_manager.formatted_todo_list).to_not include todo_name
      end
    end

    it 'does return a formatted todo list' do
      todo_manager.add_todo todo_name
      expect(todo_manager.formatted_todo_list).to include todo_name
    end
  end

  describe '#check_todo' do
    it 'does check a todo and add a check mark to the formatted list' do
      todo_manager.add_todo todo_name
      todo_manager.check_todo 0
      expect(todo_manager.formatted_todo_list).to include check_mark
    end
  end

  describe '#remove_todo' do
    it 'does return false' do
      todo_manager.add_todo todo_name
      todo_manager.remove_todo 0
      expect(todo_manager.todos_available?).to be false
    end
  end
end
