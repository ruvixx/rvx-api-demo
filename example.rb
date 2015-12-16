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
  :url => ENV['URL'],
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    name: "AV Invalid Scan - United States", # can be named anything
    incident_num: "AV0001",
    incident_url: "http://av.com/incident/13939",
    description: "varchar(255)",
    incident_text: "LONGTEXT",
    status: {
      id: 1  # OPEN
    },
    country: {
      name: 'United States'
    },
    reporting_entity: {
      name: 'SAMPLE REPORTER'
    },
    infringement_type: {
      id: 7,
      name: 'Counterfeiting'
    },
    incident_type: {
      id: 4,
      name: 'Website'
    },
    incident_date: Date.today, # YYYY-MM-DD
    identified_unknown_products: [
      {
        product: {
          model: "MODELNUM",
          brand: "BRANDNAME"
        },
        qty: 1,
        amount: 29.99,
        technologies: [
          {
            name: "HDMI",
          }
        ]
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

@signed_request.execute
