require 'rails_helper'

describe Snack, type: :model do
  describe 'relationships' do
    it {should belong_to :machine}
  end

  describe 'class methods' do
    describe '.average_price' do
      it "should calculate average price for all snacks" do
        owner = Owner.create!(name: "Sam's Snacks")
        dons  = owner.machines.create!(location: "Don's Mixed Drinks")
        snack1 = dons.snacks.create!(name: 'Butterfinger', price: 1.00)
        snack2 = dons.snacks.create!(name: 'Snickers', price: 3.00)

        expect(Snack.average_price).to eq(2)
      end
    end
  end
end
