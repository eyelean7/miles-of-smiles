class Package < ApplicationRecord
  validates :name, :description, :price, :presence => true
end
