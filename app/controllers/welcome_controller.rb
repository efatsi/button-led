class WelcomeController < ApplicationController

  def show
  end

  def click
    @status = Status.first
    if @status.status == "on"
      turn_off
    else
      turn_on
    end

    render :nothing => true
  end

  def turn_off
    @status.update_attribute(:status, "off")

    params = access_param.merge(:params => "D7,LOW")
    HTTParty.post(url, :body => params)
  end

  def turn_on
    @status.update_attribute(:status, "on")

    params = access_param.merge(:params => "D7,HIGH")
    HTTParty.post(url, :body => params)
  end

  def url
    "https://api.spark.io/v1/devices/53ff74065067544828440487/digitalwrite"
  end

  def access_param
    {:access_token => "81160ce514b1cc00cb24d8eccf47fabf336607b9"}
  end

end
