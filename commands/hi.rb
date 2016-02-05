module Vicki
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      command 'hi' do |client, data, _match|
        client.say(channel: data.channel, text: 'hi')
      end
    end
  end
end
