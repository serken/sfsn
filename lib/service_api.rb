module ServiceApi
  def check_fb_group_rights
  end

  def check_vk_group_rights
  end

  def self.post_to_fb_group(params)
    fb_group_id = params[:group_id]
    token = params[:token]
    message = params[:message]

    RestClient.post("https://graph.facebook.com/#{fb_group_id}/feed?access_token=#{token}", message: message)
  end

  def self.get_from_vk_group(params)
    group_id = params[:group_id]
    VkontakteApi::Client.new.wall.get(owner_id: - group_id, filters: 'owner')["items"].first["text"]
  end
end
