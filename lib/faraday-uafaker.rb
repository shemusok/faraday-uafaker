require 'faraday'

module FaradayMiddleware
  autoload :UserAgentFaker, 'faraday_middleware/request/user_agent_faker'
  if Faraday::Request.respond_to? :register_middleware
    Faraday::Request.register_middleware uafaker: lambda { UserAgentFaker } 
  end
end

