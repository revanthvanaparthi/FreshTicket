class Ticket < ApplicationRecord
    has_one :status
    belongs_to :organisation
    belongs_to :agent , optional: true

    validates :title, presence: { message: "Title should be entered" }
    validates :description, presence: { message: "Description should be entered" }
    
    def show_status
        Status.find(self.status_id).name if self.status_id
    end
    def show_org
        Organisation.find(self.organisation_id).name if self.organisation_id
    end
    def show_agent
        Agent.find(self.agent_id).name if self.agent_id
    end

end
