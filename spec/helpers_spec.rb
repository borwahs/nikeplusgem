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

end