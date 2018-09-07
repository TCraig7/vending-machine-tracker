require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  scenario 'user sees snacks associated with a vending machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack1 = dons.snacks.create(name: 'Butterfinger', price: 1.50)
    snack2 = dons.snacks.create(name: 'Snickers', price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Snack: #{snack1.name}")
    expect(page).to have_content("Price: #{snack1.price}")
    expect(page).to have_content("Snack: #{snack2.name}")
    expect(page).to have_content("Price: #{snack2.price}")
  end
end
