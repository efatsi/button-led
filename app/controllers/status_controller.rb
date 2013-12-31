class StatusController < ApplicationController
  before_action :assign_status

  def show
    render json: @status
  end

  def update
    if @status.update_attributes(status_attributes)
      @status.switch
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

  private

  def assign_status
    @status = Status.first
  end

  def status_attributes
    params[:status].permit!
  end
end
