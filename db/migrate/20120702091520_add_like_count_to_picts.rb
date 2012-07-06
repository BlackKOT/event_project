class AddLikeCountToPicts < ActiveRecord::Migration
  def change
    add_column :picts, :like_count, :integer
  end
end
