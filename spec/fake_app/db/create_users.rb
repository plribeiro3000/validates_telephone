class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :br_users do |u|
      u.string :telephone
    end
    create_table :en_users do |u|
      u.string :telephone
    end
  end

  def self.down
    drop_table :br_users
    drop_table :en_users
  end
end