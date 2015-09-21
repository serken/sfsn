Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1463360490661393', '3590ff139cae54bd8c6d57c9246f35aa', :scope => "publish_pages, manage_pages, email, publish_actions"
end
