#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

client.call_api :post, "/api/v1/developer/entities", {
  overwrite: true,

  name: "Test API Entity",    #required
  entity_num: "Entity_01",    #required
  url: "http://rvx-api-demo",
  country: "United States",
  notes: "--- These notes are a sample from rvx-api-demo --",
  addresses: [{
    address_num: "rvx01",
    street1: "300 Brannan St.",
    street2: "Suite 507",
    city: "San Francisco",
    state: "CA",
    postal_code: "94107",
    country: "United States",
  }],
  contacts: [
    {
      name: "John Smith",
      email: "john@smith.com",
      phones: [
        {
          number: "111-1111",
          type: "Mobile",
          is_primary: true
        },
        {
          number: "222-2222",
          type: "Work"
        }
      ],
      fax: "888-8888",
      title: "VP",
      contact_status: "Active"
    }
  ],
  entity_types: ["Manufacturer"],
  contracts: [
    {
      name: "Test API Entity Contract",
      contract_num: "C00001",
      contract_effective_date: "2015-01-01",
      contract_end_date: "2015-03-31",
      reporting_effective_date: "2015-03-01",
      reporting_end_date: "2015-06-01",
      details: "--- details ---",
      technologies: [
        technology_num: "T00001",
        reporting_type: "QIA",
        restrictions: [
          {
            number_of_uses: 500,
            country: "United States"
          }
        ]
      ]
    }
  ]
}