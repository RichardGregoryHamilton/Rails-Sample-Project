class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :console
      t.string :genre
      t.integer :released_on
      t.integer :reviewed
      t.integer :stars

      t.timestamps
    end
  end
end
