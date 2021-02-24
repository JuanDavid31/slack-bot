require 'rest-client'
require_relative 'todo_manager'

class BasicCommands < SlackRubyBot::Commands::Base
  @todo_manager = TodoManager.new

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

  command 'todo_show_all' do |client, data, _match|
    formatted_message = if todo_manager.todos_available?
                          'There are no todos to show'
                        else
                          todo_manager.formatted_todo_list
                        end

    client.say(channel: data.channel, text: formatted_message)
  end

  command 'todo_add', /todo_add \w+/ do |client, data, match|
    todo_name = match['expression']
    if todo_name.nil?
      client.say(channel: data.channel, text: 'Please write the name of your todo')
    else
      todo_manager.add_todo todo_name
      client.say(channel: data.channel, text: 'Your todo was added to the list!')
    end
  end

  command 'todo_remove', /todo_remove ^[1-9][0-9]?$|^100$/ do |client, data, match|
    if match['expression'].nil?
      client.say(channel: data.channel, text: 'Please write a valid todo number')
    else
      index = (match['expression'].to_i - 1).abs
      todo_manager.remove_todo index
      client.say(channel: data.channel, text: 'Your todo was succesfully removed')
    end
  end

  command 'todo_check', /todo_check ^[1-9][0-9]?$|^100$/ do |client, data, match|
    if match['expression'].nil?
      client.say(channel: data.channel, text: 'Please write a valid todo number')
    else
      index = (match['expression'].to_i - 1).abs
      todo_manager.check_todo index
      client.say(channel: data.channel, text: 'Your todo was succesfully checked')
    end
  end

  def self.todo_manager
    @todo_manager = TodoManager.new if @todo_manager.nil?
    @todo_manager
  end
end
