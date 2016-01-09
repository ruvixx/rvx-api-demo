# rvx-api-demo

This repo is just a quick example of how to connect and sign a request to the RVX Platform API.

The Authorization signature is built using the proceedure described here:
https://github.com/mgomes/api_auth

required `ruby-2.2.2`

```
$> bundle install

$> chmod 755 ./example_create_incident.rb

-- UPDATE your .env file to include
SECRET=XXXX
KEY=XXXX
URL=http://---rvx-platform-url

$> ./example_create_incident.rb
```
