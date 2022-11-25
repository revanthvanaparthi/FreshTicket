class AddRoleIdToAgent < ActiveRecord::Migration[7.0]
  def change
    add_column :agents, :role_id, :integer
  end
end
