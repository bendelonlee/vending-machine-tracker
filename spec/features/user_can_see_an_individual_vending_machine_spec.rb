require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    machine  = owner.machines.create!(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Chips", price: 2)
    snack_2 = Snack.create(name: "Soda", price: 3)

    machine.snacks += [snack_1, snack_2]

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")

    within "#snack-#{snack.id}" do
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content(snack_1.price)
    end

  end
end

#I see the name of all of the snacks associated with that vending machine along with their price
