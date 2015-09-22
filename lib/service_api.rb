module ServiceApi
  def check_fb_group_rights
  end

  def check_vk_group_rights
  end

  def post_to_fb_group(fb_group_id, token, message)
    RestClient.post("https://graph.facebook.com/#{fb_group_id}/feed?access_token=#{token}", message: message)
  end

  def get_from_vk_group
    VkontakteApi::Client.new.wall.get(owner_id: vk_group_id, filters: 'owner')
  end
end
