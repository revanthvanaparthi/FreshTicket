class Agent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :role
  has_many :tickets
  attr_accessor :reporter
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :role_id, presence: true
  validates :name, presence: true, uniqueness: {message: "Agent Already exists SignUp with new name"}
  validates :report_to, presence: {message: "Enter valid reporter", if: -> {self.role_id != 1} }


  before_validation :set_reporter
  before_destroy :reset_tickets

  def set_reporter
    manager = Agent.where(name: self.reporter)[0] if self.reporter
    if !manager.nil? && manager.role_id < 4
      self.report_to = manager.id
    else
      self.report_to = nil
    end
  end

  def show_reporter
    if self.report_to
      Agent.find(self.report_to).name
    else
      self.name
    end
  end

  def show_team
    return Agent.where(report_to: self.report_to) if self.role_id > 3
    return Agent.where(report_to: self.id) if self.role_id < 4
  end

  def show_role
    Role.find(self.role_id).name
  end

  def reset_tickets
    Ticket.where(agent_id: self.id).update_all(agent_id: nil)
  end

end
