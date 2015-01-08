class SmacktalksController < ApplicationController
  def index
  	@smacktalks = Smacktalk.all

  end

  def show
  	@smacktalk = Smacktalk.find(params[:id])
  end

end
