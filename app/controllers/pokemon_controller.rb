class PokemonController < ApplicationController
  def index
    Rails.logger.debug "params: #{params.inspect}"  # Log the full params
    @types = Type.all.pluck(:name) # Getting a unique type
    @pokemon = Pokemon.all

    # Search by Pokémon name
    if params[:search].present?
      search_term = "%#{params[:search].downcase}%"
      @pokemon = @pokemon.where("LOWER(name) LIKE ?", search_term)
    end

    # Filter by Pokémon type (handle multiple types by searching for the type within the type string)
    if params[:type].present? && params[:type] != ""
      @pokemon = @pokemon.where("LOWER(type) LIKE ?", "%#{params[:type].downcase}%")
    end

    @pokemon = @pokemon.paginate(page: params[:page], per_page: 12)
  end


  def show
    @pokemon = Pokemon.find(params[:id])
  end
end
