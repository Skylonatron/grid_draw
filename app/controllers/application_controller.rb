class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken
  protect_from_forgery with: :null_session

  # For mobile posts
  before_action :authenticate_user!, unless: :verify_api
  wrap_parameters false, unless: :verify_api

  def verify_api
    ['devise_token_auth', 'devise_token_auth_override', 'api'].include? params[:controller].split('/')[0]
  end

end
