class SmacktalksController < ApplicationController
  def index
  	@smacktalks = Smacktalk.all.order("updated_at desc")
    @smacktalk = Smacktalk.new

  end

  def show
  	@smacktalk = Smacktalk.find(params[:id])
    @comment = Comment.new
  end

  def new
  	@smacktalk = Smacktalk.new

  end

  def create

  	@smacktalk = Smacktalk.new(smacktalk_params) 
    @smacktalk.user_id = current_user.id
    if @smacktalk.save
      flash[:notice] = "Comment was created"
      redirect_to "/smacktalks"
    else
      flash[:alert] = @smacktalk.errors.full_messages
      redirect_to  "/smacktalks"
    end

  end

  private

  def smacktalk_params
  	params.require(:smacktalk).permit(:subject, :content)

  end

end
