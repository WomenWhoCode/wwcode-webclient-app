class RenameRoleNameToNameInRoles < ActiveRecord::Migration
  def change
    rename_column :roles, :role_name, :name
  end
end
