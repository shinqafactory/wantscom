class UsersController < ApplicationController
  before_filter :authenticate_user! 

  # ユーザプロフィール表示処理
  def show
    @user = User.find_by_username(params[:uname])
    @question = @user.questions.find(:all)
    #@answer = @user.answers.find(:all)
  end

  def question

  end

  def answer

  end

end
