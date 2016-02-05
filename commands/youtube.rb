module Vicki
  module Commands
    class YouTube < SlackRubyBot::Commands::Base
      command 'yt' do |client, data, _match|
        channel = Yt::Channel.new id: _match[:expression]
        client.say(channel: data.channel, text: "#{channel.title} has #{channel.subscriber_count} subscribers")
      end
    end
  end
end
