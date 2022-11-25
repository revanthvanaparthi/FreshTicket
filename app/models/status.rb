class Status < ApplicationRecord
    belongs_to :ticket , optional: true
    
    validates :name, presence: true, uniqueness: true
end
