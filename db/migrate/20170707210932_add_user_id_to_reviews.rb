class AddUserIdToReviews < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to(:reviews, :id)
  end
end
