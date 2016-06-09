#!/usr/bin/env ruby
require 'dotenv'
require 'json'
Dotenv.load

require 'rest-client'
require 'api-auth'
require 'date'

@access_id = ENV['KEY']
@secret_key = ENV['SECRET']

RestClient.log = $stdout

# Example of Restclient Exception handling. Required to see Developer Api error message
# Example attempts to add Royalty Report Items to a Royalty Report that has already been invoiced.
# Should return a 400 response.

@request = RestClient::Request.new(
  :url => ENV['URL']+"/api/v1/developer/royalty_reports/MY_RR_NUM1234/royalty_report_items",
  :method => :patch,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    royalty_report_items: [
      {
        brand:              "ASUS",
        model:              "90-YAA055-1UAN00Z",
        technology_num:     "HDMI",
        qty:                254,
        unit_price:         190.50,
        royalty_due:        190.50,
        qty_technology:     1,
      }
    ]
  }.to_json)

@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key, :with_http_method => true)

begin
  response = @signed_request.execute
  $stdout.print response.to_s + "\n"
rescue => bad_request
  response = JSON.parse(bad_request.response)
  $stdout.print("#{bad_request.message}: #{response["error"]}\n")
end
