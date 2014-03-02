require 'spec_helper'

describe Hash do

  before :each do
    @include_params = ["param1", "param3", "Param5", "PaRam6"]
    @test_params = { "param1" => 1, "param2" => 2, "param3" => 3, "param4" => 4, "param5" => 5, "PaRam6" => 6}
  end

  it 'should include a new method called only' do
    @test_params.should respond_to(:only)
  end

  it 'should accept an array as the parameter object' do
    params = @test_params.only(@include_params)

    params.should be_an_instance_of Hash
  end

  it 'should only include keys in argument passed in' do
    params = @test_params.only(@include_params)

    params.should have_key("param1")
    params.should have_key("param3")
    params.should have_key("PaRam6")
  end

  it 'should not include keys that argument is missing' do
    params = @test_params.only(@include_params)

    params.should_not have_key("param2")
    params.should_not have_key("param4")
    params.should_not have_key("PaRam5")
  end

end
