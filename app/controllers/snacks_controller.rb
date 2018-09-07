class SnacksController < ApplicationController
  def show
    @snack = Snack.find(params[:id])
  end

  helpers do
    def number_to_currency(number)
      ('$%.2f' % number).to_s
    end
  end
end
