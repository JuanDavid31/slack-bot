require_relative '../todo_factory'

class TodoCheck < SlackRubyBot::Commands::Base
  command 'todo_check', /todo_check ^[1-9][0-9]?$|^100$/ do |client, data, match|
    if match['expression'].nil?
      client.say(channel: data.channel, text: 'Please write a valid todo number')
    else
      index = (match['expression'].to_i - 1).abs
      TodoFactory.instance.check_todo index
      client.say(channel: data.channel, text: 'Your todo was succesfully checked')
    end
  end
end
