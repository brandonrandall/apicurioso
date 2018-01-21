class SessionsController < ApplicationController
  def github_create
    if request.env["omniauth.auth"]["provider"] == "github"
      if user = User.from_github_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
      end
    redirect_to github_dashboard_path
    end
  end

  def facebook_create
    if request.env["omniauth.auth"]["provider"] == "facebook"
      if user = User.from_facebook_omniauth(request.env["omniauth.auth"])
        session[:user_id] = user.id
      end
    redirect_to facebook_dashboard_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
