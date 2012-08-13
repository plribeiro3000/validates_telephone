class User < ActiveRecord::Base
  validates :telephone, :telephone => true
  validates :br_telephone, :telephone => { :locale => :br }
  validates :usa_telephone, :telephone => { :locale => :usa }
end