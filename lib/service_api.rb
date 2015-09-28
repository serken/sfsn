module ServiceApi
  def check_fb_group_rights
  end

  def check_vk_group_rights
  end

  def self.post_to_fb_group(params)
    fb_group = params[:group_id]
    token = params[:token]
    message = params[:message]

    RestClient.post("https://graph.facebook.com/#{fb_group}/feed?access_token=#{token}", message: message)
  end

  def self.get_from_vk_group(params)
    group_id = - params[:group_id]
    VkontakteApi::Client.new.wall.get(owner_id: group_id, filters: 'owner').third.text
  end

  def self.get_vk_group_id(group)
    VkontakteApi::Client.new.groups.get_by_id(group_ids: group).first.gid

  end

  def self.check_vk_group(params)
    unless ids = params[:group]
      return 'No Vk group selected'
    end

    begin
      group = VkontakteApi::Client.new.groups.get_by_id(group_ids: ids).first
      return nil if group
    rescue
      return 'No Vk group found'
    end
  end

  def self.check_fb_group(params)
    unless ids = params[:group]
      return 'No Fb group selected'
    end

    begin
      group = VkontakteApi::Client.new.groups.get_by_id(group_ids: ids).first
      return nil if group
    rescue
      return 'No Fb group found'
    end
  end
end
