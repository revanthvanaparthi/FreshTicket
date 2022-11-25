class RemoveCreatedByAddOrganisationIdToTickets < ActiveRecord::Migration[7.0]
  def change
    remove_column :tickets, :created_by
    add_column :tickets, :organisation_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
