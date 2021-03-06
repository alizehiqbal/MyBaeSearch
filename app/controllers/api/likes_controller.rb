class Api::LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
      if @like.save
        render :show
      else
        render ["Error Creating Like"], status: 422
      end
  end

  def update
    @like = Like.find(params[:id])
    if @like.update_attributes(like_params)
      @user = current_user
      render :show
    else
      render ["Error creating like"], status: 422
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    @user = current_user
    render "api/users/show"
  end


  def like_params
    params.require(:like).permit(:admirer_id, :crush_id)
  end
end
