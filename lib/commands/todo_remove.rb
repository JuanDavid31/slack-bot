require_relative '../todo_factory'

class TodoRemove < SlackRubyBot::Commands::Base
  command 'todo_remove', /todo_remove ^[1-9][0-9]?$|^100$/ do |client, data, match|
    if match['expression'].nil?
      client.say(channel: data.channel, text: 'Please write a valid todo number')
    else
      index = (match['expression'].to_i - 1).abs
      TodoFactory.instance.remove_todo index
      client.say(channel: data.channel, text: 'Your todo was succesfully removed')
    end
  end
end
