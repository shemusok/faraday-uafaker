require 'faraday'

module FaradayMiddleware
  class UserAgentFaker < Faraday::Middleware
    VERSION = '0.0.1'

    UASS = IO.readlines(File.expand_path('data/uass.txt'))

    def self.uas
      UASS[rand UASS.length].chomp
    end

    def call(env)
      env[:request_headers]['User-Agent'] = self.class::uas
      @app.call(env)
    end
  end
end
