class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create
    user = User.find_by(email: session_params[:email]) #送られてきたメールアドレスでユーザーを検索する
    if user&.authenticate(session_params[:password]) #ユーザーが見つかった場合パスワードによる認証をauthenticateメソッドを行う
      session[:user_id] = user.id #認証に成功した場合セッションにuser_idを格納
      redirect_to root_url, notice: 'ログインしました。'
    else
      render 'new'
    end
  end

  def destroy
    reset_session #session内の情報を全て消す
    redirect_to root_url, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
