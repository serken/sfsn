class VkGroup < ActiveRecord::Base
  belongs_to :user
  before_create :check

  def check
    errors = ServiceApi.check_vk_group(group: self.name)
    if errors
      self.errors = errors
      return
    end
  end
end
