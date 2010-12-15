class AddFieldsToPackageHistory < ActiveRecord::Migration
  def self.up
    add_column :package_histories, :title, :string
    add_column :package_histories, :type, :string
    add_column :package_histories, :version, :string
    add_column :package_histories, :size, :string
  end

  def self.down
    remove_column :package_histories, :size
    remove_column :package_histories, :version
    remove_column :package_histories, :type
    remove_column :package_histories, :title
  end
end
