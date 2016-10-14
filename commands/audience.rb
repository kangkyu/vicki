module Vicki
  module Commands
    class Audience < SlackRubyBot::Commands::Base
      command 'audience' do |client, data, _match|
        uri = URI('http://localhost:3000/audits')

        req = Net::HTTP::Post.new(uri)
        req.set_form_data("youtube_url" => "#{_match[:expression]}")

        res = Net::HTTP.start(uri.hostname, uri.port) do |http|
          http.request(req)
        end
        case res
        when Net::HTTPSuccess, Net::HTTPRedirection
          client.say channel: data.channel, text: JSON.parse(res.body)['url']
        else
          client.say channel: data.channel, text: "Ooops"
        end
        client.say channel: data.channel, text: "hello Philip"
      end
    end
  end
end
