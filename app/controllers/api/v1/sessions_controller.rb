require "#{Rails.root}/lib/session.rb"
include Session
module Api::V1
  class SessionsController < BaseController
    before_action :check_params, only: :create
    def create
      @user = set_access_token(get_user(@user_param))
    end

    def destroy
      user = User.find_by(access_token: params[:access_token])
      user.update_attribute :access_token, nil
    end
    
    private

    def check_params
      keys = [:provider, :uid, :email, :first_name, :last_name, :remote_image_url]
      @user_param = params.slice(*keys)
    end
  end
end
