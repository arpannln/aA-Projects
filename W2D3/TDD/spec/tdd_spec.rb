require 'tdd'
require 'rspec'

describe "remove_dup" do
  it "remove duplicate elements" do
    expect(remove_dup([1,2,1,3,3])).to eq([1,2,3])
  end
end

describe "two_sum" do
  it "Find pairs that add up to zero" do
    expect(two_sum([-1, 0, 2, -2, 1])).to eq([[0, 4], [2, 3]])
  end
end

describe "my_transpose" do
  it "finds the transpose of an array" do
    expect(my_transpose([[0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]])).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe "stock_picker" do
  it "finds the most profitable pair of days" do
    expect(stock_picker([3,6,0,9,18,100])).to eq([2,5])
  end
end
