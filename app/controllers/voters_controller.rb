class VotersController < ApplicationController

  def create
    voter = Voter.new(name: params[:name], hometown: params[:hometown])
    if voter.save
      render json: voter
    else
      render json: voter.errors
    end
  end

  def show
    render json: Voter.find_by_id(params[:id])
  end

  def update
    voter = Voter.find_by_id(params[:id])
    voter.update(name: params[:name]) if params[:name]
    voter.update(hometown: params[:hometown]) if params[:hometown]
    voter.update(party: params[:party]) if params[:party]
    render json: voter
  end

end
