require 'spec_helper'

describe ValidatesTelephone::Regex do
  context "#br" do
    context "with a valid number" do
      it "should return true" do
        ValidatesTelephone::Regex.br("(11)1111-1111").should be_true
      end
    end

    context "with an invalid number" do
      it "should return false" do
        ValidatesTelephone::Regex.br("11111111").should be_false
      end
    end
  end

  context "#usa" do
    context "with a valid number" do
      it "should return true" do
        ValidatesTelephone::Regex.usa("(111)111-1111").should == be_true
      end
    end

    context "with an invalid number" do
      it "should return false" do
        ValidatesTelephone::Regex.usa("11111111").should be_false
      end
    end
  end

  context "#any" do
    context "with a valid number from United States" do
      it "should return true" do
        ValidatesTelephone::Regex.any("(111)111-1111").should == be_true
      end
    end

    context "with a valid number from Brazil" do
      it "should return true" do
        ValidatesTelephone::Regex.any("(11)1111-1111").should == be_true
      end
    end

    context "with an invalid number" do
      it "should return nil" do
        ValidatesTelephone::Regex.any("11111111").should be_false
      end
    end
  end
end
