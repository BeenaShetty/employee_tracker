module Api::V1
  class BaseController < ApplicationController 
    def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id]
    end
  end
end
