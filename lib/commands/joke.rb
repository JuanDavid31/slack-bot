require 'rest-client'

class Joke < SlackRubyBot::Commands::Base
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
end
