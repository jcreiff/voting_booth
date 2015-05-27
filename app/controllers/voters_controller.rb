class VotersController < ApplicationController

  def create
    voter = Voter.new(name: params[:name], hometown: params[:hometown])
    if voter.save
      render json: voter
    else
      render json: voter.errors
    end
  end

end
