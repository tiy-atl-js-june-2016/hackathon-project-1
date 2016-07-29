class CompetitorsController < ApplicationController
  before_action :organize!

  def create
    @player = Player.find(params[:player_id])
    @competitor = @tournament.competitors.new(player_id: @player.id)
    if @competitor.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @competitor.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
