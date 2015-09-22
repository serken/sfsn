class HomeController < ApplicationController

  def index
  end

  def test
    post_message
    redirect_to root_url
  end

  def update_group_id

  end

  private

  def post_message
    fb_group_id = 625591437543689
    vk_group_id = -32728983
    text = VkontakteApi::Client.new.wall.get(owner_id: vk_group_id, filters: 'owner', offset: 2, count: 2)[2].text
    RestClient.post("https://graph.facebook.com/#{fb_group_id}/feed?access_token=#{current_user.fb_token}", message: text)
  end

end
