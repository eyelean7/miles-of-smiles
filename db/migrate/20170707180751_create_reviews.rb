class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.belongs_to :package, index: true
      t.column :content, :text
      t.column :rating, :integer

      t.timestamps
    end
  end
end
