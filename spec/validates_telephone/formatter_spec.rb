require 'spec_helper'

describe ValidatesTelephone::Formatter do
  context "#br" do
    context "with a nil value" do
      it "should return nil" do
        ValidatesTelephone::Formatter.br(nil).should be_nil
      end
    end

    context "with a valid number" do
      it "should return it formatted" do
        ValidatesTelephone::Formatter.br("1111111111").should == "(11)1111-1111"
      end
    end

    context "with an invalid number" do
      it "should return as it was" do
        ValidatesTelephone::Formatter.br("11111111").should == "11111111"
      end
    end
  end

  context "#usa" do
    context "with a nil value" do
      it "should return nil" do
        ValidatesTelephone::Formatter.usa(nil).should be_nil
      end
    end

    context "with a valid number" do
      it "should return it formatted" do
        ValidatesTelephone::Formatter.usa("1111111111").should == "(111)111-1111"
      end
    end

    context "with an invalid number" do
      it "should return as it was" do
        ValidatesTelephone::Formatter.usa("11111111").should == "11111111"
      end
    end
  end

  context "#any" do
    it "should always return the number as it was" do
      ValidatesTelephone::Formatter.any("11111").should == "11111"
    end
  end
end
