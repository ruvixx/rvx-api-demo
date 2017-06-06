#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

product_num = "P00001"

# NOTE: This currently returns 403 as developers are not allowed to delete products at this time
client.call_api :delete, "/api/v1/developer/products/#{product_num}"