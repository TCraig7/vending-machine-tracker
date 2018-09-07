require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'user sees snacks associated with a vending machine' do
    owner = Owner.create!(name: "Sam's Snacks")
    dons  = owner.machines.create!(location: "Don's Mixed Drinks")
    snack = dons.snacks.create!(name: 'Butterfinger', price: 1.50)

    visit snack_path(snack)

    expect(page).to have_content(snack.name)
    expect(page).to have_content("Price: $1.50")
  end
end
