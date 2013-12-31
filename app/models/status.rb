class Status < ActiveRecord::Base

  def switch
    status == 'on' ? turn_on : turn_off
  rescue RubySpark::Core::ApiError
  end

  def turn_on
    core.digital_write(7, "HIGH")
  end

  def turn_off
    core.digital_write(7, "LOW")
  end

  def core
    @core ||= RubySpark::Core.new("53ff74065067544828440487")
  end

end
