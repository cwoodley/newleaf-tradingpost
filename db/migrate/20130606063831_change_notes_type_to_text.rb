class ChangeNotesTypeToText < ActiveRecord::Migration
  def up
  	change_column :users, :notes, :text
  end

  def down
  	change_column :users, :notes, :string
  end
end
