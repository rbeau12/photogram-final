class RemoveForeignKeyConstraintsFromCommentsAndLikes < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :comments, :photos
    remove_foreign_key :likes, :photos

    change_column_null :comments, :photo_id, true
    change_column_null :likes, :photo_id, true
  end
end
