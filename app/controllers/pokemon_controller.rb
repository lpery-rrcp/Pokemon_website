class PokemonController < ApplicationController
  def index
    Rails.logger.debug "params: #{params.inspect}"  # Log the full params
    @types = Type.all.pluck(:name)  # Getting a unique type
    @pokemon = Pokemon.all

    # Search by Pokémon name
    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @pokemon = @pokemon.where("LOWER(name) LIKE ?", search_term)
    end

    # Filter by Pokémon type (join the types table and filter by type name)
    if params[:type].present? && params[:type] != ""
      @pokemon = @pokemon.joins(:types).where("LOWER(types.name) = ?", params[:type].downcase).distinct
    end

    @pokemon = @pokemon.paginate(page: params[:page], per_page: 12)
  end

  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
