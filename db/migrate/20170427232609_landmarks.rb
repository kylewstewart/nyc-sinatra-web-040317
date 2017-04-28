class Landmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string  :name
      t.integer :figure_id
      t.date    :year_completed
      t.timestamps
    end
  end
end
