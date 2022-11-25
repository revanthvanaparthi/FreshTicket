class AddAgentIdToTicket < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :agent_id, :integer
  end
end
