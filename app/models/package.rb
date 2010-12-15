class Package < ActiveRecord::Base
  validates_uniqueness_of :title

  cattr_reader :per_page
  @@per_page = 60

end
