

module Rack
  module Auth
    class GALogin
      
      def log(msg)
        @log << "\n  #{ msg }"
      end
      
      def initialize(app, domain = "indielabs.com")
        @app = app
        @domain = domain
      end
      
      def call(env)
        request = Rack::Request.new(env)
        
        
      end
      
    end # GALogin
  end # Auth
end # Rack