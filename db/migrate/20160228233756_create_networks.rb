class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|

      t.timestamps null: false
    end
  end
end
