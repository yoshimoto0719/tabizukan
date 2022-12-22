class CreateFavoriteNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_notifications do |t|

      t.timestamps
    end
  end
end
