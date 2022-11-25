require 'rails_helper'

RSpec.describe Role, type: :model do
  
  context 'Validation tests' do
    it "name validation" do
      role = Role.new(name: '').save
      expect(role).to eq(false)

      role = Role.new(name: 'Test').save
      expect(role).to eq(true)

      role1 = Role.new(name: 'Test').save
      expect(role1).to eq(false)
    end
  end

end

