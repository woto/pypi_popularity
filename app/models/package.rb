class Package < ActiveRecord::Base
  validates_uniqueness_of :title

  cattr_reader :per_page
  @@per_page = 60

  has_many :package_histories

  scope :twenty_ten, joins(:package_histories).where('date > "2010-01-01"').where('downloads > 100').select("distinct(packages.id), packages.title, packages.description ")
end
