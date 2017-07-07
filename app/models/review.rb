class Review < ApplicationRecord
  validates :content, :rating, :presence => true
  belongs_to :package
  belongs_to :user
end
