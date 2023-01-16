class AddCommentTextToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :comment_text, :text
  end
end
