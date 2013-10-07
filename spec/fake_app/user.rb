class User
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :telephone, :br_telephone, :usa_telephone

  validates :telephone, :telephone => true
  validates :br_telephone, :telephone => { :locale => :br }
  validates :usa_telephone, :telephone => { :locale => :usa }

  def initialize(attributes = {})
    attributes.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end
end