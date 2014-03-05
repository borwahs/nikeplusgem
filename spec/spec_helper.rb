require_relative '../lib/nikeplusgem'

require 'webmock/rspec'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<ACCESS_TOKEN>') { '12345' }
  c.filter_sensitive_data('<APP_ID>') { 'abcde' }
end
