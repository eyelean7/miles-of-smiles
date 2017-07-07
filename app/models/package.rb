class Package < ApplicationRecord
  validates :name, :description, :price, :presence => true
  has_many :reviews
end
