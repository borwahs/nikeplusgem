require 'spec_helper'

describe NikePlusGem::Client do

  before :each do
    @access_token = "12345"
    @app_id = "abcde"

    @client = NikePlusGem::Client.new(@access_token, @app_id)
  end

  describe "#new" do
    it "takes two parameters and returns a Client object" do
      @client.should be_an_instance_of NikePlusGem::Client
    end
  end

  describe "#access_token" do
    it "returns the correct access token" do
      @client.access_token.should eql @access_token
    end
  end

  describe "#app_id" do
    it "returns the correct app id" do
      @client.app_id.should eql @app_id
    end
  end

  describe "#build_headers" do
    it 'should include the App ID key in the header hash' do
      headers = @client.build_headers({"test" => "value", "test2" => "value2"})
      headers.should have_key("appid")
    end

    it 'should include the Accept key in the header hash' do
      headers = @client.build_headers({"test" => "value", "test2" => "value2"})
      headers.should have_key("Accept")
    end

    it 'should include the two keys passed in' do
      headers = @client.build_headers({"test" => "value", "test2" => "value2"})
      headers.should have_key("test")
      headers.should have_key("test2")
    end
  end

  describe "#create_qs_params_hash" do
    it 'should include the Access Token key in the hash' do
      include_params = ["access_token"]

      query_string_params = @client.create_qs_params_hash({"test" => "one"})
      query_string_params.should have_key("access_token")
      query_string_params.should have_key("test")
    end
  end

end
