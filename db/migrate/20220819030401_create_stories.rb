class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :hero
      t.string :location
      t.string :enemy
      t.string :treasure

      t.timestamps
    end
  end
end
