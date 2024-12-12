class AddCascadeToFollowRequests < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :follow_requests, column: :sender_id
    add_foreign_key :follow_requests, :users, column: :sender_id, on_delete: :cascade

    remove_foreign_key :follow_requests, column: :recipient_id
    add_foreign_key :follow_requests, :users, column: :recipient_id, on_delete: :cascade
  end
end
