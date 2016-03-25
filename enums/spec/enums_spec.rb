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

    it 'returns true if no block is given' do
      expect(@test_array.my_all?).to be true
    end
  end

  describe 'my_any? method' do
    it 'checks if any element is a string' do
      @result = @test_array.my_any? { |x| x.is_a? String }
      expect(@test_array.my_any?).to be true
    end

    it 'returns true if no block is given' do
      expect(@test_array.my_any?).to be true
    end
  end

  describe 'my_none? method' do
    it 'checks if none of elements are integers' do
      @result = @test_array.my_none? { |x| x.is_a? String }
      expect(@result).to be true
    end

    it 'checks if none of elements are even' do
      @result = @test_array.my_none? { |x| x.even? }
      expect(@result).to be false
    end

    it 'returns false if no block given' do
      expect(@test_array.my_none?).to be false
    end
  end

  describe 'my_count method' do
    it 'returns number of array element if no block given' do
      expect(@test_array.my_count).to eq(7)
    end

    it 'returns number of evens' do
      @result = @test_array.my_count { |x| x.even? }
      expect(@result).to eq(1)
    end
  end

  describe 'my_map method' do
    it 'returns array of multiplied numbers' do
      @result = @test_array.my_map { |x| x*x }
      expect(@result).to eq([1,81,4,25,49,9,25])
    end
  end

end
