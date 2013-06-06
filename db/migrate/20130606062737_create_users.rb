class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :friend_code
      t.string :console_user
      t.string :fruit
      t.string :notes
      t.string :avatar
      t.string :twitter

      t.timestamps
    end
  end
end
