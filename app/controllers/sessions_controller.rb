class SessionsController < ApplicationController
  def create
    if request.env["omniauth.auth"]["provider"] == "github"
      if user = User.from_github_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
      end
    redirect_to github_dashboard_path
    else #if request.env["omniauth.auth"]["provider"] == "facabook"
      if user = User.from_facebook_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
      end
    redirect_to dashboard_path
    end
    binding.pry
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
