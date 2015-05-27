class CandidatesController < ApplicationController

  def index
    render json: Candidate.all
  end

  def show
    render json: Candidate.find_by_id(params[:id])
  end

  def create
    candidate = Candidate.new(name: params[:name], hometown: params[:hometown],
        district: params[:district], party: params[:party])
    if candidate.save
      render json: candidate
    else
      render json: candidate.errors
    end
  end

end
