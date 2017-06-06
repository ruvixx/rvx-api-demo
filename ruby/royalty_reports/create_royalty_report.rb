#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

client.call_api :post, "/api/v1/developer/royalty_reports", {
  entity_num: "Entity_01", #required
  royalty_report_num: "RoyaltyReport_01", # your RR identifier
  start_date: '2015-01-01',
  end_date: '2015-03-31',
  currency: "USD",
  notes: "--- These notes are a sample from rvx-api-demo --",
  historical: "Y", # false, true, 'Y', 'N' - sets the timestamps correctly if this is a legacy report
  amount: "1000.00",
  royalty_report_items: [
    {
      contract_num: "SAMPLE123", #require if contract validation enabled
      brand: "TestBrand1", #required
      model: "TestModel1", #required
      new_product: "Y", # 'Y': Will create product if not exists; 'N': Sends error if product does not exist
      technology_num: "T00001", #required
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
      #revenue_percentage: "10.00",  # mutually exclusive with unit_price
      mfg_model: "MFGMODEL123"
    }
  ]
}

