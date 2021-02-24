require 'rest-client'
require_relative 'todo'

class BasicCommands < SlackRubyBot::Commands::Base
  @todos = []

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

  command 'todo_add', /todo_add \w+/ do |client, data, match|
    todo_name = match['expression']
    if todo_name.nil?
      client.say(channel: data.channel, text: 'Please write the name of your todo')
    else
      todos.push Todo.new(todo_name)
      client.say(channel: data.channel, text: 'Your todo was added to the list!')
    end
  end

  command 'todo_show_all' do |client, data, _match|
    if todos.empty?
      client.say(channel: data.channel, text: 'There are no todos to show')
    else
      formatted_todos = "Your todo list\n"
      todos.each_with_index do |todo, index|
        formatted_todos += "#{index + 1} - #{todo.name} #{todo.checked? ? '\u2713'.encode('utf-8') : ''}\n"
      end
      client.say(channel: data.channel, text: formatted_todos)
    end
  end

  command 'todo_remove', /todo_remove ^[1-9][0-9]?$|^100$/ do |client, data, match|
    if match['expression'].nil?
      client.say(channel: data.channel, text: 'Please write a valir todo number')
    else
      index = (match['expression'].to_i - 1).abs
      todos.delete_at(index)
      client.say(channel: data.channel, text: 'Your todo was succesfully removed')
    end
  end

  command 'todo_check', /todo_check ^[1-9][0-9]?$|^100$/ do |client, data, match|
    if match['expression'].nil?
      client.say(channel: data.channel, text: 'Please write a valid todo number')
    else
      index = (match['expression'].to_i - 1).abs
      todos[index].check
      client.say(channel: data.channel, text: 'Your todo was succesfully checked')
    end
  end

  def self.todos
    @todos = [] if @todos.nil?
    @todos
  end
end
