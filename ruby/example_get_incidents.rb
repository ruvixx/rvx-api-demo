#!/usr/bin/env ruby
require 'dotenv'
Dotenv.load

require 'rest-client'
require 'date'
require './api_caller'

RestClient.log = $stdout

request = RestClient::Request.new(
  :url => ENV['URL']+"/api/v1/developer/incidents",
  :method => :get,
  :headers => {
    'Content-Type' => 'application/json'
  })

caller = ApiCaller.new ENV['KEY'], ENV['SECRET']

puts "\ndo request: "
caller.call_api request

