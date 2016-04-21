class AddStationToRules < ActiveRecord::Migration[5.0]
  def change
    add_column :rules_files, :station, :string
  end
end
