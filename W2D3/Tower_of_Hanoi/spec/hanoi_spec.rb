require 'hanoi'
require 'rspec'


describe "Hanoi" do

subject(:hanoi) {Hanoi.new(3)}
  describe "#initialize" do
    it "should create 3 arrays" do
      p hanoi.pile1
      expect(hanoi.pile1).to eq([3,2,1])
      expect(hanoi.pile2).to be_empty
      expect(hanoi.pile3).to be_empty
    end
  end

  describe "#make_move" do
    it "should change the 2 tower" do
      hanoi.make_move([1,2])
      expect(hanoi.pile1).to eq([3,2])
      expect(hanoi.pile2).to eq([1])
    end
  end
end
