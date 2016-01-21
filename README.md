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