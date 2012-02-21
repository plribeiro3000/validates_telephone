class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |u|
      u.string :telephone
    end
  end

  def self.down
    drop_table :users
  end
end