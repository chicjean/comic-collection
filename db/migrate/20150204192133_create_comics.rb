class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.references :series, index: true
      t.string :title
      t.string :number
      t.string :redemption_code
      t.boolean :redeemed, default: false

      t.timestamps null: false
    end
    add_foreign_key :comics, :series
  end
end
