class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env["omniauth.auth"])


    session[:user_id] = user.id
    if session[:user_id] == nil
        @session=Session.new
    else end

   
    # if the user isn't a prof yet, let them make a prof
    if Prof.where(:user_id => user.id).empty?
      redirect_to new_path
    else
      redirect_to root_path
    end
  end


  def new
    @session = Session.new
  end



  def destroy
    #reset_session
    #current_user.update_attribute(:current_sign_in_token, "")
    session[:content] = nil
    session[:user_id] = nil
    redirect_to root_path
  end

end
