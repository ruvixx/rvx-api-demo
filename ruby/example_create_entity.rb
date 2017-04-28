#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'date'
require './api_caller'

RestClient.log = $stdout

request = RestClient::Request.new(
  :url => ENV['URL']+"/api/v1/developer/entities",
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    name: "HDMI001", #required
    url: "www.sample.from.rvx-api-demo",
    country: "Afghanistan",
    notes: "--- These notes are a sample from rvx-api-demo --",
    entity_num: "test_name", #required
    contracts: [
      {
        name: "Sample name",
        contract_num: "AGR1200655", #require
        contract_effective_date: "2015-01-01",
        contract_end_date: "2015-03-01",
        reporting_effective_date: "2015-03-01",
        reporting_end_date: "2015-06-01",
        termination_date: "2015-01-01",
        application_date: "2015-01-01",
        suspension_date: "2015-01-01",
        details: "--- These details are a sample from rvx-api-demo --",
        #must be included if contracts included
        technologies: [
          {
            technology_num: "THX",
            reporting_type: "QIA",
            restrictions: [
              {
                number_of_uses: 337,
                restriction_type: 'Entity',
                entity_num: 'Reality Inc num',
              }
            ],
          }
        ]
      }
    ],
    addresses: [{
                  address_num: 'Ruvixx',
                  street1: '300 Brannan St.',
                  street2: 'Suite 507',
                  city: 'San Francisco',
                  state: 'CA',
                  postal_code: '94107',
                  country: 'United States',
                }],
    contacts: [
      {
        email: 'new@email.com',
        phones: [{
                   number: '111-1111',
                   type: 'Mobile',
                   is_primary: true
                 },{
                   number: '111-1111',
                   type: 'Work'
                 }],
        fax: '888-8888',
        name: 'John Smith',
        title: 'VP',
        contact_status: 'Active'
      }
    ]
  }.to_json)

caller = ApiCaller.new ENV['KEY'], ENV['SECRET']

puts "\ndo request: "
caller.call_api request

