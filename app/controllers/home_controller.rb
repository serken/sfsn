class HomeController < ApplicationController

  skip_before_filter :authenticate_user!, only: :index

  def index
  end

  def test
    begin
      vk_group_id = ServiceApi.get_vk_group_id(current_user.vk_group)
      text = ServiceApi.get_from_vk_group(group_id: vk_group_id)
      ServiceApi.post_to_fb_group({message: text, token: current_user.fb_token, group_id: current_user.fb_group})
    rescue
      redirect_to root_url, alert: "something goes wrong. try again later"
      return
    end
    redirect_to root_url, notice: "Post has been copied"
  end

  def update_group
    @user = current_user
  end

  def update_group_id
    error = ServiceApi.check_vk_group(group: params[:vk_group])
    if error
      redirect_to update_group_path, alert: error
      return
    end
    #error = ServiceApi.check_fb_group(group: params[:fb_group])
    if error
      redirect_to update_group_path, alert: error
      return
    end
    current_user.fb_group = params[:fb_group]
    current_user.vk_group = params[:vk_group]
    current_user.save
    redirect_to root_url
  end
end
