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
  :url => ENV['URL']+"/api/v1/products/new",
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    brand: "Sample Brand", #required
    model: "Sample Model", #required
    notes: "--- These notes are a sample from rvx-api-demo --",
    entity_num: "sample_entity",
    manufacturer: "sample_manufacturer",
    mfg_model: "sample mfg",
    product_category: "sample",
    royalty_paid_by_entity: "entity_sample",
    product_num: "sample number",
    internal_model_num: "sample internal number",
    dsp_entity: "sample_dsp_entity",
    e3p_entity: "sample_e3p_entity",
    date_first_manufacture: "2015-03-01",
    product_status: "sample",
    product_source: "sample",
    project_name: "Sample name",
    end_of_life_at: "2018-03-01",
    msrp: "0.00",
    technologies: [
      {
        technology_num: 'test_tech_num',
        certified: "true"
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

response = @signed_request.execute

$stdout.print response.to_s + "\n"
