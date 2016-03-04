require 'spec_helper'

describe 'enums' do
  before :each do
    @test_array = [1,9,2,5,7,3,5]
    @result = Array.new
  end

  describe 'my_each method' do 
    it 'squares each element of array' do
      @test_array.my_each { |i| @result << i**2 }
      expect(@result).to eq ([1,81,4,25,49,9,25])
    end 
  end



end
