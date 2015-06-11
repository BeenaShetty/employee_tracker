class SessionsController < ApplicationController
  def create
    #raise request.env
    provider = request.env["omniauth.auth"]["provider"]
    info = request.env["omniauth.auth"]["info"]
    uid = request.env["omniauth.auth"]["uid"]

    user = get_user(provider, uid, info)
    session[:user_id] = user.id.to_s
    redirect_to root_path, notice: "Successfull Signin"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed Out Successfully"
  end

  private

  def get_user provider, uid, info
    if User.present?
      User.find_by(provider: provider, uid: uid) || User.create_with_provider(provider, uid, info)
    else
      User.create_with_provider(provider, uid, info)
    end
  end
end
