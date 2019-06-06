class AddUserIdToCatsRentalRequests < ActiveRecord::Migration[5.2]
  def change
      add_column :cat_rental_requests, :user_id, :integer
      add_index :cat_rental_requests, :user_id, null: false
  end
end