class ChangeDataTypeForReleaseDate < ActiveRecord::Migration
  def up
    change_table :games do |t|
	  t.change :release_date, :string
	end
  end
  
  def down
    change_table :games do |t|
	  t.change :release_date, :integer
	end
  end
  
end
