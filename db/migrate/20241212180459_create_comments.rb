class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :author_id, foreign_key: { to_table: :users }
      t.references :photo_id, foreign_key: { to_table: :photos }

      t.timestamps
    end
  end
end
