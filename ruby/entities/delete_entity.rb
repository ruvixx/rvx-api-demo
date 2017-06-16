#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

entity_num = "Entity_01"

client.call_api :delete, "/api/v1/developer/entities/#{entity_num}"