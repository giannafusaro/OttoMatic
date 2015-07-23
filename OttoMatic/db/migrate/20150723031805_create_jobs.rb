class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :state, null: :false
      t.string :total_time, null: :false
      t.string :total_labor, null: :false
      t.string :total_parts, null: :false
      t.string :tax, null: :false
      t.string :total_cost, null: :false
      t.string :notes, null: :false
      t.timestamps null: false
    end
  end
end
