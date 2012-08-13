class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |u|
      u.string :telephone
      u.string :br_telephone
      u.string :usa_telephone
    end
  end

  def self.down
    drop_table :users
  end
end