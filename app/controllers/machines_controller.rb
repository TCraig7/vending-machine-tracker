class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
  end

  helpers do
    def number_to_currency(number)
      ('$%.2f' % number).to_s
    end
  end
end
