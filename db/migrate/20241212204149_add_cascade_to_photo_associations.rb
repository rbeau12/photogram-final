class AddCascadeToPhotoAssociations < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :comments, :photos
    remove_foreign_key :likes, :photos

    add_foreign_key :comments, :photos, on_delete: :cascade
    add_foreign_key :likes, :photos, on_delete: :cascade
  end
end
