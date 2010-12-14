class AddDescriptionToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :description, :text
  end

  def self.down
    remove_column :packages, :description
  end
end
