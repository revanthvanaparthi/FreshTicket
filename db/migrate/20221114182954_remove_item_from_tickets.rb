class RemoveItemFromTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :item
  end
end
