class CreatePicts < ActiveRecord::Migration
  def change
    create_table :picts do |t|
      t.attachment :picture
      t.references :categories
      t.timestamps
    end
  end

end
