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

    it "requires the access_token to be non-empty and not nil" do
      expect {
        client = NikePlusGem::Client.new("", @app_id)
      }.to raise_error(NikePlusGem::InvalidArgumentError)

      expect {
        client = NikePlusGem::Client.new(nil, @app_id)
      }.to raise_error(NikePlusGem::InvalidArgumentError)
    end

    it "requires the app_id to be non-empty and not nil" do
      expect {
        client = NikePlusGem::Client.new(@access_token, "")
      }.to raise_error(NikePlusGem::InvalidArgumentError)

      expect {
        client = NikePlusGem::Client.new(@access_token, nil)
      }.to raise_error(NikePlusGem::InvalidArgumentError)
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

end
