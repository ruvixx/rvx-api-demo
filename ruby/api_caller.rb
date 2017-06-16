require 'api-auth'
require 'json'
require 'rest-client'

class ApiCaller
  def initialize(access_id, secret_key, host_url)
    @access_id = access_id
    @secret_key = secret_key
    @host_url = host_url
  end

  def call_api(method, url, payload={})
    request = RestClient::Request.new(
      :url => @host_url + url,
      :method => method,
      :payload => payload.to_json,
      :headers => {
        'Content-Type' => 'application/json'
      }
    )

    @signed_request = ApiAuth.sign!(request, @access_id, @secret_key, :with_http_method => true)

    begin
      response = @signed_request.execute
      $stdout.print(response.description)
      if response.body.size > 0
        pretty_response = JSON.pretty_generate(JSON.parse(response.body)) + "\n"
        $stdout.print(pretty_response)
      end
      response
    rescue => bad_request
      response = bad_request.response
      $stdout.print("#{bad_request.message}:\n #{response}\n")
      response
    end
  end
end

