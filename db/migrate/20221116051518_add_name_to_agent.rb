class AddNameToAgent < ActiveRecord::Migration[7.0]
  def change
    add_column :agents, :name, :string
  end
end
