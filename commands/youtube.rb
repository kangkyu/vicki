module Vicki
  module Commands
    class YouTube < SlackRubyBot::Commands::Base
      command 'yt' do |client, data, _match|
        channel = Yt::Channel.new id: _match[:expression]
        text = "#{channel.title} has #{channel.subscriber_count} subscribers"
        client.say channel: data.channel, text: text
      end
    end
  end
end
