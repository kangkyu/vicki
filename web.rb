require 'sinatra/base'

module Vicki
  class Web < Sinatra::Base
    get '/' do
      'I’m fantastic. Made of plastic.'
    end
  end
end
