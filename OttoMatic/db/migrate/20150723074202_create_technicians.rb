class CreateTechnicians < ActiveRecord::Migration
  def change
    create_table :technicians do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
