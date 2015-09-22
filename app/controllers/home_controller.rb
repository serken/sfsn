class HomeController < ApplicationController

  skip_before_filter :authenticate_user!, only: :index

  def index
  end

  def test
    text = ServiceApi.get_from_vk_group(group_id: current_user.vk_group_id)
    ServiceApi.post_to_fb_group({message: text, token: current_user.token, group_id: current_user.fb_group_id})
    redirect_to root_url
  end

  def update_group
    @user = current_user
  end

  def update_group_id
    current_user.fb_group_id = params[:fb_group_id]
    current_user.vk_group_id = params[:vk_group_id]
    current_user.save
    redirect_to root_url
  end
end
