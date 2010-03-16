require 'sinatra/base'
require 'rack/openid'

module IndieLogin
  class GoogleAppsAuth < Sinatra::Base
    use Rack::Session::Cookie
    use Rack::OpenID

    before do
      endpoint = 'https://www.google.com/accounts/o8/site-xrds?hd=%s'
      domain_endpoint = endpoint % 'indielabs.com'
    
      if resp = request.env["rack.openid.response"]
        resp.status == :success ? session[:admin] : throw(:halt, [401, 'Not Authorized'])
      else
        headers 'WWW-Authenticate' => Rack::OpenID.build_header(
          :identifier => domain_endpoint
        )
        throw(:halt, [401, 'Not Authorized'])
      end

    end
  end # GoogleAppsAuth
end # IndieLogin