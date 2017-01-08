class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: params[:like][:user], status_id: params[:like][:status])
    if @like.save
      status = Status.find(params[:like][:status])
      redirect_to root_path, notice: "You liked #{status.title}!"
    else
      # flash[:alert] = "You liked before!"
      redirect_to root_path, alert: "You liked before!"
    end
  end

  def destroy
    like = Like.find(params[:id])
    status_id = like.status_id
    like.destroy
    redirect_to status_path(status_id), notice: "You unlike."
  end


end
