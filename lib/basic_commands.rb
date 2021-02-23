require 'rest-client'
require_relative 'todo'

class BasicCommands < SlackRubyBot::Commands::Base

  @@todos = []

  command 'joke' do |client, data, _match|
    response = RestClient.get 'https://official-joke-api.appspot.com/jokes/random'
    joke = JSON.parse(response.body)
    formatted_joke = <<~TEXT
      #{joke['setup']}
      #{joke['punchline']}
      ...
    TEXT
    client.say(channel: data.channel, text: formatted_joke)
  end

  command 'todo_add', /\w+/ do |client, data, match|
    todo_name = match['expression']
    todos.push Todo.new(todo_name)
    client.say(channel: data.channel, text: 'Your todo was added to the list! ')
  end

  command 'todo_show_all', /\w+/ do |client, data, match|
    formatted_todos = 'Your todo list\\n'
    todos.each_with_index do |todo, index|
      formatted_todos += "#{index + 1} - #{todo} #{todo.checked? ? '\u2713'.encode('utf-8') : ''}\n"
    end
    client.say(channel: data.channel, text: formatted_todos)
  end

  command 'todo_remove', /\d+/ do |client, data, match|

    client.say(channel: data.channel, text: 'Your todo was succesfully removed')
  end

  def self.todos
    @@todos = [] if @@todos.nil?
    @@todos
  end

end
