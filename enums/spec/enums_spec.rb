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

    it 'returns self in block given' do
      @result = @test_array.my_each
      expect(@result).to eq(@test_array)
    end
  end

  describe 'my_each_with_index method' do
    it 'returns values with index in array of pairs' do
      @test_array.my_each_with_index { |val,i| @result << [i, val] }
      expect(@result).to eq([[0,1],[1,9],[2,2],[3,5],[4,7],[5,3],[6,5]])
    end

    it 'returns self if no block given' do
      @result = @test_array.my_each_with_index
      expect(@result).to eq(@test_array)
    end
  end

  describe 'my_select method' do
    it 'returns only even values' do
      @result = @test_array.my_select { |x| x.even? }
      expect(@result).to eq([2])
    end

    it 'returns only odd values' do
      @result = @test_array.my_select { |x| x.odd? }
      expect(@result).to eq([1,9,5,7,3,5])
    end

    it 'returs self if no block given' do
      @result = @test_array.my_select
      expect(@result).to eq(@test_array)
    end
  end  

  describe 'my_all? method' do 
    it 'checks if elements are integers' do
      @result = @test_array.my_all? { |x| x.is_a? Integer }
      expect(@result).to be true
    end
    
    it 'checks if elements are odd' do
      @result = @test_array.my_all? { |x| x.odd? }
      expect(@result).to be false
    end
  end

end
