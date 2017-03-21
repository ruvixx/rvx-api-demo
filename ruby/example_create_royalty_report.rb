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
  :url => ENV['URL']+"/api/v1/developer/royalty_reports",
  :method => :post,
  :headers => {
    'Content-Type' => 'application/json'
  },
  :payload => {
    entity_num: "HDMI001", #required
    royalty_report_num: "MY_RR_NUM1234", # your RR identifier
    start_date: '2015-01-01',
    end_date: '2015-03-31',
    currency: "USD",
    notes: "--- These notes are a sample from rvx-api-demo --",
    invoice_num: "#SAMPLE123",
    invoiced_at: "2015-02-01 14:03:32",
    historical: "Y", # false, true, 'Y', 'N' - sets the timestamps correctly if this is a legacy report
    amount: "1000.00",
    royalty_report_items: [
      {
        contract_num: "SAMPLE123", #require if contract validation enabled
        brand: "COBRA", #required
        model: "CDR900", #required
        new_product: "Y", # 'Y': Will create product if not exists; 'N': Sends error if product does not exist
        technology_num: "HDMI", #required
        qty_technology: "1", #required
        application_type: "Component",
        application_market: "",
        description: "-- This description is a sample description from rvx-api-demo call --",
        unit_price: "100.00",
        qty: "100",
        royalty_due: "1000.00",
        exchanged_amount: "1000.00",
        exchange_rate: "1.0",
        #NotImplementedYet: royalty_calculation: 'none' | 'simple' | 'asp' | 'custom'
        product_category: "Tablet",
        avg_sales_price: "93.00",
        net_revenue: "700.00",
        revenue_percentage: "10.00",
        mfg_model: "MFGMODEL123"
      }
    ]
  }.to_json)


@signed_request = ApiAuth.sign!(@request, @access_id, @secret_key, :with_http_method => true)

begin
  response = @signed_request.execute
  $stdout.print response.to_s + "\n"
rescue => bad_request
  response = JSON.parse(bad_request.response)
  $stdout.print("#{bad_request.message}: #{response["error"]}\n")
end

