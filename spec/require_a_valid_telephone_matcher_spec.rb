require 'spec_helper'
require 'shoulda-matchers'

describe Shoulda::Matchers::ActiveModel::RequireAValidTelephoneMatcher do
  before :each do
    @user = User.new
  end

  it "should accept on telephone" do
    @user.should require_a_valid_telephone(:telephone)
  end

  it "should accept without a specified attribute" do
    @user.should require_a_valid_telephone
  end

  it "should reject on br_telephone" do
    @user.should_not require_a_valid_telephone(:br_telephone)
  end

  context "with :br as locale" do
    it "should accept on br_telephone" do
      @user.should require_a_valid_telephone(:br_telephone).from(:br)
    end

    it "should reject on usa_telephone" do
      @user.should_not require_a_valid_telephone(:usa_telephone).from(:br)
    end
  end

  context "with :usa as locale" do
    it "should accept on usa_telephone" do
      @user.should require_a_valid_telephone(:usa_telephone).from(:usa)
    end

    it "should reject on br_telephone" do
      @user.should_not require_a_valid_telephone(:br_telephone).from(:usa)
    end
  end
end