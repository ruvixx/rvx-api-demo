#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'api-auth'
require 'date'

@access_id = ENV['KEY']
@secret_key = ENV['SECRET']

RestClient.log = $stdout

@request = RestClient::Request.new(
  :url => ENV['URL']+"/api/v1/entities/new",
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    name: "HDMI001", #required
    url: "www.sample.from.rvx-api-demo",
    notes: "--- These notes are a sample from rvx-api-demo --",
    ignored: false,
    entity_num: "test_name", #required
    contracts: [
      {
        contract_name: "Sample name",
        contract_num: "AGR1200655", #require
        contract_effective_date: "2015-01-01",
        contract_end_date: "2015-03-01",
        reporting_effective_date: "2015-03-01",
        reporting_end_date: "2015-06-01",
        termination_date: "2015-01-01",
        application_date: "2015-01-01",
        suspension_date: "2015-01-01",
        details: "--- These details are a sample from rvx-api-demo --",
        technologies: [
          {
            technology_num: "test_tech_num"
          }
        ]
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

response = @signed_request.execute

$stdout.print response.to_s + "\n"