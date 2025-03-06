class MovesController < ApplicationController
  def index
    @moves = Move.all

    # Search by move name
    if params[:search].present?
      @moves = @moves.where('name LIKE ?', "%#{params[:search]}%")
    end

    # Filter by move type
    if params[:move_type].present?
      @moves = @moves.where(move_type: params[:move_type])
    end

    @moves = @moves.paginate(page: params[:page], per_page: 10)
  end

  def show
    @move = Move.find(params[:id])
  end
end
