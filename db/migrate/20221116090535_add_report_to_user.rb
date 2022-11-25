class AddReportToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :agents, :report_to, :integer
  end
end
