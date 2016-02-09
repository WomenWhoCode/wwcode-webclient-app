class RenameAnemitiesToAmenitiesInEvents < ActiveRecord::Migration
  def change
    rename_column :events, :anemities, :amenities
  end
end
