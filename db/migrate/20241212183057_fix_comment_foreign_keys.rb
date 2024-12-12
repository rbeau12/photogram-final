class FixCommentForeignKeys < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :author_id_id, :author_id
    rename_column :comments, :photo_id_id, :photo_id
  end
end
