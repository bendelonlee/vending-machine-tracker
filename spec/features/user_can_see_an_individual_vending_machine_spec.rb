require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    machine  = owner.machines.create!(location: "Don's Mixed Drinks")

    snack_1 = Snack.create!(name: "Chips", price: 2)
    snack_2 = Snack.create(name: "Soda", price: 4)
    snack_3 = Snack.create!(name: "sdf", price: 2)
    snack_4 = Snack.create!(name: "sdffsd", price: 2)


    machine.snacks += [snack_1, snack_2]

    machine_2  = owner.machines.create!(location: "AMC")
    machine_2.snacks += [snack_1, snack_3, snack_4]

    machine_3  = owner.machines.create!(location: "RNC")
    machine_3.snacks << snack_2




    visit machine_path(machine)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")

    within "#snack-#{snack_1.id}" do
      expect(page).to have_content(snack_1.name)
      expect(page).to have_content("Price: #{snack_1.price}")
      expect(page).to have_content(machine_2.location)
      expect(page).to have_content("Average Price: 2")
      expect(page).to have_content("Number of Unique Snacks: 3")
    end

    within "#snack-#{snack_2.id}" do
      expect(page).to have_content(snack_2.name)
      expect(page).to have_content("Price: #{snack_2.price}")
      expect(page).to have_content(machine_3.location)
      expect(page).to have_content("Average Price: 4")
      expect(page).to have_content("Number of Unique Snacks: 1")

    end


    expect(page).to have_content "Average Price of Machine: 3"

 # and I see a count of the different kinds of items in that vending machine.
  end
end

#I see the name of all of the snacks associated with that vending machine along with their price
