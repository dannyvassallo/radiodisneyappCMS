class CreateRulesFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :rules_files do |t|
      t.string :name
      t.string :document

      t.timestamps
    end
  end
end
