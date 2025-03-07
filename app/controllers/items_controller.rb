class ItemsController < ApplicationController
  def index
    @items = Item.paginate(page: params[:page], per_page: 10)
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end
end
