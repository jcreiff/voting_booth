class VotersController < ApplicationController

  before_filter :restrict_access, except: :create

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

  private def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

end
