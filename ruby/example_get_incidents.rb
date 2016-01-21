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
  :url => ENV['URL']+"/api/v1/incidents",
  :method => :get,
  :headers => {
    'Content-Type' => 'application/json'
  })


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

response = @signed_request.execute

$stdout.print response.to_s + "\n"
