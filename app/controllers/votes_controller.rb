class VotesController < ApplicationController

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

end
