module Vicki
  module Commands
    class YouTube < SlackRubyBot::Commands::Base
      command 'yt' do |client, data, _match|
        channel = Yt::Channel.new id: _match[:expression]
        text = "#{channel.title} has #{channel.subscriber_count} subscribers"
        client.say channel: data.channel, text: text
      end

      command 'audit' do |client, data, _match|
        channel = Yt::Channel.new id: _match[:expression]
        audit = Yt::Audit.new channel: channel
        client.say channel: data.channel, text: "Channel: https://www.youtube.com/channel/#{_match[:expression]}"
        audit.run.each do |audit_item|
          text = "#{audit_item.valid_count} (out of #{audit_item.total_count}) #{audit_item.title}"
          client.say channel: data.channel, text: text
        end
      end
    end
  end
end
