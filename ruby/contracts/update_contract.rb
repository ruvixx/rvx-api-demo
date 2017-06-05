#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

contract_num = "C00002"

client.call_api :patch, "/api/v1/developer/contracts/#{contract_num}", {
  contract_effective_date: "01-01-2017",
  contract_end_date: "07-01-2017",
  details: "test details",
  technologies: [
    {
      technology_num: "T00001",
      entity_num: "Entity_01",
      restrictions: [
        {
          number_of_uses: 100,
          iso3_country: "CAN",
        }
      ],
      reporting_type: "Block",
    }
  ]
}