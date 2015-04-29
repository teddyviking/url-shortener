class AddDefaultToVisits < ActiveRecord::Migration
  def change
  	change_column_default :links, :visits, 0
  end
end
