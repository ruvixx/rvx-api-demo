#!/usr/bin/env ruby
require '../api_caller'
require 'dotenv'
Dotenv.load '../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

royalty_report_num = "RoyaltyReport_01"
client.call_api :patch, "/api/v1/developer/royalty_reports/#{royalty_report_num}/royalty_report_items", {
  royalty_report_items:[
    {
      brand:"TestBrand2",
      model:"TestModel2",
      mfg_model:"TestMfgModel2",
      product_category:"Component",
      new_product:true,
      technology_num:"T00001",
      qty_technology: 1,
      application_type:"Component",
      application_market:"",
      description:"",
      unit_price: 0.05,
      qty: 50,
      royalty_due: 1.25,
      avg_sales_price: 0,
      net_revenue: 0,
      revenue_percentage: 0
    }
  ]
}