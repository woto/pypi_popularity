class ChangeTypeColumnToPackageTypeInPackageHistory < ActiveRecord::Migration
  def self.up
    change_table :package_histories do |t|
      t.rename :type, :package_type
    end
  end

  def self.down
  end
end
