#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

client.call_api :post, "/api/v1/developer/products", {
  product_num: "P00001",     #required
  brand: "TestBrand",        #required
  model: "TestModel",        #required
  entity_num: "Entity_01",   #required
  notes: "--- These notes are a sample from rvx-api-demo --",
  manufacturers: [],
  product_category: "Tablet",
  date_first_manufacture: "2015-03-01",
  product_status: "In Design",
  product_source: "Other",
  project_name: "Project Test",
  end_of_life_at: "2018-03-01",
  has_sticker: "Y",
  msrp: "0.00",
  technologies: [
    {
      technology_num: "T00001",
      certified: true
    }
  ]
}
