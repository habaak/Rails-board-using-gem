class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user
  def current_user
    #session에 저장되어있는 경우 @User를 찾아서 저장한다.
    #||= 으로 저장하는 이유는 @user가 비어있는 경우에만 활용하기 위해서 이다
    #@user가 비어있을 때만 User.find해서 값을 넣어준다
    @user ||=  User.find(session[:user_id]) if session[:user_id]
  end


  def authorize
    if current_user.nil?
      flash[:alert] = "로그인을 해주세요"
      redirect_to '/'
    end
  end
end
