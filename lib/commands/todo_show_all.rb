require_relative '../todo_factory'

class TodoShowAll < SlackRubyBot::Commands::Base
  command 'todo_show_all' do |client, data, _match|
    formatted_message = if TodoFactory.instance.todos_available?
                          'There are no todos to show'
                        else
                          TodoFactory.instance.formatted_todo_list
                        end

    client.say(channel: data.channel, text: formatted_message)
  end
end
