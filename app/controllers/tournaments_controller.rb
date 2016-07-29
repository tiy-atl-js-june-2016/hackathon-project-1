class TournamentsController < ApplicationController
  before_action :authenticate!, only: [:create]
  before_action :organize!, only: [:seed]

  def create
    @tournament = current_user.tournaments.new(tourney_params)
    if @tournament.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @tournament.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def seed
    ## All single elim tournaments have
    ## log2(t.size) rounds and t.size - 1 matches.

    ## Shuffle all players, then pop players in pairs
    ## creating matches for each pair.
    ## Continue until you have tournament.size - 1
    ## matches, numbered 1 through t.size - 1.

    @players = @tournament.players.shuffle
    page_id = 1
    until page_id == @tournament.size
      versus = @players.shift(2)
      @tournament.matches.create(player1: versus[0],
                                 player2: versus[1],
                                 page_id: page_id)
      page_id += 1
    end
    render "seed.json.jbuilder", status: :created
  end

  def show
    @tournament = Tournament.find(params[:id])
    render "show.json.jbuilder", status: :ok
  end

  def index
    @tournaments = Tournament.page(params[:page]).per(params[:per_page]).order(created_at: :desc)
    render "index.json.jbuilder", status: :ok
  end

  private
  def tourney_params
    params.permit(:title, :size, :location, :deadline, :starting_at)
  end
end
