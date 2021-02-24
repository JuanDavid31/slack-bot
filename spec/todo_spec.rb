require_relative '../lib/todo'

describe Todo do
  let(:todo) { Todo.new 'Do some stuff' }

  describe '#checked?' do
    it 'does initialize as unchecked' do
      expect(todo.checked?).to be false
    end
  end

  describe '#check!' do
    it 'does check the todo' do
      todo.check!
      expect(todo.checked?).to be true
    end
  end
end
