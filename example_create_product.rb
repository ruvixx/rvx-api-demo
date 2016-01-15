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
    entity_num: "sample_entity",
    manufacturer_id: 1,
    mfg_model: "sample mfg",
    product_category_id: 1,
    royalty_paid_by_entity_id: 1,
    product_num: "sample number",
    internal_model_num: "sample internal number",
    dsp_entity_id: 1,
    e3p_entity_id: 1,
    date_first_manufacture: "2015-03-01",
    product_status_id: 1,
    product_source_id: 1,
    revision_of_product_id: 1,
    logo_used_id: 1,
    certification_attached_id: 1,
    project_name: "Sample name",
    end_of_life_at: "2018-03-01",
    msrp: "0.00",
    technologies: [
      {
        technology_id: 1,
        certified: true
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

response = @signed_request.execute

$stdout.print response.to_s + "\n"
