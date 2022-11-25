class Organisation < ApplicationRecord
    has_many :tickets, dependent: :destroy

    validates :name, presence: {message: "Name is required for Registration"}
    validates :price, presence: {message: "You should purchase this for Registration"}, numericality: { only_integer: true , greater_than: 10000}
    
    def show_tickets
        Ticket.where(organisation_id: self.id)
    end

end
