class CreatePhotos < ActiveRecord::Migration[7.1]
  def change
    create_table :photos do |t|
      t.text :caption
      t.string :image
      t.integer :likes_count
      t.integer :comments_count
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
