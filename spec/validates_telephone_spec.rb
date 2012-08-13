require 'spec_helper'

describe TelephoneValidator do
  let(:valid_numbers) { { :br_telephone => "(11)1111-1111",
                          :usa_telephone => "(111)111-1111",
                          :telephone => "(111)111-1111" } }

  context "on a field validated as a valid telephone from Brazil" do
    context "with an invalid number" do
      before :each do
        @user = User.new(valid_numbers.merge(:br_telephone => "12345"))
        I18n.stub(:t).with(:"activerecord.errors.models.user.attributes.br_telephone.invalid",
                           :default => :"activerecord.errors.messages.invalid").and_return("is invalid")
      end

      it "should set object as invalid" do
        @user.valid?.should be_false
      end

      it "should set an error on attribute" do
        @user.valid?
        @user.errors[:br_telephone].should == ['is invalid']
      end
    end

    context "with a valid number" do
      before :each do
        @user = User.new(valid_numbers)
      end

      it "should set object as valid" do
        @user.valid?.should be_true
      end

      it "should not set an error on attribute" do
        @user.valid?
        @user.errors[:br_telephone].should be_blank
      end
    end

    it "should accept a nil value" do
      @user = User.new(valid_numbers.merge(:br_telephone => nil))
      @user.valid?.should be_true
    end
  end

  context "on a field validated as a valid telephone from United States" do
    context "with an invalid number" do
      before :each do
        @user = User.new(valid_numbers.merge(:usa_telephone => "12345"))
        I18n.stub(:t).with(:"activerecord.errors.models.user.attributes.usa_telephone.invalid",
                           :default => :"activerecord.errors.messages.invalid").and_return("is invalid")
      end

      it "should set object as invalid" do
        @user.valid?.should be_false
      end

      it "should set an error on attribute" do
        @user.valid?
        @user.errors[:usa_telephone].should == ['is invalid']
      end
    end

    context "with a valid number" do
      before :each do
        @user = User.new(valid_numbers)
      end

      it "should set object as valid" do
        @user.valid?.should be_true
      end

      it "should not set an error on attribute" do
        @user.valid?
        @user.errors[:usa_telephone].should be_blank
      end
    end

    it "should accept a nil value" do
      @user = User.new(valid_numbers.merge(:usa_telephone => nil))
      @user.valid?.should be_true
    end
  end

  context "on a field validated as a valid telephone" do
    context "with an invalid number" do
      before :each do
        @user = User.new(valid_numbers.merge(:telephone => "12345"))
        I18n.stub(:t).with(:"activerecord.errors.models.user.attributes.telephone.invalid",
                           :default => :"activerecord.errors.messages.invalid").and_return("is invalid")
      end

      it "should set object as invalid" do
        @user.valid?.should be_false
      end

      it "should set an error on attribute" do
        @user.valid?
        @user.errors[:telephone].should == ['is invalid']
      end
    end

    context "with a valid number from Brazil" do
      before :each do
        @user = User.new(valid_numbers.merge(:telephone => "(11)1111-1111"))
      end

      it "should set object as valid" do
        @user.valid?.should be_true
      end

      it "should not set an error on attribute" do
        @user.valid?
        @user.errors[:telephone].should be_blank
      end
    end

    context "with a valid number from United States" do
      before :each do
        @user = User.new(valid_numbers.merge(:telephone => "(111)111-1111"))
      end

      it "should set object as valid" do
        @user.valid?.should be_true
      end

      it "should not set an error on attribute" do
        @user.valid?
        @user.errors[:telephone].should be_blank
      end
    end

    it "should accept a nil value" do
      @user = User.new(valid_numbers.merge(:usa_telephone => nil))
      @user.valid?.should be_true
    end
  end
end