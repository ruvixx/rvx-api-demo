#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'api-auth'
require 'date'
require 'byebug'

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

RestClient.log = $stdout

contract_technology_request = RestClient::Request.new(
  :url => ENV['URL']+'/api/v1/developer/contracts/developer%20contracts%20api%20test',
  :method => :patch,
  :headers => {
    content_type: 'application/json',
  },
  :payload => {
    contract_effective_date: '01-01-2017',
    contract_end_date: '07-01-2017',
    details: 'test details.',
    contract_type: 'Direct Royalties',
    technologies: [
      {
        technology_num: 'TechnologyKey num 1',
        entity_num: 'Juan Jacobs num',
        usage_reporting_status: 'Required',
        restrictions: [
          {
            number_of_uses: 337,
            restriction_type: 'Entity',
            entity_num: 'Reality Inc num',
          }
        ],
        reporting_type: 'Block',
      },
    ]
  }.to_json
)

ct_restriction_delete = RestClient::Request.new(
  :url => ENV['URL']+'/api/v1/developer/contracts/developer%20contracts%20api%20test/restriction',
  :method => :delete,
  :headers => {
    content_type: :json,
    accept: :json,
    params: {
      technology_num: 'TechnologyKey num 1',
      entity_num: 'Juan Jacobs num',
      restriction_type: 'Entity',
      restriction_name: 'Reality Inc',
      number_of_uses: 337
    }
  }
)


caller = ApiCaller.new ENV['KEY'], ENV['SECRET']

puts "\ndo request: "
caller.call_api ct_restriction_delete



