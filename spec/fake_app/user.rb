class User < ActiveRecord::Base
  validates :telephone, :telephone => true
end