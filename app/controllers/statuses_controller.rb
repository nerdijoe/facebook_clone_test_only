class StatusesController < ApplicationController

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(status_params)
    @status.user_id = params[:user_id]

    if @status.save
      redirect_to status_path(@status), notice: "Status is created successfully."
    else
      flash[:alert] = 'Error creating status.'
      render 'new'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update_attributes(status_params)
      redirect_to status_path(@status), notice: "Status is updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    Status.find(params[:id]).destroy
    flash[:notice] = "Status is deleted."
    redirect_to statuses_path
  end

  private
  def status_params
    params.require(:status).permit(:title, :content)
  end

end
