class VotesController < ApplicationController
  require 'byebug'

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

end
