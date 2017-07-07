class AddUserToReviews < ActiveRecord::Migration[5.1]
  def change
    remove_column :reviews, :id_id
    add_belongs_to(:reviews, :user)
  end
end
