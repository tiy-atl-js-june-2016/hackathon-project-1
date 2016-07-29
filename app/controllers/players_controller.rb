class PlayersController < ApplicationController
  before_action :authenticate!, only: [:create]

  def create
    @player = Player.new(player_params)
    if @player.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @player.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @player = Player.find_by!(nickname: params[:id])
    render "show.json.jbuilder", status: :ok
  end

  def index
    @players = Player.page(params[:page]).per(params[:per_page]).order(nickname: :asc)
    render "index.json.jbuilder", status: :ok
  end

  private
  def player_params
    params.permit(:fullname, :nickname, :location)
  end
end
