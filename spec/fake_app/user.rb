class BrUser < ActiveRecord::Base
  validates :telephone, :telephone => true
end

class EnUser < ActiveRecord::Base
  validates :telephone, :telephone => { :locale => :usa }
end