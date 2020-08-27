class RenameIntrodctionColumnToProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_column :profiles, :introdction, :introduction
  end
end
