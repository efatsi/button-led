class WelcomeController < ApplicationController

  def show
    @status = Status.first
    @new_direction = @status.status == "on" ? "OFF" : "ON"
  end

  def click
    @status = Status.first

    if @status.status == "on"
      turn_off
      new_direction = "ON"
    else
      turn_on
      new_direction = "OFF"
    end

    render json: {:new_direction => new_direction}
  end

  def turn_on
    @status.update_attribute(:status, "on")
    core.digital_write(7, "HIGH")
  end

  def turn_off
    @status.update_attribute(:status, "off")
    core.digital_write(7, "LOW")
  end

  def core
    @core ||= RubySpark::Core.new("53ff74065067544828440487")
  end

end
