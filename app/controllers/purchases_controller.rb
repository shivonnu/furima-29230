class PurchasesController < ApplicationController
  before_action :set_item, only: [:show, :create]

  def show
  end

  def create
  end
 
  private

  def set_item
    @item = Item.find_by(id: params[:id])
  end

end
