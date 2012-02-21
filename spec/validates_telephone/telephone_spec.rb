require 'spec_helper'

describe Telephone do
  context "with br as locale" do
    context "should be invalid with" do
      it "blank number" do
        Telephone.new('', :br).should_not be_valid
      end

      it "123456 as number" do
        Telephone.new('123456', :br).should_not be_valid
      end

      it "12345678910 as number" do
        Telephone.new('12345678910', :br).should_not be_valid
      end
    end

    context "should be valid with" do
      it "nil as number" do
        Telephone.new(nil, :br).should be_valid
      end

      it "1111111111 as number" do
        Telephone.new('1111111111', :br).should be_valid
      end

      it "(11)11111111 as number" do
        Telephone.new('(11)11111111', :br).should be_valid
      end

      it "111111-1111 as number" do
        Telephone.new('111111-1111', :br).should be_valid
      end

      it "(11)1111-1111 as number" do
        Telephone.new('(11)1111-1111', :br).should be_valid
      end
    end

    context "with a valid value" do
      it "should return it formatted" do
        Telephone.new('1111111111', :br).number.should == '(11)1111-1111'
      end
    end

    context "with an invalid value" do
      it "should return as it was" do
        Telephone.new('123456', :br).number.should == '123456'
      end
    end
  end

  context "with usa as locale" do
    context "should be invalid with" do
      it "blank number" do
        Telephone.new('', :en).should_not be_valid
      end

      it "123456 as number" do
        Telephone.new('123456', :en).should_not be_valid
      end

      it "12345678910 as number" do
        Telephone.new('12345678910', :en).should_not be_valid
      end
    end

    context "should be valid with" do
      it "nil as number" do
        Telephone.new(nil, :en).should be_valid
      end

      it "1111111111 as number" do
        Telephone.new('1111111111', :en).should be_valid
      end

      it "(11)11111111 as number" do
        Telephone.new('(111)1111111', :en).should be_valid
      end

      it "111111-1111 as number" do
        Telephone.new('111111-1111', :en).should be_valid
      end

      it "(11)1111-1111 as number" do
        Telephone.new('(111)111-1111', :en).should be_valid
      end
    end

    context "with a valid value" do
      it "should return it formatted" do
        Telephone.new('1111111111', :en).number.should == '(111)111-1111'
      end
    end

    context "with an invalid value" do
      it "should return as it was" do
        Telephone.new('123456', :en).number.should == '123456'
      end
    end
  end
end