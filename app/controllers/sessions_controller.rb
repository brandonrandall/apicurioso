class SessionsController < ApplicationController
  def create
    # binding.pry
    if user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      # redirect_to dashboard_index_path
    end

    # render text: request.env["omniauth.auth"].inspect
    # render text: request
    response = request.env["omniauth.auth"].inspect
    # binding.pry
    redirect_to dashboard_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
