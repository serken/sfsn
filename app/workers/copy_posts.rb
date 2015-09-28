class CopyPosts
  @queue = :copy_posts_queue

  def self.perform(params)
    vk_group_name = params['vk_group_name']
    vk_token = params['vk_token']
    fb_group_name = params['fb_group_name']
    fb_token = params['fb_token']

    vk_group_id = ServiceApi.get_vk_group_id(vk_group_name)
    text = ServiceApi.get_from_vk_group(group_id: vk_group_id)
    ServiceApi.post_to_fb_group({message: text, token: fb_token, group_id: fb_group_name})
    Resque.enqueue_in 2.seconds, CopyPosts, params
  end
end
