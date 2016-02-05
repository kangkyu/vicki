$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'vicki'
require 'web'

Thread.abort_on_exception = true

Thread.new do
  begin
    Vicki::Bot.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run Vicki::Web
