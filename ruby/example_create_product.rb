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
  :url => ENV['URL']+"/api/v1/developer/products",
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    brand: "Sample Brand11", #required
    model: "Sample Model11", #required
    notes: "--- These notes are a sample from rvx-api-demo --",
    entity_num: "HDMI001",
    manufacturer: "HDMI001",
    mfg_model: "sample mfg",
    product_category: "Tablet",
    # royalty_paid_by_entity: "",
    product_num: "sample number11",
    date_first_manufacture: "2015-03-01",
    product_status: "In Design",
    product_source: "Other",
    project_name: "Sample name",
    end_of_life_at: "2018-03-01",
    has_sticker: "Y",
    msrp: "0.00",
    technologies: [
      {
        technology_num: 'HDMI',
        certified: "true"
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

response = @signed_request.execute

$stdout.print response.to_s + "\n"
