class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :anemities
      t.datetime :date_time_start
      t.datetime :date_time_end
      t.boolean :rsvp_needed
      t.boolean :tickets_needed
      
      t.timestamps null: true
    end
  end
end
