class UsersController < ApplicationController
  before_filter :authenticate_user! 
  before_filter :get_user 

  # ユーザプロフィール表示処理
  def show
    # ユーザー情報表示
    @username = @user.username
    @user_last_sign_in = @user.last_sign_in_at
    @user_sign_up_time = @user.created_at
    @user_email = @user.email
    # ユーザIDに紐づいたquestionとanswerを3件取得
    @answer_user_all = @user.answers.find_all_by_answer_ent_kbn('1', :limit => 3)
    @question_user_all = @user.questions.find_all_by_que_ent_kbn('1', :limit => 3 )
  end

  def showall
    # ユーザーIDに紐づいたQuestionとAnwerをすべて取得
    @answer_user_all = current_user.answers.find_all_by_answer_ent_kbn('1')
    @question_user_all = current_user.questions.find_all_by_que_ent_kbn('1')

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
    if @user.nil?
      render_404
    end
  end
end
