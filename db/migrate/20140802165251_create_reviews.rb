class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :username
      t.text :body
      t.references :game, index: true

      t.timestamps
    end
  end
end
