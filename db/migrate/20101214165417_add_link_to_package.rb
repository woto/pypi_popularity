class AddLinkToPackage < ActiveRecord::Migration
  def self.up
    add_column :packages, :link, :string
  end

  def self.down
    remove_column :packages, :link
  end
end
