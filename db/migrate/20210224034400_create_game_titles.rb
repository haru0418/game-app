class CreateGameTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :game_titles do |t|
      t.string :game_title,           null: false
      t.text :game_info,            null: false
      t.text :recommended_pc,       null: false
      t.string :monthly_fee,        null: false
      t.timestamps
    end
  end
end
