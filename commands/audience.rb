module Vicki
  module Commands
    class Audience < SlackRubyBot::Commands::Base
      command 'audience' do |client, data, _match|
        uri = URI('http://localhost:3000/api/audits')

        req = Net::HTTP::Post.new(uri)
        args = _match[:expression].split(' ')
        req.set_form_data("youtube_url" => args.first, 'email' => "#{args.last}@fullscreen.net")

        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
        case res
        when Net::HTTPSuccess, Net::HTTPRedirection
          client.say channel: data.channel, text: "I'm crunching the numbers now, you will get an email soon."
        else
          client.say channel: data.channel, text: "Ooops"
        end
      end
    end
  end
end
