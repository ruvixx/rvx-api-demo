# rvx-api-demo - Ruby

This repo is just a quick example of how to connect and sign a request to the RVX Platform API.

The Authorization signature is built using the proceedure described here:
https://github.com/mgomes/api_auth

required `ruby-2.2.2`

```
$> bundle install

-- UPDATE your .env file to include
ACCESS_ID=XXXX
SECRET_KEY=XXXX
URL=http://---rvx-platform-url

$> cd incidents

$> chmod 755 ./create_incident.rb

$> ./create_incident.rb
```
