require 'spec_helper'

describe NikePlusGem::Client do

  before :each do
    @access_token = "12345"
    @app_id = "abcde"

    @client = NikePlusGem::Client.new(@access_token, @app_id)
  end

  describe "list_activities" do

    before do
      VCR.insert_cassette 'list_activities'
    end

    it "return json request for list activities" do
      @client.list_activities.should be_instance_of Hash
    end

    after do
      VCR.eject_cassette
    end

  end

  describe "aggregate_sport" do

    before do
      VCR.insert_cassette 'aggregate_sport'
    end

    it "return json request for aggregate sport" do
      @client.aggregate_sport.should be_instance_of Hash
    end

    after do
      VCR.eject_cassette
    end

  end

  describe "experience_type" do

    before do
      VCR.insert_cassette 'experience_type'
    end

    before(:each) do
      @params = {}
      @params["experienceType"] = "FUELBAND"
    end

    it "return json request for experience type" do
      @client.experience_type(@params).should be_instance_of Hash
    end

    it 'raises an exception if the experience type key is missing' do
      @params.delete("experienceType")

      expect {
        @client.experience_type(@params)
      }.to raise_error(ArgumentError)
    end

    it 'raises an exception if the experience type value is not valid' do
      @params["experienceType"] = "NOT_SOMETHING"

      expect {
        @client.experience_type(@params)
      }.to raise_error(ArgumentError)
    end


    after do
      VCR.eject_cassette
    end

  end

  describe "activity_data" do

    before do
      VCR.insert_cassette 'activity_data'
    end

    before(:each) do
      @params = {}
      @params["activityID"] = "2bd0fec0-3955-450b-92dd-29426a19d2f5"
    end

    it "return json request for activity data" do
      @client.activity_data(@params).should be_instance_of Hash
    end

    it 'raises an exception if the activity id key is missing' do
      @params.delete("activityID")

      expect {
        @client.activity_data(@params)
      }.to raise_error(ArgumentError)
    end

    it 'raises an exception if the activity id value is empty' do
      @params["activityID"] = ""

      expect {
        @client.activity_data(@params)
      }.to raise_error(ArgumentError)
    end

    after do
      VCR.eject_cassette
    end

  end

end
