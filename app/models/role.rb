class Role < ApplicationRecord
    belongs_to :agent , optional: true

    validates :name, presence: true, uniqueness: true
    
end
