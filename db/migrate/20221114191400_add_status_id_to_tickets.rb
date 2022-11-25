class AddStatusIdToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :status_id, :integer
  end
end
