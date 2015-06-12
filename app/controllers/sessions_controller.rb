require "#{Rails.root}/lib/session.rb"
include Session

class SessionsController < ApplicationController
  before_action :get_params, only: :create
  def create
    user = set_access_token(get_user(@user_param))
    session[:user_id] = user.id.to_s
    redirect_to user_path
  end

  def destroy
    user = User.find(session[:user_id])
    user.update_attribute :access_token, nil
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out Successfully"
  end

  private

  def get_params
    @user_param = {}
    @user_param[:email] = request.env["omniauth.auth"]["info"]["email"]
    @user_param[:uid] = request.env["omniauth.auth"]["uid"]
    @user_param[:provider] = request.env["omniauth.auth"]["provider"]
    @user_param[:first_name] = request.env["omniauth.auth"]["info"]["first_name"]
    @user_param[:last_name] = request.env["omniauth.auth"]["info"]["last_name"]
    @user_param [:remote_image_url] = request.env["omniauth.auth"]["info"]["image"]
    @user_param
  end
end
