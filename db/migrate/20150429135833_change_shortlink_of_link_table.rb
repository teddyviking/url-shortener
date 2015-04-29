class ChangeShortlinkOfLinkTable < ActiveRecord::Migration
  def change
  	change_column :links, :shortlink, :string
  	add_index :links, :shortlink
  end

end
