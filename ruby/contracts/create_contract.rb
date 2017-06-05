#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

client.call_api :post, "/api/v1/developer/contracts", {
  overwrite: true,
  contract_num: "C00002",
  name: "TestContract"
}
