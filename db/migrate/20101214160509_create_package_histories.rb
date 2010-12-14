class CreatePackageHistories < ActiveRecord::Migration
  def self.up
    create_table :package_histories do |t|
      t.references :package
      t.date :date
      t.integer :downloads

      t.timestamps
    end
  end

  def self.down
    drop_table :package_histories
  end
end
