#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

# NOTE:
# The technology_type must already be present in Ruvixx.  To run this example,
# create at least two levels (System Settings -> IP -> Levels) and a technology_type
# (System Settings -> IP -> IP Type) named 'TestTechnologyType', using exactly two levels.

client.call_api :post, "/api/v1/developer/technologies", {
  technology_type: "TestTechnologyType",
  technology_num: "T00001",
  technology_family: "TechFamily1",
  certification_required: true, # optional: only used when creating a new TechnologyFamily
  level_1_segment: "Green",
  level_2_segment: "Large"
}


