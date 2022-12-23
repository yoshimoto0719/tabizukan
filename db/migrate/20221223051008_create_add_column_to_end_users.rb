class CreateAddColumnToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :first_name, :string
    add_column :end_users, :last_name, :string
    add_column :end_users, :first_name_kana, :string
    add_column :end_users, :last_name_kana, :string
    add_column :end_users, :phone_number, :string
    add_column :end_users, :is_deleted, :boolean
  end
end
