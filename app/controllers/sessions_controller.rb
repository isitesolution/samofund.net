class SessionsController < Devise::SessionsController
  def destroy
    session[:impersonate] = nil
    super
  end
end