class CreateSignTimes < ActiveRecord::Migration
  def change
    create_table :sign_times do |t|
      t.references :user
      t.datetime :sign
      t.boolean  :login
      t.timestamps
    end
  end
end
