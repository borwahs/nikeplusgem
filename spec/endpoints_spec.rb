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

    it "return json request for experience type" do
      @client.experience_type({"experienceType"=>"FUELBAND"}).should be_instance_of Hash
    end

    after do
      VCR.eject_cassette
    end

  end

  describe "activity_data" do

    before do
      VCR.insert_cassette 'activity_data'
    end

    it "return json request for activity data" do
      @client.activity_data({"activityId"=>"2bd0fec0-3955-450b-92dd-29426a19d2f5"}).should be_instance_of Hash
    end

    after do
      VCR.eject_cassette
    end

  end

end
