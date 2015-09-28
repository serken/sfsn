class HomeController < ApplicationController

  skip_before_filter :authenticate_user!, only: :index

  def index
  end

  def test
    params = {vk_group_name: current_user.vk_group.name, vk_token: current_user.vk_token,
              fb_group_name: current_user.fb_group.name, fb_token: current_user.fb_token}

    Resque.enqueue(CopyPosts, params)

    redirect_to root_url, notice: "Posts will be copied"
  end

  def update_group
    @user = current_user
  end

  def update_group_id
    vk_group = VkGroup.first_or_create(name: params[:vk_group], user_id: current_user.id)
    vk_group.user = current_user
    unless vk_group.save
      redirect_to update_group_path, alert: vk_group.errors
      return
    end

    fb_group = FbGroup.first_or_create(name: params[:fb_group], user_id: current_user.id)
    fb_group.user = current_user
    unless fb_group.save
      redirect_to update_group_path, alert: fb_group.errors
      return
    end

    current_user.save
    redirect_to root_url
  end
end
