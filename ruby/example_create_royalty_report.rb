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
  :url => ENV['URL']+"/api/v1/royalty_reports/new",
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    entity_num: "HDMI001", #required
    start_date: '2015-01-01',
    end_date: '2015-03-31',
    currency: "USD",
    notes: "--- These notes are a sample from rvx-api-demo --",
    invoice_num: "#SAMPLE123",
    invoiced_at: "2015-02-01 14:03:32",
    historical: "Y", # false, true, 'Y', 'N' - sets the timestamps correctly if this is a legacy report
    royalty_report_items: [
      {
        fuz_contract_num: "SAMPLE123", #require if contract validation enabled
        fuz_brand: "COBRA", #required
        fuz_model: "CDR900", #required
        new_product: "N", # 'Y': Will create product if not exists; 'N': Sends error if product does not exist
        fuz_technology: "HDMI", #required
        qty_technology: 1, #required
        fuz_application_type: "",
        fuz_application_market: "",
        fuz_description: "-- This description is a sample description from rvx-api-demo call --",
        unit_price: "100.00",
        qty: "100",
        royalty_due: "1000.00",
        # royalty_calculation: 'none' | 'simple' | 'asp' | 'custom'
        avg_sales_price: "93.00",
        net_revenue: "700.00",
        revenue_percentage: "10.00"
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key)

response = @signed_request.execute

$stdout.print response.to_s + "\n"
