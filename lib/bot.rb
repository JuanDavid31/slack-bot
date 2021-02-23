class Bot < SlackRubyBot::Bot
  help do
    title 'Slack bot'
    desc 'This is a toy bot for the Slack app'

    command :salut do
      title 'salud'
      desc 'Says salut'
      long_desc 'Says salut again'
    end
  end
end
