class Todo
  attr_reader :name
  def initialize(name)
    @name = name
    @checked = false
  end

  def checked?
    @checked
  end

  def check
    @checked = true
  end
end
