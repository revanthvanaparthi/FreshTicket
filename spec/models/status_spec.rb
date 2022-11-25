require 'rails_helper'

RSpec.describe Status, type: :model do
  
  context 'Validation tests' do
    it "name validation" do
      status = Status.new(name: '').save
      expect(status).to eq(false)

      status = Status.new(name: 'Open').save
      expect(status).to eq(true)
      
      status1 = Status.new(name: 'Open').save
      expect(status1).to eq(false)
    end
  end

end
