class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :link
      t.integer :shortlink
      t.integer :visits
      t.date :last_visit

      t.timestamps null: false
    end
  end
end
