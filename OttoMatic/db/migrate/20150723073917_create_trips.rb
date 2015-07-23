class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :time, null: false
      t.string :notes
      t.timestamps null: false
    end
  end
end
