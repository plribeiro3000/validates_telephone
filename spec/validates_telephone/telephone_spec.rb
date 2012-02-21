require 'spec_helper'

describe Telephone do
  context "should be invalid with" do
    it "blank number" do
      Telephone.new('').should_not be_valid
    end

    it "123456 as number" do
      Telephone.new('123456').should_not be_valid
    end

    it "12345678910 as number" do
      Telephone.new('12345678910').should_not be_valid
    end
  end

  context "should be valid with" do
    it "nil as number" do
      Telephone.new(nil).should be_valid
    end

    it "1111111111 as number" do
      Telephone.new('1111111111').should be_valid
    end

    it "(11)11111111 as number" do
      Telephone.new('(11)11111111').should be_valid
    end

    it "111111-1111 as number" do
      Telephone.new('111111-1111').should be_valid
    end

    it "(11)1111-1111 as number" do
      Telephone.new('(11)1111-1111').should be_valid
    end
  end

  context "with a valid value" do
    it "should return it formatted" do
      Telephone.new('1111111111').number.should == '(11)1111-1111'
    end
  end

  context "with an invalid value" do
    it "should return as it was" do
      Telephone.new('123456').number.should == '123456'
    end
  end
end