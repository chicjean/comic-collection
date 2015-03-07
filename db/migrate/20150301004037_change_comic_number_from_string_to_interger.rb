class ChangeComicNumberFromStringToInterger < ActiveRecord::Migration
  def up
  	change_column :comics, :number, 'integer USING CAST(number AS integer)'
  end

  def down
  	change_column :comics, :number, :string
  end

end
