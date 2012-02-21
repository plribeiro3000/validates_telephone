require 'spec_helper'
require 'shoulda-matchers'

describe Shoulda::Matchers::ActiveModel::ValidateAsUsaTelephoneMatcher do
  context "on a attribute which validates telephone" do
    it "should require a valid telephone" do
      @user = EnUser.new(:telephone => '123456')
      @user.should validate_as_usa_telephone(:telephone)
    end

    it "should allow a nil value" do
      @user = EnUser.new(:telephone => nil)
      @user.should validate_as_usa_telephone(:telephone)
    end
  end

  context "on a attribute which not validates telephone" do
    before do
      @user = Admin.new(:telephone => '123456')
    end

    it "should not require a valid telephone" do
      @user.should_not validate_as_usa_telephone(:telephone)
    end
  end
end