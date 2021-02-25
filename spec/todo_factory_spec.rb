require_relative '../lib/todo_factory'

describe TodoFactory do
  describe '#instance' do
    it 'does always return an instance' do
      expect(TodoFactory.instance).to_not be nil
    end
  end
end
