class MakeForeignKeysOptional < ActiveRecord::Migration[7.1]
  def change
    change_column_null :comments, :photo_id, true
    change_column_null :likes, :photo_id, true
  end
end
