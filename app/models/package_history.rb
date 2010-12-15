class PackageHistory < ActiveRecord::Base
  belongs_to :package
  validates_uniqueness_of :title
end
