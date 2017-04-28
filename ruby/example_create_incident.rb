#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'api-auth'
require 'date'
require './api_caller'

RestClient.log = $stdout

request = RestClient::Request.new(
  :url => ENV['URL']+"/api/v1/developer/incidents",
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
      id: 1,  # OPEN
      name: nil
    },
    iso3_country: 'AUT',
    reporting_entity: {
      id: nil,
      name: 'SAMPLE REPORTER'
    },
    infringement_type: {
      name: 'Trademark'
    },
    incident_type: {
      name: 'Royalty Report'
    },
    incident_date: Date.today, # YYYY-MM-DD
    identified_unknown_products: [
      {
        product: {
          model: "MODELNUM",
          brand: "BRANDNAME",
          product_category: 'STB'
        },
        qty: 1,
        amount: 29.99,
        technologies: [
          {
            technology_num: "HDMI", # this has to match in the incident
          }
        ]
      }
    ],
    identified_products: [
      {
        product: {
          model: "KNOWN MODEL",
          brand: "KNOWN BRAND",
          product_category: 'Tablet',
          entity: {
            name: "SAMPLE REPORTER"
          }
        },
        qty: 10,
        amount: 29.99,
        technologies: [
          {
            technology_num: "THX", # this has to match in the incident
          }
        ]
      }
    ]
  }.to_json)

caller = ApiCaller.new ENV['KEY'], ENV['SECRET']

puts "\ndo request: "
caller.call_api request

