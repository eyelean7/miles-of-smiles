class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.float :price

      t.timestamp
    end
  end
end
