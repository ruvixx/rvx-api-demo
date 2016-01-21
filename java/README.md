# rvx-api-demo - Java

This repo is just a quick example of how to connect and sign a request to the RVX Platform API.

The Authorization signature is built using the procedure described here:
https://github.com/mgomes/api_auth#how-it-works

```
$> cd ./java # make sure you're in the java specific dir

$> chmod 755 ./gradlew # This is for unix machines

# Ref: https://docs.gradle.org/current/userguide/gradle_wrapper.html
$> ./gradlew # this will install gradle for you
$> gradlew # for windows

-- **UPDATE your at.avdev.ruvixx.Application class file to include your secret, access key, and URL most likely
-- provided to you in email from the Ruvixx Team

$> ./gradlew bootRun

-- You should now have successfully created an incident

```
