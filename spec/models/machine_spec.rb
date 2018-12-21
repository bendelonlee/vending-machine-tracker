require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :snack_machines }
    it { should have_many :snacks }

  end

  describe 'instance methods' do
    it '.average_price' do
      owner = Owner.create!(name: "Sam's Snacks")

      machine  = owner.machines.create!(location: "Don's Mixed Drinks")
      snack_1 = Snack.create!(name: "Chips", price: 2)
      snack_2 = Snack.create(name: "Soda", price: 3)
      machine.snacks += [snack_1, snack_2]

      expect(machine.average_price).to eq(2.5)
    end
  end
end
