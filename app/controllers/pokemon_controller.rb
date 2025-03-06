class PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
    @types = Type.pluck(:name).uniq # Getting a unique type

    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @pokemon = @pokemon.where("LOWER(name) LIKE ?", search_term)
    end

    if params[:type].present?
      @pokemon = @pokemon.join(:types.where("types.name = ?", params[:type]))
    end

    @pokemon = @pokemon.paginate(page: params[:page], per_page: 10)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
