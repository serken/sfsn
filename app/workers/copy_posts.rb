class CopyPosts
  @queue = :copy_posts_queue

  def self.perform(params)
    vk_group_name = params['vk_group_name']
    vk_token = params['vk_token']
    fb_group_name = params['fb_group_name']
    fb_token = params['fb_token']

    vk_group = VkGroup.find_by(name: vk_group_name)
    unless vk_group.last_message_time
      vk_group.last_message_time = Time.now
      vk_group.save
    end

    vk_group_id = ServiceApi.get_vk_group_id(vk_group_name)
    group = ServiceApi.get_group_from_vk(group_id: vk_group_id)
    last_post = group.third

    unless last_post.date < vk_group.last_message_time.to_i
      ServiceApi.post_to_fb_group({message: last_post.text, token: fb_token, group_id: fb_group_name})
      vk_group.last_message_time = Time.at(last_post.date)
      vk_group.save
    end

    Resque.enqueue_in 3.seconds, CopyPosts, params
  end
end
