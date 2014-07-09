# Nike Plus Gem

This gem provides access to the [Nike+ Developer Resources](http://developer.nike.com) data through their REST API.
 
_NOTE: This is currently out of date with the latest updates to the Nike+ API. They recently changed it with better documentation and OAUTH support. The gem will be updated soon._

## Documentation

Good method documentation is available at [rubydoc.info](http://www.rubydoc.info/github/borwahs/nikeplusgem/frames).

The API methods are exposed in the Client class:

* Aggregate Sports Data
* List Activities
* Activities By Experience Type
* Activity Details

At the moment, the only way to connect is to get a specific Access Token for an account from [Nike+ Developer API Portal](https://developer.nike.com/content/nike-developer-cq/us/en_us/index/documentation/api-docs.html).

## API Version

The API exposed by Nike to retrieve data is not currently versioned. Use the date located below to determine how this gem compares to the API. 

Date Last Tested: March 22nd, 2014

## Usage

Require the gem:

    require 'nikeplusgem'

Setup a new Client object with an Access Token and Application ID:

    client = NikePlusGem::Client.new("access_token", "app_id")

# Disclaimer

This is MIT licensed with no added caveats. See LICENSE file for more details.

**I am not employed by or have any association with Nike or the development of the Nike+ API.**
