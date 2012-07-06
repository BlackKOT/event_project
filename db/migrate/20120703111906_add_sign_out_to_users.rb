class AddSignOutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_sign_out_at, :datetime
  end
end
