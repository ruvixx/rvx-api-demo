#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

product_num = "P00001"

client.call_api :patch, "/api/v1/developer/products/#{product_num}", {
  overwrite: true,
  product_status: "End of Life",
  end_of_life_at: "2017-01-01"
}
