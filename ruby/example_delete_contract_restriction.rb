#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'api-auth'
require 'date'
require './api_caller'

RestClient.log = $stdout

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
