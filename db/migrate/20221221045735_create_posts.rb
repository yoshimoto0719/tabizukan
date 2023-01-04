class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :location
      t.string :cost
      t.string :day1
      t.string :day2
      t.text :description
      t.string :image_id
      t.timestamps
    end
  end
end
