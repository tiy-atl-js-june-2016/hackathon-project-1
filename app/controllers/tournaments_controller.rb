class TournamentsController < ApplicationController
  before_action :authenticate!, only: [:create, :seed]
  ## Certain actions performed by TO: add-player, seed, match update
  ## Certain actions by unauthed users: show, index, standings

  def create
    @tournament = current_user.tournaments.new(tourney_params)
    if @tournament.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @tournament.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def seed
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
