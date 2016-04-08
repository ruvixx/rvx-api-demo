# rvx-api-demo

This repo is an interactive documentation of how to connect and sign a request to the RVX Platform API.

The Authorization signature is built using the procedure described here:
https://github.com/mgomes/api_auth#how-it-works

We have provided a Ruby example which simply shows the JSON payload for the following REST actions:

- "Create Incident" POST /v1/incidents [See example](https://github.com/ruvixx/rvx-api-demo/blob/master/ruby/example_create_incident.rb)

- "Get Incidents" GET /v1/incidents [See example](https://github.com/ruvixx/rvx-api-demo/blob/master/ruby/example_get_incidents.rb)

- "Create Royalty Report" POST /v1/royalty_reports/new [See example](https://github.com/ruvixx/rvx-api-demo/blob/master/ruby/example_create_royalty_report.rb)

- "Create Entity" POST /v1/entities/new [See example](https://github.com/ruvixx/rvx-api-demo/blob/master/ruby/example_create_entity.rb)

- "Create Certified Product" POST /v1/products/new [See example](https://github.com/ruvixx/rvx-api-demo/blob/master/ruby/example_create_product.rb)


We have provided a Java implementation from one of our partners for those using Java. [See Java example](https://github.com/ruvixx/rvx-api-demo/blob/master/java)


### High-level API

Base path: `/api/v1/developer`

**entities**
- POST `/entities` Create new Entity via API
- DELETE `/entities/{entity_num}` Delete Entity via API
- PUT `/entities/{entity_num}` Update Entity via API

**incidents**
- DELETE `/incidents/{id}` Delete
- GET `/incidents/{id}` Get a specific Incident
- PATCH `/incidents/{id}` Update an Incident
- GET `/incidents` Get Incidents
- POST `/incidents` Create an Incident

**products**
- DELETE `/products/{product_num}` Delete Product
- GET `/products/{product_num}` Get Product
- PUT `/products/{product_num}` Update Product
- POST `/products` Create new Product via API

**royalty_reports**
- POST `/royalty_reports` Create new Royalty Report via API
- DELETE `/royalty_reports/{royalty_report_num}` Delete Royalty Report

**sticker_transactions**
- POST `/sticker_transactions/reset_balance` Add starting sticker balance
- POST `/sticker_transactions/purchase` Add Sticker balance increment API
- POST `/sticker_transactions/return` Add Sticker balance decrement API
