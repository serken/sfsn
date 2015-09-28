class FbGroup < ActiveRecord::Base
  belongs_to :user
  before_create :check

  def check
    errors = ServiceApi.check_fb_group(group: self.name, token: self.user.fb_token)
    if errors
      self.errors = errors
      return
    end
  end
end
