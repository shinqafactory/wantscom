class UsersController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :get_user 

  # ユーザプロフィール表示処理
  def show
    # ユーザIDに紐づいたquestionとanswerを５件取得
    @question = @user.questions.find(:all, :limit => 5)
    @answer = @user.answers.find(:all, :limit => 5)
  end

  def questions
    @question = @user.questions.find(:all)
  end

  def answers
    @question = @user.questions.find(:all)
  end
  
  def get_user
    #ユーザモデルを取得
    #エラー処理とか書く？
    @user = User.find_by_username(params[:uname])
  end
end
