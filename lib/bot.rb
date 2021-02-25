class Bot < SlackRubyBot::Bot
  help do
    title 'Slack bot'
    desc 'This is a toy bot for the Slack app. It is capable of fetching random jokes and managing todos.'

    command :joke do
      title 'joke'
      desc 'Fetch and shows a random joke from a REST API'
      long_desc 'Fetch and shows a random joke from a REST API'
    end

    command :todo_show_all do
      title 'todo_show_all'
      desc 'List all todos'
      long_desc 'List all todos'
    end

    command :todo_add do
      title 'todo_add'
      desc 'Adds the given todo to the list. Eg: clean up my room'
      long_desc 'Adds the given todo to the list. Eg: clean up my room'
    end

    command :todo_remove do
      title 'todo_remove'
      desc 'Remove the todo from the given index (A number from 1 to 100).'
      long_desc 'Remove the todo from the given index (A number from 1 to 100).'
    end

    command :todo_check do
      title 'todo_check'
      desc 'Check the todo from the given index (A number from 1 to 100)'
      long_desc 'Check the todo from the given index (A number from 1 to 100)'
    end
  end
end
