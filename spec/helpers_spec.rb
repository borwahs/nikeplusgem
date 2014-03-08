require 'spec_helper'

describe NikePlusGem::Helpers do

  it 'should return a string object' do
    date_value = "2013/06/21"
    date = NikePlusGem::Helpers.format_date(date_value)

    date.should.instance_of? String
  end

  it 'should accept a string in the correct format' do
    date_value = "2013/06/21"
    date = NikePlusGem::Helpers.format_date(date_value)

    date.should.eql? "2013/06/21"
  end

  it 'should error on a string in the incorrect format' do
    date_value = "13/06/21"
    date = NikePlusGem::Helpers.format_date(date_value)

    date.should.eql? "ERROR"
  end

  it 'should accept a Date object' do
    date_value = Date.new(2013,6,21)
    date = NikePlusGem::Helpers.format_date(date_value)

    date.should.eql? "2013/06/21"
  end

  describe "#merge_required_headers" do
    it 'should include the App ID key in the header hash' do
      headers = NikePlusGem::Helpers.merge_required_headers("appIdValue", {"test" => "value", "test2" => "value2"})
      headers.should have_key("appid")
    end

    it 'should include the Accept key in the header hash' do
      headers = NikePlusGem::Helpers.merge_required_headers("appIdValue", {"test" => "value", "test2" => "value2"})
      headers.should have_key("Accept")
    end

    it 'should include the two keys passed in' do
      headers = NikePlusGem::Helpers.merge_required_headers("appIdValue", {"test" => "value", "test2" => "value2"})
      headers.should have_key("test")
      headers.should have_key("test2")
    end

    it 'should set app_id to appIdValue' do
      headers = NikePlusGem::Helpers.merge_required_headers("appIdValue", {"test" => "value", "test2" => "value2"})
      headers.should have_key("appid")
      headers["appid"].should.eql?("appIdValue")
    end
  end

  describe "#merge_required_qs_params" do
    it 'should include the Access Token key in the hash' do
      query_string_params = NikePlusGem::Helpers.merge_required_qs_params("accessTokenValue", {"test" => "one"})
      query_string_params.should have_key("access_token")
      query_string_params.should have_key("test")
    end

    it 'should set access_token to accessTokenValue' do
      query_string_params = NikePlusGem::Helpers.merge_required_qs_params("accessTokenValue", {"test" => "value"})
      query_string_params.should have_key("access_token")
      query_string_params["access_token"].should.eql?("accessTokenValue")
    end
  end

end
