#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'date'
require './api_caller'

RestClient.log = $stdout

request = RestClient::Request.new(
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

caller = ApiCaller.new ENV['KEY'], ENV['SECRET']

puts "\ndo request: "
caller.call_api request



