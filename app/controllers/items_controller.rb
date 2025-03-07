class ItemsController < ApplicationController
  def index
    @items = Item.all

    if params[:search].present?
      @items = @items.where("LOWER(name) LIKE ?", "%#{params[:search].downcase}%")
    end

    @items = @items.paginate(page: params[:page], per_page: 10)
  end

  def show
    @item = Item.find(params[:id])
  end
end
