require_relative '../todo_factory'

class TodoAdd < SlackRubyBot::Commands::Base
  command 'todo_add', /todo_add \w+/ do |client, data, match|
    todo_name = match['expression']
    if todo_name.nil?
      client.say(channel: data.channel, text: 'Please write the name of your todo')
    else
      TodoFactory.instance.add_todo todo_name
      client.say(channel: data.channel, text: 'Your todo was added to the list!')
    end
  end
end
