class VotesController < ApplicationController
  before_filter :restrict_access, except: :index

  def index
    render json: Vote.display_total
  end

  def create
    vote = Vote.new(voter_id: params[:voter_id], candidate_id: params[:candidate_id])
    if vote.save
      render json: vote
    else
      render json: vote.errors
    end
  end

  def destroy
    vote = Vote.find_by_id(params[:id])
    vote.destroy
    render json: "Your vote has been deleted."
  end

  private def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

end
