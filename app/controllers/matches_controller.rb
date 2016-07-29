class MatchesController < ApplicationController
  before_action :organize!

  def update
    @match = @tournament.matches.find(params[:id])
    @match.update(match_params)
    render "update.json.jbuilder", status: :ok
  end

  private
  def match_params
    params.permit(:winner_id, :p1_score, :p2_score, :live)
  end
end
