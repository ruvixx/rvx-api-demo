require 'api-auth'

class ApiCaller
  def initialize(access_id, secret_key)
    @access_id = access_id
    @secret_key = secret_key
  end

  def call_api(request)
    @signed_request = ApiAuth.sign!(request, @access_id, @secret_key, :with_http_method => true)

    begin
      response = @signed_request.execute
      $stdout.print response.to_s + "\n"
      response
    rescue => bad_request
      response = JSON.parse(bad_request.response)
      $stdout.print("#{bad_request.message}: #{response}\n")
      response
    end
  end
end

