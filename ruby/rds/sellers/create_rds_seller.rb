require '../../api_caller'
require 'dotenv'
Dotenv.load '../../.env'

client = ApiCaller.new(ENV['ACCESS_ID'], ENV['SECRET_KEY'], ENV['URL'])

rds_sellers = [
  { name: 'Zappos Retail, Inc.', min_price: 46.74, max_price: 46.74},
  { name: 'Zappos.com (www.zappos.com)', min_price: 46.74, max_price: 46.74 },
  { name: 'Amadeals', min_price: 48.99, max_price: 48.99 },
  { name: 'WATCH CITY', min_price: 50.0, max_price: 50.0 },
  { name: 'North State Outfitters', min_price: 53.35, max_price: 53.35 },
  { name: 'Toykrazela', min_price: 48.99, max_price: 48.99 },
  { name: 'The Gear Coop', min_price: 54.9, max_price: 54.9 },
  { name: 'Tactical Ops', min_price: 54.9, max_price: 54.9 },
  { name: 'AracciUS', min_price: 54.9, max_price: 54.9 },
  { name: 'Skykland', min_price: 54.9, max_price: 54.9 },
  { name: 'Robert Wayne Footwear', min_price: 54.95, max_price: 54.95 },
  { name: 'Orva Stores', min_price: 54.95, max_price: 54.95 },
  { name: 'Toys and Tales, Inc', min_price: 54.99, max_price: 54.99 },
  { name: "Tilly's", min_price: 54.99, max_price: 54.99 },
  { name: 'eBags', min_price: 55.0, max_price: 55.0 },
  { name: 'smart online buys', min_price: 67.0, max_price: 67.0 }
]


rds_sellers.each do |seller|
  seller[:overwrite] = true
  seller[:rds_listings] = [
    {
      url: 'https://www.amazon.com/dp/B07192Q1M4',
      scrape_date: '2018-07-21',
      name: 'JanSport Cool Student Laptop Backpack',
      source: 'Amazon',
      categories: ['Toys & Games', 'Grown-Up Toys'],
      rds_products: [{ brand: 'JanSport', model: 'JS0A2SDD', name: 'JanSport Cool Student Laptop Backpack' }],
      images: [
        { thumb: 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/533/thumb/open-uri20180720-42837-1ph9d9j.png?1532132627',
        original: 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/533/original/open-uri20180720-42837-1ph9d9j?1532132627' },
        { thumb: 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/534/thumb/open-uri20180720-42837-ajjoiv.png?1532132627',
          original: 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/534/original/open-uri20180720-42837-ajjoiv?1532132627' },
        { :thumb => 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/535/thumb/open-uri20180720-42837-r1dv19.png?1532132627',
          :original => 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/535/original/open-uri20180720-42837-r1dv19?1532132627' },
        { :thumb => 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/536/thumb/open-uri20180720-42837-6q4smz.png?1532132627',
          :original => 'http://s3.amazonaws.com/rvx-rds-dev/development/images/uploads/007/980/536/original/open-uri20180720-42837-6q4smz?1532132627' }],
      screenshots: [{ thumb: 'http://s3.amazonaws.com/rvx-rds-dev/development/screenshots/uploads/007/980/540/thumb/7b65eeb3-f460-4330-92e6-02c66407097c-listing.png?1532134839',
        original: 'http://s3.amazonaws.com/rvx-rds-dev/development/screenshots/uploads/007/980/540/original/7b65eeb3-f460-4330-92e6-02c66407097c-listing.png?1532134839' }],
      countries: [
        { iso3_code: 'USA' },
        { name: 'China' }
      ]
    }
  ]
  client.call_api :post, '/api/v1/developer/rds/rds_sellers', seller
end
