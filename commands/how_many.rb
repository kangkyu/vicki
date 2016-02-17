module Vicki
  module Commands
    class HowMany < SlackRubyBot::Commands::Base
      command 'how many' do |client, data, _match|
        client.say(channel: data.channel, text: rand(100).to_s)
      end
    end
  end
end
