class FigureTitles < ActiveRecord::Migration
  def change
    create_table :figure_titles do |t|
      t.integer :figure_id
      t.integer :title_id
      t.timestamps
    end
  end
end
