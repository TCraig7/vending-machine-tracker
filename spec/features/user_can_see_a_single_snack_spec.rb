require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'user sees snacks associated with a vending machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    lous  = owner.machines.create!(location: "Lou's Place")
    snack = dons.snacks.create!(name: 'Butterfinger', price: 1.00)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content("Price: $1.00")
    expect(page).to have_content(dons.location)
    expect(page).to have_content(lous.location)
  end
end
