class SessionsController < ApplicationController

  def fb_new
    current_user.fb_token = auth_hash['credentials']['token']
    current_user.fb_id = auth_hash['uid']
    current_user.save
    redirect_to root_url
  end

  def new
    srand
    session[:state] ||= Digest::MD5.hexdigest(rand.to_s)

    @vk_url = VkontakteApi.authorization_url(scope: [:friends, :groups, :offline, :notify], state: session[:state])
  end

  def callback
    redirect_to root_url, alert: 'Ошибка авторизации, попробуйте войти еще раз.' and return if session[:state].present? && session[:state] != params[:state]

    @vk = VkontakteApi.authorize(code: params[:code])
    current_user.vk_token = @vk.token
    current_user.vk_id = @vk.user_id
    current_user.save

    redirect_to root_url
  end

  def destroy
    current_user.vk_token = nil
    current_user.vk_id = nil

    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
