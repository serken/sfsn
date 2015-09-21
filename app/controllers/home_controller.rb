class HomeController < ApplicationController

  def index

  end

  def test
    fb_group_id = 625591437543689
    @response = RestClient.post("https://graph.facebook.com/#{fb_group_id}/feed?access_token=#{current_user.fb_token}", message: "HELLO", link: "http://localhost")
    redirect_to root_url
  end

end
