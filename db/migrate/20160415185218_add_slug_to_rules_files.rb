class AddSlugToRulesFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :rules_files, :slug, :string
    add_index :rules_files, :slug, unique: true
  end
end
