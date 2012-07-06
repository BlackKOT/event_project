class AddUserIdToPageRequests < ActiveRecord::Migration
  def change
    add_column :page_requests, :user_id, :integer
  end
end
