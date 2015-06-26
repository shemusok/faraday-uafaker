require 'faraday'

module FaradayMiddleware
  class UserAgentFaker < Faraday::Middleware
    VERSION = '0.0.2'

    UASS_FILE = File.expand_path(File.dirname(__FILE__) + '/../../../data/uass.txt')

    UASS = IO.readlines UASS_FILE

    def self.uas
      UASS[rand UASS.length].chomp
    end

    def uas
      @uas ||= self.class.uas
    end

    def call(env)
      env[:request_headers]['User-Agent'] = uas
      @app.call(env)
    end
  end
end
